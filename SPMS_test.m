 %% 0. Clear the workspace.
clear;
clc;

%% 1. Initilize the Arduino, Servo, LCD
a = arduino('COM3', 'Uno', 'Libraries',{'Servo','ExampleLCD/LCDAddon'},'ForceBuild',true);
servoMotor = servo(a, 'D9');
lcd = addon(a,'ExampleLCD/LCDAddon','RegisterSelectPin','D7','EnablePin','D6','DataPins',{'D5','D4','D3','D2'});
initializeLCD(lcd, 'Rows', 2, 'Columns', 16);

%% 2. Define Variabales
capacity = 13;
places = capacity;
LOW = 0;
HIGH = 0.5;
sd=["0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101"];
ps=[1,2,3,4,5,6,7,8,9,10,11,12,13];
filled=zeros(1,13);
temp1=0;
temp2=0; 

%% 3. Display the initial info in LCD and show the LED as red
printLCD(lcd,['Smart Parking ']);
printLCD(lcd,['System!!!']);
pause(2);
printLCD(lcd,['Available:',num2str(places),'.']);
printLCD(lcd,['Welcome!!!']);
writePosition(servoMotor, LOW);
%% 4. LED in red
writeDigitalPin(a, 'D11', 1);  
writeDigitalPin(a, 'D12', 0);  
writeDigitalPin(a, 'D13', 0);  

%% 5. Main loop
while 1
    % 5.1 Car-in
    if readVoltage(a, 'A0') <= 2
%         fprintf('car-in');
        places = places - 1;
        temp1=0;
        if places>=0
            for k=1:13
                if ismember(ps(k),filled)==1
                    continue;
                else
                    temp1=k;
                    break;
                end
            end
            filled(temp1)=temp1;
            printLCD(lcd,'Your ID is : ');
            printLCD(lcd,num2str(dec2bin(ps(temp1),4)));
            pause(2);
            printLCD(lcd,'Park Your Car in');
            printLCD(lcd,['Slot ',num2str(ps(temp1))]);
            pause(2);
%             fprintf('bar-high');
            writeDigitalPin(a, 'D11', 0);  % LED in green
            writeDigitalPin(a, 'D13', 1);  
            writePosition(servoMotor, HIGH);
            printLCD(lcd,'Vehicle Entering');
            printLCD(lcd,'    ');
            pause(1);
            writePosition(servoMotor, LOW);
            writeDigitalPin(a, 'D11', 1);  % LED in red
            writeDigitalPin(a, 'D13', 0);  
            printLCD(lcd,['Available:',num2str(places),'.']);
            printLCD(lcd,'Welcome!!!');
            disp(places);
            disp(filled);
        else
            places = 0;
            printLCD(lcd,['Available:',num2str(places),'.']);
            printLCD(lcd,'Plz come later.');
             disp(places);
        end
    end
    
    % 5.2 Car-out
    if readVoltage(a, 'A1') <= 2
%         fprintf('car-out');
        places = places + 1;
        if places <= capacity
            k=1;
            j=1;
            while j==1
                 x='';
                 printLCD(lcd,'Please Provide');
                 printLCD(lcd,'Assigned ID:');
                 while k<=4
                     if readVoltage(a, 'A2') <= 2
                        x=[x,'0'];
                        k=k+1;
                        printLCD(lcd,'Please Provide');
                        printLCD(lcd,['Assigned ID:',x]);
                        pause(0.3);
                     elseif readVoltage(a,'A3')<=2
                        x=[x,'1'];
                        k=k+1;
                        printLCD(lcd,'Please Provide');
                        printLCD(lcd,['Assigned ID:',x]);
                        pause(0.3);
                     end
                 end
                 x
                 printLCD(lcd,'Your ID is being');
                 printLCD(lcd,'Validated');
                 pause(2);
                 if k>4
                    for i=1:13
                        if sd(i)==x
                            if filled(i)==i
                                j=0;
                                filled(i)=0;
                                break;
                            else
                                break;
                            end
                        else
                            continue;
                        end
                    end
                    if j==1
                        k=1;
                        printLCD(lcd,'Please Provide');
                        printLCD(lcd,'Valid ID');
                        pause(2);
                    end
                 end
            end
            printLCD(lcd,'Your ID is valid');
            printLCD(lcd,'Please Exit');
            pause(3);
%             fprintf('bar-high');            
            writeDigitalPin(a, 'D11', 0);  % LED in green
            writeDigitalPin(a, 'D13', 1);  
            writePosition(servoMotor, HIGH);
            pause(1);
            writePosition(servoMotor, LOW);
            writeDigitalPin(a, 'D11', 1);  % LED in red
            writeDigitalPin(a, 'D13', 0);          
            printLCD(lcd,['Available:',num2str(places),'.']);
            printLCD(lcd,'Welcome!!!');
             disp(places);
        else
            printLCD(lcd,'Zero vehicle');
            printLCD(lcd,'Parked');
            places = capacity;
            pause(2);
            printLCD(lcd,['Available:',num2str(places),'.']);
            printLCD(lcd,'Welcome!!!');
             disp(places);
        end
        disp(filled);
    end
end