-- =========================================================
-- SQL 学习项目：学生-课程-成绩数据库
-- 学习内容：
-- 1. CREATE TABLE
-- 2. PRIMARY KEY
-- 3. FOREIGN KEY
-- 4. INSERT INTO
-- 5. SELECT
-- 6. WHERE
-- 7. BETWEEN
-- 8. ORDER BY
-- 9. LIMIT
-- 10. JOIN
-- =========================================================


-- =========================================================
-- 一、创建学生表 students
-- =========================================================

CREATE TABLE students (
    student_id INT PRIMARY KEY,          -- 学生ID，主键，唯一确定一个学生
    student_name VARCHAR(50),            -- 学生姓名
    major VARCHAR(50)                    -- 学生专业
);


-- =========================================================
-- 二、创建课程表 courses
-- =========================================================

CREATE TABLE courses(
    course_id VARCHAR(10) PRIMARY KEY,   -- 课程ID，主键，唯一确定一门课程
    course_name VARCHAR(50)              -- 课程名称
);


-- =========================================================
-- 三、创建成绩表 scores
-- =========================================================

CREATE TABLE scores(
    student_id INT,                      -- 学生ID
    course_id VARCHAR(10),               -- 课程ID
    score INT,                           -- 学生成绩

    -- student_id + course_id 共同构成组合主键
    -- 一个学生同一门课程只能有一条成绩记录
    PRIMARY KEY (student_id, course_id),

    -- 外键：scores.student_id 必须对应 students.student_id
    FOREIGN KEY (student_id) REFERENCES students(student_id),

    -- 外键：scores.course_id 必须对应 courses.course_id
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- =========================================================
-- 四、向 students 表插入数据
-- =========================================================

INSERT INTO students (student_id, student_name, major)
VALUES (1, '张三', '数据科学');

INSERT INTO students (student_id, student_name, major)
VALUES (2, '李四', '数据科学');

INSERT INTO students (student_id, student_name, major)
VALUES (3, '王五', '地质学');


-- =========================================================
-- 五、向 courses 表插入数据
-- =========================================================

INSERT INTO courses (course_id, course_name)
VALUES ('DB01', '数据库');

INSERT INTO courses (course_id, course_name)
VALUES ('MATH01', '高等数学');

INSERT INTO courses (course_id, course_name)
VALUES ('DS01', '数据科学导论');


-- =========================================================
-- 六、向 scores 表插入成绩
-- =========================================================

-- 张三：数据库 92分
INSERT INTO scores (student_id, course_id, score)
VALUES (1, 'DB01', 92);

-- 王五：数据库 90分
INSERT INTO scores (student_id, course_id, score)
VALUES (3, 'DB01', 90);

-- 张三：高等数学 88分
INSERT INTO scores (student_id, course_id, score)
VALUES (1, 'MATH01', 88);

-- 李四：数据库 85分
INSERT INTO scores (student_id, course_id, score)
VALUES (2, 'DB01', 85);


-- =========================================================
-- 七、基础查询 SELECT
-- =========================================================

-- 查询 courses 表中的所有课程名称
SELECT course_name
FROM courses;


-- 查询所有学生的姓名和专业
-- 这里只需要 student_name 和 major，所以不使用 *
SELECT student_name, major
FROM students;


-- 查询 scores 表中的所有数据
-- * 表示所有列
SELECT *
FROM scores;


-- =========================================================
-- 八、使用 WHERE 进行条件查询
-- =========================================================

-- 查询成绩大于等于 90 分的记录
SELECT * 
FROM scores
WHERE score >= 90;


-- 查询专业为“数据科学”的学生
-- 这里只显示学生姓名
SELECT student_name
FROM students
WHERE major = '数据科学';


-- 查询成绩在 80~90 分之间的记录
-- BETWEEN 包含 80 和 90
-- 等价于：score >= 80 AND score <= 90
SELECT *
FROM scores
WHERE score BETWEEN 80 AND 90;


-- =========================================================
-- 九、ORDER BY + LIMIT
-- =========================================================

-- 按成绩从高到低排序
-- DESC = 降序
SELECT *
FROM scores
ORDER BY score DESC
LIMIT 2;


-- =========================================================
-- 十、多表查询 JOIN
-- =========================================================

-- 查询：
-- 1. 学生姓名
-- 2. 课程名称
-- 3. 成绩
--
-- scores 表中的 student_id
-- 与 students 表中的 student_id 对应
--
-- scores 表中的 course_id
-- 与 courses 表中的 course_id 对应

SELECT student_name, course_name, score
FROM scores

-- 通过 student_id 连接学生表
JOIN students 
ON scores.student_id = students.student_id

-- 通过 course_id 连接课程表
JOIN courses
ON scores.course_id = courses.course_id

-- 只查询数据科学专业的学生
WHERE students.major = '数据科学'

-- 按成绩从高到低排列
ORDER BY scores.score DESC;