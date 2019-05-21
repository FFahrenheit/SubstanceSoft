#include <SoftwareSerial.h>
#include <EEPROM.h>

/*
 * Este sketch maneja el sistema de 
 * empleados, haciendo requests HTTP
 * y un módulo RFID para iniciar sesión
 * en un sistema de restaurante.
 */

const byte TX_WIFI = 11;
const byte RX_WIFI = 12;
const byte BUZZ = 10;

SoftwareSerial wifi(TX_WIFI, RX_WIFI);

const byte SSID_ADD=0x00;
const byte PASS_ADD=0x40;
const byte ADD_ADD=0x80;
String _SSID="RED"; 
String _PASS="41472021";
String _SERVER="192.168.15.174";

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

void setup() 
{
  pinMode(BUZZ,OUTPUT);
  errorBeep();
  analogWrite(BUZZ,0);
  wifi.begin(115200);
  Serial.begin(9600);
  connectWifi();
}

void loop() 
{
  if(Serial.available())
  {
    char menu = Serial.read();
    okBeep();
    switch(menu)
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
    }
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
  //readCredentials();
  wifi.print("AT\r\n");
  waitResponse();
  wifi.print("AT+RST\r\n");
  waitResponse();
  wifi.print("AT+CWMODE=1\r\n");
  waitResponse();
  //wifi.print("AT+CWLAP\r\n");
  //waitResponse();
  //wifi.print("AT+RST\r\n");
  //waitResponse();
  String command = "AT+CWJAP=\""+_SSID+"\",\""+_PASS+"\"\r\n";
  wifi.print(command);
  waitResponse();
}

void connectWifi()
{
  wifi.print("AT+CIPSTATUS\r\n");
  Serial.println(waitResponse());
}

String waitResponse()
{
  String response;
  delay(2000);
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
  String ssid,pass,ip;
  do
  {
    if(Serial.available())
    {
      ssid = Serial.readStringUntil('\n');      
    }
  }while(ssid.length()<=0);
  writeValue(SSID_ADD, ssid);
  while(Serial.available()<=0);
  pass =  Serial.readStringUntil('\n');
  writeValue(PASS_ADD, pass); 
  do
  {
    if(Serial.available())
    {
      ip = Serial.readStringUntil('\n');      
    }
  }while(ip.length()<=0);
  writeValue(ADD_ADD, ip);
  Serial.println("Credenciales guardadas\n");
  readCredentials();
}

void showCredentials()
{
  Serial.println("SSID: "+_SSID);
  Serial.println("Contraseña: "+_PASS);
  Serial.println("IP servidor: "+_SERVER);
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