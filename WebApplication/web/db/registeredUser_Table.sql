/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  luke.galic
 * Created: 26/05/2020
 */

CREATE TABLE RegisteredUser_Table (
UserID INT NOT NULL, 
Password VARCHAR(20) NOT NULL,
PaymentMethod VARCHAR(20),
Payment VARCHAR(20),
SavedAddress VARCHAR(100),
Activated BOOLEAN NOT NULL,
CONSTRAINT RegisteredUser_PK PRIMARY KEY (UserID),
CONSTRAINT RegisteredUser_FK FOREIGN KEY (UserID) REFERENCES UnregisteredUser_Table(UserID));

INSERT INTO RegisteredUser_Table (UserID, Password, PaymentMethod, Payment, SavedAddress, Activated)
    VALUES (101,'yS2EgwWF','Mastercard','5109026761021066','QLD, Almaden, 4 Glen William Road',TRUE),
            (102,'3GdRehE7','Visa','4532100337595190','WA, Deepdale, 98 Carnegie Avenue',TRUE),
            (103,'7XuBgqK8','Mastercard','5110897205095354','VIC, Macleod West, 25 Maintongoon Road',TRUE),
            (104,'8Wr1nkPU','American Express','378768396947117','NSW, Maragale, 56 Grayson Street',TRUE),
            (105,'6PhJ547G','Visa','4556107230680590','SA, Caralue, 56 Black Point Drive',FALSE),
            (106,'kT080yqB','Mastercard','5103702271607901','WA, Cramphone, 9 Cubbine Road',TRUE),
            (107,'h0Gmo5FE','American Express','372322837989597','NSW, Nerrigundah, 52 Mackie Street',TRUE),
            (108,'F8bn652c','Visa','4123107230680590','NT, Santa Teresa, 89 Yulara Drive',TRUE),
            (109,'V9v03Zjo','American Express','345585760490478','NSW, Cattai, 46 Cambridge Street',FALSE),
            (110,'q0T7x3hp','Mastercard','5112687226787818','VIC, Corindhap, 9 Sunraysia Road',TRUE),
            (111,'i2B3PI5R','American Express','378426225795062','NSW, Weelong, 64 Tooraweenah Road',TRUE),
            (112,'N0vSFH16','Visa','4123107111680590','NSW, Neath, 9 Woerdens Road',TRUE),
            (113,'k9CpBK78','Mastercard','5108306512768905','QLD, Hinchinbrook, 46 South Molle Boulevard',FALSE),
            (114,'8Tec5EFj','American Express','348157093982485','NSW, Marlow, 43 Berambing Crescent',TRUE),
            (115,'8HuP2Tot','Visa','4983107111310590','NT, Coonawarra, 41 Marion St',TRUE),
            (116,'2Pl70oE5','American Express','343978620195373','VIC, Sylvaterre, 19 Armstrong Street',TRUE),
            (117,'xL2NvuUV','Mastercard','5112877730520777','VIC, Dinner Plain, 36 Frouds Road',TRUE),
            (118,'bY5vVd1j','Visa','4983107111354321','WA, Helena Valley, 34 Foreshore Road',FALSE),
            (119,'3Mn4m0DH','American Express','377171155826054','VIC, Watchupga, 36 Sullivan Court',TRUE),
            (120,'7Mr6SvWZ','Mastercard','5102699185109613','NSW, Farley, 66 Elgin Street',TRUE);