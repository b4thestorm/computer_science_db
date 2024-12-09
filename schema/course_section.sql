DROP TABLE COURSE_SECTION;

CREATE TABLE COURSE_SECTION (
    id integer(250) NOT NULL,
    schedule date NOT NULL,
    sem_year integer(4) NOT NULL,
    rm_number varchar(4) NOT NULL,
    course_id integer(100),
    emplid_f varchar(8),
    primary key (`id`),
    foreign key (`course_id`) references `course` (`id`),
    foreign key (`emplid_f`) references `employee` (`emplid`)
)