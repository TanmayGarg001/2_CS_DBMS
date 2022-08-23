#LOGICAL OPERATORS (SEC-11)
##########################################
select *
from books;

select *
from books
where released_year != 2017
  and released_year != 2001;

select *
from books
where title not like 'the%';

select *
from books
where released_year >= 2010
    and book_id < 15
   or title like 'The%'
order by book_id;

select *
from books
where released_year >= 2004
  and released_year <= 2015
order by released_year;

select *
from books
where released_year between 2004 and 2015;

select *
from books
where released_year in (2015, 2001, 2000, 2004);

select *,
       case
           when released_year between 2000 and 2014 then 'Modern Lit'
           when released_year >= 2014 then 'Latest'
           else '20th Century Lit' end as 'Era of Book'
from books
order by released_year;
##########################################
#LOGICAL OPERATORS CHALLENGE (SEC-11)
#f,t,t
select *
from books
where released_year < 1980;

select *
from books
where author_lname = 'eggers'
   or author_lname = 'chabon';

select *
from books
where author_lname = 'Lahiri'
  and released_year > 2000;

select *
from books
where pages between 100 and 200;

select *
from books
where author_lname like 'c%'
   or author_lname like 's%';

select *,
       case
           when title like '%stories%' then 'Short Stories'
           when title like 'Just%' or title like 'A Heartbreaking%' then 'Memoir'
           else 'Novel'
           end as 'type'
from books;

select author_lname,
       if(count(book_id) > 1, concat(count(*), ' books'), concat(count(*), ' book')) as 'COUNT'
from books
group by author_lname;
##########################################
