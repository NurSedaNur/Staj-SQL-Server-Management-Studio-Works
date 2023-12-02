--SELECT * FROM DimProductCategory

--SELECT EnglishProductCategoryName FROM DimProductCategory

--SELECT SalesAmount FROM FactInternetSales ORDER BY SalesAmount DESC

--SELECT SUM(TotalProductCost) FROM FactInternetSales

--SELECT SUM(YearlyIncome), AVG(YearlyIncome) FROM DimCustomer

--SELECT FirstName, MiddleName, LastName  FROM DimCustomer

--SELECT SUM(SalesAmount)  FROM FactInternetSales

--SELECT CustomerKey, FirstName, LastName, EmailAddress, Phone FROM DimCustomer WHERE FirstName='Janet';

--SELECT *
--FROM 
--  [AdventureWorksDW2014].[dbo].[DimProduct] as p
--  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
--  LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
--WHERE
--  pc.EnglishProductCategoryName = 'BIKES'
--  AND
--  ps.EnglishProductSubcategoryName='Mountain Bikes'

--SELECT EnglishDayNameOfWeek AS [english] ,* FROM DimDate 
--WHERE CalendarYear=2006 AND MonthNumberOfYear=6 

--SELECT c.EnglishProductCategoryName as Category, count(s.ProductSubcategoryKey) as SubcategoryCount
--FROM DimProductCategory c
--JOIN DimProductSubcategory s ON c.ProductCategoryKey = s.ProductCategoryKey
--GROUP BY c.EnglishProductCategoryName
--ORDER BY SubcategoryCount DESC;

---- productcategorykey ortak 
--SELECT * 
--FROM DimProductSubcategory ,DimProductCategory

--SELECT COUNT(Gender) AS ERKEK
--FROM DimEmployee
--WHERE Gender='M'

--SELECT COUNT(Gender) AS KADIN
--FROM DimEmployee
--WHERE Gender='F'

--SELECT COUNT (Gender) FROM DimEmployee

--SELECT * FROM  DimProductCategory c 
--LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductCategoryKey = c.ProductCategoryKey


----------------------------------------
SELECT * FROM Proje
SELECT * FROM  PersonelProje

--SELECT * , (SELECT COUNT(A.PerID) FROM PersonelProje A WHERE A.ProID=P.ProID) KÝÞÝ FROM Proje P

SELECT P.Ad ,COUNT(*) AS KacKisi FROM PERSONEL P
INNER JOIN PersonelProje PP ON P.PerID=PP.PerID
INNER JOIN Proje PJ ON PP.ProID=PJ.ProID
GROUP BY P.Ad
--HAVING PJ.ProID =1


SELECT PJ.ProID ,COUNT(*) AS KacKisi FROM PersonelProje PP
INNER JOIN Proje PJ ON PP.ProID=PJ.ProID
GROUP BY PJ.ProID 

--fonksiyon oluþturma
create function topla(@sayi1 int,@sayi2 int)
returns int
as
begin
declare @toplam int
set @toplam=@sayi1+@sayi2
return @toplam
end

select dbo.topla(5,18)-- fonksiyonu cagýrma iþlemi 

















