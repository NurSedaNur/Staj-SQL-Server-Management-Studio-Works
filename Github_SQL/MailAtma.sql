EXEC msdb.dbo.sp_send_dbmail
@profile_name='sedadeneme',
 @recipients = '',--MAÝL ADRESÝ GÝRÝLECEK
 @subject = 'sql_deneme1',
 @body = 'Merhaba, Raporunuz Ektedir.' , 
 @body_format = 'HTML'