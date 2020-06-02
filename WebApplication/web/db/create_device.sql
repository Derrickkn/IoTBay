/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Jianmu Huang
 * Created: 26/05/2020
 */
DROP TABLE DEVICE;
CREATE TABLE DEVICE
(    
   "ID" INT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),   
   "NAME" VARCHAR(500),     
   "TYPE" VARCHAR(500),
   "PRICE" DOUBLE,
   "QUANTITY" INTEGER
);

INSERT INTO DEVICE ("NAME", "TYPE", "PRICE", "QUANTITY") 

    VALUES  ('Canon 800D Camera', 'Photography', 2000.0, 20),
    ('Samsung Galaxy S10', 'Mobile', 1399.0, 40);
            