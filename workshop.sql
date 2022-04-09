<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/hp/Desktop/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="5166"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,8:maininvoices"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="84"/><column index="2" value="300"/><column index="3" value="76"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="invoices" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="93"/><column index="2" value="111"/><column index="3" value="162"/><column index="4" value="300"/><column index="5" value="167"/><column index="6" value="109"/><column index="7" value="132"/><column index="8" value="160"/><column index="9" value="53"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="tracks" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="75"/><column index="2" value="300"/><column index="3" value="84"/><column index="4" value="121"/><column index="5" value="80"/><column index="6" value="300"/><column index="7" value="115"/><column index="8" value="79"/><column index="9" value="88"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">-- 1)
-- SELECT Composer
-- FROM tracks;

-- 2)
-- SELECT *
-- FROM tracks;

-- 3)
-- SELECT DISTINCT Composer
-- FROM tracks;

-- 4)
-- SELECT DISTINCT AlbumId, MediaTypeId
-- FROM tracks;

--5)
-- SELECT name, TrackId
-- FROM tracks
-- WHERE Composer=&quot;Jorge Ben&quot;;

--6)
-- SELECT *
-- FROM invoices
-- WHERE total&gt;25;

--7)
-- SELECT *
-- FROM invoices
-- WHERE total&lt;15
-- LIMIT 5;

--8)
-- SELECT *
-- FROM invoices
-- WHERE total&gt;10
-- ORDER BY total ASC
-- LIMIT 2;

--9)
-- SELECT *
-- FROM invoices
-- WHERE BillingCountry != &quot;Canada&quot;
-- ORDER BY total ASC
-- LIMIT 10;

--10)




</sql><sql name="SQL 3">SELECT *
FROM invoices
WHERE total&gt;25;</sql><current_tab id="0"/></tab_sql></sqlb_project>
