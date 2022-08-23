#STRING FUNCTIONS (SEC-7)
########################################################
CREATE TABLE books
(
    book_id        INT NOT NULL AUTO_INCREMENT,
    title          VARCHAR(100),
    author_fname   VARCHAR(100),
    author_lname   VARCHAR(100),
    released_year  INT,
    stock_quantity INT,
    pages          INT,
    PRIMARY KEY (book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
       ('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
       ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
       ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
       ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
       ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
       ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
       ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
       ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
       ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
       ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
       ('Where I\'m Calling From: Selected Stories', 'Raymond', 'Carver', 1989, 12, 526),
       ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
       ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
       ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
       ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select *
from books;
########################################################
select concat('TimmySavage', 6, 9, 'XD');

select author_fname, author_lname
from books;

select concat(author_fname, ' ', author_lname) as fullName
from books;

select concat_ws('-', author_fname, author_lname, title) as fullName
from books;
# select concat_ws('-', author_fname, author_lname, ': ', title) as fullName
# from books;
########################################################
select substring('TimmySavage', 1, 4);
select substring('Timmy Savage', 5);
select substring('Timmy\'s Savage', -9);

# select substring(title, 1, 12), concat(' Pages:', pages)
# from books;
select concat(substring(title, 1, 15), '__Pages: ', pages)
from books;
########################################################
select replace('Timmy is Savage Sava Savage', 'Savage', 'DOPE');
select replace('Cheese Bread Coffee Chips Milk', ' ', '69 ');

select replace(title, 'e', 'E')
from books;

select substring(replace(author_fname, 'a', '@'), 1, 4)
from books;
########################################################
select reverse('Hello there!');
select reverse('ei'), reverse('ssss1');
select concat('Timmy', reverse('BOI'));

select concat(substring(author_fname, 1, 5), '_', substring(title, 1, 3), '_', reverse(substring(author_lname, -5)))
from books;
########################################################
select char_length('My gal is smart af.');

select concat(author_fname, '\'s book: ', title, ' title is of ', character_length(title), ' characters.')
from books;
########################################################
select concat(upper(title), '_', lower(author_lname))
from books;
########################################################
#STRING FUNCTIONS CHALLENGE (SEC-7)
select reverse(upper('Why does my cat look at me with such hared?'));

select replace(concat('I', ' ', 'like', ' ', 'cats'), ' ', '-');

select replace(title, ' ', '->') as title
from books;

select author_lname as forwards, reverse(author_lname) as backwards
from books;

select upper(concat(author_fname, ' ', author_lname)) as 'full name in caps'
from books;

select concat(title, ' was released in ', released_year) as blurb
from books;

select title, character_length(title) as 'character count'
from books;

select concat(substring(title, 1, 10), '...')  as 'short title',
       concat(author_lname, ',', author_fname) as author,
       concat(stock_quantity, ' in stock')     as quantity
from books
where stock_quantity >= 43;
########################################################

