/*===========================================================
  popular_companies
===========================================================*/
drop view if exists popular_companies;
create view popular_companies
as
select top_ca.company_id, coalesce(top_cf.number_of_follows, 0) as number_of_follows, top_ca.number_of_applications from (
    select c.company_id, coalesce(sum(ja.number_of_application), 0) as number_of_applications from companies c
    left join (
         select j.company_id,  count(a.job_id) as number_of_application
        from jobs j left join applications a on j.job_id = a.job_id
        group by j.job_id, j.company_id
    ) ja
    on c.company_id = ja.company_id
    group by c.company_id
) top_ca
left join (
    select c.company_id, count(c.company_id) as number_of_follows
    from companies c join follow_companies fc on c.company_id = fc.company_id
    group by c.company_id
) top_cf
on top_ca.company_id = top_cf.company_id
where number_of_follows > 0 or number_of_applications > 0
order by number_of_follows desc, number_of_applications desc
limit 10;

select * from popular_companies;


/*===========================================================
  popular_jobs
===========================================================*/

drop view if exists popular_jobs;
create view popular_jobs
as
select top_ja.job_id, coalesce(top_jf.number_of_likes, 0) as number_of_like, number_of_applications from (
    select j.job_id, sum(ja.number_of_application) as number_of_applications from jobs j
    left join (
         select j.job_id,  count(a.job_id) as number_of_application
        from jobs j left join applications a on j.job_id = a.job_id
        group by j.job_id, j.company_id
    ) ja
    on j.job_id = ja.job_id
    group by j.job_id
) top_ja
left join (
    select l.job_id, count(l.job_id) as number_of_likes from jobs
    inner join likes l on jobs.job_id = l.job_id
    where type_like = 'LIKE'
    group by l.job_id
) top_jf
on top_ja.job_id = top_jf.job_id
where number_of_likes > 0 or number_of_applications > 0
order by number_of_applications desc, number_of_likes desc
limit 10;

select * from popular_jobs;




/*===========================================================
  popular_posts
===========================================================*/

drop view if exists popular_posts;
create view popular_posts
as
select post_id, coalesce(top_pf.number_of_likes, 0) as number_of_like from (
    select l.post_id, count(l.post_id) as number_of_likes from posts
    inner join post_likes l on posts.post_id = l.post_id
    where type_like = 'LIKE'
    group by l.post_id
) top_pf
order by number_of_like desc, number_of_likes desc
limit 10;

select * from popular_posts;


/*===========================================================
  amount_jobs_per_month_in_current_year
===========================================================*/
drop view if exists amount_jobs_per_month_in_current_year;
create view amount_jobs_per_month_in_current_year as
select month(jobs.created_at) AS month,
       count(jobs.job_id)  AS amount_of_jobs
from jobs
where (year(jobs.created_at) = year(curdate()))
group by month
order by month;

select * from amount_jobs_per_month_in_current_year;