-- CREATING TABLE department
create table Department(
Dept_id numeric (6) not null,
Dept_type varchar (25),
Room_num varchar(10),
primary key (Dept_Id)
);
-- CREATING TABLE Doctor
CREATE TABLE Doctors (
    Doctor_ID INT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Dept_ID INT,
    Nurse_ID INT,
    Procedures VARCHAR(100),
    Room_number INT
);

-- CREATING TABLE Nurse
CREATE TABLE Nurse(
ID numeric (6) not null,
First_Name varchar (20),
Last_Name varchar (20),
Doctor_ID numeric (4),
Dept_ID numeric (6),
PRIMARY KEY (ID)
);
select COUNT(distinct ID)
from Nurse;
select *
from Nurse;
-- CREATING TABLE ProcedureType
 
-- Creating table Patients
CREATE TABLE Patient(
PPID numeric (6) not null,
First_Name varchar (20),
Last_Name varchar (20),
Birthday date,
Doctor_ID numeric (4),
PRIMARY KEY (PPID)
);
select COUNT(distinct PPID)
from patient;
select *
from patient;
-- Creating Schedule

CREATE TABLE Schedule(
ADate date not null,
ATime time not null,
Schedule_ID numeric (16) not null,
Room_number varchar(16),
PPID numeric (6),
Doctor_ID numeric (4),
Procedure_Code numeric(6),
PRIMARY KEY (Schedule_ID)
);





select COUNT(distinct schedule_id)
from schedule;
select *
from schedule;

-- CREATING TABLE Individual Procedure
CREATE TABLE Individual_Procedure(
Procedure_Code numeric(6),
Schedule_ID numeric (16) not null,
Doctor_ID numeric (4),
PPID numeric (6),
Final_Status varchar(10),
PRIMARY KEY (Procedure_Code,Schedule_ID)
);
select COUNT(distinct schedule_id)
from Individual_Procedure;
select *
from Individual_Procedure;

-- CREATING TABLE Referals 
CREATE TABLE Referrals (
    PPID NUMERIC(6),
    Doctor_ID NUMERIC(4),
    PRIMARY KEY (PPID , Doctor_ID)
);
select COUNT(distinct PPID)
from Referrals;
select *
from Referrals;

-- CREATING TABLE Procedure_Type

-- After all tables created:
ALTER TABLE Patient
add Foreign key (Doctor_ID) references Doctor(Doctor_ID)
;
-- After all tables created:
ALTER TABLE Schedule
ADD Foreign key (Doctor_ID) references Doctor(Doctor_ID),
ADD Foreign key (PPID) references Patient(PPID),
ADD Foreign key (Procedure_Code) references ProcedureType(Procedure_Code)
;
-- After all tables created:
ALTER TABLE Referrals
ADD Foreign key (Doctor_ID) references Doctor(Doctor_ID),
ADD Foreign key (PPID) references Patient(PPID)
;
ALTER TABLE Individual_Procedure
ADD Foreign key (Doctor_ID) references Doctor(Doctor_ID),
ADD Foreign key (PPID) references Patient(PPID),
ADD Foreign key (Procedure_Code) references ProcedureType(Procedure_Code),
Add Foreign key (Schedule_ID) references Schedule(Schedule_ID)
;
-- After all tables created:
ALTER TABLE Nurse
ADD Foreign key (Doctor_ID) references Doctor(Doctor_ID),
ADD Foreign key (Dept_ID) references Department(Dept_ID)
;
