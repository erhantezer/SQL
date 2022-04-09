/* ====================SESSİON-2--01 NİSAN 2022==================*/


/*======== WHERE ---CONDİTİONAL LİMİT ===========*/
----SELECT column_name FROM table_name WHERE ">,<,>=,<=,=,<>,like,between,"conditions----


SELECT name,Milliseconds FROM tracks
WHERE Composer="Jimi Hendrix";

SELECT * FROM invoices WHERE total>10;

/*===================================================
LIMIT
====================================================*/
/*SORU-1==>>invoices tablosunda Total değeri 10$'dan büyük olan 
ilk 4 kayıt'ın InvoiceId,InvoiceDate ve total 
bilgilerini sorgulayiniz */
select InvoiceId,InvoiceDate total 
FROM invoices 
WHERE total>10 LIMIT 4,15;

/* ORDER BY */
/*SORU-2 ==>>invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
(InvoiceDate) en yeni olan 10 kaydın tüm bilgilerini listeyiniz */ 
SELECT * FROM invoices 
WHERE total>10 
ORDER BY InvoiceDate DESC LIMIT 10;

/* SORU-3 ==>> invoices tablosundan CustomerId, InvoiceDate, BillingCity, total 
 değerlerini sorgulayınız. BillingCity artan sırayla ve total değerlerini 
 azalan sırayla sıralayınız.*/
SELECT CustomerId,InvoiceDate,BillingCity,total 
FROM invoices  
ORDER BY BillingCity ASC,total DESC;


/*===================================================
LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/

/* SORU-4 ===>> invoices tablosunda ülkesi (BillingCountry) USA olmayan kayıtları total değerine
göre  AZALAN sırada listeyiniz */ 

SELECT * 
FROM invoices 
WHERE  BillingCountry <> 'USA' 
 ---WHERE  BillingCountry != 'USA'  
 ---NOT BillingCountry="USA"
ORDER BY total DESC;


/*SORU-5 ===>>> invoices tablosunda, ülkesi (BillingCountry) USA veya Germany olan kayıtları, 
InvoiceId sırasına göre artan sırada listeyiniz */ 

SELECT * 
FROM invoices 
-- WHERE  BillingCountry = 'USA' OR BillingCountry = 'Germany'
WHERE  BillingCountry  IN ('USA','Germany')
ORDER BY InvoiceId ASC;

/*SORU-6 ===>> invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */ 
SELECT  *
FROM  invoices
-- WHERE  InvoiceDate BETWEEN "2012-01-01" AND "2013-01-02 00:00:00 " ;
WHERE  InvoiceDate>="2012-01-01" AND InvoiceDate<= "2013-01-02  00:00:00" ; -- inclusive olduğundan değerler dahildir!!!

/* SORU-7===>> invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 tarihleri arasındaki
en yeni faturayı listeleyen sorguyu yazınız */ 

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31'
ORDER BY InvoiceDate DESC LIMIT 1;

