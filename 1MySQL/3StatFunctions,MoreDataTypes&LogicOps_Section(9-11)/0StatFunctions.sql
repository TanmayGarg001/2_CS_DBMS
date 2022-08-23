#STAT FUNCTIONS (SEC-9)
########################################################
describe books;

select *
from books;

select count(*)
from books;

select count(distinct (author_fname, author_lname))
from books;

select count(title)
from books
where title like '%the%';
########################################################
select author_fname, sum(pages)
from books
group by author_fname;

select author_lname, count(*)
from books
group by author_lname;

select title, author_fname, author_lname
from books;

#This groups by author_fname and then further groups by author_lname
select author_fname, author_lname, count(*)
from books
group by author_lname, author_fname;

select author_fname, count(*)
from books
group by author_lname, author_fname;

select released_year, count(*)
from books
group by released_year
order by released_year;

select concat('In ', released_year, ' ', count(*), ' books were released.')
from books
group by released_year
order by released_year desc;
########################################################
select min(released_year), max(pages)
from books;

# select max(pages), title
# from books;

#This first selects then table attributes that are given and then sees the sub-query and executes it.But this takes time as we have query in query.
#Very easy and logical :D
select book_id, title, released_year, pages
from books
where pages = (select max(pages) from books);

#Same as before but faster and easier
select book_id, title, released_year, pages
from books
order by pages desc
limit 1;

#We group the books by author first and last name and also show the minimum released year in each particular group.
#i.e. We print the very 1st book released by each author
select concat(author_fname, ' ', author_lname), min(released_year)
from books
group by author_fname, author_lname;

select author_lname, author_fname, max(pages)
from books
group by author_lname, author_fname
order by author_fname desc;
########################################################
select sum(pages)
from books;

#We have to sum(pages) at end to sort because 'order by pages' won't work as we didn't group them
select concat(author_fname, '_', author_lname), sum(pages)
from books
group by author_fname, author_lname
order by sum(pages) desc;

select released_year, avg(stock_quantity)
from books
group by released_year
order by released_year;

#by default avg op gets converted to decimal coz its average ofc
select concat(author_fname, ' ', author_lname), avg(pages)
from books
group by author_fname, author_lname, author_lname
order by avg(pages) desc;
########################################################
#STAT FUNCTIONS CHALLENGE(SEC-9)
select count(*)
from books;

select released_year, count(book_id)
from books
group by released_year;

select sum(stock_quantity)
from books;

select author_fname, author_lname, avg(released_year)
from books
group by author_fname, author_lname
order by author_fname;

select concat(author_fname, ' ', author_lname), pages
from books
order by pages desc
limit 1;

##Same as above but relatively slow
select concat(author_fname, ' ', author_lname), pages
from books
where pages = (select max(pages) from books);

select released_year as year, count(book_id) as '#books', avg(pages) as 'avg pages'
from books
group by released_year
order by released_year;
########################################################