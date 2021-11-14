DROP TABLE workers;

CREATE TABLE workers(
    id serial PRIMARY KEY,
    first_name VARCHAR(64) NOT NULL CHECK(first_name != ''),
    birthday DATE DEFAULT current_date,
    salary SMALLINT NOT NULL CHECK(salary > 1)
);

INSERT INTO workers (first_name, birthday, salary)
VALUES ('Nikita', '1990.08.25', 300);

INSERT INTO workers (first_name, birthday, salary)
VALUES ('Svetlana', '1980.10.20', 1200);

INSERT INTO workers (first_name, birthday, salary)
VALUES ('Yaroslav', '1980.01.02', 1200), 
('Petr', '1993.11.15', 1000);

INSERT INTO workers (first_name, birthday, salary)
VALUES ('Vasya', '1940.10.20', 500);

UPDATE workers
SET salary = 200
WHERE id = 2;

UPDATE workers
SET birthday = '1987.11.15'
WHERE id = 4;

UPDATE workers
SET salary = 700
WHERE salary < 500;

UPDATE workers
SET birthday = '1999.11.15'
WHERE id > 2 AND id <= 5;

UPDATE workers
SET first_name = 'Jenya', salary = 900
WHERE id = 5;

SELECT *
FROM workers
WHERE id = 3;

SELECT *
FROM workers
WHERE salary > 400;

SELECT *
FROM workers
WHERE salary != 500;

SELECT extract('year' from age(birthday)) AS year_person, salary
FROM workers
WHERE id = 5;

SELECT *
FROM workers
WHERE first_name = 'Petr';

SELECT *
FROM workers
WHERE first_name != 'Petr';

SELECT *
FROM workers
WHERE age(birthday) = '27 years' OR salary = 1000;

SELECT *
FROM workers
WHERE age(birthday) > '25 years' AND age(birthday) <= '28 years';

SELECT *
FROM workers
WHERE age(birthday) BETWEEN '23 years' AND '27 years' OR salary BETWEEN 400 AND 1000;

SELECT *
FROM workers
WHERE age(birthday) = '27 years' OR salary != 400;

DELETE
FROM workers
WHERE id = 5;

DELETE
FROM workers
WHERE first_name = 'Petr';

DELETE
FROM workers
WHERE age(birthday) = '23 years';
