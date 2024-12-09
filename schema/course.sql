DROP TABLE COURSE;

CREATE TABLE COURSE (
    id integer(100) NOT NULL,
    name varchar(20) NOT NULL UNIQUE,
    description varchar(60),
    credits integer NOT NULL,
    primary key (`id`)
)