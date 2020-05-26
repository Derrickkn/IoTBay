/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  luke.galic
 * Created: 26/05/2020
 */

CREATE TABLE Product_Table (
ProductID INT(8) NOT NULL,
"Name" VARCHAR(35) NOT NULL,
Price FLOAT(10,2) NOT NULL,
Description VARCHAR(100) NOT NULL,
Quantity INTEGER(10) NOT NULL,
SuppliedDate DATE,
CONSTRAINT Product_PK PRIMARY KEY (ProductID));

INSERT INTO Product_Table (ProductID, "Name", Price, Description, Quantity, SuppliedDate)
VALUES  ('201','Google Home','140.00','Voice activation smart device.','20','2019-01-10'),
        ('202','Amazon Echo','130.00','Voice activation smart device.','20','2019-01-10'),
        ('203','Ring Doorbell','80.00','Allows the user to answer the door using their smartphone.','30','2019-01-10'),
        ('204','Apple Watch','1000.00','High tech smart watch that has many useful features.','15','2019-01-10'),
        ('205','FitBit Charge 3','200.00','Smart watch that tracks physical activity.','20','2019-01-10'),
        ('206','Nest Thermostat','70.00','Smart thermostat that can be controlled using an app.','25','2019-01-30'),
        ('207','Etekcity Smart Plug','20.00','Tracks electricity usage among devices that it charges.','40','2019-01-30'),
        ('208','BERENNIS Smart Light Bulb','30.00','Colour changing light bulb that can be controlled using an app.','40','2019-01-30'),
        ('209','TanTan Smart Light Switch','50.00','Can control lights using a timer or countdown, can be connected to Google Assistant and Amazon Alexa','40','2019-01-30'),
        ('210','Taloya Smart Ceiling Light','90.00','Colour and brightness changing light that can be controlled using an app.','30','2019-01-30'),
        ('211','HEYVALUE Smart Power Strip','25.00','Efficient power strip that can schedule the usage of power, safe against powersurges.','50','2019-02-05'),
        ('212','Sense Energy Monitor','250.00','Displays energy usage of devices, allowing the user to better control power usage.','20','2019-02-05'),
        ('213','SmartDry Wireless Laundry Sensor','50.00','Track clothes dryer status right from the fingertips.','30','2019-02-05'),
        ('214','Hornbill Smart Door Lock','140.00','Provides anti-peep passwords and auto-lock features to keep your home safe.','20','2019-02-05'),
        ('215','Graywind Motorized Roller Shade','185.00','High-quality fabric, can be comfortably controlled by the companion app called Smart Life.','20','2019-02-05'),
        ('216','Soliom S90 Pro Security Camera','140.00','Keep a track of your home or business from anywhere in the world. 1080p full HD day time video.','20','2019-02-18'),
        ('217','Philips Hue','130.00','Smart light boasting 16 million colors to make your room look dazzling.','30','2019-02-18'),
        ('218','IPhone 11','1000.00','Latest technology smart phone.','15','2019-02-18'),
        ('219','Boomerang CycloTrac','150.00','Bluetooth and cellular bike tracking device.','20','2019-02-18'),
        ('220','Samsung Galaxy S20','1100.00','Latest technology smart phone.','15','2019-02-18');