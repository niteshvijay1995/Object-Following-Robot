
#define lmotor1 8
#define lmotor2 9
#define rmotor1 10
#define rmotor2 11

void setup()
{
  Serial.begin(9600);    //Initialising serial port
  pinMode(rmotor1,OUTPUT);
  pinMode(rmotor2,OUTPUT);
  pinMode(lmotor1,OUTPUT);  
  pinMode(lmotor2,OUTPUT);
}
void loop()
{
  while(Serial.available())
  {                                                                                                                        
    int x = Serial.read();    //Reading character from serial port
    x = x-48;                //Converting ASCII code to integer
    if(x==0)    //Forward
    {
      digitalWrite(rmotor1,HIGH);
      digitalWrite(rmotor2,LOW);
      digitalWrite(lmotor1,HIGH);
      digitalWrite(lmotor2,LOW);
      delay(400);
    }
    else if(x==1)    //Backward
    {
      digitalWrite(rmotor1,LOW);
      digitalWrite(rmotor2,HIGH);
      digitalWrite(lmotor1,LOW);
      digitalWrite(lmotor2,HIGH);
      delay(400);
    }
    else if(x==2)    //Right
    {
      digitalWrite(rmotor1,LOW);
      digitalWrite(rmotor2,LOW);
      digitalWrite(lmotor1,HIGH);
      digitalWrite(lmotor2,LOW);
      delay(180);
    }
    else if(x==3)    //Left
    {
      digitalWrite(rmotor1,HIGH);
      digitalWrite(rmotor2,LOW);
      digitalWrite(lmotor1,LOW);
      digitalWrite(lmotor2,LOW);
      delay(180);
    }  
      //Ideal
      digitalWrite(rmotor1,LOW);
      digitalWrite(rmotor2,LOW);
      digitalWrite(lmotor1,LOW);
      digitalWrite(lmotor2,LOW);
      delay(300);
  }
}
