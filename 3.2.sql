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
(1, 'Dustin', 10, 35.0),
(2, 'Lubber', 8, 55.5),
(3, 'Horatio', 7, 35.0),
(4, 'Ravi', 9, 40.0);

INSERT INTO Boats VALUES
(101, 'Interlake', 'Red'),
(102, 'Clipper', 'Green'),
(103, 'Marine', 'Red'),
(104, 'Voyager', 'Blue');
INSERT INTO Reserves VALUES
(1, 101, '2025-10-10'),
(1, 102, '2025-10-11'),
(2, 101, '2025-10-12'),
(2, 103, '2025-10-13'),
(3, 101, '2025-10-14'),
(4, 102, '2025-10-15');
SELECT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid AND b.bid = r.bid AND b.color = 'Red'
UNION
SELECT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid AND b.bid = r.bid AND b.color = 'Green';
SELECT DISTINCT s.sname
FROM Sailors s
WHERE s.sname IN (
    SELECT s1.sname
    FROM Sailors s1, Reserves r1, Boats b1
    WHERE s1.sid = r1.sid AND b1.bid = r1.bid AND b1.color = 'Red'
)
AND s.sname IN (
    SELECT s2.sname
    FROM Sailors s2, Reserves r2, Boats b2
    WHERE s2.sid = r2.sid AND b2.bid = r2.bid AND b2.color = 'Green'
);
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid AND b.bid = r.bid AND b.color = 'Red'
AND s.sname NOT IN (
    SELECT s1.sname
    FROM Sailors s1, Reserves r1, Boats b1
    WHERE s1.sid = r1.sid AND b1.bid = r1.bid AND b1.color = 'Green'
);