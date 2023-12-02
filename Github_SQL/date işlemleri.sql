-----------DATE
select getdate()

select GETUTCDATE()

select year(getdate())

select PerID, year(GETDATE() )-year(DogumTarih) as yas
from Personel

select MONTH(GETDATE())
select MONTH(DogumTarih) from Personel

select day(DogumTarih),DogumTarih from Personel

select DogumTarih,Ad from Personel 
where day(DogumTarih)=04 and MONTH(DogumTarih)=04

select datepart(YEAR,getdate())
select datepart(MONTH,getdate())
select datepart(DAY,getdate())
select datepart(HOUR,getdate())
select datepart(MINUTE,getdate())
select datepart(SECOND,getdate())

select DATENAME(dw,GETDATE())

select GETDATE()
select dateadd(day,2,GETDATE())--2 gün sonraya gitti

--ISDATE OYLE BIR GUN VAR MI DIYE KONTROL EDER.
IF ISDATE('2009-15-12 10:19:41.177')=1
	PRINT'GECERLI TARIH'
ELSE
	PRINT'GECERSIZ'

SELECT DATEDIFF(YEAR,'20180901' ,getdate())

select DATENAME(MONTH,getdate())

--datediff iki tarih arasýndaki farký bulur
select GETDATE() guncel_tarih,*,
datediff(year,DogumTarih,GETDATE())
from Personel

SELECT SYSDATETIME()
SELECT getdate()

SELECT convert(varchar, getdate(), 111)

select convert (varchar,GETDATE(),1)





