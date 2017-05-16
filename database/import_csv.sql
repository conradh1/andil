LOAD DATA INFILE "/home/conradh/Code/wallawee/database/data/experience_types_DATA.csv"
INTO TABLE experience_types
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE "/home/conradh/Code/wallawee/database/data/providers_DATA.csv"
INTO TABLE providers
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE "/home/conradh/Code/wallawee/database/data/seekers_DATA.csv"
INTO TABLE seekers
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE "/home/conradh/Code/wallawee/database/data/experiences_DATA.csv"
INTO TABLE experiences
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;