DROP TABLE ENROLLMENT;

CREATE TABLE ENROLLMENT (
    id integer(255) NOT NULL,
    status varchar(9),
    cheating_incident date,
    cheating_status varchar(20),
    emplid_student varchar(8),
    cs_id integer(250),
    grade varchar(3),
    foreign key (`emplid_student`) references `student`(`emplid`),
    foreign key (`cs_id`) references `course_section`(`id`),
    primary key (`id`),
    CHECK (status='active' OR status='dropped' OR status='completed'),
    CHECK (grade='A' OR grade='B' OR grade='C' OR grade='D' OR grade='F'),
    CHECK (cheating_status='open' OR cheating_status='closed')
)