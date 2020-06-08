/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  luke.galic
 * Created: 26/05/2020
 */

CREATE TABLE ProductOrderLine_Table (
ProductID INT NOT NULL,
OrderID INT NOT NULL,
Quantity INT NOT NULL,
CONSTRAINT ProductOrderLine_PK PRIMARY KEY (ProductID, OrderID),
CONSTRAINT ProductOrderLine_FK1 FOREIGN KEY (ProductID) REFERENCES Product_Table(ProductID),
CONSTRAINT ProductOrderLine_FK2 FOREIGN KEY (OrderID) REFERENCES Order_Table(OrderID));

INSERT INTO ProductOrderLine_Table (ProductID, OrderID, Quantity)
VALUES  (1,1,1),
        (1,2,1),
        (1,3,1),
        (2,4,1),
        (3,5,1),
        (8,6,1),
        (11,7,2),
        (17,8,1),
        (19,8,1),
        (20,9,1),
        (6,11,1),
        (7,11,1),
        (17,12,1),
        (15,13,1),
        (16,13,1),
        (11,14,2),
        (4,15,1),
        (8,16,1),
        (5,17,2),
        (11,18,2),
        (3,19,1),
        (1,20,1),
        (3,20,1);