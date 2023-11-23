-- Database: Soundgood

-- DROP DATABASE IF EXISTS "Soundgood";


	
	CREATE TABLE student (
	student_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
	contact_person_phonenumber VARCHAR(500),
	current_level VARCHAR(500),
	contact_person_email VARCHAR(500),
	first_name VARCHAR(500),
	last_name VARCHAR(500),
	personal_number VARCHAR(12) NOT NULL UNIQUE,
	email VARCHAR(500),
	phone_number VARCHAR(500),
	street VARCHAR(500),
	zip VARCHAR(500),
	city VARCHAR(500)
	
	);
	
	CREATE TABLE sibling (
    personal_number VARCHAR(12) NOT NULL UNIQUE,
    student_id INT REFERENCES student(student_id) ON DELETE CASCADE NOT NULL,
    PRIMARY KEY (personal_number, student_id)
);
	
	
	
	CREATE TABLE instructor (
	instructor_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
	personal_number VARCHAR(12) NOT NULL UNIQUE,
	email VARCHAR(500),
	first_name VARCHAR(500),
	last_name VARCHAR(500),	
	phone_number VARCHAR(500),	
	street VARCHAR(500),
	zip VARCHAR(500),
	city VARCHAR(500),
	ensambles BOOLEAN NOT NULL
	);
	CREATE TABLE place (
    place_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    building varchar(500)
);
	CREATE TABLE price_scheme (
    price_scheme_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    price_skill_level varchar(500) NOT NULL,
    discount varchar(500) NOT NULL,
    type_of_lesson_price varchar(500) NOT NULL
);

CREATE TABLE salary_scheme (
    salary_scheme_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    lesson_type varchar(500) NOT NULL,
    skill_level varchar(500) NOT NULL
);
	
	
	
	CREATE TABLE lesson (
	lesson_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
	lesson_time TIMESTAMP,
	student_id INT  REFERENCES student(student_id) ON DELETE SET NULL,
	instructor_id INT REFERENCES instructor(instructor_id) ON DELETE SET NULL,
	place_id INT REFERENCES place(place_id) NOT NULL,	
	price_scheme_id INT REFERENCES price_scheme(price_scheme_id) NOT NULL,
	salary_scheme_id INT REFERENCES salary_scheme(salary_scheme_id) NOT NULL
	);

	
	CREATE TABLE instruments (
	instruments_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
	price VARCHAR(500) NOT NULL,
	brand VARCHAR(500),
	in_stock BOOLEAN,
	type_of_instrument VARCHAR(500)
		
	);
	
	CREATE TABLE renting_instruments (
	renting_instruments_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
	expired TIMESTAMP,
	rent_start_time TIMESTAMP NOT NULL,
	student_id INT REFERENCES student(student_id) ON DELETE SET NULL,
	instruments_id INT REFERENCES instruments(instruments_id) NOT NULL
	);
	
	CREATE TABLE group_lesson (
	lesson_id INT REFERENCES lesson(lesson_id) NOT NULL,
	number_of_students VARCHAR(500),
	min_students VARCHAR(500),
	max_students VARCHAR(500),
	instrument_type VARCHAR(500) NOT NULL,
	skill_level VARCHAR(500) NOT NULL,
	PRIMARY KEY(lesson_id)
	);
	
CREATE TABLE instrument (
    instrument_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    instrument_type varchar(500)
);	
	

CREATE TABLE instructor_instrument (
    instrument_id INT REFERENCES instrument(instrument_id) NOT NULL,
    instructor_id INT REFERENCES instructor(instructor_id) ON DELETE CASCADE NOT NULL,
     PRIMARY KEY (instrument_id, instructor_id)
);



CREATE TABLE individual_lessons (
	lesson_id INT REFERENCES lesson(lesson_id) NOT NULL,
    instrument_type varchar(500) NOT NULL,
    skill_level varchar(500) NOT NULL,
	PRIMARY KEY(lesson_id)
);

CREATE TABLE ensamble (
	lesson_id INT REFERENCES lesson(lesson_id) NOT NULL,
    number_of_students varchar(500),  --amountofstudents
    min_students varchar(500),
    max_students varchar(500),
    genre varchar(500) NOT NULL,
	PRIMARY KEY(lesson_id)
	
);