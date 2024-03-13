-- Drop the database if it already exists
DROP DATABASE IF EXISTS sql_escooter_forecast;

-- Create the database
CREATE DATABASE sql_escooter_forecast;

-- Use the database
USE sql_escooter_forecast;

-- Create the 'cities' table
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
    city VARCHAR(255) NOT NULL, -- Name of the city
    PRIMARY KEY (city_id) -- Primary key to uniquely identify each city
);

-- Create the 'city_info' table
CREATE TABLE city_info (
    city_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
    population INT NOT NULL, -- population of the city
    date_retrieved DATETIME, -- Year the data from Wikipedia was retrieved
    lat VARCHAR(255), -- latitude
    longt VARCHAR(255), -- longitude
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to connect data to its city
);

-- Create the 'weather' table
CREATE TABLE weather (
    weather_id INT AUTO_INCREMENT, -- Automatically generated ID for each weather entry
    city_id INT ,
    forecast_time DATETIME, -- population of the city
    outlook VARCHAR(255),
    temperature FLOAT,
    feels_like FLOAT,
    wind_speed FLOAT,
    rain_prob FLOAT,
    PRIMARY KEY (weather_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to connect data to its city
);

-- Create the 'airports' table
CREATE TABLE airports (
    city_id INT,
    icao VARCHAR(255), 
    PRIMARY KEY (icao),
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to connect airports to their city
);

-- Create the 'flights' table
CREATE TABLE flights (
	flight_id INT AUTO_INCREMENT, -- Automatically generated ID for each weather entry
    arrival_airport_icao VARCHAR(255),
    departure_airport_icao VARCHAR(255),
	departure_airport_name VARCHAR(255),
	scheduled_arrival_time DATETIME,
	flight_number VARCHAR(255),
	data_retrieval_time DATETIME,
    PRIMARY KEY (flight_id),
    FOREIGN KEY (arrival_airport_icao) REFERENCES airports(icao) -- Foreign key to connect flights to its airport
);

#INSERT INTO airports (icao) VALUES ('EDDB');
INSERT INTO cities (city) VALUES ('Berlin'), ('Hamburg'), ('Munich');
select * from weather;

INSERT INTO airports (city_id, icao) VALUES (1, 'EDDB');
#INSERT INTO airports (city_id, icao) VALUES (2, 'EDDM');
select * from flights;
select * from airports;
select * from weather;