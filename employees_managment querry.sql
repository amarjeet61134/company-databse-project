-- list all employees with tehir department names.
select e.emp_id, e.first_name,d.dept_name
from employees as e 
inner join departments as d
on e.dept_id=d.dept_id
-- show employees with salary > average salary
select * from salaries 
where salary>( select avg(salary)
from salaries)
--find top 5 highest paid salary
select top 5 salary ,salary_id
from salaries
order by salary desc
--count employees in each department
select d.dept_name,
count(*) as employees_count
from employees as e 
join departments as  d 
on e.dept_id=d.dept_id
group by dept_name
--show employees work on multiple project
select e.emp_id,e.first_name,
count(ep.project_id) as project_count
from employees as e 
join employees_project as ep
on e.emp_id=ep.emp_id
group by e.emp_id,e.first_name
having count(ep.project_id)>1
--get department by-wise hishest salary
select e.dept_id,
max(s.salary) as highest_salary
from employees as e
left join salaries as s 
on e.emp_id=s.emp_id
group by e.dept_id
-- find second highest salary
select max(salary) as second_highest
from salaries
where salary<(select max(salary) from 
salaries)


