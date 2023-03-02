--DROP TABLE restaurant;
CREATE TABLE state_code (
  state VARCHAR(250),
  abbreviation VARCHAR(50)
); 

COPY state_code
FROM 'D:\data\state-abbrevs.csv'
DELIMITER ','
CSV HEADER;