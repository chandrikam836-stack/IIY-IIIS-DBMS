show databases;
USE P3;
CREATE TABLE st1 (
    rollno INT PRIMARY KEY,
    name VARCHAR(30),
    marks INT
);
INSERT INTO st1 VALUES
(501, 'jyothi', 90),
(502, 'sai', 95),
(503, 'ravi', 80),
(504, 'yamuna', 70),
(505, 'padma', 60);
CREATE VIEW myview AS
SELECT rollno, name FROM st1;
SHOW FULL TABLES;
SELECT * FROM myview;
INSERT INTO myview VALUES (506, 'prathisha');
SELECT * FROM myview;
SELECT * FROM st1;
DELETE FROM myview WHERE rollno = 506;
SELECT * FROM myview;
SELECT * FROM st1;
CREATE OR REPLACE VIEW myview AS
SELECT * FROM st1;
SELECT * FROM myview;
CREATE OR REPLACE FORCE VIEW abc AS
SELECT * FROM dummy_table;
CREATE VIEW myview1 AS
SELECT * FROM st1
WITH READ ONLY;
SELECT * FROM myview1;
CREATE VIEW myview2 AS
SELECT * FROM st1
WHERE marks < 101
WITH CHECK OPTION;
SELECT * FROM myview2;
DROP VIEW myview1;
SHOW FULL TABLES;
CREATE TABLE student_extra (
    sid INT,
    bid INT
);
INSERT INTO student_extra VALUES
(101, 201),
(102, 202),
(103, 203),
(104, 204),
(105, 205);
CREATE VIEW complex_view AS
SELECT st1.rollno, st1.name, student_extra.sid, student_extra.bid
FROM st1, student_extra;
SELECT * FROM complex_view;
CREATE OR REPLACE VIEW complex_view AS
SELECT * FROM st1, student_extra;
DROP VIEW complex_view;
CREATE TABLE materialized_view AS
SELECT * FROM st1;
SELECT * FROM materialized_view;
TRUNCATE TABLE materialized_view;
INSERT INTO materialized_view SELECT * FROM st1;
SELECT * FROM materialized_view;