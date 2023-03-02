--DROP TABLE restaurant;
CREATE TABLE crime (
  year INT,
  State VARCHAR(50),
  population FLOAT,
  violent_crime FLOAT,
  homicide FLOAT,
  rape_revised FLOAT,
  robbery FLOAT,
  aggravated_assault FLOAT,
  property_crime FLOAT,
  burglary FLOAT,
  larceny FLOAT,
  motor_vehicle_theft FLOAT,
  Total FLOAT
); 

COPY crime
FROM 'D:\data\USCrime.csv'
DELIMITER ','
CSV HEADER;