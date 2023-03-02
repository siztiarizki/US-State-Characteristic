--DROP TABLE restaurant;
CREATE TABLE loc (
  Location VARCHAR(250),
  Month INT,
  Year INT,
  Season VARCHAR(250),
  Address VARCHAR(1000),
  Latitude VARCHAR(1000),
  Longitude VARCHAR(1000)
); 

COPY loc
FROM 'D:\data\Location.csv'
DELIMITER ','
CSV HEADER;