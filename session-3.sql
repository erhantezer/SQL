/*====================SESSİON-3 (02 NİSAN 2022)===========================================*/


/*============================LİKE===============================*/
-- PRAGMA case_sensitive_like = true; ifadesini yazarak
--  büyük/küçük harf duyarlılığı haline getiririz



/*===================================================
LIKE
====================================================*/
/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
listeyen sorguyu yazınız*/


SELECT name
FROM tracks
WHERE Composer like '%Bach';

/* albulms tablosunda Title (başlık) sutununda Greatest içeren kayıtların tüm bilgilerini 
listeyen sorguyu yazınız*/

SELECT *
FROM albums
WHERE Title LIKE 'Greatest%Hit%';

/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/

-- SELECT *
-- FROM invoices
-- WHERE (InvoiceDate LIKE "201_-02-%")
-- SELECT * FROM invoices 
-- WHERE InvoiceDate BETWEEN "2019" AND "2010" LIKE "201_-02%";
 
 /* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
LastName ve City bilgilerini	listeleyen sorguyu yazınız*/
SELECT FirstName,LastName,City 
FROM customers
WHERE FirstName LIKE "___";


/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
LastName ve City bilgilerini listeleyen sorguyu yazınız*/
SELECT FirstName,LastName,City 
FROM customers
WHERE LastName LIKE "Sch%" or LastName LIKE "Go%";

/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
-- COUNT
------------------------------------------------------------------------------
/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */
SELECT count(*) --tamamını sayar.NULL dahil
from invoices ;

SELECT count(BillingState) --null sayılmaz
from invoices ;

SELECT count(*) AS null_value
from invoices 
WHERE BillingState IS NULL;

SELECT count(*) AS null_value
from invoices 
WHERE BillingState IS NOT NULL;

/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/

SELECT COUNT(DISTINCT composer) 
FROM tracks;

-- MIN,MAX
-----------------------------------------------------------------------------------------------	
/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
ziniz */
-- 
-- SELECT name, MIN(Milliseconds) as min_duration
-- FROM tracks;

/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */

SeLECT  MIN(Grade) as min_grade,MAX(Grade) as max_grade
 FROM students

 
-- SUM,AVG
-- -----------------------------------------------------------------------------------------------	
-- /* invoices  tablosundaki faturaların toplam değerini listeyiniz */

Select round(sum(total),3) 
FROM invoices

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
şarkıların adlarını listeleyiniz */

SELECT name,Milliseconds
from tracks
WHERE Milliseconds > (SELECT avg(Milliseconds) FROM tracks)


/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır 
sonraki bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/


/*======================GROUP BY============*/

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */

SELECT Composer,count(name)
FROM tracks
WHERE Composer is not NULL
GROUP BY Composer;

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/
SELECT BillingCountry,round (AVG(total),2)
FROM invoices
WHERE InvoiceDate BETWEEN "2009-01-01" and "2011-12-31"
GROUP BY BillingCountry






