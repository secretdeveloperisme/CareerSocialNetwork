DROP DATABASE career_social_network;
CREATE DATABASE career_social_network;
USE career_social_network;
-- PATH "G:\My Drive\InformationTechnology\Project_Thesis\Design_Database\V1\career_social_network_db_script.sql";


select * from users;
select * from conversations;
select * from participants;
select * from messages;
select * from attachments;

select `jobs`.`job_id`
AS `id`,`jobs`.`title`
AS `title`,`jobs`.`title`
AS `slug`,`jobs`.`createdAt`
AS `createdAt`,count(`jobs`.`id`)
AS `number_of_likes`
from (`jobs` join `likes`
on((`jobs`.`job_id` = `likes`.`job_id`)))
where ((`likes`.`type_like` = 'like'))
group by `jobs`.`job_id`,`jobs`.`title`,jobs.``,`jobs`.`createdAt`
order by `number_of_likes` desc limit 0,5;
 
 
-- query popular tags
select tags.tag_id, tags.name, count(jt.job_id) as number_of_jobs
from tags join job_tags jt on tags.tag_id = jt.tag_id
group by tags.tag_id, tags.name
order by number_of_jobs desc
limit 10;

-- query popluar job
select l.job_id, count(l.job_id) as number_of_likes from jobs
inner join likes l on jobs.job_id = l.job_id
group by l.job_id
order by number_of_likes desc ;



-- query popular companies

select c.company_id, count(c.company_id) as number_of_follows
from companies c join follow_companies fc on c.company_id = fc.company_id
group by c.company_id
order by number_of_follows desc
limit 10;

select c.company_id, job_id from companies c
join jobs j on c.company_id = j.company_id;


-- query job application
select j.job_id, j.company_id,  count(a.job_id) as number_of_application
from jobs j left join applications a on j.job_id = a.job_id
group by j.job_id, j.company_id;

-- query job answer
select jq.job_id, a.user_id, a.answer, q.question_id, jq.job_que_id, q.content from
    questions q
    inner join job_question jq on q.question_id = jq.question_id
    left join
        (select * from answers a where user_id = 22) a on a.job_que_id = jq.job_que_id
where job_id = 12;


INSERT INTO `companies` VALUES (8,'2022-09-07 06:01:14',NULL,'hello','hoanglinhplus','life is riding a bicycle','2022-09-07 06:01:14','https://hoanglinhplus.com',2,2,1)
                             ,(17,'2022-09-10 16:48:27',NULL,'hello','hoanglinhplus','life is riding a bicycle','2022-09-10 16:48:27','https://hoanglinhplus.com',20,2,1),
                              (18,'2022-09-10 16:48:50',NULL,'minhman logo 123321','minhmanhaha','that is a good idea yeah','2022-09-10 16:48:50','https://minhmanhaha.com.vn',20,3,5),
                              (19,'2022-09-12 20:27:00',NULL,'van minh logo','vanminh farmers','that is a good idea haha','2022-09-12 20:27:00','https://vanminhfarmer.com.vn',21,5,1),
                              (20,'2022-10-08 14:37:39','2022-10-08 14:37:42','sdfsdfds','dsfsdfsdfsdfsf',NULL,NULL,NULL,NULL,NULL,NULL);