/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  luke.galic
 * Created: 26/05/2020
 * Edited by: kira
 */

CREATE TABLE Order_Table (
OrderID INT NOT NULL,
UserID  INT NOT NULL,
OrderDate DATE NOT NULL,
TrackingNumber INT,
OrderPaid BOOLEAN NOT NULL,
ShipmentAddress VARCHAR(100) NOT NULL,
OrderStatus VARCHAR(100) NOT NULL,
OrderCost INT NOT NULL,
CONSTRAINT Order_PK PRIMARY KEY (OrderID),
CONSTRAINT Order_FK FOREIGN KEY (UserID) REFERENCES UnregisteredUser_Table(UserID));

INSERT INTO Order_Table (OrderID, UserID, OrderDate, TrackingNumber, OrderPaid, ShipmentAddress, OrderStatus, OrderCost)
VALUES  (401,141,'2019-02-20',50001,TRUE,'VIC, Telford, 12 Myrtle Street','Delivered',140.00),
        (402,142,'2019-02-20',50002,TRUE,'QLD, Turkey Beach, 83 Masthead Drive','Shipping',140.00),
        (403,143,'2019-02-20',50003,TRUE,'NSW, Burwood North, 93 Edward Bennett Drive','Delivered',140.00),
        (404,101,'2019-02-20',50004,TRUE,'QLD, Almaden, 4 Glen William Road','Delivered',130.00),
        (405,101,'2019-02-22',50005,TRUE,'QLD, Almaden, 4 Glen William Road','Delivered',80.00),
        (406,101,'2019-02-23',50006,FALSE,'QLD, Almaden, 4 Glen William Road','Waiting for Payment',25.00),
        (407,103,'2019-03-20',50007,TRUE,'VIC, Macleod West, 25 Maintongoon Road','Delivered',50.00),
        (408,103,'2019-03-25',50008,TRUE,'VIC, Macleod West, 25 Maintongoon Road','Delivered',280.00),
        (409,103,'2019-03-28',50009,TRUE,'VIC, Macleod West, 25 Maintongoon Road','Delivered',1100.00),
        (410,103,'2019-04-25',50010,FALSE,'VIC Macleod West, 25 Maintongoon Road','Waiting for Payment',90.00),
        (411,106,'2019-04-25',50011,TRUE,'WA, Cramphone, 9 Cubbine Road','Delivered',90.00),
        (412,106,'2019-05-02',50012,TRUE,'WA, Cramphone, 9 Cubbine Road','Delivered',130.00),
        (413,111,'2019-05-02',50013,TRUE,'NSW, Weelong, 64 Tooraweenah Road','Delivered',325.00),
        (414,111,'2019-05-10',50014,TRUE,'NSW, Weelong, 64 Tooraweenah Road','Shipping',50.00),
        (415,112,'2019-05-10',50015,TRUE,'NSW, Neath, 9 Woerdens Road','Delivered',1000.00),
        (416,114,'2019-05-10',50016,TRUE,'NSW, Marlow, 43 Berambing Crescent','Shipping',30.00),
        (417,115,'2019-05-10',50017,TRUE,'NT, Coonawarra, 41 Marion St','Shipping',400.00),
        (418,117,'2019-05-10',50018,TRUE,'VIC, Dinner Plain, 36 Frouds Road','Delivered',50.00),
        (419,117,'2019-05-20',50019,TRUE,'VIC, Dinner Plain, 36 Frouds Road','Shipping',80.00),
        (420,117,'2019-05-30',50020,TRUE,'VIC, Dinner Plain, 36 Frouds Road','Shipping',220.00);

Select * from Order_table where userID = 141;