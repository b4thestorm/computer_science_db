DROP TABLE PREREQUISITE;

CREATE TABLE PREREQUISITE (
    id integer(255) NOT NULL,
    course_id integer(100),
    req_id integer(100),
    primary key (`id`),
    foreign key (`course_id`) references `course`(`id`),
    foreign key (`req_id`) references  `course`(`id`)
)
