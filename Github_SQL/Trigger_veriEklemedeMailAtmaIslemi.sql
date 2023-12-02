USE [Sirket]
GO

/****** Object:  Trigger [dbo].[TRIGGER_EKLEME5]    Script Date: 24.07.2023 08:33:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TRIGGER_EKLEME5]
ON [dbo].[Personel] 
after INSERT
AS
BEGIN
set language turkish

declare @ad nvarchar,@soyad nvarchar,@perid int,@dogumTarih smalldatetime,@adres nvarchar,@cinsiyet nvarchar,@maas int,@amirID int, @bolumID int,@yas int
select  @ad= Ad,@soyad=Soyad,@perid=PerID, @dogumTarih=DogumTarih,@adres=Adres,@cinsiyet=Cinsiyet,@maas=Maas,@amirID=AmirID,@bolumID=BolumID,@yas=Yas from Personel

BEGIN
EXEC msdb.dbo.sp_send_dbmail
@profile_name='sedadeneme',
 @recipients = '',--MAÝL ADRESÝ GÝRÝLECEK
 @subject = 'sql_deneme1',
 @body = 'Merhaba, Raporunuz Ektedir.' , 
 @body_format = 'HTML'
 END
END
GO

ALTER TABLE [dbo].[Personel] ENABLE TRIGGER [TRIGGER_EKLEME5]
GO

