create database s4; 
use s4; 
CREATE TABLE univ_denorm ( 
  StudentID INTEGER, StudentName TEXT, Major TEXT, 
  CourseID TEXT, CourseName TEXT, Credits INTEGER, 
  EnrollmentDate TEXT, 
  InstructorID INTEGER, InstructorName TEXT, Phone TEXT 
); 
INSERT INTO univ_denorm 
(StudentID, StudentName, Major, CourseID, CourseName, Credits, EnrollmentDate, InstructorID, 
InstructorName, Phone) 
VALUES 
(1, 'Alice Smith', 'Computer Science', 'C101', 'Intro to CS', 3, '2025-09-01', 10, 'Dr. Adams', '555
0100'), 
(1, 'Alice Smith', 'Computer Science', 'C101', 'Intro to CS', 3, '2025-09-01', 11, 'Dr. Baker', '555
0111'), 
(2, 'Bob Jones', 'Mathematics', 'C101', 'Intro to CS', 3, '2025-09-03', 10, 'Dr. Adams', '555-0100'), 
(2, 'Bob Jones', 'Mathematics', 'C101', 'Intro to CS', 3, '2025-09-03', 11, 'Dr. Baker', '555-0111'), 
(1, 'Alice Smith', 'Computer Science', 'C102', 'Calculus I', 4, '2025-09-02', 11, 'Dr. Baker', '555
0111'), 
(3, 'Carol Lee', 'Physics', 'C103', 'Physics I', 4, '2025-09-04', 12, 'Dr. Clark', '555-0122'); 
Select * from univ_denorm; 
 
CREATE TABLE Students AS 
  SELECT DISTINCT StudentID, StudentName, Major FROM univ_denorm; 
 
CREATE TABLE Courses AS 
  SELECT DISTINCT CourseID, CourseName, Credits FROM univ_denorm; 
 
CREATE TABLE Instructors AS 
  SELECT DISTINCT InstructorID, InstructorName, Phone FROM univ_denorm; 
 
CREATE TABLE Enrollments AS 
  SELECT DISTINCT StudentID, CourseID, EnrollmentDate FROM univ_denorm; 
 
CREATE TABLE Course_Instructors AS 
  SELECT DISTINCT StudentID,CourseID, InstructorID FROM univ_denorm; 
 
SELECT e.StudentID, s.StudentName, s.Major, 
       e.CourseID, c.CourseName, c.Credits, e.EnrollmentDate, 
       ci.InstructorID, i.InstructorName, i.Phone 
FROM Enrollments e 
JOIN Students s ON e.StudentID = s.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID 
JOIN Course_Instructors ci ON c.CourseID = ci.CourseID 
JOIN Instructors i ON ci.InstructorID = i.InstructorID 
ORDER BY e.StudentID, e.CourseID, ci.InstructorID;