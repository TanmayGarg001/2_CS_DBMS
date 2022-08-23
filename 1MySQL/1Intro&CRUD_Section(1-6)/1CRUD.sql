## CRUD: Create, Read, Update, Delete (SEC-5)
##################################################
#CREATE:(SEC-5)
create table cats
(
    cat_id int AUTO_INCREMENT,
    name   varchar(100),
    breed  varchar(100),
    age    int,
    primary key (cat_id)
);

describe cats;

INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

#################################################
#READ:(SEC-5)
select *
from cats;

select breed
from cats;

select name, age, breed
from cats;

select cat_id
from cats;

select name, breed
from cats;

select name, age
from cats
where breed = 'Tabby';

select cat_id, age
from cats
where cat_id = age;

select name as cat_name, age
from cats
where cat_id <= 4;
#################################################
#UPDATE:(SEC-5)
select *
from cats;

update cats
set breed='Short Hair'
where breed = 'Tabby';

update cats
set name='Jack'
where name = 'Jackson';

update cats
set breed='British Shorthair'
where name = 'Ringo';

update cats
set age=12
where breed = 'Maine Coon';
#################################################
#DELETE:(SEC-5)
select *
from cats;

delete
from cats
where age = 4;

delete
from cats
where cat_id = age;

delete
from cats;
#################################################