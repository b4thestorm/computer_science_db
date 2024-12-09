DROP TABLE CONCENTRATION;

CREATE TABLE CONCENTRATION (
    id int(100) NOT NULL,
    type varchar(9) NOT NULL,
    title varchar(45) NOT NULL,
    dept_id integer(20),
    primary key (`id`),
    foreign key (`dept_id`) references `department` (`id`),
    CHECK (type='major' OR  type='minor')
)