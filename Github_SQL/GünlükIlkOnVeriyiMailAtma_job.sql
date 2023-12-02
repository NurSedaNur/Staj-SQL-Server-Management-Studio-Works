USE [msdb]
GO

/****** Object:  Job [GunlukIlkOnVeriyiListeleme]    Script Date: 24.07.2023 11:45:07 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 24.07.2023 11:45:07 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'GunlukIlkOnVeriyiListeleme', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [GunlukIlkOnVeriyiListeleme]    Script Date: 24.07.2023 11:45:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'GunlukIlkOnVeriyiListeleme', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=2, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'--HER GUN PRODUCT TABLOSUNDAKI ILK 10 VERİYİ MAIL ATAR 
BEGIN
declare @ad nvarchar(50), @soyad nvarchar(50) , @perid int,@dogumtarihi smalldatetime, @adres nvarchar(50) , @cinsiyet nvarchar(1) , @maas int,
@amid int,@bolumid int,@yas int



declare @textTitle varchar(MAX),
        @tableHTML Nvarchar(max)


	   select  @textTitle =''Merhabar, günlük product tablosundaki ilk on veri listelenmiştir.''
	

set @tableHTML = @textTitle + ''<html><head><style>'' +
     ''td {border: solid grey 3px;padding-left:3px;padding-right:3px;padding-top:1px;padding-bottom:1px;font-size:9pt;} '' +
   ''</style></head><body>'' + ''</div>'' +
   ''<div style="margin-left:3px; font-family:Calibri;"><table cellpadding=0 cellspacing=3 border=3>'' +
   ''<tr bgcolor=#4b6c9e>'' +
   ''<td align=center><font face="calibri" color=White><b>AD</b></font></td>'' +    -- Manually type headers
   ''<td align=center><font face="calibri" color=White><b>SOYAD</b></font></td>'' +    -- Manually type headers
   ''<td align=center><font face="calibri" color=White><b>PERID</b></font></td>'' +    -- Manually type headers
   ''<td align=center><font face="calibri" color=White><b>DOGUMTARIHI</b></font></td>'' +    -- Manually type headers
   ''<td align=center><font face="calibri" color=White><b>ADRES</b></font></td>'' +    -- Manually type headers
   ''<td align=center><font face="calibri" color=White><b>CINSIYET</b></font></td>'' +    -- Manually type headers
   ''<td align=center><font face="calibri" color=White><b>MAAS</b></font></td>'' +    -- Manually type headers
   ''<td align=center><font face="calibri" color=White><b>AMIRID</b></font></td>'' +    -- Manually type headers
   ''<td align=center><font face="calibri" color=White><b>BOLUMID</b></font></td>'' +    -- Manually type headers
    ''<td align=center><font face="calibri" color=White><b>YAS</b></font></td></tr>''     -- Manually type headers
   

    declare @body NvarChar(max)
select @body =
(
   SELECT TOP 10
   td=Ad,  
   td=Soyad,
   td=PerID,
   td=DogumTarih,
   td=Adres,
   td=Cinsiyet,
   td=Maas,
   td=AmirID,
   td=BolumID,
   td=Yas
   FROM Personel
   for XML raw(''tr''), elements
)

set @tableHTML = @tableHTML + @body + ''</table></div></body></html>''


EXEC msdb.dbo.sp_send_dbmail
@profile_name=''sedadeneme'',
 @recipients = '',--MAİL ADRESİ GİRİLECEK
 @subject = ''sql_deneme1'',
 @body = @tableHTML , 
 @body_format = ''HTML''

 END', 
		@database_name=N'Sirket', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'GunlukIlkOnVeriyiListeleme', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20230724, 
		@active_end_date=99991231, 
		@active_start_time=114600, 
		@active_end_time=235959, 
		@schedule_uid=N'33830b60-18e5-4813-8e0e-7a854a33f7e8'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

