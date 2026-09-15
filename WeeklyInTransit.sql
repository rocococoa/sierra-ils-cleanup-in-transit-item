/*
Report captures items that have had an in-transit status for more that 7 days from the time of the report
Reports Location, Call #, Author, Title, Barcode, Status Updated Date
Created AGW
*/

SELECT  DISTINCT  
	CASE
		WHEN pei.index_entry IS NULL THEN UPPER(peb.index_entry) 
		ELSE UPPER(pei.index_entry)
	END AS "Call#",
	i.location_code AS "Location",
	brp.best_author AS "Author",
	brp.best_title AS "Title", 
	i.barcode AS "Barcode",
	i.last_status_update::date AS "Updated"

FROM sierra_view.item_view i
JOIN sierra_view.bib_record_item_record_link bri ON bri.item_record_id=i.id
JOIN sierra_view.bib_view b ON bri.bib_record_id=b.id
JOIN sierra_view.phrase_entry peb ON peb.record_id=b.id AND peb.index_tag='c'
JOIN sierra_view.bib_record_property brp ON brp.bib_record_id=b.id
JOIN sierra_view.record_metadata rm ON rm.id=i.id
LEFT JOIN sierra_view.phrase_entry pei ON pei.record_id=i.id AND pei.index_tag='c'

WHERE i.item_status_code = 't'
AND i.last_status_update::date<=now()- interval '7 days'

GROUP BY 
		"Call#", 
		brp.best_author,
		i.barcode, 
		i.location_code,
		i.last_status_update::date,
		brp.best_title
ORDER BY i.location_code, "Call#"