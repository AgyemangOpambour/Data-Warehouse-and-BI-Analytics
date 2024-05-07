-- load data from a csv file into the tables 

BEGIN; 

-- Load data into the dimension table DimDate

COPY public."MyDimDate" (dateid, date, year, quarter, quartername, month, monthname, day, weekday, weekdayname)
FROM ' ' DELIMITER ',' CSV HEADER;




-- Read data from the tables 

SELECT * FROM public."MyDimStation"
ORDER BY stationid ASC 

SELECT * FROM public."MyDimDate"
ORDER BY dateid ASC LIMIT 100

SELECT * FROM public."MyDimStation"
ORDER BY stationid ASC 

SELECT * FROM public."MyFactTrips"
ORDER BY tripid ASC 


END;