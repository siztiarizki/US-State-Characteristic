WITH state_loc as (
	SELECT 
		DISTINCT location,
		regexp_replace(address, '[0-9]+,', '', 'g') adress, 
		reverse(split_part(reverse(regexp_replace(address, '[0-9]+,', '', 'g')),' ,',2)) state
	FROM loc
),

dat_in as (
	SELECT 
		sl.state, 
		COUNT(uc.location) total_check_in
	FROM us_checkin uc
	LEFT JOIN state_loc sl on sl.location = uc.location
	WHERE EXTRACT(YEAR FROM date) IN (SELECT DISTINCT year FROM temperature)
	GROUP BY 1
),

temp_state as (
	SELECT state, AVG(value) avg_temp
	FROM temperature
	GROUP BY 1
),

avg_crime as (
	SELECT state, SUM(total) total_crime
	FROM crime
	WHERE year IN (SELECT DISTINCT year FROM temperature)
	GROUP BY 1
)


SELECT ts.*, total_check_in, total_crime
FROM temp_state ts
LEFT JOIN dat_in di on di.state = ts.state
LEFT JOIN state_code sc on sc.state = ts.state
LEFT JOIN avg_crime ac on ac.state = sc.abbreviation
ORDER BY total_check_in DESC