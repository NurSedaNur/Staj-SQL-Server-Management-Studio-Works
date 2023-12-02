
declare @ad nvarchar(50), @soyad nvarchar(50) , @perid int,@dogumtarihi smalldatetime, @adres nvarchar(50) , @cinsiyet nvarchar(1) , @maas int,
@amid int,@bolumid int,@yas int



declare @textTitle varchar(MAX),
        @tableHTML Nvarchar(max)


select  @textTitle ='Merhabar, günlük product tablosundaki ilk on veri listelenmiþtir.'
	

set @tableHTML = @textTitle + '<html><head><style>' +
     'td {border: solid grey 3px;padding-left:3px;padding-right:3px;padding-top:1px;padding-bottom:1px;font-size:9pt;} ' +
   '</style></head><body>' + '</div>' +
   '<div style="margin-left:3px; font-family:Calibri;"><table cellpadding=0 cellspacing=3 border=3>' +
   '<tr bgcolor=#4b6c9e>' +
   '<td align=center><font face="calibri" color=White><b>AD</b></font></td>' +    -- Manually type headers
   '<td align=center><font face="calibri" color=White><b>SOYAD</b></font></td>' +    -- Manually type headers
   '<td align=center><font face="calibri" color=White><b>PERID</b></font></td>' +    -- Manually type headers
   '<td align=center><font face="calibri" color=White><b>DOGUMTARIHI</b></font></td>' +    -- Manually type headers
   '<td align=center><font face="calibri" color=White><b>ADRES</b></font></td>' +    -- Manually type headers
   '<td align=center><font face="calibri" color=White><b>CINSIYET</b></font></td>' +    -- Manually type headers
   '<td align=center><font face="calibri" color=White><b>MAAS</b></font></td>' +    -- Manually type headers
   '<td align=center><font face="calibri" color=White><b>AMIRID</b></font></td>' +    -- Manually type headers
   '<td align=center><font face="calibri" color=White><b>BOLUMID</b></font></td>' +    -- Manually type headers
    '<td align=center><font face="calibri" color=White><b>YAS</b></font></td></tr>'     -- Manually type headers
   

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
   for XML raw('tr'), elements
)

set @tableHTML = @tableHTML + @body + '</table></div></body></html>'


EXEC msdb.dbo.sp_send_dbmail
@profile_name='sedadeneme',
 @recipients = '',--MAÝL ADRESÝ GÝRÝLECEK
 @subject = 'sql_deneme1',
 @body = @tableHTML , 
 @body_format = 'HTML'

