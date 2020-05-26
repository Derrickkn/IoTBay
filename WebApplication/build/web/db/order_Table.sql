/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  luke.galic
 * Created: 26/05/2020
 */

CREATE TABLE Order_Table (
OrderID INT(8) NOT NULL,
UserID  INT(8) NOT NULL,
OrderDate DATE NOT NULL,
TrackingNumber INT(20),
OrderPaid BOOLEAN NOT NULL,
ShipmentAddress VARCHAR(100) NOT NULL,
OrderStatus VARCHAR(100) NOT NULL,
OrderCost INT(10) NOT NULL,
PaymentMethod VARCHAR(20) NOT NULL,
CardNo INT(4),
CONSTRAINT Order_PK PRIMARY KEY (OrderID),
CONSTRAINT Order_FK FOREIGN KEY (UserID) REFERENCES UnregisteredUser_Table(UserID));

INSERT INTO Order_Table (OrderID, UserID, OrderDate, TrackingNumber, OrderPaid, Shipment Address, OrderStatus, OrderCost, PaymentMethod, CardNo)
VALUES  ('401','141','2019-02-20','50001','T','VIC, Telford, 12 Myrtle Street','Delivered','140.00','Mastercard','1234'),
        ('402','142','2019-02-20','50002','T','QLD, Turkey Beach, 83 Masthead Drive','Shipping','140.00','Visa','2222'),
        ('403','143','2019-02-20','50003','T','NSW, Burwood North, 93 Edward Bennett Drive','Delivered','140.00','Visa','1111'),
        ('404','101','2019-02-20','50004','T','QLD, Almaden, 4 Glen William Road','Delivered','130.00','Mastercard','1066'),
        ('405','101','2019-02-22','50005','T','QLD, Almaden, 4 Glen William Road','Delivered','80.00','Mastercard','1066'),
        ('406','101','2019-02-23','50006','F','QLD, Almaden, 4 Glen William Road','Waiting for Payment','25.00','Mastercard','1066'),
        ('407','103','2019-03-20','50007','T','VIC, Macleod West, 25 Maintongoon Road','Delivered','50.00','Mastercard','5354'),
        ('408','103','2019-03-25','50008','T','VIC, Macleod West, 25 Maintongoon Road','Delivered','280.00','Mastercard','5354'),
        ('409','103','2019-03-28','50009','T','VIC, Macleod West, 25 Maintongoon Road','Delivered','1100.00','Mastercard','5354'),
        ('410','103','2019-04-25','50010','F','VIC Macleod West, 25 Maintongoon Road','Waiting for Payment','90.00','Mastercard','5354'),
        ('411','106','2019-04-25','T','WA, Cramphone, 9 Cubbine Road','Delivered','50011','90.00','Mastercard','7901'),
        ('412','106','2019-05-02','T','WA, Cramphone, 9 Cubbine Road','Delivered','50012','130.00','Mastercard','7901'),
        ('413','111','2019-05-02','T','NSW, Weelong, 64 Tooraweenah Road','Delivered','50013','325.00','American Express','5062'),
        ('414','111','2019-05-10','T','NSW, Weelong, 64 Tooraweenah Road','Shipping','50014','50.00','American Express','5062'),
        ('415','112','2019-05-10','T','NSW, Neath, 9 Woerdens Road','Delivered','50015','1000.00','Visa','0590'),
        ('416','114','2019-05-10','T','NSW, Marlow, 43 Berambing Crescent','Shipping','50016','30.00','American Express','2485'),
        ('417','115','2019-05-10','T','NT, Coonawarra, 41 Marion St','Shipping','50017','400','Visa','0590'),
        ('418','117','2019-05-10','T','VIC, Dinner Plain, 36 Frouds Road','Delivered','50018','50','Mastercard','0777'),
        ('419','117','2019-05-20','T','VIC, Dinner Plain, 36 Frouds Road','Shipping','50019','80.00','Mastercard','0777'),
        ('420','117','2019-05-30','T','VIC, Dinner Plain, 36 Frouds Road','Shipping','50020','220.00','Mastercard','0777');