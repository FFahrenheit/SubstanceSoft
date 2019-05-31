/*
 * Este sketch maneja el sistema de 
 * empleados, haciendo requests HTTP
 * y un módulo RFID para iniciar sesión
 * en un sistema de restaurante.
 * @author: ivxn :)
 */

#include <LiquidCrystal.h>
#include <EEPROM.h>
#include <Wire.h>
#include <Adafruit_PN532.h>

boolean configure = false; 
boolean gotIP = false;

/**
 * Modos:
 * Configure
 * true => Se usa para poner el Arduino en modo
 * configuración, es decir, cargar el SSID, 
 * Password e IP local del server
 * false => Se usa para usar el módulo en su
 * funcionamiento común
 */

const byte BUZZ = 10;
const byte PN532_IRQ = 2;
const byte PN532_RESET = 3;
const byte CONFIGURE_SW = 11;

#define wifi Serial3
Adafruit_PN532 nfc(PN532_IRQ, PN532_RESET);
LiquidCrystal lcd(4,5,6,7,8,9);  //RS, EN, DATA

const byte SSID_ADD=0x00;
const byte PASS_ADD=0x40;
const byte ADD_ADD=0x80;
String _SSID; 
String _PASS;
String _SERVER;

void readyBeep()
{
  for(int i=0; i<256;i++)
  {
    analogWrite(BUZZ,i);
    delay(2);
  }
  analogWrite(BUZZ,0);
}

void readBeep()
{
  analogWrite(BUZZ,100);
  delay(150);
  analogWrite(BUZZ,200);
  delay(350);
  analogWrite(BUZZ,0);
}

void okBeep()
{
  analogWrite(BUZZ,120);
  delay(200);
  analogWrite(BUZZ,200);
  delay(200);
  analogWrite(BUZZ,240);
  delay(100);
  analogWrite(BUZZ,0);
}

void errorBeep()
{
  analogWrite(BUZZ,240);
  delay(500);
  analogWrite(BUZZ,0);
}

void startNFC()
{
  uint32_t versiondata = nfc.getFirmwareVersion();
  if (! versiondata) 
  {
    Serial.print("Error, no hay lector");
    lcd.clear();
    lcd.print("Error con lector");
    while (true);
  }
  nfc.setPassiveActivationRetries(0xFF);
  nfc.SAMConfig();
  Serial.println("NFC listo");
}

void configurePins()
{
  pinMode(CONFIGURE_SW, INPUT_PULLUP);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(BUZZ,OUTPUT); 
}

void setup() 
{
  configurePins();
  Serial.begin(9600);
  lcd.begin(16,2);
  configure = !digitalRead(CONFIGURE_SW); //Verificar el estado de configuración
  Serial.println("Estado de configure: " + (String)configure);
  lcd.print("</SubstanceSoft>");
  if(!configure)
  {
    readCredentials(); //Lee las credenciales de la EEPROM
    showCredentials(); //Muestra las credenciales
    wifi.begin(115200); //Inicializa la velocidad del ESP8266
    if(!gotIP && !tryWifi())   //Se intenta conectar una vez, si falla ...
    {
      innitConnection(); //Hace la conexión al WiFi
      connectWifi(); //Conecta al WiFi 
    }
    nfc.begin();  //Inicializa la comunicación con el módulo
    startNFC(); //Inicia el NFC
    Serial.println("Listo para recibir");
  }
  readyBeep();
}

void loop() 
{
  if(Serial.available() && configure)
  {
    analogWrite(BUZZ,200);
    String menu = Serial.readStringUntil('\n');
    if(menu=="b") //No se puede con el switch, sorry mom. :(((
    {
      showCredentials();
    }
    else if (menu=="a")
    {
      setCredentials();
    }
    lcd.clear();
    lcd.print("  Configurado.");
    okBeep();
  }
  else if(!configure)
  {
    Serial.println("Espero tu NFC");
    lcd.clear();
    lcd.print("  Esperando...");
    boolean success;
    uint8_t uid[] = { 0, 0, 0, 0, 0, 0, 0 };  
    uint8_t uidLength;
    while(wifi.available()>0);   //Si hay algún dato atorado en buffer
    digitalWrite(LED_BUILTIN, HIGH);
    success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, &uid[0], &uidLength);
    digitalWrite(LED_BUILTIN,LOW);
     if (success) 
     {
      readBeep();
      int counter = 0;
      for (uint8_t i=0; i < uidLength; i++) 
      {
        counter+=pow(uid[i],i);
      }
      lcd.clear();
      lcd.print("   Procesando");
      registerCard(counter);
    }
    else
    {
      lcd.clear();
      lcd.print("Error en lector");
      errorBeep();
    }
    delay(3000);
  }
}

boolean registerCard(int card)
{
   Serial.println("Tarjeta: "+(String)card);
   String command = "AT+CIPSTART=\"TCP\",\""+_SERVER+"\",80\r\n";
   wifi.print(command);
   waitResponse(1200);
   command = "GET /SubstanceSoft/php/requests/read.php?code="+(String)card+"\r\n";
   wifi.print("AT+CIPSEND="+(String)command.length()+"\r\n");
   waitResponse();
   wifi.print(command);
   String statusCode = waitResponse(2000);
   Serial.println("Status code: "+statusCode);
   if(statusCode.indexOf("CLOSED")>0)
   {
     if(statusCode.indexOf("1:0")>0)
     {
        errorBeep();
        lcd.clear();
        lcd.print("  Error en la");
        lcd.setCursor(0,1);
        lcd.print("    peticion");
     }
     else if(statusCode.indexOf("1:3")>0)
     {
      errorBeep();
      lcd.clear();
      lcd.print("   Tarjeta no");
      lcd.setCursor(0,1);
      lcd.print("   registrada");
     }
     else if(statusCode.indexOf("1:2")>0)
     {
        errorBeep();
        lcd.clear();
        lcd.print("    Tarjeta");
        lcd.setCursor(0,1);
        lcd.print("   registrada");
     }
     else
     {
      okBeep();
      String username = statusCode.substring(statusCode.indexOf(":")+1,statusCode.indexOf("<"));
      String tipo = statusCode.substring(statusCode.indexOf("<")+1,statusCode.indexOf("CLOS"));
      Serial.println(username);
      lcd.clear();
      (tipo == "1") ? lcd.print("  Hasta  luego") : lcd.print("   Bienvenido"); //salida
      lcd.setCursor(0,1);
      lcd.print(username);
     }
   }
   else 
   {
      errorBeep();
      lcd.clear();
      lcd.print("    Error en");
      lcd.setCursor(0,1);
      lcd.print("    peticion");
   }
}

void readCredentials()
{  
  _SSID = readValue(SSID_ADD);
  _PASS = readValue(PASS_ADD);
  _SERVER = readValue(ADD_ADD);
}

void innitConnection()
{
  wifi.print("AT\r\n");
  waitResponse();
  wifi.print("AT+RST\r\n");
  waitResponse();
  wifi.print("AT+CWMODE=1\r\n");
  waitResponse();
  String command = "AT+CWJAP=\""+_SSID+"\",\""+_PASS+"\"\r\n";
  wifi.print(command);
  waitResponse(1500);
}

bool tryWifi()
{
  wifi.print("AT+CIPSTATUS\r\n");
  delay(1500);
  String response = getStatus();
  if(!response.equals("Error"))
  {
    Serial.print("Aqui si jaló");
    Serial.println(response);
    String _statusCode = response.substring(response.indexOf(":")+1);
    Serial.println("Estado: "+_statusCode);
    int statusCode = _statusCode.toInt();
    Serial.println("Status: "+(String)statusCode);
    if(statusCode == 4 || statusCode == 5) //Status 2 is totally ok...
    {
      lcd.clear();
      lcd.print("    Error en");
      lcd.setCursor(0,1);
      lcd.print(" conexion Wi-Fi");
      errorBeep();
      return false;
    }
    lcd.clear();
    lcd.print("    Correcto");
    return true; 
  }
  else 
  {
    Serial.println("Es un error");
    lcd.clear();
    lcd.print("    Error en");
    lcd.setCursor(0,1);
    lcd.print(" conexion Wi-Fi");
    errorBeep();
    return false;
  }
}

bool connectWifi()
{
  wifi.print("AT+CIPSTATUS\r\n");
  delay(1500);
  String response = getStatus();
  if(gotIP)
  {
    return true;
  }
  if(!response.equals("Error"))
  {
    Serial.print("Aqui si jaló");
    Serial.println(response);
    String _statusCode = response.substring(response.indexOf(":")+1);
    Serial.println("Estado: "+_statusCode);
    int statusCode = _statusCode.toInt();
    Serial.println("Status: "+(String)statusCode);
    if(statusCode == 4 || statusCode == 5) //Status 2 is totally ok...
    {
      lcd.clear();
      lcd.print("    Error en");
      lcd.setCursor(0,1);
      lcd.print(" conexion Wi-Fi");
      errorBeep();
      return connectWifi();
    }
    lcd.clear();
    lcd.print("    Correcto");
    return true; 
  }
  else 
  {
    Serial.println("Es un error");
    lcd.clear();
    lcd.print("    Error en");
    lcd.setCursor(0,1);
    lcd.print(" conexion Wi-Fi");
    errorBeep();
    return connectWifi();
  }
}

String getStatus()
{
  String response, ans="Error";
  delay(1000); //Aguantame las carnes
  while(!wifi.available());
  while(wifi.available())
  {
    response = wifi.readStringUntil('\n');
    if(response.indexOf("US:")>0)
    {
      ans = response;
      Serial.println("Status: "+ans);
    }
    if(response.indexOf("GOT IP")>0)
    {
      Serial.println("GOT FCKING IP");
      gotIP = true;
    }
    Serial.println(response);
  }
  return ans;
}

String waitResponse()
{
  String response;
  delay(1000); //Aguantame las carnes
  while(!wifi.available());
  while(wifi.available())
  {
    response = wifi.readStringUntil('\n');
    if(response.indexOf("GOT IP")>0)
    {
      Serial.println("GOT FCKING IP");
      gotIP = true;
    }
    Serial.println(response);
  }
  return response;
}

String waitResponse(int timeout)
{
  String response;
  delay(timeout); //Aguantame las carnes
  while(!wifi.available());
  while(wifi.available())
  {
    response = wifi.readStringUntil('\n');
    if(response.indexOf("GOT IP")>0)
    {
      Serial.println("GOT FCKING IP");
      gotIP = true;
    }
    Serial.println(response);
  }
  return response;
}

bool setCredentials()
{
  analogWrite(BUZZ,0);
  String ssid,pass="",ip;
  do
  {
    if(Serial.available())
    {
      ssid = Serial.readStringUntil('\n');
    }
  }while(ssid.length()<=0);
  while(Serial.available()<=0);
  pass =  Serial.readStringUntil('\n');
  do
  {
    if(Serial.available())
    {
      ip = Serial.readStringUntil('\n');      
    }
  }while(ip.length()<=0);
  writeValue(PASS_ADD, pass); 
  writeValue(SSID_ADD, ssid);
  writeValue(ADD_ADD, ip);
  readCredentials();
}

void showCredentials()
{
  Serial.print("SSID: "+_SSID);
  Serial.print(" | Password: "+_PASS);
  Serial.println(" | Server IP: "+_SERVER);
}

void writeValue(char add,String data)
{
  for(int i=0;i<data.length();i++)
  {
    EEPROM.write(add+i,data[i]);
  }
  EEPROM.write(add+data.length(),'\0');
}
 
 
String readValue(char add)
{
  char data[100];
  int len=0;
  unsigned char k;
  k = EEPROM.read(add);
  while(k != '\0' && len<500)  
  {    
    k=EEPROM.read(add+len);
    data[len]=k;
    len++;
  }
  data[len]='\0';
  return String(data);
}
