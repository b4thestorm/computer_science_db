DROP TABLE STUDENT;

CREATE TABLE STUDENT (
    emplid varchar(8) NOT NULL UNIQUE,
    first_name varchar(15),
    middle_initial varchar(1),
    last_name varchar(15),
    date_of_birth date,
    email varchar(24),
    phone varchar(9),
    home_address varchar(50)
)