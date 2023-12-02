--TABLOYA EKLEYINCE MAIL ATIYOR

CREATE TRIGGER TRIGGER_EKLEME5
ON Personel 
after INSERT
AS
BEGIN
set language turkish

declare @ad nvarchar,@soyad nvarchar,@perid int,@dogumTarih smalldatetime,@adres nvarchar,@cinsiyet nvarchar,@maas int,@amirID int, @bolumID int,@yas int
select  @ad= Ad,@soyad=Soyad,@perid=PerID, @dogumTarih=DogumTarih,@adres=Adres,@cinsiyet=Cinsiyet,@maas=Maas,@amirID=AmirID,@bolumID=BolumID,@yas=Yas from Personel

BEGIN
EXEC msdb.dbo.sp_send_dbmail
@profile_name='sedadeneme',
 @recipients = ' ',	-- mail ekleß
 @subject = 'sql_deneme1',
 @body = 'Merhaba, Raporunuz Ektedir.Veri eklenmiþtir' , 
 @body_format = 'HTML'
 END
END
GO


--veri ekliyooorrrr
INSERT INTO Personel (Ad,Soyad,PerID,Maas)
VALUES ('seda','nur',603,900)
GO

----
INSERT INTO Personel (Ad,Soyad ,PerID,Adres,Cinsiyet,Maas,AmirID,BolumID,Yas)
VALUES ('selam','mail',602,'Taksim','K',687 ,101,3,30)


--KONTROL EDÝLDÝ
select * from Personel





















--INSERT INTO Personel (Ad,Soyad ,PerID, Maas)
--VALUES ('SEDA','NUR',600,900)


--SELECT * FROM Personel WHERE Ad='SEDA'

