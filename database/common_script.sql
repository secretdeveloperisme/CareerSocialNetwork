DROP DATABASE career_social_network;
CREATE DATABASE career_social_network;
USE career_social_network;
-- PATH "G:\My Drive\InformationTechnology\Project_Thesis\Design_Database\V1\career_social_network_db_script.sql";


select *
from users;
select *
from conversations;
select *
from participants;
select *
from messages;
select *
from attachments;

-- query popular tags
select tags.tag_id, tags.name, count(jt.job_id) as number_of_jobs
from tags
         join job_tags jt on tags.tag_id = jt.tag_id
group by tags.tag_id, tags.name
order by number_of_jobs desc
limit 10;

-- query popluar job
select l.job_id, count(l.job_id) as number_of_likes
from jobs
         inner join likes l on jobs.job_id = l.job_id
group by l.job_id
order by number_of_likes desc;
-- query popular companies

select c.company_id, count(c.company_id) as number_of_follows
from companies c
         join follow_companies fc on c.company_id = fc.company_id
group by c.company_id
order by number_of_follows desc
limit 10;

select c.company_id, job_id
from companies c
         join jobs j on c.company_id = j.company_id;


-- query job application
select j.job_id, j.company_id, count(a.job_id) as number_of_application
from jobs j
         left join applications a on j.job_id = a.job_id
group by j.job_id, j.company_id;

-- query job answer
select jq.job_id, a.user_id, a.answer, q.question_id, jq.job_que_id, q.content
from questions q
         inner join job_question jq on q.question_id = jq.question_id
         left join
         (select * from answers a where user_id = 22) a on a.job_que_id = jq.job_que_id
where job_id = 12;

-- query follow job
select *
from (select distinct j.job_id,
                      j.amount,
                      j.created_at,
                      j.deleted_at,
                      j.end_date,
                      j.experience,
                      j.image,
                      j.job_description,
                      j.location,
                      j.salary_max,
                      j.salary_min,
                      j.start_date,
                      j.title,
                      j.updated_at,
                      j.company_id,
                      j.employment_type_id,
                      j.position_id,
                      j.work_place_id
      from users
               inner join follow_tags on users.user_id = follow_tags.user_id
               inner join tags on follow_tags.tag_id = tags.tag_id
               inner join job_tags jt on tags.tag_id = jt.tag_id
               inner join jobs j on jt.job_id = j.job_id
      where users.user_id = ${userId}
        and j.deleted_at is null
      union
      select distinct j2.job_id,
                      j2.amount,
                      j2.created_at,
                      j2.deleted_at,
                      j2.end_date,
                      j2.experience,
                      j2.image,
                      j2.job_description,
                      j2.location,
                      j2.salary_max,
                      j2.salary_min,
                      j2.start_date,
                      j2.title,
                      j2.updated_at,
                      j2.company_id,
                      j2.employment_type_id,
                      j2.position_id,
                      j2.work_place_id
      from users
               inner join follow_companies fc on users.user_id = fc.user_id
               inner join jobs j2 on fc.company_id = j2.company_id
      where users.user_id = ${userId}
        and j2.deleted_at is null) uf
order by uf.created_at desc
limit ${start},${numberOfPostsPerPage};

-- query follow post

select distinct p.post_id
              , p.content
              , p.created_at
              , p.deleted_at
              , p.description
              , p.image
              , p.slug
              , p.title
              , p.updated_at
              , p.user_id
              , p.post_status
from users
         inner join follow_tags on users.user_id = follow_tags.user_id
         inner join tags on follow_tags.tag_id = tags.tag_id
         inner join post_tags pt on tags.tag_id = pt.tag_id
         inner join posts p on pt.post_id = p.post_id
where users.user_id = :userId
  and p.post_status = 'PUBLIC'
  and p.deleted_at is null
union
select distinct p2.post_id
              , p2.content
              , p2.created_at
              , p2.deleted_at
              , p2.description
              , p2.image
              , p2.slug
              , p2.title
              , p2.updated_at
              , p2.user_id
              , p2.post_status
from users
    inner join follow_users fu
on users.user_id = fu.following_id
    inner join posts p2 on fu.followed_id = p2.user_id
where
    users.user_id = :userId and p2.deleted_at is null
    and p2.post_status = 'PUBLIC';
--

