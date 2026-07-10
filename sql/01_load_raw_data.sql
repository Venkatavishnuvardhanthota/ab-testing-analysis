CREATE TABLE ab_test_staging (
    user_id        INT,
    test_group     VARCHAR(10),
    converted      VARCHAR(10),
    total_ads      INT,
    most_ads_day   VARCHAR(15),
    most_ads_hour  INT
);

LOAD DATA LOCAL INFILE 'D:/projects/ab-testing-analysis/data/raw/marketing_AB.csv'
INTO TABLE ab_test_staging
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@dummy, user_id, test_group, converted, total_ads, most_ads_day, most_ads_hour);

SELECT COUNT(*) AS row_count FROM ab_test_staging;

CREATE TABLE ab_test_raw AS
SELECT
    user_id,
    test_group,
    CASE WHEN converted = 'TRUE' THEN 1 ELSE 0 END AS converted,
    total_ads,
    most_ads_day,
    most_ads_hour
FROM ab_test_staging;

SELECT COUNT(*) AS final_row_count FROM ab_test_raw;