create database three20210610 default charset=utf8;
use  three20210610;

CREATE TABLE `studentinfo` (
  `StudentID` char(10) DEFAULT NULL,
  `StudentName` varchar(20) DEFAULT NULL,
  `Gender` varchar(2) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `ClassID` int(4) DEFAULT NULL,
  `BeginYear` year(4) DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `Province` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) 

create table teacher (
    id int,
    teachername VARCHAR(10),
    hiredate DATE,
    gender char

);

create table classinfo (
    id int,   # 班级编号
    classname varchar(10),
    gradeid int,   # 年级编号
    beginyear varchar(10)  # 开始年份

);

create table subject (
    id int ,
    subjectname varchar(10),
    teacherid int 
    
);

create table exam (
    id int,
    exam int,
    subjectid int,
    studentid int,
    remark varchar(10) # 备注
);

create table grade(
    id int ,
    gradename varchar(10),
    major varchar(20)
);

INSERT INTO `three20210610`.`classinfo`(`id`, `classname`, `gradeid`, `beginyear`) VALUES (2001, '20级1班', 20, '2020');
INSERT INTO `three20210610`.`classinfo`(`id`, `classname`, `gradeid`, `beginyear`) VALUES (2002, '20级2班', 20, '2020');

INSERT INTO `three20210610`.`exam`(`id`, `exam`, `subjectid`, `studentid`, `remark`) VALUES (1, 98, 101, 1, '无');
INSERT INTO `three20210610`.`exam`(`id`, `exam`, `subjectid`, `studentid`, `remark`) VALUES (2, 89, 102, 1, NULL);
INSERT INTO `three20210610`.`exam`(`id`, `exam`, `subjectid`, `studentid`, `remark`) VALUES (3, 79, 103, 1, '');
INSERT INTO `three20210610`.`exam`(`id`, `exam`, `subjectid`, `studentid`, `remark`) VALUES (4, 96, 104, 1, NULL);
INSERT INTO `three20210610`.`exam`(`id`, `exam`, `subjectid`, `studentid`, `remark`) VALUES (5, 85, 101, 2, NULL);
INSERT INTO `three20210610`.`exam`(`id`, `exam`, `subjectid`, `studentid`, `remark`) VALUES (6, 89, 102, 2, NULL);
INSERT INTO `three20210610`.`exam`(`id`, `exam`, `subjectid`, `studentid`, `remark`) VALUES (7, 79, 103, 2, NULL);
INSERT INTO `three20210610`.`exam`(`id`, `exam`, `subjectid`, `studentid`, `remark`) VALUES (8, 83, 104, 2, NULL);


INSERT INTO `three20210610`.`grade`(`id`, `gradename`, `major`) VALUES (20, '20级', '软件技术');


INSERT INTO `three20210610`.`studentinfo`(`StudentID`, `StudentName`, `Gender`, `Birthday`, `ClassID`, `BeginYear`, `Phone`, `Province`, `City`, `Email`) VALUES ('1', '张无忌', '男', '2021-06-10', 2001, 2020, '13012340001', '河南', '许昌', 'zwj@qq.com');
INSERT INTO `three20210610`.`studentinfo`(`StudentID`, `StudentName`, `Gender`, `Birthday`, `ClassID`, `BeginYear`, `Phone`, `Province`, `City`, `Email`) VALUES ('2', '张铁牛', '男', '2021-06-16', 2001, 2020, '13012340002', '河南', '许昌', 'ztn@qq.com');
INSERT INTO `three20210610`.`studentinfo`(`StudentID`, `StudentName`, `Gender`, `Birthday`, `ClassID`, `BeginYear`, `Phone`, `Province`, `City`, `Email`) VALUES ('3', '林平之', '男', '2021-06-15', 2001, 2020, '13012340003', '河南', '安阳', 'lpz@qq.com');
INSERT INTO `three20210610`.`studentinfo`(`StudentID`, `StudentName`, `Gender`, `Birthday`, `ClassID`, `BeginYear`, `Phone`, `Province`, `City`, `Email`) VALUES ('4', '令狐冲', '男', '2021-06-08', 2002, 2019, '13012340004', '河南', '濮阳', 'lhc@qq.com');
INSERT INTO `three20210610`.`studentinfo`(`StudentID`, `StudentName`, `Gender`, `Birthday`, `ClassID`, `BeginYear`, `Phone`, `Province`, `City`, `Email`) VALUES ('5', '岳灵珊', '女', '2021-06-02', 2002, 2019, '13012340005', '河南', '南阳', 'yls@qq.com');


INSERT INTO `three20210610`.`subject`(`id`, `subjectname`, `teacherid`) VALUES (101, 'mysql', 201);
INSERT INTO `three20210610`.`subject`(`id`, `subjectname`, `teacherid`) VALUES (102, 'java基础', 201);
INSERT INTO `three20210610`.`subject`(`id`, `subjectname`, `teacherid`) VALUES (103, '面向对象', 202);
INSERT INTO `three20210610`.`subject`(`id`, `subjectname`, `teacherid`) VALUES (104, '网页设计', 202);



INSERT INTO `three20210610`.`teacher`(`id`, `teachername`, `hiredate`, `gender`) VALUES (201, 'hys', '2021-06-04', '男');
INSERT INTO `three20210610`.`teacher`(`id`, `teachername`, `hiredate`, `gender`) VALUES (202, 'dj', '2021-06-01', '女');


-- 子查询  用子查询实现，查询出学生“林平之”的同班同学  
# 1 找到林平之 的班级

select classid from studentinfo where studentname='林平之';
# 2 查同班同学
-- 查找林平之的同學
select *from studentinfo where classid=(select classid from studentinfo where studentname='林平之');



-- 查詢MySQL考試成績剛好等于85分的学生名单，

根据学生id查询学生的名单
select studentname from stunentinfo where studentid = ?


在成绩中找到成绩为85的学生id
select studentid from exam where exam = 85;

在课程表中找到MySQL的课程id
select id from subject where subjectname='mysql';
融合
select studentname from studentinfo where studentid = (select studentid from exam where exam = 85 and exam.subjectid = (select id from subject where subjectname='mysql'));

更新 dj的网页设计的成绩为+5

找到  成绩
update  exam set exam =exam + 5 where subjectid=？
找到课程id
select id from subject where subjectname = '网页设计'
找到教师id
select id from teacher where teachername='dj'


update  exam set exam =exam + 5 where subjectid= (select id from subject where subjectname = '网页设计' and subject .teacherid=(select id from teacher where teachername='dj'));


#删除张无忌的所有考试成绩

-- 在stduentinfo表中找到张无忌的学生id

select studentid from studentinfo where studentname='张无忌'

-- 根据id删除成绩
delete from exam  where studentid=？

delete from exam  where studentid=(select studentid from studentinfo where studentname='张无忌');

 
 
-- 插入的子循环  把查询的结果作为内容插入到新的数据

insert into studentinfo (select *from studentinfo where studentid=5);






-- 在成绩中找到成绩为85的学生id  子查询有多条结果  表示在某某范围之内
select studentid from exam where exam = 85;

-- 在课程表中找到MySQL的课程id
select id from subject where subjectname='mysql';
-- 融合
select studentname from studentinfo where studentid = (select studentid from exam where exam = 85 and exam.subjectid in (select id from subject where subjectname='mysql'));



