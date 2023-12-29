--INSERT QUERIES--

--Insert data into Ward table
insert into dbo.Ward
(Location,Phone,ChargeNurse)
values
('BSN123','8131234567','2'),
('BSN124','8132345678','3'),
('BSN125','8131233212','4'),
('BSN126','8134567890','5'),
('BSN131','2228909876','6'),
('BSN132','3339088976','7'),
('BSN133','1233234567','8'),
('BSN134','9098887878','9'),
('BSN135','9881237999','10');

--Insert data into Treatment table
insert into dbo.Treatment
(TreatmentName, Description, Charge)
values
('antibiotic therapy','treatment with antibiotics','50'),
('physical therapy','rehabilitation programs','45'),
('chemotherapy','systemic treatment','80'),
('wound care','cleaning and dressing of wounds','30'),
('radiation therapy','high doses of radiation','150'),
('surgery','medical procedures','75'),
('pain management','multidisciplinary approach to alleviate pain','35'),
('dialysis','treatment for kidney failure','40'),
('respiratory therapy','treatment for respiratory conditions','65'),
('cardiac rehabilitation','recover from heart-related issues','50');

--Insert data into Bed table
insert into dbo.Bed
(Size,Type,WardID)
values
('S','E','1'),
('S','E','2'),
('S','M','1'),
('S','M','2'),
('L','E','1'),
('L','M','1'),
('L','E','2'),
('XL','E','1'),
('XL','M','2'),
('XL','M','1');

--Insert data into Nurse table
insert into dbo.Nurse
(FirstName, LastName, Phone, Street, City, State, Zip, Email)
values
('Emily','Johnson','5551234567','Main St','Springfield','IL','62701','emily.johnson@email.com')
('Daniel','Smith','5552345678','Oak St','Riverdale','CA','90210','daniel.smith@email.com')
('Sophia','Davis','5553456789','Pine St','Lakeside','TX','75001','sophia@email.com'),
('Liam','Wilson','5554567890','Birch St','Mountainview','FL','33123','liam@email.com'),
('Ava','Taylor','5555678901','Cedar St','Lakeshore','NY','14622','ava.taylor@email.com'),
('Noah','Brown','5556789012','Elm St','Hilltop','AZ','85001','noah.brown@email.com'),
('Isabella','Miller','5557890123','Maple st','Sunset','GA','30303','isabella@email.com'),
('Lucas','Jones','5558901234','Pine St','Greenfield','OH','43123','lucas@email.com'),
('Mia','Wilson','5559012345','Oak St','Woodland','MI','48888','mia.wilson@email.com'),
('Ethan','White','5550123456','Birch','Seaside','WA','98001','ethan.white@email.com');

--Insert data into Nurse's Certificate table
insert into dbo.NurseCert
(NurseID,Certification)
values
('1','ABC'),
('1','ABD'),
('2','DEF'),
('3','DEC'),
('3','ABC'),
('3','AEF'),
('4','ABE'),
('4','DED'),
('5','ABC'),
('6','ABC');

--Insert data into Physician table
insert into dbo.Physician
(FirstName,LastName,Phone, Street, City, State, Zip, Email)
values
('Chloe','White','5551112222','Cedar St','Seattle','WA','98101','chloe.white@example.com'),
('Jackson','Garcia','45423344332','Birch St','Miami','FL','33101','jackson@gmail.com'),
('Harper','Adams','4340998976','Oak St','Atlanta','GA','30301','harper@example.com'),
('Aiden','Price','4330008789','Pine St','Chicago','IL','60601','aiden@example.com'),
('Zoey','Peterson','8889093245','Elm St','Boston','MA','02101','zoey.peter@example.com'),
('Caleb','Cooper','1233212233','Walnut St','Dallas','TX','75201','caleb.cooper@example.com'),
('Abigail','Foster','3234443212','Cedar St','San Francisco','CA','94101','abigail.foster@example.com'),
('Grayson','Hayes','8887978932','Pine St','Houston','TX','77001','grayson@gmail.com'),
('Lily','Brooks','8981234832','Elm St','Los Angeles','CA','90001','lily.brooks@example.com'),
('Olivier','Powell','1339093344','Walnut St','New York','NY','10001','oliver@example.com');

--Insert data into Physician Specialty table
insert into PhysicianSpecialty
(DoctorID,Specialty)
values
('8','ABC'),
('9','ABD'),
('9','DEF'),
('10','DEC'),
('11','ABC'),
('11','AEF'),
('12','ABE'),
('13','DED'),
('14','ABC'),
('15','ABC');

--Insert data into Patients table
insert into dbo.Patient
(FirstName,LastName,Phone,Gender,DOB,Street,City,State,Zip,BedNo)
values
('Alice','Johnson','5551238888','F','1985-07-12','Main St','Springfield','IL','62701','4'),
('Michael','Rodriguez','5555678901','M','1990-03-24','Oak St','Lexington','KY','40502','5'),
('Emily','Nguyen','8139887678','F','1988-11-05','Pine St','Denver','CO','80202','6'),
('Jason','Taylor','4349998756','M','1979-09-18','Cedar St','Portland','OR','97201','11'),
('Sophia','Davis','4441235678','F','1995-02-03','Elm St','Raleigh','NC','27601','7'),
('Daniel','Baker','1235559876','M','1982-06-15','Maple St','Sacramento','CA','95814','8'),
('Olivia','Martinez','5556789123','F','1998-04-20','Birch St','Austin','TX','78701','5'),
('Ethan','Lewis','1236669988','M','1987-12-08','Walnut St','Nashville','TN','37201','9'),
('Ava','Turner','55589700998','F','1993-10-30','Pine St','Phoenix','AZ','85001','10'),
('Caleb','Mitchell','8135679098','M','1980-08-22','Oak St','Columbus','OH','43201','7');

--Insert data into Item table
insert into dbo.Item
(ItemName, Charge)
values
('Medical Consultation Fee','50'),
('Diagnostic Tests','30'),
('Prescription Medications','20'),
('Hospital Room Charge','75'),
('Surgical Fee','120'),
('Emergency Room Charges','45'),
('Ambulance Service','50'),
('Physical Therapy Sessions','70'),
('Medical Supplies','30'),
('Administrative Fee','30');

--Insert data into Admit-Discharge table
insert into dbo.AdmitDischarge
(AdmitDate,DischargeDate,PatientNo,AdmitDoc,DischargeDoc)
values
('2023-01-27','2023-02-04','6','8','8'),
('2023-03-12','2023-03-15','9','10','11')
('2023-04-02','2023-05-15','11','16','11'),
('2023-02-12','2023-05-15','12','15','17'),
('2023-02-01','2023-06-18','7','12','12'),
('2023-04-08','2023-07-26','8','17','17'),
('2023-02-22','2023-08-15','10','13','13'),
('2023-03-12','2023-03-19','15','10','11'),
('2023-07-21','2023-09-15','13','8','11'),
('2023-03-12','2023-10-02','9','10','15');

--Insert data into Nurse-Patient table
insert into dbo.NursePatient
(EventType, Date, Time, PatientID,NurseID)
values
('WC','2023-04-15','14:30:00','7','2'),
('MED','2023-03-23','16:30:00','9','5'),
('FS','2023-06-22','15:30:00','10','7'),
('AS','2023-07-04','17:30:00','12','4'),
('TA','2023-09-25','18:30:00','8','5'),
('O','2023-09-30','19:30:00','11','1'),
('WC','2023-10-02','08:30:00','13','8'),
('FS','2023-10-03','10:30:00','15','5'),
('O','2023-04-26','18:30:00','6','6'),
('TA','2023-04-27','20:30:00','11','4');

--Insert into Nurse Assignment table
insert into dbo.NurseAssignment
(NurseID,WardID,Date,Hours)
values
('3','2','2023-05-19','2'),
('2','1','2023-05-29','4'),
('6','5','2023-05-30','4'),
('1','4','2023-07-14','1'),
('8','3','2023-07-22','3'),
('10','3','2023-07-25','6'),
('9','7','2023-08-01','3'),
('8','6','2023-08-08','2'),
('7','5','2023-09-10','4'),
('4','10','2023-09-26','3');

--Insert into Treatment Administration table
insert into TreatmentAdministration
(PatientNo,DoctorID,TreatmentNo,DateTime,Results)
values
('6','8','1','2023-05-22 12:15:00','good'),
('7','9','2','2023-06-12 13:25:00','pending'),
('8','10','3','2023-07-05 15:10:00','pending'),
('9','11','4','2023-07-15 16:11:00','good'),
('10','12','5','2023-08-11 17:15:00','recovered'),
('11','13','6','2023-08-16 18:15:00','examine needed'),
('12','14','7','2023-08-20 19:30:00','good'),
('13','15','8','2023-09-25 20:15:00','pending'),
('14','16','9','2023-09-30 21:00:00','good'),
('15','17','10','2023-10-01 22:15:00','recovered');

--Insert into Item Charge table
insert into dbo.ItemCharge
(Date, Quantity, PatientNo,ItemNo)
values
('2023-01-27','2','7','1'),
('2023-03-12','1','10','3'),
('2023-04-02','2','13','5'),
('2023-02-12','1','11','6'),
('2023-02-01','1','10','5'),
('2023-04-08','3','14','9'),
('2023-02-22','1','8','10'),
('2023-03-12','1','6','2'),
('2023-07-21','1','7','7'),
('2023-03-12','1','9','8');
