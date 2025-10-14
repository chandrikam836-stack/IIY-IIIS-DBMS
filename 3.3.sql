show databases ;
USE P3;
CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(30),
    rating INT,
    age FLOAT
);

CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(30),
    color VARCHAR(15)
);

CREATE TABLE Reserves (
    sid INT,
    bid INT,
    day DATE,
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

INSERT INTO Sailors VALUES
(58, 'Lubber', 8, 55.5),
(71, 'Dustin', 10, 35.0),
(74, 'Horatio', 7, 35.0),
(85, 'Andy', 5, 40.0),
(95, 'Ravi', 9, 40.0),
(101, 'Brutus', 4, 28.0),
(102, 'Art', 6, 37.5),
(103, 'Bob', 3, 25.0),
(104, 'Rusty', 6, 33.5),
(105, 'Zobra', 7, 30.0);

INSERT INTO Boats VALUES
(101, 'Interlake', 'Red'),
(102, 'Clipper', 'Green'),
(103, 'Marine', 'Blue'),
(104, 'Voyager', 'Red');

INSERT INTO Reserves VALUES
(71, 103, '2025-10-10'),
(58, 103, '2025-10-11'),
(95, 103, '2025-10-12'),
(74, 101, '2025-10-13'),
(85, 102, '2025-10-14');

SELECT s.sname
FROM Sailors s
WHERE s.sid IN (
    SELECT r.sid
    FROM Reserves r
    WHERE r.bid = 103
);

SELECT s.sname
FROM Sailors s
WHERE s.sid NOT IN (
    SELECT r.sid
    FROM Reserves r
    WHERE r.bid = 103
);

SELECT s.sid
FROM Sailors s
WHERE s.rating >= ALL (
    SELECT s1.rating
    FROM Sailors s1
);

SELECT s.sid
FROM Sailors s
WHERE s.rating > ANY (
    SELECT s1.rating
    FROM Sailors s1
    WHERE s1.sname = 'Andy'
);

SELECT s.sname
FROM Sailors s
WHERE EXISTS (
    SELECT *
    FROM Reserves r
    WHERE s.sid = r.sid AND r.bid = 103
);
SELECT s.sname
FROM Sailors s
WHERE NOT EXISTS (
    SELECT *
    FROM Reserves r
    WHERE s.sid = r.sid AND r.bid = 103
);

