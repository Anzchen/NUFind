CREATE DATABASE NUFind;
CREATE USER 'webapp'@'%' IDENTIFIED BY 'abc123';
GRANT ALL PRIVILEGES ON NUFind.* to 'webapp'@'%';
FLUSH PRIVILEGES;

USE NUFind;

CREATE TABLE Account (
   acc_password VARCHAR(50) NOT NULL,
   acc_access ENUM('Staff' , 'Student' , 'Eboard') NOT NULL
);

insert into Account (acc_password, acc_access) values ('papa123', 'Student');
insert into Account (acc_password, acc_access) values ('asdkj2', 'Student');
insert into Account (acc_password, acc_access) values ('sdank2', 'Student');
insert into Account (acc_password, acc_access) values ('sdkew3', 'Student');
insert into Account (acc_password, acc_access) values ('dekk4', 'Student');
insert into Account (acc_password, acc_access) values ('huh49', 'Student');
insert into Account (acc_password, acc_access) values ('fjk324', 'Student');
insert into Account (acc_password, acc_access) values ('ewimlnu34', 'Student');
insert into Account (acc_password, acc_access) values ('fsunk34', 'Student');
insert into Account (acc_password, acc_access) values ('erku4', 'Student');
insert into Account (acc_password, acc_access) values ('wiomn54', 'Student');
insert into Account (acc_password, acc_access) values ('wi9nn8', 'Eboard');
insert into Account (acc_password, acc_access) values ('daad23', 'Eboard');
insert into Account (acc_password, acc_access) values ('egsr45', 'Eboard');
insert into Account (acc_password, acc_access) values ('rkhnn8', 'Eboard');
insert into Account (acc_password, acc_access) values ('fafakk34', 'Staff');
insert into Account (acc_password, acc_access) values ('Lardfjk3m', 'Staff');
insert into Account (acc_password, acc_access) values ('dad231do', 'Staff');
insert into Account (acc_password, acc_access) values ('Ndskk324', 'Staff');
insert into Account (acc_password, acc_access) values ('Kevfakjm34', 'Staff');

CREATE TABLE StudentAccount (
    user INT NOT NULL,
    stu_pass VARCHAR(50) NOT NULL,
    acc_access ENUM('Student', 'Eboard') NOT NULL,
    CONSTRAINT stuAcc_fk1 FOREIGN KEY (user) REFERENCES StudentAccount(user),
    CONSTRAINT stuAcc_fk2 FOREIGN KEY (stu_pass) REFERENCES Account(acc_password),
    CONSTRAINT stuAcc_fk3 FOREIGN KEY (acc_access) REFERENCES Account(acc_access)
);

insert into StudentAccount (user, stu_pass, acc_access) values ('001828751', 'papa123', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('005204433', 'asdkj2', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('007984483', 'sdank2', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('009143208', 'sdkew3', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('009210841', 'dekk4', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('007796386', 'huh49', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('004200317', 'fjk324', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('002656470', 'ewimlnu34', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('001283376', 'fsunk34', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('001279000', 'erku4', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('001235247', 'wiomn54', 'Student');
insert into StudentAccount (user, stu_pass, acc_access) values ('008966095', 'wi9nn8', 'Eboard');
insert into StudentAccount (user, stu_pass, acc_access) values ('007019241', 'daad23', 'Eboard');
insert into StudentAccount (user, stu_pass, acc_access) values ('007977895', 'egsr45', 'Eboard');
insert into StudentAccount (user, stu_pass, acc_access) values ('008865218', 'rkhnn8', 'Eboard');

CREATE TABLE StaffAccount (
   user INT NOT NULL,
   staff_pass VARCHAR(50) NOT NULL,
   acc_access ENUM('Staff') NOT NULL,
   CONSTRAINT staAcc_fk1 FOREIGN KEY (user) REFERENCES Staff(employeeID),
   CONSTRAINT staAcc_fk2 FOREIGN KEY (staff_pass) REFERENCES Account(acc_password),
   CONSTRAINT staAcc_fk3 FOREIGN KEY (acc_access) REFERENCES Account(acc_access)
);

insert into StaffAccount (user, staff_pass, acc_access) values ('600000', 'fafakk34', 'Staff');
insert into StaffAccount (user, staff_pass, acc_access) values ('600001', 'Lardfjk3m', 'Staff');
insert into StaffAccount (user, staff_pass, acc_access) values ('600002', 'dad231do', 'Staff');
insert into StaffAccount (user, staff_pass, acc_access) values ('600003', 'Ndskk324', 'Staff');
insert into StaffAccount (user, staff_pass, acc_access) values ('600005', 'Kevfakjm34', 'Staff');

CREATE TABLE Students (
    nuid INT PRIMARY KEY NOT NULL,
    stu_fName VARCHAR(50) NOT NULL,
    stu_mName VARCHAR(50),
    stu_lName VARCHAR(50) NOT NULL,
    stu_email VARCHAR(50) NOT NULL UNIQUE,
    stu_phone INT NOT NULL UNIQUE,
    stu_year INT NOT NULL
);

insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('001828751', 'Nestor', NULL, 'Fallanche', 'nfallanche0@desdev.cn', 3);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('005204433', 'Wright', NULL, 'Benian', 'abenian1@ihg.com', 4);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('007984483', 'Gertrudis', NULL, 'Stivens', 'gstivens2@home.pl', 4);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('009143208', 'Cherin', NULL, 'Farebrother', 'cfarebrother3@cbslocal.com', 3);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('009210841', 'Gabrila', NULL, 'Corfield', 'gcorfield4@vimeo.com', 5);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('007796386', 'Adriaens', NULL, 'Allmark', 'aallmark5@bigcartel.com', 3);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('004200317', 'Elsworth', 'Peery', 'Mulheron', 'emulheron6@acquirethisname.com', 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('002656470', 'Robinette', 'Carrel', 'Glendinning', 'rglendinning7@drupal.org', 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('001283376', 'Purcell', NULL, 'O''Roan', 'poroan8@blog.com', 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('001279000', 'Cristina', NULL, 'Allin', 'callin9@miitbeian.gov.cn', 4);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('001235247', 'Darby', NULL, 'Grutchfield', 'dgrutchfielda@seattletimes.com', 4);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('008966095', 'Kelsey', NULL, 'McKee', 'kmckeeb@cdbaby.com', 1);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('007019241', 'Kassi', NULL, 'MacCague', 'kmaccaguec@amazon.co.jp', 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('007977895', 'Legra', NULL, 'Copnar', 'lcopnard@sohu.com', 2);
insert into Students (nuid, stu_fName, stu_mName, stu_lName, stu_email, stu_year) values ('008865218', 'Raphael', NULL, 'Spatoni', 'rspatonie@sciencedirect.com', 5);

CREATE TABLE EventAttendees (
    nuid INT NOT NULL,
    eventID INT NOT NULL,
    CONSTRAINT eventsAttending_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    CONSTRAINT eventsAttending_fk2 FOREIGN KEY (eventID) REFERENCES Events(eventID),
    PRIMARY KEY(eventID, nuid)
);

insert into EventAttendees (nuid, eventID) values ('001828751', '1654');
insert into EventAttendees (nuid, eventID) values ('005204433', '1154');
insert into EventAttendees (nuid, eventID) values ('007984483', '1617');

CREATE TABLE Friends (
    nuid INT NOT NULL,
    friendsWith INT,
    CONSTRAINT friends_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    CONSTRAINT friends_fk2 FOREIGN KEY (friendsWith) REFERENCES Students(nuid),
    PRIMARY KEY(friendsWith, nuid)
);

insert into Friends (nuid, friendsWith) values ('001828751', 'Nestor', NULL);
insert into Friends (nuid, friendsWith) values ('005204433', 'Wright', '007984483');
insert into Friends (nuid, friendsWith) values ('007984483', 'Gertrudis', '005204433');
insert into Friends (nuid, friendsWith) values ('009143208', 'Cherin', '009210841');
insert into Friends (nuid, friendsWith) values ('009210841', 'Gabrila', '009143208');
insert into Friends (nuid, friendsWith) values ('007796386', 'Adriaens', '004200317');
insert into Friends (nuid, friendsWith) values ('004200317', 'Elsworth', '007796386');
insert into Friends (nuid, friendsWith) values ('002656470', 'Robinette', '001283376');
insert into Friends (nuid, friendsWith) values ('001283376', 'Purcell', '002656470');
insert into Friends (nuid, friendsWith) values ('001279000', 'Cristina', '001235247');
insert into Friends (nuid, friendsWith) values ('001235247', 'Darby', '001279000');
insert into Friends (nuid, friendsWith) values ('008966095', 'Kelsey', NULL);
insert into Friends (nuid, friendsWith) values ('007019241', NULL);
insert into Friends (nuid, friendsWith) values ('007977895', NULL);
insert into Friends (nuid, friendsWith) values ('008865218', NULL);


CREATE TABLE Major (
    major_name VARCHAR(50) NOT NULL,
    major_ID INT NOT NULL,
    nuid INT NOT NULL,
    CONSTRAINT major_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    PRIMARY KEY(major_ID, nuid)
);

insert into Major (major_name, major_ID, nuid) values ('Computer Science', '201' '001828751');
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
insert into Major (major_name, major_ID, nuid) values ('Health Science', '205''007019241');
insert into Major (major_name, major_ID, nuid) values ('Art', '206', '007977895');
insert into Major (major_name, major_ID, nuid) values ('Art', '206', '008865218');

CREATE TABLE Minor (
    minor_name VARCHAR(50),
    minor_ID INT,
    nuid INT NOT NULL,
    CONSTRAINT minor_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    PRIMARY KEY(minor_ID, nuid)
);

insert into Minor (minor_name, minor_ID, nuid) values (NULL, NULL, '001828751');
insert into Minor (minor_name, minor_ID, nuid) values (NULL, NULL, '005204433');
insert into Minor (minor_name, minor_ID, nuid) values (NULL, NULL, '007984483');
insert into Minor (minor_name, minor_ID, nuid) values (NULL, NULL, '009143208');
insert into Minor (minor_name, minor_ID, nuid) values (NULL, NULL, '009210841');
insert into Minor (minor_name, minor_ID, nuid) values (NULL, NULL, '007796386');
insert into Minor (minor_name, minor_ID, nuid) values (NULL, NULL, '004200317');
insert into Minor (minor_name, minor_ID, nuid) values (NULL, NULL, '002656470');
insert into Minor (minor_name, minor_ID, nuid) values ('Art', '306', '001283376');
insert into Minor (minor_name, minor_ID, nuid) values ('Art', '306', '001279000');
insert into Minor (minor_name, minor_ID, nuid) values ('Art', '306', '001235247');
insert into Minor (minor_name, minor_ID, nuid) values ('Business', '302', '008966095');
insert into Minor (minor_name, minor_ID, nuid) values ('Business', '302','007019241');
insert into Minor (minor_name, minor_ID, nuid) values (NULL, NULL, '007977895');
insert into Minor (minor_name, minor_ID, nuid) values ('Business', '302', '008865218');

CREATE TABLE Events (
    eventID INT PRIMARY KEY NOT NULL,
    event_desc VARCHAR(800),
    event_capacity INT NOT NULL,
    event_fee INT,
    event_prize BOOLEAN NOT NULL,
    event_name VARCHAR(50) NOT NULL,
    event_time TIME NOT NULL
);

insert into Events (eventID, event_desc, event_capacity, event_fee, event_prize, event_name, event_time) values ('1654', 'Come have a chip party with ASU', '20', '10', FALSE, 'Chip Party', '18:30:00');
insert into Events (eventID, event_desc, event_capacity, event_fee, event_prize, event_name, event_time) values ('1154', 'Learn Python with Disrupt and compete with students', '55', '0', TRUE, 'Python Competition', '17:00:00');
insert into Events (eventID, event_desc, event_capacity, event_fee, event_prize, event_name, event_time) values ('1654', 'Network with panelist brought to you by WIF', '35', '0', FALSE, 'Finance Panelist', '17:30:00');


CREATE TABLE EventLocation (
    eventID INT NOT NULL,
    locationID INT NOT NULL,
    CONSTRAINT eLocation_fk1 FOREIGN KEY (eventID) REFERENCES Events(eventID),
    CONSTRAINT eLocation_fk2 FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);

insert into EventLocation (eventID, locationID) values ('1654', '500');
insert into EventLocation (eventID, locationID) values ('1154', '501');
insert into EventLocation (eventID, locationID) values ('1617', '502');

CREATE TABLE EventClub (
    eventID INT NOT NULL,
    clubID INT NOT NULL,
    CONSTRAINT eClub_fk1 FOREIGN KEY (eventID) REFERENCES Events(eventID),
    CONSTRAINT eClub_fk2 FOREIGN KEY (clubID) REFERENCES Club(clubID)
);

insert into EventClub (eventID, clubID) values ('1654', '900');
insert into EventClub (eventID, clubID) values ('1154', '901');
insert into EventClub (eventID, clubID) values ('1617', '902');

CREATE TABLE Food (
    foodID INT NOT NULL,
    food_cusine VARCHAR(50) NOT NULL,
    food_allergies VARCHAR(100)
);

insert into Food (foodID, food_cusine, food_allergies) values ('700', 'snacks', NULL);
insert into Food (foodID, food_cusine, food_allergies) values ('701', 'pizza', NULL);
insert into Food (foodID, food_cusine, food_allergies) values ('702', 'bowls', 'nuts');
insert into Food (foodID, food_cusine, food_allergies) values ('703', 'dessert', 'nuts');
insert into Food (foodID, food_cusine, food_allergies) values ('704', 'drink', 'milks');

CREATE TABLE Catering (
    foodID INT NOT NULL,
    eventID INT NOT NULL,
    CONSTRAINT catering_fk1 FOREIGN KEY (foodID) REFERENCES Food(foodID),
    CONSTRAINT catering_fk2 FOREIGN KEY (eventID) REFERENCES Events(EventID)
);

insert into Catering (foodID, eventID) values ('700', '1654');
insert into Catering (foodID, eventID) values ('701', '1154');
insert into Catering (foodID, eventID) values ('702', '1617');

CREATE TABLE Billing (
    billID INT PRIMARY KEY NOT NULL,
    datePaid DATE NOT NULL
);

insert into Billing (billID, datePaid) values ('100', 2021-08-01);
insert into Billing (billID, datePaid) values ('101', 2021-08-01);
insert into Billing (billID, datePaid) values ('102', 2021-08-01);

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

insert into EventCost (billID, eventID) values ('100', 250, '1654');
insert into EventCost (billID, eventID) values ('101', 300, '1154');
insert into EventCost (billID, eventID) values ('102', 100, '1617');

CREATE TABLE Staff (
    employeeID INT PRIMARY KEY NOT NULL,
    staff_name VARCHAR(50) NOT NULL,
    date_hired date NOT NULL,
    salary INT NOT NULL
);

insert into Staff (employeeID, staff_name, date_hired, salary) values ('600000', 'Ben Polo', 2003-08-01, '19000');
insert into Staff (employeeID, staff_name, date_hired, salary) values ('600001', 'Larry Kim', 2002-08-01, '25000');
insert into Staff (employeeID, staff_name, date_hired, salary) values ('600002', 'Kim Beno', 2019-07-01, '20000');
insert into Staff (employeeID, staff_name, date_hired, salary) values ('600003', 'Nancy Peno', 2021-01-01, '23000');
insert into Staff (employeeID, staff_name, date_hired, salary) values ('600005', 'Kevin Chen', 2019-12-22, '34000');

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
    InterestID INT PRIMARY KEY NOT NULL,
    interests ENUM('political/social', 'religious', 'sports/active', 'gaming', 'engineering',
    'coding', 'cultural', 'volunteering', 'advising/tutoring', 'arts', 'global/international', 'other') NOT NULL
);

insert into AreasOfInterest (InterestID, interests) values ('1', 'political/social');
insert into AreasOfInterest (InterestID, interests) values ('2', 'religious');
insert into AreasOfInterest (InterestID, interests) values ('3', 'sports/active');
insert into AreasOfInterest (InterestID, interests) values ('4', 'gaming');
insert into AreasOfInterest (InterestID, interests) values ('5', 'engineering');
insert into AreasOfInterest (InterestID, interests) values ('6', 'coding');
insert into AreasOfInterest (InterestID, interests) values ('7', 'cultural');
insert into AreasOfInterest (InterestID, interests) values ('8', 'volunteering');
insert into AreasOfInterest (InterestID, interests) values ('9', 'advising/tutoring');
insert into AreasOfInterest (InterestID, interests) values ('10', 'arts');
insert into AreasOfInterest (InterestID, interests) values ('11', 'global/international');
insert into AreasOfInterest (InterestID, interests) values ('12', 'other');

CREATE TABLE ClubInterests (
    clubID INT NOT NULL,
    interests ENUM('political/social', 'religious', 'sports/active', 'gaming', 'engineering',
    'coding', 'cultural', 'volunteering', 'advising/tutoring', 'arts', 'global/international', 'other') NOT NULL,
    CONSTRAINT cInterests_fk1 FOREIGN KEY (clubID) REFERENCES Club(clubID),
    CONSTRAINT cInterests_fk2 FOREIGN KEY (interests) REFERENCES AreasOfInterest(interests)
);

insert into ClubInterests (clubID, interests) values ('900', 'cultural');
insert into ClubInterests (clubID, interests) values ('901', 'other');
insert into ClubInterests (clubID, interests) values ('902', 'other');
insert into ClubInterests (clubID, interests) values ('903', 'coding');
insert into ClubInterests (clubID, interests) values ('904', 'coding');
insert into ClubInterests (clubID, interests) values ('905', 'engineering');
insert into ClubInterests (clubID, interests) values ('906', 'coding');

CREATE TABLE EventInterests (
    eventID INT NOT NULL,
    interests ENUM('political/social', 'religious', 'sports/active', 'gaming', 'engineering',
    'coding', 'cultural', 'volunteering', 'advising/tutoring', 'arts', 'global/international', 'other') NOT NULL,
    CONSTRAINT eInterests_fk1 FOREIGN KEY (eventID) REFERENCES Events(eventID),
    CONSTRAINT eInterests_fk2 FOREIGN KEY (interests) REFERENCES AreasOfInterest(interests)
);

insert into EventInterests (eventID, interests) values ('1654', 'cultural');
insert into EventInterests (eventID, interests) values ('1154', 'other');
insert into EventInterests (eventID, interests) values ('1617', 'other');

CREATE TABLE Club (
    clubID INT PRIMARY KEY NOT NULL,
    club_name VARCHAR(50) NOT NULL,
    club_email VARCHAR(50) NOT NULL,
    affiliated_college VARCHAR(50),
    budget INT
);

insert into Club (clubID, club_name, club_email, affiliated_college, budget) values ('900', 'ASU', 'asu@northeastern.edu', NULL, 'cultural', 10000);
insert into Club (clubID, club_name, club_email, affiliated_college, budget) values ('901', 'ASU', 'disrupt@northeastern.edu', 'D’Amore-McKim', 'other', 7000);
insert into Club (clubID, club_name, club_email, affiliated_college, budget) values ('902', 'ASU', 'wif@northeastern.edu', 'D’Amore-McKim', 'other', 30000);
insert into Club (clubID, club_name, club_email, affiliated_college, budget) values ('903', 'ASU', 'c4c@northeastern.edu', 'Khoury', 'coding', 5000);
insert into Club (clubID, club_name, club_email, affiliated_college, budget) values ('904', 'ASU', 'sandbox@northeastern.edu', 'Khoury', 'coding', 5000);
insert into Club (clubID, club_name, club_email, affiliated_college, budget) values ('905', 'ASU', 'electricracing@northeastern.edu', 'Khoury', 'engineering', 15000);
insert into Club (clubID, club_name, club_email, affiliated_college, budget) values ('906', 'ASU', 'multi@northeastern.edu', 'Khoury', 'coding', 3000);

CREATE TABLE News (
    datePosted DATE NOT NULL,
    priorities BOOLEAN,
    clubID INT NOT NULL,
    CONSTRAINT news_fk1 FOREIGN KEY (clubID) REFERENCES Club(clubID)
);

insert into News (datePosted, priorities, clubID) values (2022-10-05, TRUE, '903');
insert into News (datePosted, priorities, clubID) values (2022-11-15, TRUE, '904');
insert into News (datePosted, priorities, clubID) values (2022-10-20, TRUE, '905');
insert into News (datePosted, priorities, clubID) values (2022-11-17, TRUE, '906');

CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY NOT NULL,
    app_names VARCHAR(50) NOT NULL,
    app_position VARCHAR(50) NOT NULL,
    app_email VARCHAR(50) NOT NULL
);

insert into Applications (ApplicationID, app_names, app_position, app_email) values ('501', 'Gabrila Tivers', 'President', 'ftivers4@pen.io' );
insert into Applications (ApplicationID, app_names, app_position, app_email) values ('501', 'Adriaens Churchin', 'Treasurer', 'cchurchin5@bloglovin.com' );
insert into Applications (ApplicationID, app_names, app_position, app_email) values ('501', 'Elsworth Kelby', 'Operations', 'lkelby6@washingtonpost.com' );
insert into Applications (ApplicationID, app_names, app_position, app_email) values ('501', 'Robinette Filippone', 'General Member', 'dfilippone7@ihg.com' );

CREATE TABLE EboardApp (
    applicationID INT NOT NULL,
    nuid INT NOT NULL,
    clubID INT NOT NULL,
    roles ENUM('President', 'Vice President', 'Treasurer', 'Secretary', 'Media Chair'),
    CONSTRAINT eApp_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    CONSTRAINT eApp_fk2 FOREIGN KEY (clubID) REFERENCES Club(clubID),
    CONSTRAINT eApp_fk3 FOREIGN KEY (roles) REFERENCES Eboard(roles),
    CONSTRAINT eApp_fk4 FOREIGN KEY (applicationID) REFERENCES Applications(ApplicationID)
);

insert into EboardApp (ApplicationID, nuid, clubID, roles) values ('501', '009210841', '900', 'President' );
insert into EboardApp (ApplicationID, nuid, clubID, roles) values ('502', '007796386', '901', 'Treasurer' );
insert into EboardApp (ApplicationID, nuid, clubID, roles) values ('503', '004200317', '901', 'Secretary' );
insert into EboardApp (ApplicationID, nuid, clubID, roles) values ('504', '002656470', '902', 'President' );

CREATE TABLE ClubApp (
    applicationID INT NOT NULL,
    nuid INT NOT NULL,
    clubID INT NOT NULL,
    CONSTRAINT cApp_fk1 FOREIGN KEY (nuid) REFERENCES Students(nuid),
    CONSTRAINT cApp_fk2 FOREIGN KEY (clubID) REFERENCES Club(clubID),
    CONSTRAINT cApp_fk3 FOREIGN KEY (applicationID) REFERENCES Applications(ApplicationID)
);

insert into ClubApp (ApplicationID, nuid, clubID) values ('501', '009210841', '900');
insert into ClubApp (ApplicationID, nuid, clubID) values ('502', '007796386', '901');
insert into ClubApp (ApplicationID, nuid, clubID) values ('503', '004200317', '901');
insert into ClubApp (ApplicationID, nuid, clubID) values ('504', '002656470', '902');

CREATE TABLE Eboard (
    responsibilities VARCHAR(800),
    roles ENUM('President', 'Vice President', 'Treasurer', 'Secretary', 'Media Chair') NOT NULL,
    nuid INT NOT NULL,
    clubID INT NOT NULL,
    CONSTRAINT eboard_fk1 FOREIGN KEY (clubID) REFERENCES Club(clubID),
    CONSTRAINT eboard_fk2 FOREIGN KEY (nuid) REFERENCES Students(nuid)
);

insert into Eboard (responsibilities, roles, nuid, clubID) values ('manage social media', 'Media Chair', '008966095', '900');
insert into Eboard (responsibilities, roles, nuid, clubID) values ('help manage operations', 'Media Chair', '007019241', '901');
insert into Eboard (responsibilities, roles, nuid, clubID) values ('manage all operations', 'Media Chair', '007977895', '902');
insert into Eboard (responsibilities, roles, nuid, clubID) values ('manage the finances ', 'Media Chair', '008865218', '903');

SHOW TABLES