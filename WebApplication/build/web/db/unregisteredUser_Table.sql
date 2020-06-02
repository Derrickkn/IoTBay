/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  luke.galic
 * Created: 26/05/2020
 */

drop table unregisteredUser_Table;  
CREATE TABLE UnregisteredUser_Table (
UserID INT NOT NULL,
FName VARCHAR(20) NOT NULL,
LName VARCHAR(20) NOT NULL,
Email VARCHAR(30) NOT NULL,
Phone VARCHAR(10) NOT NULL,
UserType Char NOT NULL,
CONSTRAINT UnregisteredUser_PK PRIMARY KEY (UserID));

INSERT INTO UnregisteredUser_Table (UserID, FName, LName, Email, Phone, UserType) 
    VALUES  (000,'Portal', 'Admin', 'iotbay@admin.com','0000000000', 'A'),
            (101,'Owen', 'McNair', 'O.McNair@gmail.com','0461151366', 'R'),
            (102,'Natalie', 'Camden', 'Nat.Camden@gmail.com','0291826799', 'R'),
            (103,'Jack', 'Greener', 'Jack.G@hotmail.com','0362364593', 'R'),
            (104,'Joseph', 'Sinclaire', 'Jo.Sinclaire@gmail.com','0246581357', 'R'),
            (105,'Harrison', 'Antill', 'Harry.Antill@outlook.com','0890859152', 'R'),
            (106,'Sara', 'Fink', 'Sara.Fink@gmail.com','0353039688', 'R'),
            (107,'Sophia', 'Wyndham', 'Soph.Wynham@outlook.com','0395821236', 'R'),
            (108,'Rory', 'Oldfield', 'R.Oldfield@hotmail.com','0353430191', 'R'),
            (109,'Kayla', 'Hernshiem', 'Kayla.H123@gmail.com','0890899026', 'R'),
            (110,'Callum', 'Nettlefold', 'Cal.Net1@hotmail.com','0261363372', 'R'),
            (111,'Alexis', 'Blair', 'Alexis.B01@outlook.com','0243906040', 'R'),
            (112,'Alex', 'Mordaunt', 'Alex.Mordaunt@hotmail.com','0887941913', 'R'),
            (113,'Sarah', 'Frodsham', 'Sarah.Frodsham@gmail.com','0394670151', 'R'),
            (114,'Savannah', 'Dyson', 'Sav.Dyson@outlook.com','0362920956', 'R'),
            (115,'Emma', 'Weatherburn', 'Emma.Weatherburn@hotmail.com','0295134983', 'R'),
            (116,'Matilda', 'Kermadec', 'Matilda123@gmail.com','0887184332', 'R'),
            (117,'Gabriel', 'Champion', 'Gab.Champ@hotmail.com','0889976748', 'R'),
            (118,'Tayla', 'Ruatoka', 'Tay.Ruatoka@outlook.com','0882970079', 'R'),
            (119,'Lola', 'Makutz', 'Lola.Makutz@gmail.com','0894089484', 'R'),
            (120,'Zane', 'Billson', 'Zane.B123@outlook.com','0293189184', 'R'),
            (121,'Zachary', 'Howitt', 'Zach.Howitt@gmail.com','0882630618', 'S'),
            (122,'Nicholas', 'Boniwell', 'Nich.Boniwell@hotmail.com','0395487371', 'S'),
            (123,'Kate', 'Allen', 'Kate.Allen@outlook.com','0887533689', 'S'),
            (124,'Jai', 'Osman', 'J.Osman@hotmail.com','0749693952', 'S'),
            (125,'Jackson', 'Gratwick', 'Jackson.Grat1@gmail.com','0749400944', 'S'),
            (126,'Zane', 'Prowse', 'ZP1995@gmail.com','0753888527', 'S'),
            (127,'Joshua', 'Butlin', 'JoshB2000@gmail.com','0261994188', 'S'),
            (128,'Dakota', 'Gascoigne', 'Dakota1@hotmail.com','0882344861', 'S'),
            (129,'Nate', 'Nolan', 'N.Nolan12@outlook.com','0745974168', 'S'),
            (130,'Justin', 'Swanton', 'J.Swanton1980@outlook.com','0753085560', 'S'),
            (131,'Sebastion', 'Kevin', 'Seb.Kev@outlook.com','0353910125', 'S'),
            (132,'Savannah', 'Caire', 'Savannah.C@outlook.com','0745729444', 'S'),
            (133,'Amber', 'Duryea', 'Amber.Duryea@hotmail.com','0240811565', 'S'),
            (134,'Max', 'Berrick', 'Max.Berrick@gmail.com','0267112401', 'S'),
            (135,'Jett', 'Lake', 'JLake@gmail.com','0353096853', 'S'),
            (136,'Piper', 'Kennerly', 'Pip.Kennerly@gmail.com','0353387998', 'S'),
            (137,'Poppy', 'Purton', 'P.P123@gmail.com','0267364201', 'S'),
            (138,'Alana', 'Marden', 'Alana.Marden@hotmail.com','0267562735', 'S'),
            (139,'Nathan', 'Chevalier', 'Nath.Chev12@hotmail.com','0883389732', 'S'),
            (140,'Ava', 'Hannah', 'Ava.Han@outlook.com','0353703240', 'S'),
            (141,'Sam', 'Standley', 'SamStandley@outlook.com','0883353112', 'U'),
            (142,'Samuel', 'Davitt', 'Sam.Dav@hotmail.com','0353503156', 'U'),
            (143,'Spencer', 'Murnin', 'Spence.M1928@outlook.com','0740642625', 'U');
         
SELECT * FROM UnregisteredUser_Table;