DROP TABLE IF EXISTS instagram_data;

CREATE TABLE instagram_data (
    post_id VARCHAR(30),
    description TEXT,
    duration_secs VARCHAR(10),
    publish_time VARCHAR(255),
    permalink TEXT,
    post_type VARCHAR(100),
    data_comment TEXT,
    date VARCHAR(50),
    impressions VARCHAR(20),
    reach VARCHAR(20),
    likes VARCHAR(10),
    shares VARCHAR(10),
    follows VARCHAR(10),
    comments VARCHAR(10),
    saves VARCHAR(10),
    plays VARCHAR(20)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Instagram-Data-1.csv'
INTO TABLE instagram_data
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

#first five rows of the dataset:
SELECT * 
FROM instagram_data 
LIMIT 5;

#summary statistics
SELECT 
    COUNT(*) AS Total_Posts,
    AVG(Impressions) AS Avg_Impressions,
    MAX(Likes) AS Max_Likes,
    MIN(Likes) AS Min_Likes
FROM instagram_data;

#Identifying Missing Data
SELECT 
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN Plays IS NULL THEN 1 ELSE 0 END) AS Missing_Plays,
    SUM(CASE WHEN Data_comment IS NULL THEN 1 ELSE 0 END) AS Missing_Data_Comment
FROM instagram_data;

#Analyzing Distribution
SELECT 
    Post_type, 
    COUNT(*) AS Frequency
FROM instagram_data
GROUP BY Post_type;

#Analyzing Engagement Metrics
SELECT 
    Post_type, 
    COUNT(*) AS Frequency
FROM instagram_data
GROUP BY Post_type;

#Analyzing Trends over Time
SELECT 
    DATE(Publish_time) AS Date,
    SUM(Impressions) AS Total_Impressions,
    SUM(Likes) AS Total_Likes
FROM instagram_data
GROUP BY DATE(Publish_time)
ORDER BY Date ASC;

#Identifying Outliers
SELECT * 
FROM instagram_data
WHERE Impressions > (
    SELECT AVG(Impressions) + 2 * STDDEV(Impressions) FROM instagram_data
) 
OR Impressions < (
    SELECT AVG(Impressions) - 2 * STDDEV(Impressions) FROM instagram_data
);

