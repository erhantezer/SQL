<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/hp/Desktop/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="3862"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,4:mainname"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="84"/><column index="2" value="300"/><column index="3" value="76"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="name" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="63"/><column index="2" value="61"/><column index="3" value="93"/><column index="4" value="91"/><column index="5" value="115"/><column index="6" value="56"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="people" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="42"/><column index="2" value="84"/><column index="3" value="76"/><column index="4" value="50"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="personel" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="103"/><column index="2" value="99"/><column index="3" value="52"/><column index="4" value="92"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="vacation_plan" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="63"/><column index="2" value="61"/><column index="3" value="163"/><column index="4" value="91"/><column index="5" value="115"/><column index="6" value="56"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="vacation_plan2" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="63"/><column index="2" value="61"/><column index="3" value="123"/><column index="4" value="91"/><column index="5" value="105"/><column index="6" value="66"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="workers" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="97"/><column index="2" value="116"/><column index="3" value="117"/><column index="4" value="108"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">/*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
/*------------------------------------------------------------------------------------------
/*  CREATE TABLE
/*------------------------------------------------------------------------------------------
	
/*personel adinda bir tablo oluşturunuz.  Tabloda first_name, last_name 
age(INT) ve hire_date (Date) sutunuları bulunmalıdır.	*/

 CREATE TABLE personel(
  first_name TEXT,
  last_name TEXT,
  age INT,
  hire_date DATE
 );
 
 /* Aynı isimle yeniden bir veritabanı oluşturulmak istenirse hata verir. Bu hatayı
almamak için IF NOT EXISTS keywordu kullanılabilir */
CREATE TABLE IF NOT EXISTS personel(
  first_name TEXT,
  last_name TEXT,
  age INT,
  hire_date DATE
 );
 
 /*Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  Sutun isimleri
place_id, country, hotel_name, employee_id, vacation_length,budget 	*/
 
 CREATE TABLE vacation_plan (
 place_id INT,
 country TEXT(50),
 hotel_name TEXT(100), 
 employee_id INT, 
 vacation_length INT,
 budget NUMERIC
 );
 

/*------------------------------------------------------------------------------------------
/*  DROP TABLE
/*------------------------------------------------------------------------------------------
/* personel tablosunu siliniz */

DROP TABLE personel;


/* Bir tabloyu silerken tablo bulunamazsa hata verir.
 Bu hatayı görmemek için IF EXISTS keywordu kullanılabilir.*/

DROP TABLE IF EXISTS personel;

-- NOT: SQL'de TRUNCATE TABLE komutu bulunmasına karşın SQLite bu komutu 
-- desteklememektedir. Truncate komutu  bir tabloyu değil içindeki tüm verileri 
-- silmek için kullanılır.



INSERT INTO vacation_plan VALUES(34, &quot;TURKEY&quot;, &quot;HOTEL ISTANBUL&quot;,1, 7, 4000); 
INSERT INTO vacation_plan VALUES(42, &quot;TURKEY&quot;, &quot;HOTEL AHSARAY&quot;,2, 4, 2000);
-- NOT: Aynı komut tekrar çalıştırılırsa herhangi bir kısıt yoksa ise aynı veriler
-- tekrar tabloya girilmiş olur.

/*vacation_plan tablosuna vacation_lenght ve budget sutunlarını eksik olarak veri girişi 
yapınız*/

INSERT INTO vacation_plan VALUES(06, &quot;TURKEY&quot;, &quot;HOTEL BASKENT&quot;,2, NULL,NULL);

-- NOT : giriş yapılmayan sutunlara NULL atanır.

 
 /*------------------------------------------------------------------------------------------
/*  CONSTRAINTS - KISITLAMALAR 
/*-----------------------------------------------------------------------------------------

NOT NULL - Bir Sütunun NULL içermemesini garanti eder. 

UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  

PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
 BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)

FOREIGN KEY - Başka bir tablodaki Primary Key'i referans göstermek için kullanılır. 
 Böylelikle, tablolar arasında ilişki kurulmuş olur. 

 DEFAULT - Herhangi bir değer atanmadığında Başlangıç değerinin atanmasını sağla*/
 
 CREATE TABLE workers (
 id INT	PRIMARY KEY,
 id_number TEXT NOT NULL UNIQUE,
 name TEXT DEFAULT &quot;NONAME&quot;,
 salary INTEGER NOT NULL
 );
 
 --INSERT INTO workers VALUES(1, &quot;25929839144&quot;, &quot;AHMET CAN&quot;, 4000);
-- UNIQUE OLDUĞU İÇİN 1 PRIMARY KEY TEKRAR KULLANILMAZ

 INSERT INTO workers VALUES(1, &quot;18929839144&quot;, &quot;CAN&quot;, 5000);
 INSERT INTO workers VALUES(2, &quot;25929839144&quot;, &quot;AHMET CAN&quot;, 4000);
 
 INSERT INTO workers (id, id_number, salary) VALUES(4,&quot;57786678910&quot;,9000);
 
 
 /*vacation_plan tablosunu place_id sutunu PK ve employee_id sutununu 
ise FK olarak  değiştirirek vacation_plan2 adinda yeni bir tablo oluşturunuz.
Bu tablo, employees tablosu ile ilişkili olmalıdır */ 
 
 CREATE TABLE vacation_plan2 (
 place_id INT,
 country TEXT(50),
 hotel_name TEXT(100), 
 employee_id INT, 
 vacation_length INT,
 budget NUMERIC,
 PRIMARY KEY(place_id),
 FOREIGN KEY (employee_id) REFERENCES employees(EmployeeId)
 );
 
 /* Employees tablosundaki EmployeeId'si 1 olan kişi için bir tatil planı giriniz.*/
 INSERT INTO vacation_plan2 VALUES(33, &quot;TURKEY&quot;, &quot;HAPPY NATION&quot;,1, 5, 4000);  
 
 /* Employees tablosunda bulunmayan bir kişi için (EmployeeId=9) olan kişi için bir tatil planı giriniz.*/
 --INSERT INTO vacation_plan2 VALUES(33, &quot;TURKEY&quot;, &quot;HAPPY NATION&quot;,9, 4, 4000);
 
 /*JOIN işlemi ile 2 tablodan veri çekme*/
 /* FirstName, LastName, vacation_length, hotel_name*/ 
 SELECT e.FirstName, e.LastName, v.vacation_length, v.hotel_name
 FROM employees e
 LEFT JOIN vacation_plan2 v
 ON e.EmployeeId= v.employee_id ;

 /*------------------------------------------------------------------------------------------
/*  ALTER TABLE (ADD, RENAME TO, DROP)
/*  SQLITE MODIFY VE DELETE KOMUTLARINI DOĞRUDAN DESTEKLENMEZ
/*------------------------------------------------------------------------------------------
	
/*vacation_plan2 tablosuna name adında ve DEFAULT değeri noname olan 
yeni bir sutun ekleyelim */
ALTER TABLE vacation_plan2
ADD name TEXT DEFAULT &quot;isimsiz&quot;;
 
 
 /*vacation_plan2 tablosundaki name sütununu siliniz*/
 ALTER TABLE vacation_plan2
 DROP COLUMN name;
 
 
 /* workers tablosunun adını people olarak değiştiriniz */
 ALTER TABLE vacation_plan2
 RENAME TO name;
 
 
 
 
/*------------------------------------------------------------------------------------------
/*  UPDATE,DELETE
-- SYNTAX
----------
-- UPDATE tablo_adı
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
-- WHERE koşul;
		
--DELETE tablo_adı
--WHERE koşul;
/*-----------------------------------------------------------------------------------------*/
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydini  hotel_name'ini
 Komagene Hotel olarak güncelleyiniz.*/
 
 UPDATE vacation_plan2
 set hotel_name = &quot;KOMAGENE HOTEL&quot; 
 WHERE employee_id =1 ;
 
 
 
 
 /* people tablosunda salary sutunu 7000 'den az olanların salary(maaşına)
%10 zam yapacak sorguyu yazınız*/ 
 
 
 
 
 
 </sql><sql name="SQL 2">/*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
/*-----------------------------------------------------
/*  CREATE TABLE
/*-----------------------------------------------------
	
/*personel adinda bir tablo oluşturunuz. Tabloda first_name, 
last_name, age(INT) ve hire_date (Date) sutunları bulunmalıdır.	*/

 CREATE TABLE personel(
  first_name TEXT,
  last_name TEXT,
  age INT,
  hire_date DATE
 );
 
 /* Aynı isimle yeniden bir veritabanı oluşturulmak istenirse hata verir.
 Bu hatayı almamak için IF NOT EXISTS keywordu kullanılabilir */

 CREATE TABLE IF NOT EXISTS personel(
  first_name TEXT,
  last_name TEXT,
  age INT,
  hire_date DATE
 );

/* Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  
Sutun isimleri place_id, country, hotel_name, employee_id, 
vacation_length, budget */
 
 CREATE TABLE vacation_plan (
  place_id INT, 
  country NVARCHAR(50), 
  hotel_name NVARCHAR(100),
  employee_id INTEGER, 
  vacation_length INT,
  budget REAL
 );
 
/*---------------------------------------------------
/*  DROP TABLE
/*---------------------------------------------------
/* personel tablosunu siliniz */
 DROP TABLE personel;
  	
/* Bir tabloyu silerken tablo bulunamazsa hata verir.
 Bu hatayı görmemek için IF EXISTS keywordu kullanılabilir.*/

 DROP TABLE IF EXISTS personel;
  
-- NOT: SQL'de TRUNCATE TABLE komutu bulunmasına karşın SQLite 
-- bu komutu desteklememektedir. Truncate komutu  bir tabloyu 
-- değil içindeki tüm verileri silmek için kullanılır.
 
  INSERT INTO vacation_plan VALUES(34, &quot;TURKEY&quot;, 'HOTEL ISTANBUL',1, 7, 4000);
  
-- NOT: Aynı komut tekrar çalıştırılırsa herhangi bir kısıt yoksa ise aynı veriler
-- tekrar tabloya girilmiş olur. 
	
  INSERT INTO vacation_plan VALUES(42, &quot;TURKEY&quot;, 'HOTEL MEVLANA',2, 4, 2000);
  
  /*vacation_plan tablosuna vacation_lenght ve budget sutunlarını eksik 
  olarak veri girişi yapınız*/
  
  INSERT INTO vacation_plan (place_id,country, hotel_name, employee_id) 
                             VALUES(06, &quot;TURKEY&quot;, 'HOTEL BAŞKENT',3);
-- NOT : giriş yapılmayan sutunlara NULL atanır.

/*------------------------------------------------------------------------------------------
/*  CONSTRAINTS - KISITLAMALAR 
/*-----------------------------------------------------------------------------------------

 NOT NULL - Bir Sütunun NULL içermemesini garanti eder. 

 UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  

 PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
 BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)

 FOREIGN KEY - Başka bir tablodaki Primary Key'i referans göstermek için kullanılır. 
 Böylelikle, tablolar arasında ilişki kurulmuş olur. 

 DEFAULT - Herhangi bir değer atanmadığında Başlangıç değerinin atanmasını sağlar.*/
 
  CREATE TABLE workers(
   id INT PRIMARY KEY,
   id_number TEXT NOT NULL UNIQUE,
   name TEXT DEFAULT 'NONAME',
   salary INTEGER NOT NULL
  );
  
  INSERT INTO workers VALUES(1,&quot;12345678910&quot;,&quot;CAN CANAN&quot;, 10000);
  
  -- UNIQUE CONST VIOLATION
  -- INSERT INTO workers VALUES(1,&quot;4445678910&quot;,&quot;AHMET CANAN&quot;, 7000); 
  
    INSERT INTO workers VALUES(3,&quot;566678910&quot;,NULL, 9000);
	
	--name kısmına NONAME yazılır. (DEFAULT)
	INSERT INTO workers (id, id_number, salary) VALUES(4,&quot;57786678910&quot;,9000);
  
/*vacation_plan tablosunu place_id sutunu PK ve employee_id sutununu 
ise FK olarak değiştirirek vacation_plan2 adinda yeni bir tablo oluşturunuz.
Bu tablo, employees tablosu ile ilişkili olmalıdır */ 
 
 CREATE TABLE vacation_plan2 (
  place_id INT, 
  country NVARCHAR(50), 
  hotel_name NVARCHAR(100),
  employee_id INTEGER, 
  vacation_length INT,
  budget REAL,
  PRIMARY KEY(place_id),
  FOREIGN KEY (employee_id) REFERENCES employees(EmployeeId) 
 );
	
 /* Employees tablosundaki EmployeeId'si 1 olan kişi için 
 bir tatil planı giriniz.*/
 
 INSERT INTO vacation_plan2 VALUES(34,&quot;TURKEY&quot;, 'HAPPY NATION',1,5,5000);
  
 /* Employees tablosunda bulunmayan bir kişi için (EmployeeId=9) 
 olan kişi için bir tatil planı giriniz.*/
 
 --HATA (FOREIGN KEY constraint failed)
 --INSERT INTO vacation_plan2 VALUES(35,&quot;TURKEY&quot;, 'HOTEL DELRAY',9,4,3000);
 
 /*JOIN işlemi ile 2 tablodan veri çekme*/
 /* FirstName, LastName, vacation_length, hotel_name*/ 
 
 SELECT e.FirstName, e.LastName, v.vacation_length, v.hotel_name
 FROM employees e
 LEFT JOIN vacation_plan2 v
 --INNER JOIN vacation_plan2 v
 ON e.EmployeeId = v.employee_id;
 
  
/*------------------------------------------------------------------------------------------
/*  ALTER TABLE (ADD, RENAME TO, DROP)
/*  SQLITE MODIFY VE DELETE KOMUTLARINI DOĞRUDAN DESTEKLENMEZ
/*------------------------------------------------------------------------------------------
	
/*vacation_plan2 tablosuna name adında ve DEFAULT değeri noname olan 
yeni bir sutun ekleyelim */

 ALTER TABLE vacation_plan2
 ADD name TEXT DEFAULT 'isimsiz';
 
 /*vacation_plan2 tablosundaki name sutununu siliniz*/
  ALTER TABLE vacation_plan2
  DROP COLUMN name;
  
 /* workers tablosunun adını people olarak değiştiriniz */
 
 ALTER TABLE vacation_plan2
 RENAME TO people;
 
  ALTER TABLE people
  RENAME TO vacation_plan2;
 
/*------------------------------------------------------------------------------------------
/* UPDATE,DELETE
-- SYNTAX
----------
-- UPDATE tablo_adı
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
-- WHERE koşul;
		
--DELETE tablo_adı
--WHERE koşul;
/*-----------------------------------------------------------------------------------------*/
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydini hotel_name'ini
 Komagene Hotel olarak güncelleyiniz.*/
 
 UPDATE vacation_plan2
 SET hotel_name = &quot;KOMAGENE HOTEL&quot;
 WHERE employee_id = 1;
 
   
/* people tablosunda salary sutunu 7000 'den az olanların 
salary(maaşına) %10 zam yapacak sorguyu yazınız*/ 
   
UPDATE vacation_plan2
SET hotel_name = 'Komagene Hotel'
WHERE employee_id = 1;
   
/* workers tablosunda salary sutunu 9000 'den fazla olanların salary(maaşına)
%10 zam yapacak sorguyu yazınız*/ 
   
UPDATE workers
SET salary = salary*1.1
WHERE salary &gt;= 9000;
   
/*workers tablosundaki tüm kayıtların salary sutununu 10000 olarak güncelleyiniz */
UPDATE workers
SET salary=10000;
   
/*workers tablosundaki id=1 olan kaydı siliniz*/
DELETE FROM workers
WHERE id=1;</sql><current_tab id="0"/></tab_sql></sqlb_project>
