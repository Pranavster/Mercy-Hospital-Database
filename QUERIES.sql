-- # 1 Find All Doctors in the Cardiology department.
SELECT First_Name, Last_Name FROM Doctors where Dept_ID = (SELECT Dept_ID FROM 
Department WHERE Dept_type = 'Cardiology');

-- #2 Shows the number of patients assigned to each doctor.
SELECT Doctor_ID, COUNT(PPID) as PatientCount FROM Schedule
GROUP BY Doctor_ID;

-- #3 List of Appointments for a Specific Day and Specific Time
SELECT * FROM Schedule WHERE ADate = '10/15/24' AND ATime = '10:00:00';

-- 4 Finds doctors who have no appointments scheduled.
SELECT D.Doctor_ID, D.First_Name, D.Last_Name FROM Doctors D LEFT JOIN
Schedule S ON D.Doctor_ID = S.Doctor_ID WHERE PPID IN (0,999999);


-- 5 Lists all nurses working with doctors from the Orthopedic department.
SELECT Nurse.First_Name, Nurse.Last_Name 
FROM Nurse inner JOIN Doctors ON Nurse.ID = Doctors.Nurse_ID 
WHERE Doctors.Dept_ID = (SELECT Dept_ID FROM Department WHERE Dept_type like 'Orthopedic');


-- 6 Patients Seen by More Than One Doctor 
SELECT PPID 
FROM Schedule 
GROUP BY PPID 
HAVING COUNT(DISTINCT Doctor_ID) > 1;



-- 7 Ranking Doctors by Number of Appointments
SELECT Doctor_ID, COUNT(Schedule_ID) AS AppointmentCount, 
RANK() OVER (ORDER BY COUNT(Schedule_ID) DESC) AS Ranked 
FROM Schedule 
-- GROUP BY Doctor_ID
where PPID not in (0,000000,999999)
GROUP BY Doctor_ID;

-- 8 Finding an open appointment for any doctor in a specific Department
-- Listing all available appointments for ENT
-- First, get the Doctor_ID that are available in the department.
with Doctor_Available(Last_Name, Doctor_ID) as
(SELECT Last_name, Doctor_ID
from Doctors
Where Dept_ID = 
(
select dept_id
from department
where dept_type = 'ENT'))
SELECT Schedule.ADate,Schedule.ATime, Doctor_Available.Last_Name 
FROM Schedule inner join Doctor_Available on Schedule.Doctor_ID = Doctor_Available.Doctor_ID
WHERE PPID in (0,000000);
-- 9 Finding an open appointment for any doctor in a specific Department
-- Listing all available appointments for ENT
-- First, get the Doctor_ID that are available in the department.
with Doctor_Available(Last_Name, Doctor_ID) as
(SELECT Last_name, Doctor_ID
from Doctors
Where Dept_ID = 
(
select dept_id
from department
where dept_type = 'ENT'))
SELECT Schedule.ADate,Schedule.ATime, Doctor_Available.Last_Name 
FROM Schedule inner join Doctor_Available on Schedule.Doctor_ID = Doctor_Available.Doctor_ID
WHERE PPID in (0,000000) and Adate>2024-10-14;

-- #10 Find the distinct combinations of dates and times where appointments exist.
SELECT ADate, ATime,COUNT(*) AS row_count FROM Schedule GROUP BY ADate, ATime WITH ROLLUP;
-- 11 Counts the number of appointments scheduled each month.
SELECT EXTRACT(YEAR FROM ADate) AS Year, EXTRACT(MONTH FROM ADate) AS Month, COUNT(*) AS AppointmentCount FROM Schedule GROUP BY Year, Month;
-- 12 Lists patients who have a surgery.
Select PPID,Schedule_ID From Schedule Where Room_number like 'Surgery _';
-- 13 Identifies the top 5 most frequently performed procedures.
SELECT Procedure_Name, COUNT(*) AS ProcedureCount FROM Schedule s Join proceduretype pt on s.Procedure_Code=pt.Procedure_Code 
GROUP BY Procedure_Name ORDER BY ProcedureCount DESC LIMIT 5;
-- 14 Compares the number of appointments year-over-year.
SELECT YEAR(ADate) AS Year, COUNT(*) AS Appointments, LAG(COUNT(*)) OVER (ORDER BY YEAR(ADate)) AS Previous_Year_Appointments FROM Schedule
GROUP BY YEAR(ADate) ORDER BY Year;