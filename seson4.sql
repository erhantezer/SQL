<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/hp/Desktop/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached><db schema="araclar" path="C:\Users\hp\Desktop\araclar.db"/></attached><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="3862"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/><expanded_item id="4" parent="1"/></tab_structure><tab_browse><current_table name="7,8:araclarmarkalar"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="63"/><column index="2" value="300"/><column index="3" value="61"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="araclar" name="markalar" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="69"/><column index="2" value="77"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="araclar" name="siparisler" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="42"/><column index="2" value="69"/><column index="3" value="94"/><column index="4" value="95"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">
/*===================================================
 JOINS
====================================================*/
    
-- Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
-- olusturmak icin kullanilabilir.
--     
-- JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
-- Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
-- icin JOIN islemleri kullanilabilir.
-- Standart SQL'de en çok kullanılan Join islemleri:
-- 1) FULL JOIN:  Tablodaki tum sonuclari gosterir
-- 2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
-- 3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
-- 4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.
--  NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
/*===================================================*/   
/* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/
SELECT  m.marka_id,m.marka_adi,s.siparis_adedi,s.siparis_adedi
FROM markalar as m
INNER JOIN siparisler as s
ON m.marka_id=s.marka_id;
-- UZUN VE LEFT HALİ
SELECT  markalar.marka_id,markalar.marka_adi,siparisler.siparis_adedi,siparisler.siparis_adedi
FROM markalar
LEFT JOIN siparisler
ON markalar.marka_id=siparisler.marka_id;
/* Markalar ve Siparisler tablolarındaki tüm araç markalarının siparis bilgilerini
(marka_id,marka_adi,siparis_adedi,siparis_tarihi) listeleyen bir sorgu yaziniz.*/
SELECT  markalar.marka_id,markalar.marka_adi,siparisler.siparis_adedi,siparisler.siparis_adedi
FROM markalar
LEFT JOIN siparisler
ON markalar.marka_id=siparisler.marka_id;
/* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının
türünü (genre) listeleyiniz.*/
SELECT  t.name,g.name
FROM tracks t
JOIN genres g
ON t.GenreId=g.GenreId;
 /* invoice tablosundaki faturaların her birinin müşteri adını (FirstName),soyadını (lastName), 
 fatura tarihini (InvoiceDate) ve fatura meblağını (total) listeleyen sorguyu yazınız */
 SELECT c.FirstName,c.LastName,i.InvoiceDate,sum(i.total) as total_amount
 FROM invoices i
 JOIN customers c
 ON i.CustomerId=c.CustomerId
 GROUP BY c.FirstName;
 
  /* invoice tablosundaki faturaların her birinin müşteri adını 
(FirstName),soyadını(lastName) ve fatura meblağlarının 
toplamının(total) 40 dolardan fazla olanlarını artan sırada
listeleyen sorguyu yazınız */
 SELECT c.FirstName, c.LastName,sum(i.total) as total_amount
 FROM invoices i
 JOIN customers c
 ON i.CustomerId = c.CustomerId
 GROUP BY c.FirstName
 HAVING total_amount &gt; 40
 ORDER BY total_amount DESC;
 
 --Alternatif olarak (CustomerId'ye gruplandırırsak)
 SELECT c.CustomerId, c.FirstName, c.LastName,sum(i.total) as total_amount
 FROM invoices i
 JOIN customers c
 ON i.CustomerId = c.CustomerId
 GROUP BY c.CustomerId
 HAVING total_amount &gt; 40
 ORDER BY total_amount DESC;
 
 /*=====================================================
     SUBQERIES
     ===================================================*/
     
     /* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */
SELECT TrackId, name, AlbumId
 FROM tracks 
 where AlbumId = (select AlbumId
                  FROM albums
                  where Title = &quot;Faceless&quot;);
                  
----JOIN------------
SELECT      t.TrackId, t.name, t.AlbumId
FROM        tracks t
JOIN        albums a
            ON t.AlbumId = a.AlbumId
WHERE       a.Title = 'Faceless';
SELECT      t.TrackId, t.name, t.AlbumId
FROM        tracks t
JOIN        albums a
            ON t.AlbumId = a.AlbumId AND a.Title = 'Faceless';
/* ÖDEV-1 albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */           
     
/* ÖDEV-2 albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
JOIN kullanarak listeyiniz.Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */ </sql><current_tab id="0"/></tab_sql></sqlb_project>
