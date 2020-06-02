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
datePaid DATE,
PRIMARY KEY (PaymentID),
FOREIGN KEY (OrderID) REFERENCES order_Table(OrderID));

INSERT INTO Product_Table (ProductID, OrderID, PaymentMethod, CardNo, datePaid)
    VALUES  (201,401,'Mastercard','1234 5671 5466 1288', sysdate),
            (202,402,'Visa','2222 5315 0315 1562', sysdate),
            (203,403,'Visa','1111 1364 1531 3156', sysdate),
            (204,404,'Mastercard','1066 4864 8746 5648', sysdate),
            (205,405,'Mastercard','1066 1569 1354 3146', sysdate),
            (206,406,'Mastercard','1066 1325 1356 1548', sysdate),
            (207,407,'Mastercard','5354 2318 3546 8435', sysdate),
            (208,408,'Mastercard','5354 1354 3185 1354', sysdate),
            (209,409,'Mastercard','5354 1687 1564 1384', sysdate),
            (210,410,'Mastercard','5354 4648 1865 6468', sysdate),
            (211,411,'Mastercard','7901 6465 1634 6486', sysdate),
            (212,412,'Mastercard','7901 2454 5469 1864', sysdate),
            (213,413,'American Express','5062 6464 4862 5848', sysdate),
            (214,414,'American Express','5062 5468 3486 1548', sysdate),
            (215,415,'Visa','0590 4879 4874 1418', sysdate),
            (216,416,'American Express','2485 1456 1548 1583', sysdate),
            (217,417,'Visa','0590 1868 4891 6862', sysdate),
            (218,418,'Mastercard','0777 5684 6869 4644', sysdate),
            (219,419,'Mastercard','0777 2659 5954 6953', sysdate),
            (220,420,'Mastercard','0777 5864 1864 3984', sysdate);