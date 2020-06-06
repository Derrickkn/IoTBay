/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  silve
 * Created: May 31, 2020
 * Edited by: Kira
 */
DROP TABLE Payment_Table
CREATE TABLE Payment_Table (
PaymentID INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
OrderID INT NOT NULL,
paymentMethod VARCHAR(20),
cardNo VARCHAR(20),
datePaid VARCHAR(20),
PRIMARY KEY (PaymentID),
FOREIGN KEY (OrderID) REFERENCES order_Table(OrderID));

INSERT INTO Payment_Table(OrderID, PaymentMethod, CardNo, datePaid)
    VALUES  (1,'Mastercard','1234 5671 5466 1288', '15-12-2019'),
            (2,'Visa','2222 5315 0315 1562', '28-06-2020'),
            (3,'Visa','1111 1364 1531 3156', '28-06-2020'),
            (4,'Mastercard','1066 4864 8746 5648', '29-06-2020'),
            (5,'Mastercard','1066 1569 1354 3146', '29-06-2020'),
            (6,'Mastercard','1066 1325 1356 1548', '29-06-2020'),
            (7,'Mastercard','5354231835468435', '29-06-2020'),
            (8,'Mastercard','5354135431851354', '29-06-2020'),
            (9,'Mastercard','5354168715641384', '29-06-2020'),
            (10,'Mastercard','5354 464818656468', '30-06-2020'),
            (11,'Mastercard','7901646516346486', '30-06-2020'),
            (12,'Mastercard','7901245454691864', '30-06-2020'),
            (13,'American Express','5062646448625848', '30-06-2020'),
            (14,'American Express','5062546834861548', '30-06-2020'),
            (15,'Visa','0590487948741418', '30-06-2020'),
            (16,'American Express','2485 1456 1548 1583', '01-07-2020'),
            (17,'Visa','0590186848916862', '01-07-2020'),
            (18,'Mastercard','0777568468694644', '01-07-2020'),
            (19,'Mastercard','0777265959546953', '01-07-2020'),
            (20,'Mastercard','0777586418643984', '01-07-2020');