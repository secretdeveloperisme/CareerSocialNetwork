/*===========================================================
  popular_companies
===========================================================*/

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
order by number_of_applications desc, number_of_likes desc
limit 10;

select * from popular_jobs;
