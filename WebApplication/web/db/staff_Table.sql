    /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  luke.galic
 * Created: 26/05/2020
 */

CREATE TABLE Staff_Table (
UserID INT NOT NULL,
Password VARCHAR(20) NOT NULL,
EContact VARCHAR(50) NOT NULL,
StaffType VARCHAR(10) NOT NULL,
CONSTRAINT Staff_PK PRIMARY KEY (UserID),
CONSTRAINT Staff_FK FOREIGN KEY (UserID) REFERENCES UnregisteredUser_Table(UserID));

INSERT INTO Staff_Table (UserID, Password, EContact, StaffType)
VALUES  (121,'Ux5MOah1','Archer (0246995987)','Manager'),
        (122,'0dBsy8M7','Abigail (0889736546)','Manager'),
        (123,'Z2mzf2xy','Patrick (0353993462)','Manager'),
        (124,'b1ZFh6fL','Alex (0362610702)','Employee'),
        (125,'Au1WzkFp','Connor (0362463884)','Employee'),
        (126,'Lq8mXMFx','Darcy (0391979814)','Employee'),
        (127,'zK8pi7q5','Keira (0745116609)','Employee'),
        (128,'L8hKkR7X','Daniel (0249572032)','Employee'),
        (129,'p6HVJjIY','Darcy (0890539084)','Employee'),
        (130,'L1ftfAG1','Claudia (0353659891)','Employee'),
        (131,'vE1UXbdf','Indiana (0890436383)','Employee'),
        (132,'Vs78Aixv','Phoebe (0893814181)','Employee'),
        (133,'Wb91I533','Logan (0240490219)','Employee'),
        (134,'He45w0YB','Ali (0261608103)','Employee'),
        (135,'Mn9XzKy9','Aaron (0739197233)','Employee'),
        (136,'4oVZ9U45','Laura (0740032518)','Employee'),
        (137,'p3FXNi2Z','Zac (0240685285)','Employee'),
        (138,'E3frjFA4','Lilly (0740184410)','Employee'),
        (139,'7JeYVmC7','Connor (0261723424)','Employee'),
        (140,'2BaYFL61','Angus (0240133669)','Employee');