
-- Create database
CREATE DATABASE StudentDB;

-- Use the database
USE StudentDB;

-- Create students table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    class VARCHAR(10)
);

-- Create scores table
CREATE TABLE scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    score INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- Insert sample students
INSERT INTO students (name, gender, class) VALUES
('Aisha Bello', 'Female', 'JSS1'),
('John Mark', 'Male', 'JSS2'),
('Fatima Umar', 'Female', 'JSS1'),
('Chinedu Okoro', 'Male', 'JSS3'),
('Grace Obi', 'Female', 'JSS2');

-- Insert sample scores
INSERT INTO scores (student_id, subject, score) VALUES
(1, 'Math', 85),
(1, 'English', 78),
(2, 'Math', 65),
(2, 'English', 72),
(3, 'Math', 90),
(4, 'English', 60),
(5, 'Math', 88),
(5, 'English', 81);

-- Basic queries

-- View all students
SELECT * FROM students;

-- View all scores
SELECT * FROM scores;

-- Join students with their scores
SELECT s.name, s.gender, s.class, sc.subject, sc.score
FROM students s
JOIN scores sc ON s.id = sc.student_id;

-- Filter: Students who scored above 80
SELECT s.name, sc.subject, sc.score
FROM students s
JOIN scores sc ON s.id = sc.student_id
WHERE sc.score > 80;
