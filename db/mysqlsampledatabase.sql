CREATE DATABASE NUFind;
-- CREATE USER 'webapp'@'%' IDENTIFIED BY 'abc123';
GRANT ALL PRIVILEGES ON NUFind.* to 'webapp'@'%';
FLUSH PRIVILEGES;

USE NUFind;

CREATE TABLE Students ( 
    nuid INT PRIMARY KEY NOT NULL,
    stu_fName VARCHAR(50) NOT NULL,
    stu_mName VARCHAR(50),
    stu_lName VARCHAR(50) NOT NULL,
    stu_email VARCHAR(50) NOT NULL UNIQUE,
    stu_phone VARCHAR(10) NOT NULL UNIQUE,
    stu_year INT NOT NULL
);

insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('001828751', 'Nestor', NULL, 'Fallanche', 'nfallanche0@desdev.cn', 6314273278, 3);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('005204433', 'Wright', NULL, 'Benian', 'abenian1@ihg.com', 1827364098, 4);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('007984483', 'Gertrudis', NULL, 'Stivens', 'gstivens2@home.pl', 1728401779, 4);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('009143208', 'Cherin', NULL, 'Farebrother', 'cfarebrother3@cbslocal.com', 2638765432, 3);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('009210841', 'Gabrila', NULL, 'Corfield', 'gcorfield4@vimeo.com', 1356790876, 5);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('007796386', 'Adriaens', NULL, 'Allmark', 'aallmark5@bigcartel.com', 4568432179, 3);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('004200317', 'Elsworth', 'Peery', 'Mulheron', 'emulheron6@acquirethisname.com', 4561892179, 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('002656470', 'Robinette', 'Carrel', 'Glendinning', 'rglendinning7@drupal.org', 4560987179, 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('001283376', 'Purcell', NULL, 'O''Roan', 'poroan8@blog.com', 1098432179, 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('001279000', 'Cristina', NULL, 'Allin', 'callin9@miitbeian.gov.cn', 4157432179, 4);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('001235247', 'Darby', NULL, 'Grutchfield', 'dgrutchfielda@seattletimes.com', 4287432179, 4);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('008966095', 'Kelsey', NULL, 'McKee', 'kmckeeb@cdbaby.com', 1356790982, 1);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('007019241', 'Kassi', NULL, 'MacCague', 'kmaccaguec@amazon.co.jp', 1109790982, 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('007977895', 'Legra', NULL, 'Copnar', 'lcopnard@sohu.com', 4428765432, 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_phone, stu_year) values ('008865218', 'Raphael', NULL, 'Spatoni', 'rspatonie@sciencedirect.com', 2638009432, 5);

CREATE TABLE Friends (
    nuid INT NOT NULL,
    friendsWith INT,
    CONSTRAINT friends_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    CONSTRAINT friends_fk2 FOREIGN KEY (friendsWith) REFERENCES Students(nuid),
    PRIMARY KEY(friendsWith, nuid)
);

insert into Friends (nuid, friendsWith) values ('001828751', '005204433');
insert into Friends (nuid, friendsWith) values ('005204433', '007984483');
insert into Friends (nuid, friendsWith) values ('007984483', '005204433');
insert into Friends (nuid, friendsWith) values ('009143208', '009210841');
insert into Friends (nuid, friendsWith) values ('009210841', '009143208');
insert into Friends (nuid, friendsWith) values ('007796386', '004200317');
insert into Friends (nuid, friendsWith) values ('004200317', '007796386');
insert into Friends (nuid, friendsWith) values ('002656470', '001283376');
insert into Friends (nuid, friendsWith) values ('001283376', '002656470');
insert into Friends (nuid, friendsWith) values ('001279000', '001235247');
insert into Friends (nuid, friendsWith) values ('001235247', '001279000');
insert into Friends (nuid, friendsWith) values ('008966095', '005204433');
insert into Friends (nuid, friendsWith) values ('007019241', '005204433');
insert into Friends (nuid, friendsWith) values ('007977895', '005204433');
insert into Friends (nuid, friendsWith) values ('008865218', '005204433');

CREATE TABLE Major (
    major_name VARCHAR(50) NOT NULL,
    major_ID INT NOT NULL,
    nuid INT NOT NULL,
    CONSTRAINT major_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    PRIMARY KEY(major_ID, nuid)
);

insert into Major (major_name, major_ID, nuid) values ('Computer Science', '201', '001828751');
insert into Major (major_name, major_ID, nuid) values ('Computer Science', '201', '005204433');
insert into Major (major_name, major_ID, nuid) values ('Computer Science', '201', '007984483');
insert into Major (major_name, major_ID, nuid) values ('Business', '202', '009143208');
insert into Major (major_name, major_ID, nuid) values ('Business', '202', '009210841');
insert into Major (major_name, major_ID, nuid) values ('Business', '202', '007796386');
insert into Major (major_name, major_ID, nuid) values ('Business', '202', '004200317');
insert into Major (major_name, major_ID, nuid) values ('Engineering', '203', '002656470');
insert into Major (major_name, major_ID, nuid) values ('Engineering', '203', '001283376');
insert into Major (major_name, major_ID, nuid) values ('English', '204', '001279000');
insert into Major (major_name, major_ID, nuid) values ('Health Science', '205', '001235247');
insert into Major (major_name, major_ID, nuid) values ('Health Science', '205', '008966095');
insert into Major (major_name, major_ID, nuid) values ('Health Science', '205', '007019241');
insert into Major (major_name, major_ID, nuid) values ('Art', '206', '007977895');
insert into Major (major_name, major_ID, nuid) values ('Art', '206', '008865218');

CREATE TABLE Minor (
    minor_name VARCHAR(50),
    minor_ID INT,
    nuid INT NOT NULL,
    CONSTRAINT minor_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    PRIMARY KEY(minor_ID, nuid)
);

insert into Minor (minor_name, minor_ID, nuid) values ('Math', '100', '001828751');
insert into Minor (minor_name, minor_ID, nuid) values ('Math', '100', '005204433');
insert into Minor (minor_name, minor_ID, nuid) values ('Math', '100', '007984483');
insert into Minor (minor_name, minor_ID, nuid) values ('Math', '100', '009143208');
insert into Minor (minor_name, minor_ID, nuid) values ('Math', '100', '009210841');
insert into Minor (minor_name, minor_ID, nuid) values ('Math', '100', '007796386');
insert into Minor (minor_name, minor_ID, nuid) values ('Math', '100', '004200317');
insert into Minor (minor_name, minor_ID, nuid) values ('Math', '100', '002656470');
insert into Minor (minor_name, minor_ID, nuid) values ('Art', '306', '001283376');
insert into Minor (minor_name, minor_ID, nuid) values ('Art', '306', '001279000');
insert into Minor (minor_name, minor_ID, nuid) values ('Art', '306', '001235247');
insert into Minor (minor_name, minor_ID, nuid) values ('Business', '302', '008966095');
insert into Minor (minor_name, minor_ID, nuid) values ('Business', '302','007019241');
insert into Minor (minor_name, minor_ID, nuid) values ('Math', '100', '007977895');
insert into Minor (minor_name, minor_ID, nuid) values ('Business', '302', '008865218');

CREATE TABLE Staff (
    employeeID INT PRIMARY KEY NOT NULL,
    staff_name VARCHAR(50) NOT NULL,
    date_hired DATE NOT NULL,
    salary INT NOT NULL
);

insert into Staff (employeeID, staff_name, date_hired, salary) values ('600000', 'Ben Polo', '2003-08-01', '19000');
insert into Staff (employeeID, staff_name, date_hired, salary) values ('600001', 'Larry Kim', '2002-08-01', '25000');
insert into Staff (employeeID, staff_name, date_hired, salary) values ('600002', 'Kim Beno', '2019-07-01', '20000');
insert into Staff (employeeID, staff_name, date_hired, salary) values ('600003', 'Nancy Peno', '2021-01-01', '23000');
insert into Staff (employeeID, staff_name, date_hired, salary) values ('600005', 'Kevin Chen', '2019-12-22', '34000');

CREATE TABLE Locations (
    locationID INT PRIMARY KEY NOT NULL,
    loc_availability BOOLEAN NOT NULL,
    loc_zip INT NOT NULL,
    loc_streetNum INT NOT NULL,
    loc_streetName VARCHAR(50) NOT NULL,
    loc_buildingName VARCHAR(50) NOT NULL
);


insert into Locations (locationID, loc_availability, loc_zip, loc_streetNum, loc_streetName, loc_buildingName) values ('500', FALSE, '2115', '360', 'Forsyth St', 'Forsyth Building');
insert into Locations (locationID, loc_availability, loc_zip, loc_streetNum, loc_streetName, loc_buildingName) values ('501', FALSE, '2115', '324', 'Huntington Ave', 'Dodge Hall');
insert into Locations (locationID, loc_availability, loc_zip, loc_streetNum, loc_streetName, loc_buildingName) values ('502', FALSE, '2115', '115', 'Forsyth St', 'Shillman Hall');
insert into Locations (locationID, loc_availability, loc_zip, loc_streetNum, loc_streetName, loc_buildingName) values ('503', TRUE, '2115', '370', 'Huntington Ave', 'Hayden Hall');
insert into Locations (locationID, loc_availability, loc_zip, loc_streetNum, loc_streetName, loc_buildingName) values ('504', TRUE, '2115', '55', 'Forsyth St', 'Kariotis Hall');
insert into Locations (locationID, loc_availability, loc_zip, loc_streetNum, loc_streetName, loc_buildingName) values ('505', TRUE, '2115', '510', 'Parker St', 'West Village A');
insert into Locations (locationID, loc_availability, loc_zip, loc_streetNum, loc_streetName, loc_buildingName) values ('506', TRUE, '2115', '360', 'Huntington Ave', 'Snell Library');

CREATE TABLE Events (
    eventID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    event_desc VARCHAR(800),
    event_capacity INT NOT NULL,
    event_fee INT,
    event_name VARCHAR(50) NOT NULL,
    event_time DATETIME NOT NULL
);

Alter table Events AUTO_INCREMENT = 1000;
insert into Events (event_desc, event_capacity, event_fee, event_name, event_time) values ('Come have a chip party with ASU', '20', '10', 'Chip Party', '2023-10-8 18:30:00');
insert into Events (event_desc, event_capacity, event_fee, event_name, event_time) values ('Learn Python with Disrupt and compete with students', '55', '0', 'Python Competition', '2023-10-18 17:00:00');
insert into Events (event_desc, event_capacity, event_fee, event_name, event_time) values ('Network with panelist brought to you by WIF', '35', '0', 'Finance Panelist', '2023-09-27 17:30:00');

CREATE TABLE Club (
    clubID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    club_name VARCHAR(50) NOT NULL,
    club_email VARCHAR(50) NOT NULL,
    affiliated_college VARCHAR(50),
    budget INT
);

Alter table Club AUTO_INCREMENT = 900;
insert into Club (club_name, club_email, affiliated_college, budget) values ('ASU', 'asu@northeastern.edu', NULL, 10000);
insert into Club (club_name, club_email, affiliated_college, budget) values ('ASU', 'disrupt@northeastern.edu', 'D’Amore-McKim', 7000);
insert into Club (club_name, club_email, affiliated_college, budget) values ('ASU', 'wif@northeastern.edu', 'D’Amore-McKim', 30000);
insert into Club (club_name, club_email, affiliated_college, budget) values ('ASU', 'c4c@northeastern.edu', 'Khoury', 5000);
insert into Club (club_name, club_email, affiliated_college, budget) values ('ASU', 'sandbox@northeastern.edu', 'Khoury', 5000);
insert into Club (club_name, club_email, affiliated_college, budget) values ('ASU', 'electricracing@northeastern.edu', 'Khoury', 15000);
insert into Club (club_name, club_email, affiliated_college, budget) values ('ASU', 'multi@northeastern.edu', 'Khoury', 3000);

CREATE TABLE EventLocation (
    eventID INT NOT NULL,
    locationID INT NOT NULL,
    CONSTRAINT eLocation_fk1 FOREIGN KEY (eventID) REFERENCES Events(eventID),
    CONSTRAINT eLocation_fk2 FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);

insert into EventLocation (eventID, locationID) values ('1000', '500');
insert into EventLocation (eventID, locationID) values ('1001', '501');
insert into EventLocation (eventID, locationID) values ('1002', '502');

CREATE TABLE EventClub (
    eventID INT NOT NULL,
    clubID INT NOT NULL,
    CONSTRAINT eClub_fk1 FOREIGN KEY (eventID) REFERENCES Events(eventID),
    CONSTRAINT eClub_fk2 FOREIGN KEY (clubID) REFERENCES Club(clubID)
);

insert into EventClub (eventID, clubID) values ('1000', '900');
insert into EventClub (eventID, clubID) values ('1001', '901');
insert into EventClub (eventID, clubID) values ('1002', '902');

CREATE TABLE EventAttendees (
    nuid INT NOT NULL,
    eventID INT NOT NULL,
    CONSTRAINT eventsAttending_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    CONSTRAINT eventsAttending_fk2 FOREIGN KEY (eventID) REFERENCES Events(eventID),
    PRIMARY KEY(eventID, nuid)
);

insert into EventAttendees (nuid, eventID) values ('001828751', '1000');
insert into EventAttendees (nuid, eventID) values ('005204433', '1001');
insert into EventAttendees (nuid, eventID) values ('007984483', '1002');

CREATE TABLE Food (
    foodID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    food_cuisine VARCHAR(50) NOT NULL,
    food_allergies VARCHAR(100)
);

Alter table Food AUTO_INCREMENT = 700;
insert into Food (food_cuisine, food_allergies) values ('snacks', NULL);
insert into Food (food_cuisine, food_allergies) values ('pizza', NULL);
insert into Food (food_cuisine, food_allergies) values ('bowls', 'nuts');
insert into Food (food_cuisine, food_allergies) values ('dessert', 'nuts');
insert into Food (food_cuisine, food_allergies) values ('drink', 'milks');

CREATE TABLE Catering (
    foodID INT NOT NULL,
    eventID INT NOT NULL,
    CONSTRAINT catering_fk1 FOREIGN KEY (foodID) REFERENCES Food(foodID),
    CONSTRAINT catering_fk2 FOREIGN KEY (eventID) REFERENCES Events(EventID)
);

insert into Catering (foodID, eventID) values ('700', '1000');
insert into Catering (foodID, eventID) values ('701', '1001');
insert into Catering (foodID, eventID) values ('702', '1002');

CREATE TABLE Billing (
    billID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    datePaid DATE NOT NULL
);

Alter Table Billing AUTO_INCREMENT = 100;
insert into Billing (datePaid) values ('2021-08-01');
insert into Billing (datePaid) values ('2021-08-01');
insert into Billing (datePaid) values ('2021-08-01');

CREATE TABLE LocationCost (
    billID INT NOT NULL,
    loc_amount INT NOT NULL,
    locationID INT NOT NULL,
    CONSTRAINT lCost_fk1 FOREIGN KEY (locationID) REFERENCES Locations(locationID),
    CONSTRAINT lCost_fk2 FOREIGN KEY (billID) REFERENCES Billing(billID)
);

insert into LocationCost (billID, loc_amount, locationID) values ('100', 10, '500');
insert into LocationCost (billID, loc_amount, locationID) values ('101', 0, '501');
insert into LocationCost (billID, loc_amount, locationID) values ('102', 0,'502');

CREATE TABLE FoodCost (
    billID INT NOT NULL,
    food_amount INT NOT NULL,
    foodID INT NOT NULL,
    CONSTRAINT fCost_fk1 FOREIGN KEY (foodID) REFERENCES Food(foodID),
    CONSTRAINT fCost_fk2 FOREIGN KEY (billID) REFERENCES Billing(billID)
);

insert into FoodCost (billID, food_amount, foodID) values ('100', 30, '700');
insert into FoodCost (billID, food_amount, foodID) values ('101', 52, '701');
insert into FoodCost (billID, food_amount, foodID) values ('102', 79, '702');

CREATE TABLE StaffCost (
    billID INT NOT NULL,
    staff_amount INT NOT NULL,
    employeeID INT NOT NULL,
    CONSTRAINT sCost_fk1 FOREIGN KEY (employeeID) REFERENCES Staff(employeeID),
    CONSTRAINT sCost_fk2 FOREIGN KEY (billID) REFERENCES Billing(billID)
);

insert into StaffCost (billID, staff_amount, employeeID) values ('100', 0, '600000');
insert into StaffCost (billID, staff_amount, employeeID) values ('101', 0, '600001');
insert into StaffCost (billID, staff_amount, employeeID) values ('102', 0, '600002');

CREATE TABLE EventCost (
    billID INT NOT NULL,
    event_amount INT NOT NULL,
    eventID INT NOT NULL,
    CONSTRAINT eCost_fk1 FOREIGN KEY (eventID) REFERENCES Events(eventID),
    CONSTRAINT eCost_fk2 FOREIGN KEY (billID) REFERENCES Billing(billID)
);

insert into EventCost (billID, event_amount, eventID) values ('100', 250, '1000');
insert into EventCost (billID, event_amount, eventID) values ('101', 300, '1001');
insert into EventCost (billID, event_amount, eventID) values ('102', 100, '1002');

CREATE TABLE Advisor (
    advisor_fName VARCHAR(50) NOT NULL,
    advisor_lName VARCHAR(50) NOT NULL,
    clubID INT NOT NULL,
    employeeID INT NOT NULL,
    CONSTRAINT advisor_fk1 FOREIGN KEY (clubID) REFERENCES Club(clubID),
    CONSTRAINT advisor_fk2 FOREIGN KEY (employeeID) REFERENCES Staff(employeeID),
    PRIMARY KEY(clubID, employeeID)
);

insert into Advisor (advisor_fName, advisor_lName, clubID, employeeID) values ('Ben', 'Polo', '900', '600000');
insert into Advisor (advisor_fName, advisor_lName, clubID, employeeID) values ('Lary', 'Kim', '901', '600001');
insert into Advisor (advisor_fName, advisor_lName, clubID, employeeID) values ('Kim', 'Beno', '902', '600002');

CREATE TABLE AreasOfInterest (
    InterestID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    interests ENUM('political/social', 'religious', 'sports/active', 'gaming', 'engineering',
    'coding', 'cultural', 'volunteering', 'advising/tutoring', 'arts', 'global/international', 'other') NOT NULL
);

insert into AreasOfInterest (interests) values ('political/social');
insert into AreasOfInterest (interests) values ('religious');
insert into AreasOfInterest (interests) values ('sports/active');
insert into AreasOfInterest (interests) values ('gaming');
insert into AreasOfInterest (interests) values ('engineering');
insert into AreasOfInterest (interests) values ('coding');
insert into AreasOfInterest (interests) values ('cultural');
insert into AreasOfInterest (interests) values ('volunteering');
insert into AreasOfInterest (interests) values ('advising/tutoring');
insert into AreasOfInterest (interests) values ('arts');
insert into AreasOfInterest (interests) values ('global/international');
insert into AreasOfInterest (interests) values ('other');

CREATE TABLE ClubInterests (
    clubID INT NOT NULL,
    interestID INT NOT NULL,
    CONSTRAINT cInterests_fk1 FOREIGN KEY (clubID) REFERENCES Club(clubID),
    CONSTRAINT cInterests_fk2 FOREIGN KEY (interestID) REFERENCES AreasOfInterest(InterestID)
);

insert into ClubInterests (clubID, interestID) values ('900', '7');
insert into ClubInterests (clubID, interestID) values ('901', '12');
insert into ClubInterests (clubID, interestID) values ('902', '12');
insert into ClubInterests (clubID, interestID) values ('903', '6');
insert into ClubInterests (clubID, interestID) values ('904', '6');
insert into ClubInterests (clubID, interestID) values ('905', '5');
insert into ClubInterests (clubID, interestID) values ('906', '6');

CREATE TABLE EventInterests (
    eventID INT NOT NULL,
    interestID INT NOT NULL,
    CONSTRAINT eInterests_fk1 FOREIGN KEY (eventID) REFERENCES Events(eventID),
    CONSTRAINT eInterests_fk2 FOREIGN KEY (interestID) REFERENCES AreasOfInterest(InterestID)
);

insert into EventInterests (eventID, interestID) values ('1000', '7');
insert into EventInterests (eventID, interestID) values ('1001', '12');
insert into EventInterests (eventID, interestID) values ('1002', '12');

CREATE TABLE News (
    datePosted DATE NOT NULL,
    priorities BOOLEAN,
    clubID INT NOT NULL,
    CONSTRAINT news_fk1 FOREIGN KEY (clubID) REFERENCES Club(clubID)
);

insert into News (datePosted, priorities, clubID) values ('2022-10-05', TRUE, '903');
insert into News (datePosted, priorities, clubID) values ('2022-11-15', TRUE, '904');
insert into News (datePosted, priorities, clubID) values ('2022-10-20', TRUE, '905');
insert into News (datePosted, priorities, clubID) values ('2022-11-17', TRUE, '906');

CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    app_names VARCHAR(50) NOT NULL,
    app_position VARCHAR(50) NOT NULL,
    app_email VARCHAR(50) NOT NULL
);

Alter table Applications AUTO_INCREMENT = 500;
insert into Applications (app_names, app_position, app_email) values ('Gabrila Tivers', 'President', 'ftivers4@pen.io' );
insert into Applications (app_names, app_position, app_email) values ('Adriaens Churchin', 'Treasurer', 'cchurchin5@bloglovin.com' );
insert into Applications (app_names, app_position, app_email) values ('Elsworth Kelby', 'Operations', 'lkelby6@washingtonpost.com' );
insert into Applications (app_names, app_position, app_email) values ('Robinette Filippone', 'General Member', 'dfilippone7@ihg.com' );

CREATE TABLE Roles (
    roleID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    roleName VARCHAR(50) NOT NULL
);

Alter table Roles AUTO_INCREMENT = 10000;
insert into Roles (roleName) values ('President');
insert into Roles (roleName) values ('Vice President');
insert into Roles (roleName) values ('Treasurer');
insert into Roles (roleName) values ('Secretary');
insert into Roles (roleName) values ('Media Chair');

CREATE TABLE Eboard (
    eboardID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    responsibilities VARCHAR(800),
    nuid INT NOT NULL,
    clubID INT NOT NULL,
    roleID INT NOT NULL,
    CONSTRAINT eboard_fk1 FOREIGN KEY (clubID) REFERENCES Club(clubID),
    CONSTRAINT eboard_fk2 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    CONSTRAINT eboard_fk3 FOREIGN KEY (roleID) REFERENCES Roles(roleID)
);

Alter table Eboard AUTO_INCREMENT = 100000;
insert into Eboard (responsibilities, nuid, clubID, roleID) values ('manage social media', '008966095', '900', '10000');
insert into Eboard (responsibilities, nuid, clubID, roleID) values ('help manage operations', '007019241', '901', '10001');
insert into Eboard (responsibilities, nuid, clubID, roleID) values ('manage all operations', '007977895', '902', '10002');
insert into Eboard (responsibilities, nuid, clubID, roleID) values ('manage the finances ', '008865218', '903', '10003');

CREATE TABLE EboardApp (
    applicationID INT NOT NULL,
    nuid INT NOT NULL,
    clubID INT NOT NULL,
    roleID INT NOT NULL,
    CONSTRAINT eApp_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    CONSTRAINT eApp_fk2 FOREIGN KEY (clubID) REFERENCES Club(clubID),
    CONSTRAINT eApp_fk3 FOREIGN KEY (roleID) REFERENCES Roles(roleID),
    CONSTRAINT eApp_fk4 FOREIGN KEY (applicationID) REFERENCES Applications(ApplicationID)
);

insert into EboardApp (ApplicationID, nuid, clubID, roleID) values ('500', '009210841', '900', '10000' );
insert into EboardApp (ApplicationID, nuid, clubID, roleID) values ('501', '007796386', '901', '10001' );
insert into EboardApp (ApplicationID, nuid, clubID, roleID) values ('502', '004200317', '901', '10002' );
insert into EboardApp (ApplicationID, nuid, clubID, roleID) values ('503', '002656470', '902', '10003' );

CREATE TABLE ClubApp (
    applicationID INT NOT NULL,
    nuid INT NOT NULL,
    clubID INT NOT NULL,
    CONSTRAINT cApp_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    CONSTRAINT cApp_fk2 FOREIGN KEY (clubID) REFERENCES Club(clubID),
    CONSTRAINT cApp_fk3 FOREIGN KEY (applicationID) REFERENCES Applications(ApplicationID)
);

insert into ClubApp (ApplicationID, nuid, clubID) values ('500', '009210841', '900');
insert into ClubApp (ApplicationID, nuid, clubID) values ('501', '007796386', '901');
insert into ClubApp (ApplicationID, nuid, clubID) values ('502', '004200317', '901');
insert into ClubApp (ApplicationID, nuid, clubID) values ('503', '002656470', '902');

CREATE TABLE Access (
    accID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    accName VARCHAR(50) NOT NULL
);

Alter table Access AUTO_INCREMENT = 1000000;
insert into Access (accName) values ('Staff');
insert into Access (accName) values ('Student');
insert into Access (accName) values ('Eboard');

CREATE TABLE Account (
   acc_password VARCHAR(50) PRIMARY KEY NOT NULL,
   acc_access INT NOT NULL,
   CONSTRAINT acc_fk1 FOREIGN KEY (acc_access) references Access(accID)
);

insert into Account (acc_password, acc_access) values ('papa123', '1000001');
insert into Account (acc_password, acc_access) values ('asdkj2', '1000001');
insert into Account (acc_password, acc_access) values ('sdank2', '1000001');
insert into Account (acc_password, acc_access) values ('sdkew3', '1000001');
insert into Account (acc_password, acc_access) values ('dekk4', '1000001');
insert into Account (acc_password, acc_access) values ('huh49', '1000001');
insert into Account (acc_password, acc_access) values ('fjk324', '1000001');
insert into Account (acc_password, acc_access) values ('ewimlnu34', '1000001');
insert into Account (acc_password, acc_access) values ('fsunk34', '1000001');
insert into Account (acc_password, acc_access) values ('erku4', '1000001');
insert into Account (acc_password, acc_access) values ('wiomn54', '1000001');
insert into Account (acc_password, acc_access) values ('wi9nn8', '1000002');
insert into Account (acc_password, acc_access) values ('daad23', '1000002');
insert into Account (acc_password, acc_access) values ('egsr45', '1000002');
insert into Account (acc_password, acc_access) values ('rkhnn8', '1000002');
insert into Account (acc_password, acc_access) values ('fafakk34', '1000000');
insert into Account (acc_password, acc_access) values ('Lardfjk3m', '1000000');
insert into Account (acc_password, acc_access) values ('dad231do', '1000000');
insert into Account (acc_password, acc_access) values ('Ndskk324', '1000000');
insert into Account (acc_password, acc_access) values ('Kevfakjm34', '1000000');

CREATE TABLE StudentAccount (
    user INT NOT NULL,
    stu_pass VARCHAR(50) NOT NULL,
    acc_access INT NOT NULL,
    CONSTRAINT stuAcc_fk1 FOREIGN KEY (user) REFERENCES Students(nuid),
    CONSTRAINT stuAcc_fk2 FOREIGN KEY (stu_pass) REFERENCES Account(acc_password),
    CONSTRAINT stuAcc_fk3 FOREIGN KEY (acc_access) REFERENCES Access(accID)
);

insert into StudentAccount (user, stu_pass, acc_access) values ('001828751', 'papa123', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('005204433', 'asdkj2', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('007984483', 'sdank2', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('009143208', 'sdkew3', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('009210841', 'dekk4', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('007796386', 'huh49', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('004200317', 'fjk324', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('002656470', 'ewimlnu34', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('001283376', 'fsunk34', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('001279000', 'erku4', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('001235247', 'wiomn54', '1000001');
insert into StudentAccount (user, stu_pass, acc_access) values ('008966095', 'wi9nn8', '1000002');
insert into StudentAccount (user, stu_pass, acc_access) values ('007019241', 'daad23', '1000002');
insert into StudentAccount (user, stu_pass, acc_access) values ('007977895', 'egsr45', '1000002');
insert into StudentAccount (user, stu_pass, acc_access) values ('008865218', 'rkhnn8', '1000002');

CREATE TABLE StaffAccount (
   user INT NOT NULL,
   staff_pass VARCHAR(50) NOT NULL,
   acc_access INT NOT NULL,
   CONSTRAINT staAcc_fk1 FOREIGN KEY (user) REFERENCES Staff(employeeID),
   CONSTRAINT staAcc_fk2 FOREIGN KEY (staff_pass) REFERENCES Account(acc_password),
   CONSTRAINT staAcc_fk3 FOREIGN KEY (acc_access) REFERENCES Access(accID)
);

insert into StaffAccount (user, staff_pass, acc_access) values ('600000', 'fafakk34', '1000000');
insert into StaffAccount (user, staff_pass, acc_access) values ('600001', 'Lardfjk3m', '1000000');
insert into StaffAccount (user, staff_pass, acc_access) values ('600002', 'dad231do', '1000000');
insert into StaffAccount (user, staff_pass, acc_access) values ('600003', 'Ndskk324', '1000000');
insert into StaffAccount (user, staff_pass, acc_access) values ('600005', 'Kevfakjm34', '1000000');


SHOW TABLES