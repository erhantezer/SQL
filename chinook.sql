<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/hp/Desktop/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="3862"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,6:maintracks"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="63"/><column index="2" value="300"/><column index="3" value="61"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="tracks" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="58"/><column index="2" value="300"/><column index="3" value="63"/><column index="4" value="92"/><column index="5" value="61"/><column index="6" value="300"/><column index="7" value="86"/><column index="8" value="63"/><column index="9" value="67"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">-- SELECT * FROM tracks;
-- SELECT DISTINCT AlbumId, MediaTypeId FROM tracks;

-- SELECT name
-- FROM tracks
-- WHERE Composer = &quot;Jimi Hendrix&quot;;

/*===================================================
WHERE
====================================================*/

/*Composer'ı Jimi Hendrix olan şarkıları sorgulayiniz*/
SELECT name
FROM tracks
WHERE Composer = 'Jimi Hendrix';

/* invoices tablosunda Total değeri 10$ dan büyük olan faturaların 
tüm bilgilerini sorgulayiniz */

SELECT *
FROM invoices
WHERE total &gt; 10;

/*===================================================
LIMIT
====================================================*/
/*invoices tablosunda Total değeri 10$'dan büyük olan 
ilk 4 kayıt'ın InvoiceId,InvoiceDate ve total 
bilgilerini sorgulayiniz */
SELECT InvoiceId,invoicedate,total 
FROM invoices
WHERE total &gt; 10
LIMIT 4;


/*===================================================
ORDER BY
====================================================*/
	
/*invoices tablosunda Total değeri 10$'dan büyük olan 
kayıtlardan işlem tarihi (InvoiceDate) en yeni olan 10
 kaydın tüm bilgilerini listeyiniz */

SELECT * 
FROM invoices
WHERE total &gt; 10
ORDER BY InvoiceDate DESC
LIMIT 10; 
 
 /* invoices tablosundan CustomerId, InvoiceDate, 
 BillingCity, total değerlerini sorgulayınız. 
 BillingCity artan sırayla ve total değerlerini 
 azalan sırayla sıralayınız.*/
 SELECT CustomerId, InvoiceDate,BillingCity,total
 FROM invoices
 ORDER BY BillingCity ASC,total DESC;
 
  	
/*===================================================
LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/

/* invoices tablosunda ülkesi (BillingCountry) USA olmayan
 kayıtları total değerine göre  AZALAN sırada listeyiniz */ 
 
 SELECT *
 FROM invoices
 WHERE NOT BillingCountry = &quot;USA&quot; 
 --WHERE BillingCountry != &quot;USA&quot; 
 -- WHERE BillingCountry &lt;&gt; &quot;USA&quot;
 ORDER BY total DESC;
  	
/* invoices tablosunda, ülkesi (BillingCountry) USA veya 
Germany olan kayıtları,InvoiceId sırasına göre artan sırada listeyiniz */ 
	
 SELECT *
 FROM invoices
 WHERE BillingCountry = 'USA' OR BillingCountry = 'Germany'
 ORDER BY InvoiceId ASC;
 
 /* invoices tablosunda fatura tarihi (InvoiceDate) 
 01-01-2012 ile 02-01-2013 tarihleri arasındaki faturaların 
 tüm bilgilerini listeleyiniz */

SELECT *
FROM invoices
WHERE InvoiceDate&gt;= '2012-01-01' AND InvoiceDate &lt;= '2013-01-02 00:00:00';

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN '2012-01-01' AND '2013-01-02 00:00:00';

/* invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 
tarihleri arasındaki en yeni faturayı listeleyen sorguyu yazınız */ 

 SELECT *
 FROM invoices
 WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31'
 ORDER BY InvoiceDate DESC
 LIMIT 1;
 
 	
/*===================================================
 IN
====================================================*/
/* customers tablosunda Belgium, Norway,Canada veya USA  
ülkelerinden sipariş veren müşterilerin FirstName, LastName, 
country bilgilerini listeyiniz.	*/

SELECT FirstName,LastName,country
FROM customers
WHERE country IN('Belgium', 'Norway','Canada','USA');

 
 
 
	
 </sql><current_tab id="0"/></tab_sql></sqlb_project>
