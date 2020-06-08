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

INSERT INTO Payment_Table(OrderID, PaymentMethod, CardNo, datePaid)
    VALUES  (1,'Mastercard','1234567154661288', '2019-12-15'),
            (2,'Visa','2222 531503151562', '2020-06-28'),
            (3,'Visa','1111 136415313156', '2020-06-28'),
            (4,'Mastercard','106648648746 5648', '2020-06-29'),
            (5,'Mastercard','106615691354 3146', '2020-06-29'),
            (6,'Mastercard','106613251356 1548', '2020-06-29'),
            (7,'Mastercard','5354231835468435', '2020-06-29'),
            (8,'Mastercard','5354135431851354', '2020-06-29'),
            (9,'Mastercard','5354168715641384', '2020-06-29'),
            (10,'Mastercard','5354 464818656468', '2020-06-30'),
            (11,'Mastercard','7901646516346486', '2020-06-30'),
            (12,'Mastercard','7901245454691864', '2020-06-30'),
            (13,'American Express','5062646448625848', '2020-06-30'),
            (14,'American Express','5062546834861548', '2020-06-30'),
            (15,'Visa','0590487948741418', '2020-06-30'),
            (16,'American Express','2485145615481583', '2020-07-01'),
            (17,'Visa','0590186848916862', '2020-07-01'),
            (18,'Mastercard','0777568468694644', '2020-07-01'),
            (19,'Mastercard','0777265959546953', '2020-07-01'),
            (20,'Mastercard','0777586418643984', '2020-07-01'),
            (5, 'MasterCard', '4920183759381729', '2020-01-19'),
            (4, 'Mastercard', '4920183759381729', '2020-01-17')
            (8, 'Mastercard', '4920183759381729', '2020-04-11'),
            (17, 'Mastercard', '4920183759381729', '2020-06-19'),
            (21, 'Mastercard', '4920183759381729', '2020-10-11');

