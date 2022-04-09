<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/hp/Desktop/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="5166"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,6:mainalbums"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="84"/><column index="2" value="300"/><column index="3" value="76"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="customers" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="85"/><column index="2" value="73"/><column index="3" value="83"/><column index="4" value="294"/><column index="5" value="264"/><column index="6" value="132"/><column index="7" value="46"/><column index="8" value="96"/><column index="9" value="82"/><column index="10" value="128"/><column index="11" value="122"/><column index="12" value="183"/><column index="13" value="100"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="invoices" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="70"/><column index="2" value="85"/><column index="3" value="129"/><column index="4" value="264"/><column index="5" value="132"/><column index="6" value="82"/><column index="7" value="98"/><column index="8" value="118"/><column index="9" value="42"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="playlist_track" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="69"/><column index="2" value="58"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="playlists" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="69"/><column index="2" value="155"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="tracks" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="58"/><column index="2" value="300"/><column index="3" value="63"/><column index="4" value="92"/><column index="5" value="61"/><column index="6" value="300"/><column index="7" value="86"/><column index="8" value="63"/><column index="9" value="67"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">-- WRITE A QUERY THAT RETURNS TRACK NAME AND ITS COMPOSER FROM TRACKS TABLE
-- 1)
SELECT name, Composer
FROM tracks;

-- WRITE A QUERY THAT RETURNS ALL COLUMNS FROM TRACKS TABLE
--2)
SELECT *
FROM tracks;

-- WRITE A QUERY THAT RETURNS THE NAME OF COMPOSERS OF EACH TRACK
--3)
SELECT Composer
FROM tracks;

-- WRITE A QUERY THAT RETURNS UNIQUE ALBUMID, MEDIATYPEID FROM TRACKS TABLE
--4)
SELECT DISTINCT AlbumId, MediaTypeId
FROM tracks;

-- WRITE A QUERY THAT RETURNS TRACK NAME AND TRACKID OF ‘Jorge Ben’
--5)
SELECT name, TrackId
FROM tracks
WHERE Composer=&quot;Jorge Ben&quot;;

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH TOTAL AMOUNT IS GREATER THAN $25
--6)
SELECT *
FROM invoices
WHERE total&gt;25;

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH TOTAL AMOUNT IS LESS THAN $15. JUST RETURN 5 ROWS
--7)
SELECT *
FROM invoices
WHERE total&lt;15
LIMIT 5;

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH TOTAL AMOUNT IS GREATER THAN $10. THEN SORT THE TOTAL AMOUNTS IN DESCENDING ORDER, LASTLY DISPLAY TOP 2 ROWS
--8)
SELECT *
FROM invoices
WHERE total &gt;10
ORDER BY total DESC
LIMIT 2;

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH BILLING COUNTRY IS NOT CANADA. THEN SORT THE TOTAL AMOUNTS IN ASCENDING ORDER, LASTLY DISPLAY TOP 10 ROWS
--9)
SELECT *
FROM invoices
WHERE BillingCountry NOT IN (&quot;Canada&quot;) -- != de olabilir
ORDER BY total ASC
LIMIT 10;

-- WRITE A QUERY THAT RETURNS INVOICEID, CUSTOMERID AND TOTAL DOLLAR AMOUNT FOR EACH INVOICE. THEN SORT THEM FIRST BY CUSTOMERID IN ASCENDING, THEN TOTAL DOLLAR AMOUNT IN DESCENDING ORDER
--10)
SELECT InvoiceId, CustomerId, total
FROM invoices
ORDER BY CustomerId ASC, total DESC;

--WRITE A QUERY THAT RETURNS ALL TRACK NAMES THAT START WITH ‘B’ AND END WITH ‘S
--11)
SELECT *
FROM tracks
WHERE name like &quot;B%S&quot;;

-- WRITE A QUERY THAT RETURNS THE NEWEST DATE AMONG THE INVOICE DATES BETWEEN 2008 AND 2011
--12)
SELECT InvoiceDate
FROM invoices
WHERE InvoiceDate BETWEEN &quot;2008-01-01&quot; AND &quot;2011-12-31&quot;
ORDER BY InvoiceDate DESC
LIMIT 1;

-- WRITE A QUERY THAT RETURNS THE FIRST AND LAST NAME OF THE CUSTOMERS WHO HAVE ORDERS FROM NORWAY AND BELGIUM
--13)
SELECT FirstName, LastName
FROM customers
WHERE country IN(&quot;Norway&quot;, &quot;Belgium&quot;);

--WRITE A QUERY THAT RETURNS THE TRACK NAMES OF ‘ZAPPA’
--14)
SELECT name
FROM tracks
WHERE Composer LIKE &quot;%zappa&quot;;

-- HOW MANY TRACKS AND INVOICES ARE THERE IN THE DIGITAL MUSIC STORE, DISPLAY SEPERATELY
--15)
SELECT count(*) as number
FROM tracks;
SELECT count(*) as number
FROM invoices ;

-- HOW MANY COMPOSERS ARE THERE IN THE DIGITAL MUSIC STORE
--16)
SELECT count(Composer) as composer_number
FROM tracks;

-- HOW MANY TRACKS DOES EACH ALBUM HAVE, DISPLAY ALBUMID AND NUMBER OF TRACKS SORTED FROM HIGHEST TO LOWEST
--17)
SELECT AlbumId,COUNT(*) AS number_of_tracks
FROM tracks
GROUP BY AlbumId
ORDER BY number_of_tracks DESC;

-- WRITE A QUERY THAT RETURNS TRACK NAME HAVING THE MINIMUM AND MAXIMUM DURATION, DISPLAY SEPERATELY
--18)
SELECT Name, MIN(Milliseconds)
FROM tracks;
SELECT Name, MAX(Milliseconds)
FROM tracks;

-- WRITE A QUERY THAT RETURNS THE TRACKS HAVING DURATION LESS THAN THE AVERAGE DURATION
--19)
SELECT *
FROM tracks
WHERE Milliseconds &lt; (SELECT avg(Milliseconds) FROM tracks)

-- WRITE A QUERY THAT RETURNS THE TOTAL NUMBER OF EACH COMPOSER’s TRACK
-- 20)
SELECT Composer, COUNT(Composer)
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer;

-- WRITE A QUERY THAT RETURNS THE GENRE OF EACH TRACK
--21)
SELECT tracks.Name, genres.Name
FROM tracks
JOIN genres
ON tracks.GenreId = genres.GenreId;

-- WRITE A QUERY THAT RETURNS THE ARTIST’s ALBUM INFO
-- 22)
SELECT * 
FROM artists
LEFT JOIN albums 
ON albums.ArtistId = artists.ArtistId

-- WRITE A QUERY THAT RETURNS THE MINIMUM DURATION OF THE TRACK IN EACH ALBUM. DISPLAY ALBUMID, ALBUM TITLE AND DURATION OF THE TRACK. THEN SORT THEM FROM HIGHEST TO LOWEST 
--23)
SELECT tracks.AlbumId, albums.Title, 
MIN(tracks.Milliseconds) AS min_duration
FROM tracks
JOIN albums 
ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId, albums.Title
ORDER BY min_duration DESC;

-- WRITE A QUERY THAT RETURNS ALBUMS WHOSE TOTAL DURATION IS HIGHER THAN 60 MIN. DISPLAY ALBUM TITLE AND THEIR DURATIONS. THEN SORT THE RESULT FROM HIGHEST TO LOWEST
--24)
SELECT albums.Title, SUM(tracks.Milliseconds) AS total_duration
FROM tracks
JOIN albums ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId
HAVING total_duration &gt; 3600000
ORDER BY total_duration DESC;

--WRITE A QUERY THAT RETURNS TRACKID, TRACK NAME AND ALBUMID INFO OF THE ALBUM WHOSE TITLE ARE ‘Prenda Minha’, 'Heart of the Night' AND 'Out Of Exile'
--25)
SELECT Trackid, Name, Albumid
FROM tracks
WHERE albumid IN (SELECT AlbumId FROM albums WHERE Title IN ('Prenda Minha', 'Heart of the Night', 'Out Of Exile'));

</sql><current_tab id="0"/></tab_sql></sqlb_project>
