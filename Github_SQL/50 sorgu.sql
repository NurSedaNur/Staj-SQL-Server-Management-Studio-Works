--SELECT * FROM PERSONEL

SELECT PerID FROM Personel

SELECT PerID,Ad,Soyad FROM Personel

SELECT PerID,Ad,Soyad,DogumTarih,Adres FROM Personel
WHERE PerID=101

SELECT DogumTarih,Adres FROM Personel
WHERE Ad='Ali' AND Soyad='Yýlmaz'

SELECT PerID,Ad+Soyad AS AdSoyad,Maas FROM Personel
WHERE Maas<=700 AND Maas>=600 AND Cinsiyet='K'

SELECT PerID,BolumID FROM PERSONEL
WHERE BolumID=4 OR BolumID=6

----------------BOLUM
SELECT BolumAd,Ad,Soyad FROM Bolum,Personel
WHERE YoneticiID=PerID

SELECT PerID, Ad,BolumAd FROM Bolum B, Personel P
WHERE BolumAd='Pazarlama' AND
B.BolumID=P.BolumID

SELECT PerID,Ad,Bolum.BolumID,BolumAd FROM Bolum ,Personel 
WHERE BolumAd='Pazarlama' AND 
Personel.BolumID=Bolum.BolumID

SELECT PerID,Ad,B.BolumID,BolumAd FROM Bolum B,Personel P
WHERE BolumAd='Pazarlama' AND 
P.BolumID=B.BolumID

SELECT PerID,Ad,BolumAd FROM Personel P,Bolum B
WHERE P.BolumID=B.BolumID

SELECT PerID,Ad,BolumAd FROM Personel P
LEFT JOIN Bolum B ON P.BolumID=B.BolumID

--13.SORGU:   SELECT PerID,Ad,Soyad FROM Personel

SELECT *  FROM Personel

SELECT P.*, B.* FROM Personel P, Bolum B
WHERE B.YoneticiID=P.PerID

SELECT P.ProID,P.BolumID,PR.Soyad,PR.Adres,PR.DogumTarih 
FROM Proje P, Bolum B,Personel PR
WHERE P.Lokasyon='Kadýköy' AND
B.YoneticiID=PR.PerID AND 
PR.BolumID=P.BolumID

SELECT PerID,Soyad FROM Personel
WHERE BolumID IN (1,2,4)

SELECT P.PerID,P.Soyad FROM Bolum B, Personel P
WHERE B.BolumAd IN('Merkez','ArGe','Pazarlama') AND 
B.BolumID=P.BolumID

SELECT Maas FROM Personel

SELECT DISTINCT Maas FROM Personel

SELECT PR.ProID FROM Personel P, Bolum B,Proje PR
WHERE P.Soyad='Þirin' AND 
B.YoneticiID=P.PerID AND
P.BolumID=PR.BolumID

SELECT PP.ProID FROM Personel P
INNER JOIN PersonelProje PP ON P.PerID=PP.PerID 
WHERE P.Soyad='Þirin'

SELECT PJ.ProID FROM Personel P
INNER JOIN Bolum B ON P.PerID=B.YoneticiID
INNER JOIN Proje PJ ON B.BolumID=PJ.BolumID
WHERE P.Soyad='Þirin'
UNION
SELECT PP.ProID FROM Personel P
INNER JOIN PersonelProje PP ON P.PerID=PP.PerID
WHERE P.Soyad='Þirin'

SELECT PerID,Ad,Soyad FROM Personel
WHERE Adres LIKE '%Kadýköy%'

SELECT PerID,Ad,Soyad FROM Personel
WHERE Ad LIKE 'C_n%'

SELECT P.PerID,P.Soyad,P.Maas+P.Maas*0.1 AS 'YENI_MAAS'
FROM Proje PJ
INNER JOIN PersonelProje PP ON PP.ProID=PJ.ProID
INNER JOIN Personel P ON P.PerID=PP.PerID
WHERE PJ.ProAd='Bilgisayar Eðitimi'

SELECT B.BolumAd,P.PerID,P.Ad,P.Soyad,PJ.ProAd FROM Personel P
INNER JOIN PersonelProje PP ON PP.PerID=P.PerID
INNER JOIN Bolum B ON B.BolumID=P.BolumID
INNER JOIN Proje PJ ON PJ.ProID=PP.ProID
ORDER BY B.BolumAd,P.Soyad,PJ.ProAd

SELECT PerID,Ad,Soyad FROM Personel
WHERE AmirID IS NULL

SELECT P.PerID,P.Ad,P.Soyad FROM Personel P
LEFT JOIN PersonelProje PP ON PP.PerID=P.PerID
WHERE PP.ProID IS NULL 

--SELECT P.Ad,P.Soyad FROM BakmaklaYukumlu B
--LEFT JOIN Personel P ON P.PerID=B.PerID
--WHERE P.Ad=B.BakYukAd AND P.Cinsiyet=B.Cinsiyet

SELECT  P.Ad,P.Soyad FROM Personel P
WHERE EXISTS (SELECT * FROM BakmaklaYukumlu B
	WHERE P.Ad=B.BakYukAd AND P.Cinsiyet=B.Cinsiyet)

SELECT * FROM Personel P
LEFT JOIN BakmaklaYukumlu B ON P.PerID=B.PerID
WHERE B.PerID IS NULL

SELECT DISTINCT P.PerID,P.Ad,P.Soyad FROM Personel P 
LEFT JOIN BakmaklaYukumlu B ON P.PerID=B.PerID
WHERE B.PerID>=1

SELECT DISTINCT * FROM Personel P
LEFT JOIN BakmaklaYukumlu B ON P.PerID=B.PerID
LEFT JOIN Bolum BL ON P.PerID=BL.YoneticiID
WHERE B.PerID>=1 

SELECT SUM(Maas) AS TOPLAM,MAX(Maas)AS MAXIMUM,
MIN(Maas) AS EN_AZ,AVG(Maas) AS ORTALAMA
FROM Personel

SELECT SUM(Maas) AS TOPLAM_MAAS,MAX(Maas) AS MAX_MAAS,
MIN(Maas) AS MIN_MAAS, AVG(Maas) AS ORTALAMA_MAAS
FROM Personel P
LEFT JOIN Bolum B ON P.BolumID=B.BolumID
WHERE BolumAd='Merkez'

SELECT COUNT(PerID) AS KAC_KÝSÝ FROM Personel

SELECT COUNT(P.PerID) AS SAYISI FROM Personel P
LEFT JOIN Bolum B ON P.BolumID=b.BolumID
WHERE BolumAd='Merkez'

SELECT  COUNT(DISTINCT Maas) AS FARKLI_MAAS
FROM Personel

SELECT P.BolumID,COUNT(*) AS SAYISI 
FROM PERSONEL P
LEFT JOIN Bolum B ON B.BolumID=P.BolumID
GROUP BY P.BolumID

SELECT P.BolumID,COUNT(*) AS CALISAN_SAYISI, AVG(P.Maas)AS ORT_MAAS
FROM Personel P
GROUP BY P.BolumID

SELECT pp.ProID, p.ProAd, count(*) ProjePerSay 
FROM PersonelProje PP
INNER JOIN Proje P ON  PP.ProID=P.ProID
GROUP BY PP.ProID,P.ProAd

SELECT P.PerID,P.Soyad,SUM(PP.CalismaSaat) 
FROM Personel P
INNER JOIN PersonelProje PP ON P.PerID=PP.PerID
GROUP BY  P.PerID, P.Soyad

SELECT P.PerID,COUNT(*) FROM Personel P
INNER JOIN BakmaklaYukumlu BK ON P.PerID=BK.PerID
GROUP BY P.PerID

SELECT P.PerID,P.Ad, COUNT(*) FROM Personel P
INNER JOIN BakmaklaYukumlu BK ON P.PerID=BK.PerID
GROUP BY P.PerID,P.Ad


Select p.PerID, p.Soyad, ppc.ProjeTopSaat, bks.BkYukSay
From Personel p,
(Select pp.PerID, sum(pp.CalismaSaat) ProjeTopSaat 
From PersonelProje pp
Group By pp.PerID) ppc,
(Select bk.PerID, count(*) BkYukSay
From BakmaklaYukumlu bk
Group By bk.PerID) bks
Where p.PerID=ppc.PerID and ppc.PerID=bks.PerID

SELECT PP.PerID,PJ.ProID,SUM(PP.CalismaSaat) FROM Proje PJ
LEFT JOIN PersonelProje PP ON PJ.ProID=PP.ProID
WHERE  PJ.Lokasyon='Üsküdar'
GROUP BY PP.PerID,PJ.ProID

SELECT P.ProID,P.ProAd,SUM(PP.PerID)
FROM Proje P
INNER JOIN PersonelProje PP ON P.ProID=PP.ProID
GROUP BY P.ProID,P.ProAd

SELECT P.ProID,P.ProAd,SUM(PP.PerID)
FROM Proje P
INNER JOIN PersonelProje PP ON P.ProID=PP.ProID
GROUP BY P.ProID,P.ProAd
HAVING COUNT(*)>1

SELECT P.BolumID,B.BolumAd,COUNT(*)
FROM Personel P
LEFT JOIN Bolum B ON P.BolumID=B.BolumID
WHERE P.Maas>500 
GROUP BY P.BolumID,B.BolumAd
HAVING COUNT(*)>=3

SELECT P.BolumID,B.BolumAd,COUNT(*) PER_SAYISI
FROM Personel P
LEFT JOIN Bolum B ON P.BolumID=B.BolumID
GROUP BY P.BolumID,B.BolumAd
HAVING COUNT(*)>=3

--ONEMLI
select p.BolumID, b.BolumAd, count(*) PerSay
from Personel p
inner join Bolum b on p.BolumID=b.BolumID
where p.BolumID in (select p2.BolumID
from Personel p2
group by p2.BolumID
having count(*)>=3)
and p.Maas>500
group by p.BolumID, b.BolumAd


SELECT * FROM Personel P
INNER JOIN BakmaklaYukumlu BK ON P.PerID=BK.PerID


--ONEMLI 
select p.PerID, p.Ad + ' ' + p.Soyad [Ad Soyad], b.BolumAd, sum(pp.CalismaSaat) TopSaat,
count(*) ProjeSay, 1.0*sum(pp.CalismaSaat)/count(*) OrtSaat
from Personel p
inner join Bolum b on p.BolumID=b.BolumID
inner join PersonelProje pp on p.PerID=pp.PerID
where p.PerID in (select bk.PerID
from BakmaklaYukumlu bk
group by bk.PerID
having count(*)>=2)
group by p.PerID, p.Ad + ' ' + p.Soyad, b.BolumAd
order by b.BolumAd, OrtSaat desc



SELECT * FROM BakmaklaYukumlu
SELECT * FROM Bolum
--SELECT * FROM BolumLokasyon
SELECT * FROM Personel
SELECT * FROM PersonelProje-- PROJENIN CALISANI ICIN KULLAN SAAT VAR
--SELECT * FROM Proje










