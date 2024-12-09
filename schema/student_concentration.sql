DROP TABLE STUDENT_CONCENTRATION;

CREATE TABLE STUDENT_CONCENTRATION (
    id integer(255) NOT NULL,
    student_id varchar(8), 
    concentration_id int(100),
    primary key (`id`),
    foreign key (`student_id`) references `student`(`emplid`),
    foreign key (`concentration_id`) references `concentration`(`id`)
)