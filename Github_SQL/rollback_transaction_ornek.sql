--KALICI ��LEMLER.
BEGIN TRY 
BEGIN TRANSACTION 
INSERT INTO Kisiler(PersonelNumara,PersonelAd�)
VALUES (8,'SSSS')
COMMIT TRANSACTION;--��LEMLER�N KALICI OLMASINI SA�LIYOR.
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrNum, ERROR_MESSAGE() AS ErrMsg;
 IF (XACT_STATE()) = -1  -- Herhangi bir transaction var m� diye kontrol eder.
 BEGIN
 ROLLBACK TRANSACTION;
 END;
 ELSE
SELECT ERROR_NUMBER() AS ErrNum, ERROR_MESSAGE() AS ErrMsg;
 ROLLBACK TRANSACTION; -- YAPILAN ��LEMLER�N GER� ALINMASINI SA�LAR.
END CATCH; 



--BURADAK� ��LEMLER KALICI DE��L.
BEGIN TRANSACTION --��lem bu sat�rdan itibaren ba�lang�c� bildiriyoruz.
DELETE FROM Kisiler WHERE PersonelAd� LIKE '%ssss%' --Sonu test ile bitenleri silecek
ROLLBACK TRANSACTION



--KALICI ��LEMLER.
BEGIN TRANSACTION
BEGIN TRY
	BEGIN
		DELETE FROM Kisiler WHERE PersonelAd� LIKE '%ssss%' --Sonu test ile bitenleri silecek
	END

COMMIT TRANSACTION 

END TRY 

BEGIN CATCH 
	ROLLBACK TRANSACTION
END CATCH




------
SELECT* FROM Kisiler












