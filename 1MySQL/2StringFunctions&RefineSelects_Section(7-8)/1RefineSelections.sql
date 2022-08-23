#REFINE SELECTS(SEC-8)
########################################################
INSERT INTO books
(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
       ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
       ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

select *
from books;

select author_fname
from books;

select DISTINCT author_fname
from books;

# select distinct concat(author_fname, ' ', author_lname) as 'distinct full name'
# from books;

select distinct author_fname, author_lname
from books;
########################################################
select *
from books
order by title;

select released_year, pages
from books
order by pages;

select released_year, pages, title, author_lname
from books
order by 2;

select concat(title, ' ', released_year)              as 'Title Year',
       concat(upper(author_fname), '_', author_lname) as 'Author name'
from books
order by released_year, title desc;
########################################################
select *
from books
limit 5;

select released_year, pages, title, author_lname
from books
order by released_year
limit 10;

select title
from books
limit 5,10000;
########################################################
select title
from books
where title like 'the%'
   or title like '%of%'
   or title like '%r';

select title
from books
where title like 'the%'
   or title like '%of%'
   or title like '%r';

select title
from books
where title like '__e%';
########################################################
#REFINE SELECTS CHALLENGE(SEC-8)
select title
from books
where title like '%stories%';

select title, pages
from books
order by pages desc
limit 1;

select concat(title, ' - ', released_year) as summary
from books
order by released_year desc
limit 3;

select title, author_lname
from books
where author_lname like '% %';

select title, released_year, stock_quantity
from books
order by stock_quantity, title
limit 3;

select title, author_lname
from books
order by author_lname, title;

select upper(concat('my favorite author is ', author_fname, ' ', author_lname, '!')) as yell
from books
order by author_lname;
########################################################
