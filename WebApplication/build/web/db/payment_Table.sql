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
    VALUES  (401,'Mastercard','1234 5671 5466 1288', '15-12-2019'),
            (402,'Visa','2222 5315 0315 1562', '28-06-2020'),
            (403,'Visa','1111 1364 1531 3156', '28-06-2020'),
            (404,'Mastercard','1066 4864 8746 5648', '29-06-2020'),
            (405,'Mastercard','1066 1569 1354 3146', '29-06-2020'),
            (406,'Mastercard','1066 1325 1356 1548', '29-06-2020'),
            (407,'Mastercard','5354 2318 3546 8435', '29-06-2020'),
            (408,'Mastercard','5354 1354 3185 1354', '29-06-2020'),
            (409,'Mastercard','5354 1687 1564 1384', '29-06-2020'),
            (410,'Mastercard','5354 4648 1865 6468', '30-06-2020'),
            (411,'Mastercard','7901 6465 1634 6486', '30-06-2020'),
            (412,'Mastercard','7901 2454 5469 1864', '30-06-2020'),
            (413,'American Express','5062 6464 4862 5848', '30-06-2020'),
            (414,'American Express','5062 5468 3486 1548', '30-06-2020'),
            (415,'Visa','0590 4879 4874 1418', '30-06-2020'),
            (416,'American Express','2485 1456 1548 1583', '01-07-2020'),
            (417,'Visa','0590 1868 4891 6862', '01-07-2020'),
            (418,'Mastercard','0777 5684 6869 4644', '01-07-2020'),
            (419,'Mastercard','0777 2659 5954 6953', '01-07-2020'),
            (420,'Mastercard','0777 5864 1864 3984', '01-07-2020');