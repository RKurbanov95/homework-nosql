-- TODO: Implementation
describe cluster;

create keyspace my_ks with replication = {'class':'SimpleStrategy', 'replication_factor':1};

use my_ks;

create table posts
(
    user_id int,
    username text,
    email text,
    post_id int,
    topic_id int,
    content text,
    created_at timestamp,
    PRIMARY KEY (user_id, created_at)
) with clustering order by (created_at desc);

insert into posts (user_id, username, email, post_id, topic_id, content, created_at)
values (1, 'Roma', 'roma@mail.ru', 1, 2, 'Topic 1', '2023-12-01 16:00+0000');
insert into posts (user_id, username, email, post_id, topic_id, content, created_at)
values (2, 'Sasha', 'sasha@mail.ru', 2, 1, 'Topic 1', '2023-12-02 16:00+0000');
insert into posts (user_id, username, email, post_id, topic_id, content, created_at)
values (3, 'Max', 'max@mail.ru', 1, 2, 'Topic 1', '2023-12-03 16:00+0000');
insert into posts (user_id, username, email, post_id, topic_id, content, created_at)
values (4, 'Maria', 'mar@mail.ru', 2, 1, 'Topic 1', '2023-12-04 16:00+0000');
insert into posts (user_id, username, email, post_id, topic_id, content, created_at)
values (3, 'Max', 'max@mail.ru', 1, 2, 'Topic 1', '2023-12-05 16:00+0000');
insert into posts (user_id, username, email, post_id, topic_id, content, created_at)
values (2, 'Sasha', 'sasha@mail.ru', 2, 1, 'Topic 2', '2023-12-06 16:00+0000');
insert into posts (user_id, username, email, post_id, topic_id, content, created_at)
values (1, 'Roma', 'roma@mail.ru', 1, 2, 'Topic 2', '2023-12-07 16:00+0000');

-- задание 1
select post_id, content, created_at
from posts
where user_id = 1
order by created_at desc;

-- задание 2
select post_id, content, created_at, username
from posts
where user_id = 1
order by created_at desc
limit 1;

-- задание 3
select post_id, content, created_at
from posts
where user_id = 1 and created_at >= '2023-12-03'
order by created_at desc;

-- задание 4
create table user_posts
(
    user_id int,
    username text,
    post_id int,
    topic_id int,
    created_at timestamp,
    date_pk date,
    PRIMARY KEY ((topic_id, date_pk), created_at)
) with clustering order by (created_at desc);

insert into user_posts (user_id, username, post_id, topic_id, created_at, date_pk) values (1, 'Alex', 1, 1, '2022-02-03 04:05+0000', toDate('2022-02-03 04:05+0000'));
insert into user_posts (user_id, username, post_id, topic_id, created_at, date_pk) values (2, 'Max', 2, 1, '2022-02-05 16:18+0000', toDate('2022-02-05 16:18+0000'));
insert into user_posts (user_id, username, post_id, topic_id, created_at, date_pk) values (3, 'Sasha', 5, 1, '2022-02-05 16:21+0000', toDate('2022-02-05 16:21+0000'));
insert into user_posts (user_id, username, post_id, topic_id, created_at, date_pk) values (2, 'Max', 3, 1, '2022-02-06 12:59+0000', toDate('2022-02-06 12:59+0000'));
insert into user_posts (user_id, username, post_id, topic_id, created_at, date_pk) values (3, 'Sasha', 4, 1, '2022-02-07 11:18+0000', toDate('2022-02-07 11:18+0000'));
insert into user_posts (user_id, username, post_id, topic_id, created_at, date_pk) values (3, 'Sasha', 7, 2, '2022-03-01 07:28+0000', toDate('2022-03-01 07:28+0000'));
insert into user_posts (user_id, username, post_id, topic_id, created_at, date_pk) values (3, 'Sasha', 6, 2, '2022-03-11 13:28+0000', toDate('2022-03-11 13:28+0000'));

-- запрос
select user_id, username, post_id, created_at
from user_post
where topic_id=1 and date_pk = '2023-02-05'
order by created_at desc;