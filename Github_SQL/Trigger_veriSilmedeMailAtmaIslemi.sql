USE [Sirket]
GO

/****** Object:  Trigger [dbo].[TRIGGER_EKLEME]    Script Date: 24.07.2023 08:32:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TRIGGER_EKLEME]
ON [dbo].[Personel] 
after DELETE
AS
BEGIN
set language turkish

declare @ad nvarchar,@soyad nvarchar,@perid int,@dogumTarih smalldatetime,@adres nvarchar,@cinsiyet nvarchar,@maas int,@amirID int, @bolumID int,@yas int
select  @ad= Ad,@soyad=Soyad,@perid=PerID, @dogumTarih=DogumTarih,@adres=Adres,@cinsiyet=Cinsiyet,@maas=Maas,@amirID=AmirID,@bolumID=BolumID,@yas=Yas from Personel

BEGIN
EXEC msdb.dbo.sp_send_dbmail
@profile_name='sedadeneme',
 @recipients = ' ',--MAİL ADRESİ GİRİLECEK
 @subject = 'sql_deneme1',
 @body = 'Merhaba, Raporunuz Ektedir.Veri eklenmiştir' , 
 @body_format = 'HTML'
 END
END
GO

ALTER TABLE [dbo].[Personel] ENABLE TRIGGER [TRIGGER_EKLEME]
GO

