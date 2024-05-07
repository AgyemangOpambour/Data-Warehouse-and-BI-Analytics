-- creating marterialed query table 

BEGIN; 

-- Create a group set

SELECT 
    f.stationid,
    t.trucktype,
    SUM(f.wastecollected) AS "total waste collected"
FROM 
    public."MyFactTrips" f
JOIN 
    public."MyDimTruck" t ON f.truckid = t.truckid
GROUP BY 
    GROUPING SETS ((f.stationid), (t.trucktype), (f.stationid, t.trucktype));


---Create a rollup query
SELECT 
    d.year,
    s.city,
    f.stationid,
    SUM(f.wastecollected) AS "total waste collected"
FROM 
    public."MyFactTrips" f
JOIN 
    public."MyDimDate" d ON f.dateid = d.dateid
JOIN 
    public."MyDimStation" s ON f.stationid = s.stationid
JOIN 
    public."MyDimTruck" t ON f.truckid = t.truckid
GROUP BY 
    ROLLUP (d.year, s.city, f.stationid);



--Create a cube query
SELECT 
    d.year,
    s.city,
    f.stationid,
    AVG(f.wastecollected) AS "average waste collected"
FROM 
    public."MyFactTrips" f
JOIN 
    public."MyDimDate" d ON f.dateid = d.dateid
JOIN 
    public."MyDimStation" s ON f.stationid = s.stationid
GROUP BY 
    CUBE (d.year, s.city, f.stationid);


--Create an MQT
CREATE MATERIALIZED VIEW max_waste_stats AS
SELECT 
    s.city,
    f.stationid,
    t.trucktype,
    MAX(f.wastecollected) AS "max waste collected"
FROM 
   public."MyFactTrips" f
JOIN 
    public."MyDimStation" s ON f.stationid = s.stationid
JOIN 
    public."MyDimTruck" t ON f.truckid = t.truckid
GROUP BY 
    s.city, f.stationid, t.trucktype;


-- refresh to view the materialed query view 
REFRESH MATERIALIZED VIEW max_waste_stats;

select * from max_waste_stats;



END; 