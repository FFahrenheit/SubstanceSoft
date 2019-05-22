#include <SoftwareSerial.h>
#include <EEPROM.h>
#include <Wire.h>
#include <Adafruit_PN532.h>

/*
 * Este sketch maneja el sistema de 
 * empleados, haciendo requests HTTP
 * y un módulo RFID para iniciar sesión
 * en un sistema de restaurante.
 */

boolean debug = false; //True para entrar a modo configuración, en esencia no importa
boolean configure = false; //Es un switch, si está en alto significa que abre el serial

const byte TX_WIFI = 11;
const byte RX_WIFI = 12;
const byte BUZZ = 10;
const byte PN532_IRQ = 2;
const byte PN532_RESET = 3;
const byte CONFIGURE_SW = 9;

SoftwareSerial wifi(TX_WIFI, RX_WIFI);
Adafruit_PN532 nfc(PN532_IRQ, PN532_RESET);

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
    while (true);
  }
  nfc.setPassiveActivationRetries(0xFF);
  nfc.SAMConfig();
  Serial.println("NFC listo");
}

void setup() 
{
  pinMode(CONFIGURE_SW, INPUT_PULLUP);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(BUZZ,OUTPUT);
  Serial.begin(9600);
  readCredentials();
  configure = !digitalRead(CONFIGURE_SW); //Logica inversa porque es más fácil si no está conectado 1=>0
  if(!configure)
  {
    wifi.begin(115200);
    nfc.begin();
    startNFC();
    innitConnection();
    connectWifi();
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
    //readBeep();
    if(menu=="b") //No se puede con el switch :(((
    {
      showCredentials();
    }
    else if (menu=="a")
    {
      setCredentials();
    }
    okBeep();
    /*switch(menu)
    {
      case 'a': 
        setCredentials();
        break;
      case 'b':
        showCredentials();
        break;
      case 'c':
        innitConnection();
      case 'd':
        connectWifi();
        break;
    }*/
  }
  else if(!configure)
  {
    boolean success;
    uint8_t uid[] = { 0, 0, 0, 0, 0, 0, 0 };  
    uint8_t uidLength;
    digitalWrite(LED_BUILTIN, HIGH);
    success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, &uid[0], &uidLength);
    digitalWrite(LED_BUILTIN,LOW);
     if (success) 
     {
      readBeep();
      //Serial.print("UID Length: ");
      //Serial.print(uidLength, DEC);Serial.println(" bytes");
      //Serial.print("UID Value: ");
      int counter = 0;
      for (uint8_t i=0; i < uidLength; i++) 
      {
        //Serial.print(" 0x");
        //Serial.print(uid[i], HEX); 
        counter+=pow(uid[i],i);
      }
      if(debug)
      {
        Serial.println("\nValor: "+String(counter));
      }
      else 
      {
        registerCard(counter);
      }
    }
    else
    {
      errorBeep();
    }
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
   if(statusCode.indexOf("1:1")>0)
   {
    okBeep();
   }
   else 
   {
    errorBeep();
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
  //readCredentials();    //descomentar para usar credenciales de la EEPROM
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

void connectWifi()
{
  wifi.print("AT+CIPSTATUS\r\n");
  Serial.println(waitResponse());
}

String waitResponse()
{
  String response;
  delay(1000); //Aguantame las carnes
  while(!wifi.available());
  while(wifi.available())
  {
    response = wifi.readStringUntil('\n');
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
  //readyBeep();
  while(Serial.available()<=0);
  pass =  Serial.readStringUntil('\n');
  //readyBeep();
  do
  {
    if(Serial.available())
    {
      ip = Serial.readStringUntil('\n');      
    }
  }while(ip.length()<=0);
  //readyBeep();
  //Serial.println("Credenciales guardadas\n");
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
