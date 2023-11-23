INSERT INTO student (
    contact_person_phonenumber,
    current_level,
    contact_person_email,
    first_name,
    last_name,
    personal_number,
    email,
    phone_number,
    street,
    zip,
    city
) VALUES (
    '123456789',
    'Beginner',
    'contact@example.com',
    'Leo',
    'Halfar',
    '200208218636',
    'leo@example.com',
    '987654321',
    'en gata',
    '12345',
    'Stockholm'
);
INSERT INTO student (
    contact_person_phonenumber,
    current_level,
    contact_person_email,
    first_name,
    last_name,
    personal_number,
    email,
    phone_number,
    street,
    zip,
    city
) VALUES (
    '123456782',
    'Beginner',
    'contact@example.com',
    'Otto',
    'Svenberg',
    '123456789012',
    'otto@example.com',
    '987654321',
    'gata 2',
    '12333',
    'Göteborg'
);
-- Insert data into the sibling table
INSERT INTO sibling (personal_number, student_id) VALUES ('200208218636', 2);

-- Insert data into the instructor table
INSERT INTO instructor (
    personal_number,
    email,
    first_name,
    last_name,
    phone_number,
    street,
    zip,
    city,
    ensambles
) VALUES (
    '987654321098',
    'instructor@example.com',
    'Leif',
    'Lindbäck',
    '456789012',
    'gata 3',
    '54321',
    'Uppsala',
    true
);

-- Insert data into the place table
INSERT INTO place (building) VALUES ('Building U');

-- Insert data into the price_scheme table
INSERT INTO price_scheme (price_skill_level, discount, type_of_lesson_price) VALUES ('Intermediate', '10%', 'Hourly');

-- Insert data into the salary_scheme table
INSERT INTO salary_scheme (lesson_type, skill_level) VALUES ('Group', 'Advanced');

-- Insert data into the lesson table
INSERT INTO lesson (
    lesson_time,
    student_id,
    instructor_id,
    place_id,
    price_scheme_id,
    salary_scheme_id
) VALUES (
    '2023-11-22 15:00:00',
    1,
    1,
    1,
    1,
    1
);

-- Insert data into the instruments table
INSERT INTO instruments (price, brand, in_stock, type_of_instrument) VALUES ('500', 'BrandX', true, 'Piano');

-- Insert data into the renting_instruments table
INSERT INTO renting_instruments (expired, rent_start_time, student_id, instruments_id) VALUES ('2023-11-30 23:59:59', '2023-09-30 23:59:59', 1, 1);

-- Insert data into the group_lesson table
INSERT INTO group_lesson (
    lesson_id,
    number_of_students,
    min_students,
    max_students,
    instrument_type,
    skill_level
) VALUES (
    1,
    '5',
    '3',
    '10',
    'Piano',
    'Intermediate'
);

-- Insert data into the instrument table
INSERT INTO instrument (instrument_type) VALUES ('Guitar');

-- Insert data into the instructor_instrument table
INSERT INTO instructor_instrument (instrument_id, instructor_id) VALUES (1, 1);

-- Insert data into the individual_lessons table
INSERT INTO individual_lessons (lesson_id, instrument_type, skill_level) VALUES (1, 'Violin', 'Beginner');

-- Insert data into the ensamble table
INSERT INTO ensamble (lesson_id, number_of_students, min_students, max_students, genre) VALUES (1, '8', '5', '15', 'Classical');