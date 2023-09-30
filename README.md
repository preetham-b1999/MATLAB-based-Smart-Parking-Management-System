# MATLAB-based-Smart-Parking-Management-System

*Description* 

Designed and implemented a parking control system using Arduino uno board to do the following tasks. 

1.	When there are empty spots in the parking, the total number of available parking spots and a “Welcome!!!” message has to be displayed on an LCD indicator. The parking barrier arm must be in the closed position with a RED traffic light on. 

2.	For a car to enter the parking, the driver must press the Enter button. Then the system assigns a four-digit ID number to the Vehicle and displays it on LCD. The system then displays the Parking slot number in which the car must be parked. Then the gate will be opened and the RED traffic light changes to GREEN to allow the car to enter. After the car enters, the barrier arm closes, the traffic light turns to RED again and the number of available parking spots is reduced by one. 

3.	For a car to exit the parking, the driver must press the Exit button. Then the system will ask for ID. The driver must enter the four-digit ID assigned to him. The ID will be validated. If the ID is not valid, the system again asks the driver to enter the ID. If it is valid, the barrier arm will open, and the traffic light turns from RED to GREEN. Once the car leaves the parking, the barrier bar closes again, the traffic light turns to RED, and the number of available parking spots displayed on the LCD increases by one. 

4.	It is assumed that the capacity of the parking lot is 13 spots. When the parking is full, the message on the LCD has to change from “Welcome!!!” to “Please come later.” with the available parking spots of 0. In this case, the barrier bar should not open if a driver tries to enter the parking by pressing the Enter button.

5.	We have 13 ID’s and 13 Parking Spots. The IDs are ['0001',0010', '0011', '0100', '0101', '0110', '0111', '1000', '1001','1010','1011','1100','1101'] and their corresponding Parking Slots are [Slot1, Slot 2, Slot3, Slot 4, Slot 5, Slot 6, Slot 7, Slot 8, Slot 9, Slot 10, Slot 11, Slot 12, Slot 13] respectively. These IDs and Slots are first come first serve. The Slots are to be filled from Slot 1 to Slot 13 in the mentioned order. That means the first vehicle to enter should be parked at Slot 1 and last vehicle to enter should be parked at Slot 13. The Slot 1 is assigned to driver with ID 0001, Slot 2 is assigned to driver with ID 0010 and similarly Slot 13 is assigned to Driver with ID 1101. 




*Example*

•	Assume 13 Cars entered the parking lot, one after the other. Driver will press the Enter button. They will be assigned an ID starting from ‘0001’ until ‘1101’ [left to right] in the mentioned order and will be assigned Slot 1 to Slot 13 [left to right] in the mentioned order to park their cars respectively. Now the Parking Lot is full, with zero IDs and Slots left.
•	A driver with ID 0011 wants to exit. The driver will press the exit button. The system will ask for ID. The Driver will enter the ID. The system then displays “The ID is valid, you can Exit”. Red light changes to green, barrier goes up and the driver will exit the parking. Similarly, Drivers with ID’s 0101 and 1100 will exit one after the other. Now, in total there are 10/13 slots left, as 3 left the parking. The empty parking slots are Slot 3, Slot 5 and Slot 12 and the left-over IDs are 0011, 0101 and 1100 respectively. A Driver now presses the Enter button. The ID 0010 and Parking Slot 3 will be assigned to this driver. Red light changes to green, barrier goes up and Car enters. Then barrier goes down and green light changes to red.

*Test procedure*

The implemented project will be fully tested to ensure that the project objectives are met. A sample test may include the following steps. 
1. When the parking lot is empty, 6 cars enter the parking lot sequentially. 
2. 1 car leaves the parking lot. 
3. 8 cars enter the parking lot sequentially. 
4. 1 car enters the parking lot. 
5. 1 car leaves the parking lot. 
6. 1 car enters the parking lot. 
