SHOW DATABASES;
USE p_2;
CREATE TABLE company (
    company VARCHAR(20),
    amount INT
);
INSERT INTO company VALUES ('wipro', 5000);
INSERT INTO company VALUES ('ibm', 8000);
INSERT INTO company VALUES ('dell', 9000);
INSERT INTO company VALUES ('wipro', 2000);
INSERT INTO company VALUES ('dell', 10000);
SELECT * FROM company;
SELECT AVG(amount) FROM company;
SELECT SUM(amount) FROM company;
SELECT MAX(amount) FROM company;
SELECT MIN(amount) FROM company;
SELECT COUNT(*) FROM company;
SELECT company, SUM(amount) 
FROM company 
GROUP BY company;
SELECT company, MIN(amount) 
FROM company 
GROUP BY company;
SELECT company, MAX(amount) 
FROM company 
GROUP BY company;
SELECT company, COUNT(*) 
FROM company 
GROUP BY company;
SELECT company, COUNT(*) 
FROM company 
GROUP BY company 
HAVING COUNT(*) > 1;
SELECT company, SUM(amount) 
FROM company 
GROUP BY company 
HAVING SUM(amount) > 10000;
