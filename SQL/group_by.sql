-- ============================================
-- SQL 第三次练习
-- 主题：聚合函数、GROUP BY、HAVING、JOIN、ORDER BY
-- ============================================


-- 1. COUNT()
-- 统计 scores 表中一共有多少条成绩记录
SELECT COUNT(*)
FROM scores;


-- 2. AVG()
-- 计算所有成绩的平均分
SELECT AVG(scores.score)
FROM scores;


-- 3. MAX() 和 MIN()
-- 查询所有成绩中的最高分和最低分
SELECT MAX(scores.score), MIN(scores.score)
FROM scores;


-- 4. SUM()
-- 计算所有成绩的总分
SELECT SUM(scores.score)
FROM scores;


-- ============================================
-- GROUP BY：分组统计
-- ============================================


-- 5. 按学生分组
-- 计算每个学生的平均成绩
SELECT student_id, AVG(score)
FROM scores
GROUP BY student_id;


-- 6. 按课程分组
-- 计算每门课程的平均成绩
SELECT course_id, AVG(score)
FROM scores
GROUP BY course_id;


-- 7. 按学生分组
-- 统计每个学生一共选了多少门课程
SELECT student_id, COUNT(course_id)
FROM scores
GROUP BY student_id;


-- ============================================
-- HAVING：对分组后的结果进行筛选
-- ============================================


-- 8. 筛选平均成绩 >= 90 分的学生
-- WHERE 不能直接筛选 AVG() 的结果
-- 因此这里使用 HAVING
SELECT student_id, AVG(score)
FROM scores
GROUP BY student_id
HAVING AVG(score) >= 90;


-- 9. 筛选至少选修 2 门课程的学生
-- COUNT(course_id) 是分组后的统计结果
-- 因此使用 HAVING 进行筛选
SELECT student_id, COUNT(course_id)
FROM scores
GROUP BY student_id
HAVING COUNT(course_id) >= 2;


-- ============================================
-- JOIN + GROUP BY + HAVING + ORDER BY
-- 综合练习
-- ============================================


-- 10. 查询平均成绩 >= 88 分的学生
-- 同时显示学生姓名和平均成绩
-- 最后按照平均成绩从高到低排序
SELECT student_name, AVG(score) AS avg_score
FROM scores
JOIN students
ON students.student_id = scores.student_id
GROUP BY students.student_id
HAVING AVG(score) >= 88
ORDER BY avg_score DESC;