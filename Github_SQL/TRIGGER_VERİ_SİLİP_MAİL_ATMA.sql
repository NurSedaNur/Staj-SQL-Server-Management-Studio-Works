--VER� S�L�NCE MA�L ATIYOR

CREATE TRIGGER TRIGGER_EKLEME
ON Personel 
after DELETE
AS
BEGIN
set language turkish

declare @ad nvarchar,@soyad nvarchar,@perid int,@dogumTarih smalldatetime,@adres nvarchar,@cinsiyet nvarchar,@maas int,@amirID int, @bolumID int,@yas int
select  @ad= Ad,@soyad=Soyad,@perid=PerID, @dogumTarih=DogumTarih,@adres=Adres,@cinsiyet=Cinsiyet,@maas=Maas,@amirID=AmirID,@bolumID=BolumID,@yas=Yas from Personel

BEGIN
EXEC msdb.dbo.sp_send_dbmail
@profile_name='sedadeneme',
 @recipients = '',--mail adresi eklenecek
 @subject = 'sql_deneme1',
 @body = 'Merhaba, Raporunuz Ektedir.Veri S�L�NM��T�R' , 
 @body_format = 'HTML'
 END
END
GO

-------------VER� S�L�ND�
DELETE FROM Personel
WHERE PerID=603


-------------KONTROL ED�LD�
select * from Personel
























--INSERT INTO Personel (Ad,Soyad ,PerID, Maas)
--VALUES ('SEDA','NUR',600,900)


--SELECT * FROM Personel WHERE Ad='SEDA'

