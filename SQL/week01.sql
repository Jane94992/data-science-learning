-- SQL Week 01
-- Basic SQL practice
-- Topics: CREATE TABLE, INSERT, SELECT, WHERE, ORDER BY, LIMIT, DELETE

-- ========================================
-- 1. Create table
-- ========================================

CREATE TABLE students (
  id INTEGER,
  name TEXT,
  major TEXT,
  score INTEGER
);


-- ========================================
-- 2. Insert data
-- ========================================

INSERT INTO students
VALUES (1, 'Alice', 'Data Science', 92);

INSERT INTO students
VALUES (2, 'Bob', 'Computer Science', 78);

INSERT INTO students
VALUES (3, 'Carol', 'Data Science', 85);

INSERT INTO students
VALUES (4, 'David', 'Computer Science', 95);

INSERT INTO students
VALUES (5, 'Emma', 'Data Science', 76);

INSERT INTO students
VALUES (6, 'Frank', 'Computer Science', 88);


-- ========================================
-- 3. Q1: Query all students
-- ========================================

SELECT *
FROM students;


-- ========================================
-- 4. Q2: Query name and score
-- ========================================

SELECT name, score
FROM students;


-- ========================================
-- 5. Q3: Query students with score > 80
-- ========================================

SELECT *
FROM students
WHERE score > 80;


-- ========================================
-- 6. Q4: Query Data Science students
-- ========================================

SELECT *
FROM students
WHERE major = 'Data Science';


-- ========================================
-- 7. Q5: Sort by score from high to low
-- ========================================

SELECT *
FROM students
ORDER BY score DESC;


-- ========================================
-- 8. Q6: Query top 3 students
-- ========================================

SELECT *
FROM students
ORDER BY score DESC
LIMIT 3;