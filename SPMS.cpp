#include <LiquidCrystal.h>// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(7,6,5,4,3,2);
#include <Servo.h> //includes the servo library

Servo myservo;

int enter =A0;
int exitb =A1;
int Nu_0=A2;
int Nu_1=A3;

int Total =13;
int Space;

char *sd[]={"0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101"};
int ps[13]={1,2,3,4,5,6,7,8,9,10,11,12,13};
int filled[13]={};
int temp1=0;
int temp2=0; 

void setup() 
{
pinMode(enter, INPUT);
pinMode(exitb, INPUT);
pinMode(Nu_0,INPUT);
pinMode(Nu_1,INPUT);

pinMode(11, OUTPUT);
pinMode(13, OUTPUT);
pinMode(12, OUTPUT);
myservo.attach(9);
myservo.write(0);

lcd.begin(16, 2);  
lcd.setCursor (0,0);
lcd.print("Smart Parking");
lcd.setCursor (0,1);
lcd.print("System     ");
delay (500);
lcd.clear();  

Space = Total;
}

void loop()
{ 
if(digitalRead (enter) == LOW)
{
  if(Space>0)
  {
        for(int i=0;i<13;i++)
        {
          for(int j=0;j<13;j++)
          {
            if(ps[i]==filled[j])
            {
              break;
            }
            else
            {
              temp1=i;
              break;
            }
          }
          if (temp1 != NULL)
          {
            break;
          }
        }
        temp2=13-Space;
        filled[temp2]=ps[temp1];
        lcd.clear();
        lcd.setCursor(0,0);
        lcd.print("Your ID is: ");
        lcd.setCursor(0,1);
        lcd.print(sd[temp1]);
        delay(2000);
        lcd.clear();
        lcd.setCursor(0,0);
        lcd.print("Park Your Car in");
        lcd.setCursor(0,1);
        lcd.print("Slot ");
        lcd.print(ps[temp1]);
        delay(2000);
        myservo.write(100); 
        digitalWrite(11,0);
        digitalWrite(13,1);
        Space = Space-1;
        lcd.clear();
    lcd.setCursor (0,0);
    lcd.print("ENTER");
        delay(500);
        myservo.write(0);
        lcd.clear();
        temp1=0;
  } 
}

if(digitalRead (exitb) == LOW)
{
  if(Space==Total)
  {
    lcd.clear();
    lcd.setCursor (0,0);
    lcd.print("No cars");
    lcd.setCursor (0,1);
    lcd.print("Parked");
    delay (500);
    lcd.clear(); 
  } 
  else
  {
    myservo.write(100);
    digitalWrite(11,0);
    digitalWrite(13,1);
    Space = Space+1;
    delay(500);
    myservo.write(0);
    lcd.clear();
  }
}
if(Space==0)
{
  lcd.setCursor (0,0);
  lcd.print("Space Unavailable");
  lcd.setCursor (0,1);
  lcd.print("Plz Come later");
  digitalWrite(11,1);
  digitalWrite(13,0);
}
if(Space>0)
{
digitalWrite(11,1);
digitalWrite(13,0);
lcd.setCursor (0,0);
lcd.print("Welcome!!");

lcd.setCursor (0,1);
lcd.print("Avail Slots:");
lcd.print(Space);
}
}
