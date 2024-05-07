
BEGIN;

-- Create MyDimDate Table
CREATE TABLE public."MyDimDate"
(
    dateid SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    year INTEGER NOT NULL,
    quarter INTEGER NOT NULL,
    quartername VARCHAR(2) NOT NULL,
    month INTEGER NOT NULL,
    monthname VARCHAR(20) NOT NULL,
    day INTEGER NOT NULL,
    weekday INTEGER NOT NULL,
    weekdayname VARCHAR(20) NOT NULL
);

-- Create MyDimStation Table
CREATE TABLE public."MyDimStation"
(
    stationid SERIAL PRIMARY KEY,
    city VARCHAR(40) NOT NULL
);

-- Create MyDimTruck Table
CREATE TABLE public."MyDimTruck"
(
    truckid SERIAL PRIMARY KEY,
    trucktype VARCHAR(20) NOT NULL
);

-- Create MyFactTrips Table
CREATE TABLE public."MyFactTrips"
(
    tripid SERIAL PRIMARY KEY,
    dateid INTEGER NOT NULL,
    stationid INTEGER NOT NULL,
    truckid INTEGER NOT NULL,
    wastecollected FLOAT NOT NULL,
    FOREIGN KEY (dateid) REFERENCES public."MyDimDate"(dateid),
    FOREIGN KEY (stationid) REFERENCES public."MyDimStation"(stationid),
    FOREIGN KEY (truckid) REFERENCES public."MyDimTruck"(truckid)
);


END;