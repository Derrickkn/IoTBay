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
VALUES  (201,401,1),
        (201,402,1),
        (201,403,1),
        (202,404,1),
        (203,405,1),
        (208,406,1),
        (211,407,2),
        (217,408,1),
        (219,408,1),
        (220,409,1),
        (210,410,1),
        (206,411,1),
        (207,411,1),
        (217,412,1),
        (215,413,1),
        (216,413,1),
        (211,414,2),
        (204,415,1),
        (208,416,1),
        (205,417,2),
        (211,418,2),
        (203,419,1),
        (201,420,1),
        (203,420,1);