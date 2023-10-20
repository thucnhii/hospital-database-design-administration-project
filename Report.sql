--1. Physician total admits for the past year (2023).
create procedure TotalPhysicianAdmits
@year int
as
begin
select ad.AdmitDoc 'DoctorID', d.LastName 'Physician', count(ad.AdmitID) as 'Total Admits'
from AdmitDischarge ad
join Physician d
on ad.AdmitDoc=d.DoctorID
where @year=year(ad.AdmitDate)
group by ad.AdmitDoc, d.LastName
end;

exec TotalPhysicianAdmits @year=2023


--2. Patient itemized bill: List of items, by charge amount and sorted by date (2023-01-27)
create procedure PatientItemizedBill
@date date
as
begin
select ic.PatientNo,p.LastName, sum(ic.Quantity*i.Charge) as 'Total Amount'
from ItemCharge ic
join Item i
on ic.ItemNo=i.ItemNo
join Patient p
on ic.PatientNo=p.PatientID
where @date=ic.Date
group by ic.PatientNo, p.LastName
end;
exec PatientItemizedBill @date='2023-01-27'

--3. Average age of Patients admitted by Physicians
create procedure AverageAdmittedPatient
as
begin
select avg(p.Age) as 'Average Patient Age', ad.AdmitDoc, d.LastName as 'Physician'
from Patient p
join AdmitDischarge ad
on p.PatientID=ad.PatientNo
join Physician d
on d.DoctorID=ad.AdmitDoc
group by ad.AdmitDoc, d.LastName
order by avg(p.Age)
end;
exec AverageAdmittedPatient


--4. Total list of treatments administered to a patient by physician for each treatment, sorted by date of treatment, listing last name of patient and of physician.
--CREATE VIEW
create view vw_TreatmentAdministration
as
select  p.LastName as 'Patient', d.LastName as 'Physician', tr.TreatmentName as 'Treatment',ta.DateTime
from TreatmentAdministration ta
join Patient p
on p.PatientID=ta.PatientNo
join Physician d
on d.DoctorID=ta.DoctorID
join Treatment tr
on tr.TreatmentNo=ta.TreatmentNo

select * from vw_TreatmentAdministration
order by DateTime desc

--CREATE SPROC
Create Procedure PatientDoctorTreatmentAdministration
@patientID int, @DoctorID int
as
begin
select p.PatientID,d.DoctorID,  p.LastName as 'Patient', d.LastName as 'Physician', tr.TreatmentName as 'Treatment',ta.DateTime
from TreatmentAdministration ta
join Patient p
on p.PatientID=ta.PatientNo
join Physician d
on d.DoctorID=ta.DoctorID
join Treatment tr
on tr.TreatmentNo=ta.TreatmentNo
where @patientID=p.PatientID and @DoctorID=d.DoctorID
order by DateTime desc
end;
--EXAMPLE OF USING 2 PARAMETERS
EXEC PatientDoctorTreatmentAdministration @patientID=15, @doctorid=17


--5. List all nurse-patient events with nurse name and patient name.*/
--CREATE VIEW
create view vw_NursePatient
as
select np.EventType as'Event',n.LastName as 'Nurse',p.LastName as 'Patient'
from NursePatient np
join Nurse n
on np.NurseID=n.NurseID
join Patient p
on np.PatientID=p.PatientID

select * from vw_NursePatient

--CREATE SPROC
create procedure sproc_NursePatient
@nurseID int, @PatientID int
as
begin
select np.EventType as'Event',n.LastName as 'Nurse',p.LastName as 'Patient'
from NursePatient np
join Nurse n
on np.NurseID=n.NurseID
join Patient p
on np.PatientID=p.PatientID
where @nurseID=n.NurseID and @PatientID=p.PatientID
end;
--EXAMPLE
EXEC sproc_NursePatient @nurseID=5 , @PatientID=6


--6. Find missing values for beds with and without patients, and for patients with and
without beds.*/
--Beds with and without patients
--CREATE VIEW
create view vw_BedWithoutPatient
as
select b.BedID,p.PatientID
from Bed b
left join Patient p
on p.BedNo=b.BedID
where p.PatientID is null

select * from vw_BedWithoutPatient

--CREAT SPROC
create procedure BedWithoutPatient
@bed int
as
begin
select b.BedID,p.PatientID
from Bed b
left join Patient p
on p.BedNo=b.BedID
where p.PatientID is null and @bed=b.BedID
end;
--EXAMPLE
exec BedWithoutPatient @bed=12


--7. Find missing values of nurses who have not seen a patient and all patients that
have not seen a nurse.*/
--Nurses who have not seen a patient
--CREATE VIEW
create view vw_NurseNotSeenPatient
as
select n.NurseID,n.LastName as 'Nurse Name',np.PatientID
from Nurse n
full join NursePatient np
on np.NurseID=n.NurseID
where np.PatientID is null

select * from vw_NurseNotSeenPatient

--CREATE SPROC
create procedure NurseWithoutPatient
@nurse int
as
begin
select n.NurseID,n.LastName as 'Nurse Name',np.PatientID
from Nurse n
full join NursePatient np
on np.NurseID=n.NurseID
where np.PatientID is null and @nurse=n.NurseID
end;

--EXAMPLE
EXEC NurseWithoutPatient @nurse=9


--8. Create a distribution of nurses across all wards, and a distribution of all wards
across nurses.*/
--Nurses across all wards
--CREATE VIEW
create view vw_NurseAcrossWard
as
select n.NurseID, w.WardID
from Nurse n
cross join Ward w

select * from vw_NurseAcrossWard

--CREATE SPROC
create procedure NurseAcrossWard
@nurse int, @ward int
as
begin
select n.NurseID, w.WardID
from Nurse n
cross join Ward w
where @nurse=n.NurseID and @ward=w.WardID
end;

--EXAMPLE
exec NurseAcrossWard @nurse=3, @ward=1