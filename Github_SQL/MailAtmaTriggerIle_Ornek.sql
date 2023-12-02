USE [AdventureWorksDW2014]
GO

/****** Object:  Trigger [dbo].[TRIGGER_EKLEME]    Script Date: 24.07.2023 08:46:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TRIGGER_EKLEME]
ON [dbo].[DimProduct]

AFTER INSERT
AS
BEGIN

INSERT INTO DimProduct(ProductAlternateKey,ProductSubcategoryKey,Color,ListPrice,Size)
VALUES('PA-T100',22,'Black',59,52)

EXEC msdb.dbo.sp_send_dbmail
 @profile_name = 'Deneme2'
 ,@recipients = ''--MAİL ADRESİ GİRİLECEK
 ,@subject = 'kayıt ekleme'
 ,@body = 'Merhaba, Raporunuz Ektedir.' 
 ,@importance ='HIGH'
END

GO

ALTER TABLE [dbo].[DimProduct] ENABLE TRIGGER [TRIGGER_EKLEME]
GO

