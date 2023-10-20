
use Hospital_LE

--Create DELETE trigger
create trigger Patient_delete_trigger
On dbo.Patient
For Delete
As
Insert into PatientDeletedRows
(patientID, FirstName, LastName, DOB, Street, City, State, Zip, phone, age, BedNo,action)
Select
patientID,FirstName,LastName,DOB,Street,City,State,Zip,phone,age,BedNo,'deleted'
from deleted


select * from Patient
delete from Patient
where patientID='14';
select * from PatientDeletedRows

--Create UPDATE trigger

create trigger Patient_update_trigger
On dbo.Patient
For Update
As
Insert into PatientDeletedRows
(patientID, FirstName, LastName, DOB, Street, City, State, Zip, phone, age, BedNo,action)
Select
patientID,FirstName,LastName,DOB,Street,City,State,Zip,phone,age,BedNo,'updated'
from inserted

select * from Patient
update Patient
set State = 'FL'
where patientID='9'
select * from PatientDeletedRows

--Create INSTEAD trigger

create trigger dml_patient_patient
on dbo.Patient
instead of delete
as
print 'you should never delete rows'
rollback

select * from Patient

delete from Patient
where patientID='6'