#INSTAGRAM CHALLENGES (SEC-15)
###################################################
use instagram_clone;
select database();

#CHALLENGE_1: We want to reward our users who have been around the longest. Find the 5 oldest users.
select *
from users
order by created_at
limit 5;

#CHALLENGE_2: We want the day of the week do most users register on. We need this to figure out when to schedule an ad-campaign.
select date_format(created_at, '%W') as 'WeekDay', count(*) as 'Count'
from users
group by WeekDay
order by Count desc
limit 2;

#CHALLENGE_3: We want to target our inactive users with an email campaign. Find the users who have never posted a photo.
select users.id,
       username,
       concat(date_format(users.created_at, '%D'), '-',
              monthname(users.created_at)) as 'User creation',
       photos.id,
       photos.image_url
from users
         left join photos on users.id = photos.user_id
where photos.id is null;

#CHALLENGE_4: We're running a new contest to see who can get the most likes on a single photo. Find out who is the winner.
select photo_id, count(likes.user_id) as Likes_Count
from photos
         inner join likes on likes.photo_id = photos.id
group by photo_id
order by Likes_Count desc
limit 1;

select username, image_url, count(likes.user_id) as Likes_Count
from photos
         inner join likes on likes.photo_id = photos.id
         inner join users on photos.user_id = users.id
group by photo_id
order by Likes_Count desc
limit 1;

#CHALLENGE_5: How many times does the average user posts?
select (select count(*) from photos) / (select count(*) from users) as average;

#CHALLENGE_6: A brand wants to know which hashtags to use in a post to increase ad-revenue. Tell them top 5 used hashtags.
select tag_name, count(photo_tags.tag_id) as count
from tags
         inner join photo_tags on tags.id = photo_tags.tag_id
group by tags.id
order by count desc
limit 5;

#*****CHALLENGE_7*****: We have a problem with bots on our site. Find the users who have liked every single photo on the website.
select username, user_id, count(*) as totalLikes
from users
         inner join likes on users.id = likes.user_id
group by likes.user_id
having totalLikes = (select count(*) from photos);
###################################################