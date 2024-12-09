DROP TABLE EMPLOYEE;

CREATE TABLE EMPLOYEE (
    name varchar(20),
    emplid varchar(8) NOT NULL UNIQUE,
    ssn varchar(9) NOT NULL UNIQUE,
    phone varchar(9),
    email varchar(24),
    home_address varchar(24),
    salary integer(7),
    office_location varchar(24),
    hire_date date,
    title varchar(20),
    role_title varchar(10),
    ranking varchar(20),
    primary key (`emplid`),
    CHECK (role_title = 'staff' OR role_title = 'faculty')
)