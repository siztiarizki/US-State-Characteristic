--DROP TABLE restaurant;
CREATE TABLE us_checkin (
  Location VARCHAR(250),
  Date TIMESTAMP
); 

COPY us_checkin
FROM 'D:\data\IG.csv'
DELIMITER ','
CSV HEADER;