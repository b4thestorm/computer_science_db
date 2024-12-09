DROP TABLE DEPARTMENT;

CREATE TABLE DEPARTMENT (
    id integer(20) NOT NULL,
    name varchar(25) NOT NULL UNIQUE,
    phone varchar(9),
    office_location varchar(50),
    chairperson_start_date date,
    secretary_id varchar(8),
    chairperson_id varchar(8),
    primary key (`id`),
    foreign key (`chairperson_id`) references `employee` (`emplid`),
    foreign key (`secretary_id`) references `employee` (`emplid`)
)