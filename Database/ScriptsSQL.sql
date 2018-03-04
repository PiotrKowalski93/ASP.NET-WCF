Select * from dbo.Persons

-- INNER JOIN - selects records that have matching values in both tables 
Select Persons.FirstName, Persons.Surname, AgeGroups.AgeGroup from dbo.Persons
inner join dbo.AgeGroups on dbo.Persons.AgeGroupId = dbo.AgeGroups.Id

-- LEFT JOIN - returns all records from the left table (persons), and the matched records from the right table (ageGroup). The result is NULL from the right side, if there is no match
Select FirstName, Surname, Gender, AgeGroup from dbo.Persons
left join dbo.AgeGroups on dbo.Persons.AgeGroupId = dbo.AgeGroups.Id

-- RIGHT JOIN - returns all records from the right table (persons), and the matched records from the left table (ageGroup). The result is NULL from the left side, when there is no match.
Select FirstName, Surname, Gender, AgeGroup from dbo.Persons
right join dbo.AgeGroups on dbo.Persons.AgeGroupId = dbo.AgeGroups.Id

-- FULL JOIN - return all records when there is a match in either left (table1) or right (table2) table records.
Select FirstName, Surname, Gender, AgeGroup from dbo.Persons
full outer join dbo.AgeGroups on dbo.Persons.AgeGroupId = dbo.AgeGroups.Id

-- UNION - is used to combine the result-set of two or more SELECT statements.
-- Each SELECT statement within UNION must have the same number of columns
-- The columns must also have similar data types
-- The columns in each SELECT statement must also be in the same order
--Select * from dbo.Persons
--Union
--Select * from dbo.GunTypes

-- GROUP BY 
Select p.AgeGroupId, Min(p.Id) as MinId from dbo.Persons as p
group by p.AgeGroupId
order by p.AgeGroupId desc

-- We need Full-text index
Select Count(p.Id) as #Cities, p.City from dbo.Persons as p 
where City like 'A%'
group by p.City

Create index CityIndex
on dbo.Persons(City)

Select Count(p.Id) as #Cities, p.City from dbo.Persons as p 
where Contains(p.City, 'A')
group by p.City

Create fulltext catalog GunPermTextCatalog
Create fulltext index on Persons.City  
(  
    CityIndex                           --Full-text index column name   
        TYPE COLUMN City    --Name of column that contains file type information  
        Language 2057                 --2057 is the LCID for British English  
)  
KEY INDEX CityIndex ON GunPermTextCatalog --Unique index  
WITH CHANGE_TRACKING AUTO            --Population type;  
GO  

-- HAVING
Select Count(Id) as #, AgeGroupId as AgeGroup from dbo.Persons
group by AgeGroupId
having count(Id) > 145

-- EXISTS
Select FirstName, Surname, JobId from Persons
where exists (Select Id from Jobs where JobName like 'T%')

-- ANY and ALL
Select FirstName, Surname, JobId from Persons
where JobId = any (Select Id from Jobs where JobName like 'T%')

-- ANY and ALL
Select FirstName, Surname, JobId from Persons
where JobId = all (Select Id from Jobs where Id = 3)

Select Count(Id) as #, JobId from Persons
group by JobId
order by JobId

-- Nested Selects
Select FirstName, Surname, JobName, AgeGroup from Persons
inner join Jobs on Persons.JobId = Jobs.ID
inner join AgeGroups on Persons.AgeGroupId = AgeGroups.Id
where JobId in ( Select Id from Jobs where JobName like 'A%')
and AgeGroupId in ( Select Id from AgeGroups where AgeGroup = '25-30')

-- Create view
Use GunPermissions
Go

Create view YoungPeople as 
Select FirstName, Surname, JobName, AgeGroup from Persons
inner join Jobs on Persons.JobId = Jobs.ID
inner join AgeGroups on Persons.AgeGroupId = AgeGroups.Id
where JobId in ( Select Id from Jobs where JobName like 'A%')
and AgeGroupId in ( Select Id from AgeGroups where AgeGroup = '25-30')
go

----------------------------------------------
-- Procedury
----------------------------------------------

-- Procedure will return GunPermissions Ids Accepted in given year
if exists (select 1 from sys.objects where type='P' and name='ShowApprovedPermissions')
drop procedure ShowApprovedPermissions
go

create procedure ShowApprovedPermissions @year int
as
begin
select Perms.Id from [GunPermissions].[dbo].[GunPermissionApplications] as Perms
inner join [GunPermissions].[dbo].[Time] on Perms.DateId = [GunPermissions].[dbo].[Time].Id
where Perms.IsApproved = 1
and [Time].Year = @year
end

exec ShowApprovedPermissions 2016

-- Procedure will show Persons data from refiused permission applications
if exists(select 1 from sys.objects where type='P' and name='ShowRefiusedPeople')
drop procedure ShowRefiusedPeople
go

create procedure ShowRefiusedPeople @year int
as
begin
select FirstName, Surname, Gender, Year from GunPermissionApplications as GunPerm
inner join Persons on GunPerm.PersonId = Persons.Id
inner join Time on DateId = Time.Id
where IsApproved = 1
and Time.Year = @year
end


exec ShowRefiusedPeople 2016


-- Procedure will show Persons data from refiused permission applications with reason
if exists(select 1 from sys.objects where type='P' and name='ShowRefiusedPeopleWithReason')
drop procedure ShowRefiusedPeopleWithReason
go

create procedure ShowRefiusedPeopleWithReason @year int
as
begin
select FirstName, Surname, Gender, ReasonName, Year from GunPermissionApplications as GunPerm
inner join Persons on GunPerm.PersonId = Persons.Id
inner join Time on DateId = Time.Id
inner join (select MedicalReport.Id, ReasonName from dbo.MedicalReport
			inner join Reasons on ReasonId = Reasons.Id) as Mr on GunPerm.MedicalReportId = Mr.Id
where IsApproved = 1
and Time.Year = @year
end

exec ShowRefiusedPeopleWithReason 2016

-- Procedure to change old gun name to new gun name
if exists (select 1 from sys.objects where type='P' and name='ChangeGunName')
drop procedure ChangeGunName
go

create procedure ChangeGunName @gunName nvarchar(100), @newGunName nvarchar(100)
as
begin
update Guns
set GunName = @newGunName
where GunName = @gunName
end

exec ChangeGunName 'Ruger Number One', 'Ruger Number Two'
----------------------------------------------
-- Funkcje
----------------------------------------------




----------------------------------------------
-- Triggery
----------------------------------------------

create trigger GunUniqueNumberExists
on Guns
for insert
as
declare @serialNumber varchar(MAX)
set @serialNumber = (select SerialNumber from inserted)
begin
if exists (select Id from Guns where SerialNumber = @serialNumber)
	begin 
		print 'Serial Number Exists'
		rollback
	end

end

insert into Guns values ('TestGunName', 1, 1, '23676B8D-EA73-BCD8-8B13-42273F7394E4');
go