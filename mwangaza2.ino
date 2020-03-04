

#include <ESP8266WiFi.h>
#include<PubSubClient.h>

const char* ssid = "";
const char* pass = "";

const char *mqtt_server = "";
const int mqtt_port =  ;
const char *mqttuser = "";
const char *mqttpass = "";

const int pin = D2;
const int pin2 = D7;

void callback(String topic,byte* payload,unsigned int length1){
Serial.print("message arrived[");
Serial.print(topic);
Serial.println("]");
String msgg;
String msgg2;

for(int i=0;i<length1;i++){
Serial.print((char)payload[i]);
msgg += (char)payload[i];
msgg2 += (char)payload[i];

}
if(topic == "room/lamp")
{
if(msgg == "on"){
digitalWrite(pin,HIGH);
Serial.print("\n LED PIN 1 ON \n ");

}
else if(msgg == "off")
{
digitalWrite(pin,LOW);

Serial.print("\n LED PIN 1 OFF");
}
}

if(topic == "room/lamp2"){

  if(msgg2 == "on2"){
digitalWrite(pin2,HIGH);
Serial.print("\n LAMP 2 ON \n ");

}
else if(msgg2 == "off2")
{
digitalWrite(pin2,LOW);

Serial.print("\n LAMP 2 OFF ");
}
  
    
  }
}

WiFiClient espclient;
PubSubClient client(mqtt_server,13391,callback,espclient);

void setup() {
Serial.begin(115200);
pinMode(pin,OUTPUT);
WiFi.begin(ssid, pass);
while (WiFi.status() != WL_CONNECTED) {
delay(1000);
Serial.println("Connecting to WiFi..");
}
Serial.println("Connected to the WiFi network");
client.setServer(mqtt_server, mqtt_port);
client.setCallback(callback);
}

void reconnect(){
while (!client.connected()) {
Serial.println("Connecting to MQTT…");
if (client.connect("ESP8266Client", mqttuser, mqttpass )) {
Serial.println("connected");
client.subscribe("room/lamp");
client.subscribe("room/lamp2");
} else {
Serial.print("failed with state");
Serial.print(client.state());
delay(2000);
}
}
}

void loop()
{
if(!client.connected()){
reconnect();
}
client.loop();

}



//// Change the credentials below, so your ESP8266 connects to your router
//const char* ssid = "JTL-FAIBA";
//const char* password = "Win@2050";
//
//// Change the variable to your Mosquitto IP address, so it connects to your MQTT broker
//const char* mqtt_server = "mqtt://localhost:1883";
//
//// Initializes the espClient. You should change the espClient name if you have multiple ESPs running in your home automation system
//WiFiClient espClient;
//PubSubClient client(espClient);
//
//
//
//// Lamp - LED - GPIO 4 = D2 on ESP-12E NodeMCU board
//const int lamp = 4;
//
//
//
//// Timers auxiliar variables
//long now = millis();
//long lastMeasure = 0;
//
//// Don't change the function below. This functions connects your ESP8266 to your router
//void setup_wifi() {
//  delay(10);
//  // We start by connecting to a WiFi network
//  Serial.println();
//  Serial.print("Connecting to ");
//  Serial.println(ssid);
//   WiFi.mode(WIFI_STA);
//  WiFi.begin(ssid, password);
//  while (WiFi.status() != WL_CONNECTED) {
//    delay(500);
//    Serial.print(".");
//  }
//  Serial.println("");
//  Serial.print("WiFi connected - ESP IP address: ");
//  Serial.println(WiFi.localIP());
//}
//
//// This functions is executed when some device publishes a message to a topic that your ESP8266 is subscribed to
//// Change the function below to add logic to your program, so when a device publishes a message to a topic that 
//// your ESP8266 is subscribed you can actually do something
//void callback(String topic, byte* message, unsigned int length) {
//  Serial.print("Message arrived on topic: ");
//  Serial.print(topic);
//  Serial.print(". Message: ");
//  String messageTemp;
//  
//  for (int i = 0; i < length; i++) {
//    Serial.print((char)message[i]);
//    messageTemp += (char)message[i];
//  }
//  Serial.println();
//
//  // Feel free to add more if statements to control more GPIOs with MQTT
//
//  // If a message is received on the topic room/lamp, you check if the message is either on or off. Turns the lamp GPIO according to the message
//  if(topic=="room/lamp"){
//      Serial.print("Changing Room lamp to ");
//      if(messageTemp == "on"){
//        digitalWrite(lamp, HIGH);
//        Serial.print("On");
//      }
//      else if(messageTemp == "off"){
//        digitalWrite(lamp, LOW);
//        Serial.print("Off");
//      }
//  }
//  Serial.println();
//}
//
//// This functions reconnects your ESP8266 to your MQTT broker
//// Change the function below if you want to subscribe to more topics with your ESP8266 
//void reconnect() {
//  // Loop until we're reconnected
//  while (!client.connected()) {
//    Serial.print("Attempting MQTT connection...");
//    // Attempt to connect
//   
//
//    if (client.connect("ESP8266Client")) {
//      Serial.println("connected");  
//      // Subscribe or resubscribe to a topic
//      // You can subscribe to more topics (to control more LEDs in this example)
//      client.subscribe("room/lamp");
//    } else {
//      Serial.print("failed, rc=");
//      Serial.print(client.state());
//      Serial.println(" try again in 5 seconds");
//      // Wait 5 seconds before retrying
//      delay(5000);
//    }
//  }
//}
//
//// The setup function sets your ESP GPIOs to Outputs, starts the serial communication at a baud rate of 115200
//// Sets your mqtt broker and sets the callback function
//// The callback function is what receives messages and actually controls the LEDs
//void setup() {
//  pinMode(lamp, OUTPUT);
//  
// 
//  
//  Serial.begin(115200);
//  setup_wifi();
//  
//  client.setServer(mqtt_server, 1883);
//  client.setCallback(callback);
//
//}
//
//// For this project, you don't need to change anything in the loop function. Basically it ensures that you ESP is connected to your broker
//void loop() {
//
//  if (!client.connected()) {
//    reconnect();
//  }
//  if(!client.loop())
//    client.connect("ESP8266Client");
//
//  now = millis();
//  
// 
//} 
