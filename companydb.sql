DROP DATABASE IF EXISTS `companydb`;

CREATE DATABASE IF NOT EXISTS `companydb` DEFAULT CHARACTER SET latin1;

USE `companydb`;

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `middlename` varchar(20) DEFAULT NULL,
  `lastname` varchar(30) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(31) DEFAULT NULL,
  `extension` smallint(6) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `commission_pct` int(11) DEFAULT NULL,
  `department_id` int(11),
  `job_id` int(11),
  `address` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipcode` char(5) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CHECK (gender IN ('F', 'M')),
  CHECK (state IN ('GA','MA','NC','NJ'))
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `square_footage` int(11) DEFAULT NULL,
  `street_address` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipcode` char(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CHECK (state IN ('GA','MA','NC','NJ'))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `minimum_salary` int(11) DEFAULT NULL,
  `maximum_salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `parent_project_id` INT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `assignments`;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*UPDATE employees SET id = id + 1000;*/

/*ALTER TABLE `employees` AUTO_INCREMENT=1001;*/

-- file :  earthlings_populate.sql
-- last updated : Feb 15, 2012
-- copyright : Cynthia Gustaff Rayl, 2005-2012 all rights reserved
--
-- This script
-- > has been validated in Oracle (9i R2, 10g, 11g),
--   MySQL 5.0, PostgreSQL 8.3.1 and Derby (10.3, 10.4, 10.5, 10.6)
-- > is called by the create schema objects script for each of
--   the above environments
-- > inserts all of the locations, departments, jobs and employees
--   data.  The insert statements are valid in each of the
--   environments listed above.
-- > does not use C style multiline comments because
--   not all vendors support them.
--
-- As of this writing, some of the supported databases' versions
-- do not support the ANSI
--    "commit work;"
-- statement, so the non-ANSI
--    "commit;"
-- has been used instead.
--
-- Date values are not in the standard Oracle default format.
-- However, the Oracle create script which calls this script
-- sets the appropriate session environmental variable to
-- support the date format in the insert statements.

insert into locations (square_footage, street_address, city, state, zipcode) values (6300, '3 Peachtree Plaza', 'Atlanta','GA', '30365');
insert into locations (square_footage, street_address, city, state, zipcode) values (4500, '791 Massachusetts Avenue', 'Boston','MA', '02101');
insert into locations (square_footage, street_address, city, state, zipcode) values (8000, '1045 University City Boulevard', 'Charlotte','NC', '28226');
insert into locations (square_footage, street_address, city, state, zipcode) values (12000, '1 Grover''s Mill Circle', 'Grover''s Mill', 'NJ', '08538');

insert into departments (name, location_id) values ('Research', 4);
insert into departments (name, location_id) values ('Administration', 2);
insert into departments (name, location_id) values ('Software Development', 3);
insert into departments (name, location_id) values ('Hardware Development', 3);
insert into departments (name, location_id) values ('Test And Integration', 3);
insert into departments (name, location_id) values ('Sales', 1);
insert into departments (name, location_id) values ('HR', 2);
insert into departments (name, location_id) values ('Facilities', 2);
insert into departments (name, location_id) values ('Operations', 1);
insert into departments (name, location_id, manager_id) values ('Documentation', 2, 1035);


insert into jobs (name, minimum_salary, maximum_salary)
values ('President', 80000, 100000 );
insert into jobs (name, minimum_salary, maximum_salary)
values ('Vice President', 70000, 90000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Director', 60000, 80000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Manager', 50000, 70000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Supervisor', 40000, 60000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Administrative Assistant', 25000, 45000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Secretary', 20000, 40000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Lead Engineer', 30000, 40000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Engineer', 20000, 30000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Junior Engineer', 15000, 20000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('DataBase Administrator', 80000, 120000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('DataBase Operator', 20000, 40000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Systems Administrator', 60000, 80000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Systems Operator', 20000, 40000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Data Analyst', 30000, 50000 );
insert into jobs (name, minimum_salary, maximum_salary)
values ('Project Lead', 70000, 90000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Senior Developer', 60000, 80000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Developer', 40000, 70000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Junior Developer', 30000, 50000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Product Evangelist', 50000, 70000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Senior Sales Rep', 35000, 55000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Account Rep', 30000, 50000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Sales Rep', 25000, 45000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Tester', 30000, 50000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Receptionist', 18000, 30000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Data Entry Clerk', 16000, 25000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Technical Writer', 25000, 50000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Trainer', 40000, 65000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('COO', 70000, 90000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('CFO', 70000, 90000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('CIO', 70000, 90000);
insert into jobs (name, minimum_salary, maximum_salary)
values ('Test Designer', 40000, 60000);

commit;

-- Hack for MySQL only: set the initial value of the employee id to 1001
-- Ignore the error for the line below in Oracle and Derby
set insert_id=1001;

insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Patrick', '', 'Acosta', 'M', 1147, '1986-08-13', 61000, null, 9, 4, '876 Vesper Drive', 'Atlanta', 'GA', '30324');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Amdell', 'M', 1243, '1938-10-31', 15000, 0, 1, 10, '1938 Grover Avenue', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Letitia', 'Rochelle', 'Anderson', 'F', 1136, '1995-01-29', 21000, null, 2, 26, '515 North Fork Drive', 'Boston', 'MA', '02131');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Angel', 'M', 1220, '1938-10-31', 30000, 0, 1, 8, '1938 Old Hightstown Place', 'Cranburg', 'NJ', '08512');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Ayer', 'M', 1242, '1938-10-31', 15000, null, 1, 10, '1938 Old Princeton Trail', 'Windsor', 'NJ', '08561');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Patrick', '', 'Bailey', 'M', 1154, '1984-09-24', 41000, 0, 9, 6, '728 Roswell Road', 'Atlanta', 'GA', '30316');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Barrell', 'M', 1214, '1938-10-31', 50000, null, 1, 4, '1938 Hightstown Place', 'Princeton', 'NJ', '08541');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Vivian', 'Reyna', 'Baxter', 'F', 1158, '1994-12-22', 82000, 0, 2, 30, '16 Quincy Hills Boulevard', 'Boston', 'MA', '02129');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Ty', '', 'Beard', 'M', 1206, '1987-08-31', 65000, null, 3, 17, '843 Fern Park Circle', 'Charlotte', 'NC', '28228');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Luigi', 'Bruno', 'Berger', 'M', 1192, '1955-10-20', 90000, 0, 5, 16, '412 Springwater Drive', 'Charlotte', 'NC', '28206');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', 'Mini', 'Berries', 'M', 1235, '1938-10-31', 20000, null, 1, 9, '1938 Grover Place', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Larry', '', 'Best', 'M', 1188, '1974-10-12', 65000, 0, 3, 18, '536 Orchard Drive', 'Charlotte', 'NC', '28205');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', 'Sky', 'Bird', 'M', 1236, '1938-10-31', 20000, null, 1, 9, '1938 West Mill Drive', 'Princeton Junction', 'NJ', '08550');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Bivouc', 'M', 1212, '1938-10-31', 60000, 0, 1, 3, '1938 Old Junction Street', 'Windsor', 'NJ', '08561');
--
-- Keep Kearie Booker's first name for the like operator example.
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Kearie', 'Jasmine', 'Booker', 'F', 1122, '1994-04-20', 25000, null, 9, 14, '983 Unadilla Road', 'Atlanta', 'GA', '30321');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Bowlin', 'M', 1229, '1938-10-31', 20000, 0, 1, 9, '1938 Grover Street', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Thelma', 'Dionne', 'Burgess', 'F', 1155, '1989-03-13', 67000, 10, 6, 3, '153 Alpharetta Highway', 'Atlanta', 'GA', '30315');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Glenda', '', 'Burks', 'F', 1125, '1990-04-02', 29000, 0, 3, 7, '302 Hametown Road', 'Charlotte', 'NC', '28210');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Elwood', 'Merle', 'Calhoun', 'M', 1174, '1996-06-28', 22000, null, 2, 26, '658 Ira Road', 'Boston', 'MA', '02101');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Walker', '', 'Calhoun', 'M', 1207, '1998-06-02', 38000, 8, 6, 21, '536 Beamer Lane', 'Boston', 'MA', '02101');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Hugh', '', 'Campbell', 'M', 1179, '1988-01-18', 32000, 6, 6, 23, '798 Montrose Avenue', 'Boston', 'MA', '02125');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('King', 'Dewayne', 'Cardenas', 'M', 1185, '1999-02-09', 84000, 0, 2, 31, '910 Flannery Circle', 'Charlotte', 'NC', '28225');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Mariana', 'Eliza', 'Castillo', 'F', 1141, '1988-09-02', 67000, null, 4, 17, '848 Round Rock Drive', 'Charlotte', 'NC', '28215');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', 'Qim', 'Chee', 'M', 1223, '1938-10-31', 30000, 0, 1, 8, '1938 Hightstown Place, South', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Kareem', '', 'Christian', 'M', 1182, '1999-02-26', 25000, null, 4, 7, '359 Oak Knoll Road', 'Charlotte', 'NC', '28203');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Jami', 'Silvia', 'Church', 'F', 1127, '1996-02-17', 65000, 0, 5, 3, '189 Idlebrook Drive', 'Charlotte', 'NC', '28211');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', 'Town', 'Crier', 'M', 1213, '1938-10-31', 60000, null, 1, 3, '1938 North Cranburg Highway', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Elliot', '', 'Cross', 'M', 1173, '1976-02-26', 36000, 0, 9, 14, '962 High Ridge Trail', 'Atlanta', 'GA', '30308');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Travis', 'Damion', 'David', 'M', 1205, '1978-04-08', 75000, null, 4, 17, '855 Main Street', 'Charlotte', 'NC', '28229');
--
-- Keep Korie Dean's first name for the like operator example.
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Korie', 'Bianca', 'Dean', 'F', 1130, '2002-12-31', 26000, 8, 6, 23, '533 Knollwood Lane', 'Atlanta', 'GA', '30320');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'deConnor', 'M', 1230, '1938-10-31', 20000, 0, 1, 9, '1938 Old Mill Drive', 'Cranburg', 'NJ', '08512');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Donovan', 'Nestor', 'Dorsey', 'M', 1170, '1978-03-13', 44000, null, 5, 24, '453 Ghent Ridge Road', 'Charlotte', 'NC', '28236');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Wiley', '', 'Durham', 'M', 1208, '1984-03-15', 57000, 2, 6, 20, '587 Rose Avenue', 'Atlanta', 'GA', '30322');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Lucas', 'Marquis', 'Espinoza', 'M', 1191, '1980-09-16', 38000, 6, 6, 23, '817 Revere Road', 'Charlotte', 'NC', '28209');
--
-- Have to have an employee without a department assignment for the
--   outer join example. Since Ernestine is now going to be the manager
--   for the added Documentation department, I've chosen to leave her
--   assignment in HR. The "story" is that she is the acting manager
--   of the Documentation department until she's hired some writers and
--   decided on a permanent manager. So, none of her information in the
--   employees table changes.  Only the departments table is affected and
--   that will only be affected for the 301 (SQL) course. If installing
--   for that course, then the createdb script will call an additional
--   script to add the new department.
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Ernestine', '', 'Estrada', 'F', 1121, '1992-02-05', 53000, 0, 7, 5, '442 Four Seasons Drive', 'Boston', 'MA', '02133');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Georgia', '', 'Farmer', 'F', 1124, '2000-03-08', 28000, 6, 6, 23, '782 Greenhaven Drive', 'Boston', 'MA', '02114');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Wendy', '', 'Fleming', 'F', 1159, '1990-05-12', 42000, 8, 6, 21, '425 Fulton Drive', 'Atlanta', 'GA', '30312');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Edgar', 'Andre', 'Frank', 'M', 1171, '1990-08-25', 28000, null, 9, 12, '873 Greenhaven Circle', 'Atlanta', 'GA', '30309');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Ross', 'Samual', 'Franks', 'M', 1201, '1986-01-05', 68000, 0, 4, 16, '971 Park Street', 'Charlotte', 'NC', '28232');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Noble', 'Dana', 'Frazier', 'M', 1195, '1979-06-17', 62000, null, 4, 18, '730 Timberline Drive', 'Charlotte', 'NC', '28207');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Kitty', 'Tara', 'French', 'F', 1131, '1977-03-01', 43000, 0, 5, 24, '419 Lake View Drive', 'Charlotte', 'NC', '28211');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Garnet', 'M', 1210, '1938-10-31', 20000, 0, 1, 9, '1938 Junction Street', 'Cranburg', 'NJ', '08512');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Gonzales', 'M', 1218, '1938-10-31', 30000, 0, 1, 8, '1938 Old Windsor Rd', 'Hightstown', 'NJ', '08520');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Latasha', '', 'Goodwin', 'F', 1132, '1970-04-21', 43000, 6, 6, 23, '826 Lois Drive', 'Charlotte', 'NC', '28213');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Jefferson', '', 'Gray', 'M', 1180, '1992-09-20', 41000, 8, 6, 22, '537 North Ridge Street', 'Atlanta', 'GA', '30307');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Lesa', '', 'Griffith', 'F', 1135, '1987-08-02', 52000, 0, 4, 18, '759 Nina Lane', 'Charlotte', 'NC', '28212');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Eloise', '', 'Gross', 'F', 1119, '1986-05-21', 51000, 0, 3, 18, '580 Everett Road', 'Charlotte', 'NC', '28209');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Napoleon', '', 'Gross', 'M', 1194, '1972-08-09', 76000, 0, 7, 3, '355 Tanager Drive', 'Boston', 'MA', '02137');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Gus', 'M', 1244, '1938-10-31', 15000, 0, 1, 10, '1938 Grover Way', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Leola', 'Annmarie', 'Harris', 'F', 1134, '1988-07-25', 32000, 6, 6, 23, '616 Motz Drive', 'Atlanta', 'GA', '30320');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Rowena', 'Helena', 'Hebert', 'F', 1151, '1980-08-18', 34000, 0, 9, 14, '886 Peachtree Street', 'Atlanta', 'GA', '30317');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Leopoldo', '', 'Holden', 'M', 1190, '1983-03-14', 40000, 0, 5, 24, '462 Raintree Drive', 'Charlotte', 'NC', '28205');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', 'Robin', 'Hood', 'M', 1225, '1938-10-31', 30000, 0, 1, 8, '1938 Welles Way, West', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Galen', '', 'Hopper', 'M', 1177, '1986-06-06', 25000, 0, 2, 26, '243 Ledgewood Drive', 'Boston', 'MA', '02110');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Erick', 'Minh', 'House', 'M', 1176, '1976-08-05', 63000, 0, 4, 4, '222 Larkspur Lane, South', 'Charlotte', 'NC', '28201');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Rhonda', 'Roberta', 'Hunt', 'F', 1150, '1970-06-10', 81000, 0, 3, 16, '995 Yellow Creek Lane', 'Charlotte', 'NC', '28218');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Shanna', 'Wilma', 'Hunter', 'F', 1153, '1969-11-12', 43000, 6, 6, 23, '720 Peachtree Industrial Drive', 'Atlanta', 'GA', '30317');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Deloris', 'Tina', 'Hurst', 'F', 1114, '2003-04-14', 40000, 0, 4, 18, '786 Caladonia Place', 'Charlotte', 'NC', '28208');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Orval', 'Quinn', 'Johns', 'M', 1196, '1967-03-07', 120000, 0, 9, 11, '80 Walnut Ridge Street, North', 'Atlanta', 'GA', '30304');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Jones', 'M', 1221, '1938-10-31', 30000, 0, 1, 8, '1938 Hightstown Place, North', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Dane', 'Brain', 'King', 'M', 1166, '1992-01-28', 28000, 6, 6, 23, '701 Canterbury Road', 'Atlanta', 'GA', '30309');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Bigboote', 'M', 1211, '1938-10-31', 95000, 0, 1, 2, '1938 East Windsor Rd', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Tricia', '', 'Larsen', 'F', 1156, '1982-07-25', 81000, 10, 6, 2, '116 Marietta Boulevard', 'Atlanta', 'GA', '30314');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Delmar', '', 'Le', 'M', 1168, '1981-06-16', 59000, 0, 3, 4, '203 Darlington Drive', 'Charlotte', 'NC', '28220');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Dona', 'Kristen', 'Leonard', 'F', 1115, '2004-05-14', 16000, 0, 2, 26, '538 Candlewood Lane', 'Boston', 'MA', '02134');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Li', 'M', 1224, '1938-10-31', 30000, 0, 1, 8, '1938 Old Welles Way', 'Princeton', 'NJ', '08541');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Penny', '', 'Pretty', 'F', 1126, '1966-01-07', 24000, 0, 2, 6, '164 Hillandale Drive', 'Boston', 'MA', '02104');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Cruz', '', 'Lyons', 'M', 1165, '1985-10-23', 35000, 0, 8, 7, '706 Bridle Trail', 'Boston', 'MA', '02128');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Randall', '', 'Marsh', 'M', 1197, '1965-04-20', 45000, 6, 6, 23, '628 Wood Thursh Drive', 'Atlanta', 'GA', '30303');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Tommy', '', 'Martin', 'M', 1204, '1993-02-04', 40000, 8, 6, 21, '393 Magnolia Drive', 'Charlotte', 'NC', '28201');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Emanuel', 'Jesus', 'Martinez', 'M', 1175, '1984-09-04', 32000, 0, 9, 12, '872 Kensington Road', 'Atlanta', 'GA', '30301');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Mary', 'M', 1222, '1938-10-31', 30000, 0, 1, 8, '1938 Welles Way', 'Windsor', 'NJ', '08561');
--
-- Keep Kory Maynard's first name for the like operator example.
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Kory', '', 'Maynard', 'M', 1187, '1961-04-03', 83000, 0, 5, 16, '371 Ivey Street', 'Charlotte', 'NC', '28205');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Vanessa', '', 'McConnell', 'F', 1157, '1986-02-15', 48000, 8, 6, 21, '477 Old Vermont Road', 'Boston', 'MA', '02128');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Elias', 'Alphonso', 'McCoy', 'M', 1172, '1977-11-06', 72000, 0, 4, 16, '969 Harmony Hills Street', 'Charlotte', 'NC', '28235');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Rhonda', '', 'McKee', 'F', 1149, '1991-07-09', 35000, 8, 6, 22, '570 Wye Road', 'Atlanta', 'GA', '30317');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Milton', 'M', 1227, '1938-10-31', 20000, 0, 1, 9, '1938 Welles Way, East', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Mister', 'M', 1234, '1938-10-31', 20000, 0, 1, 9, '1938 South Mill Drive', 'Princeton', 'NJ', '08541');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('William', '', 'Moses', 'M', 1209, '1983-12-02', 59000, 0, 4, 18, '697 Ginger Drive', 'Charlotte', 'NC', '28237');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Nola', 'Sondra', 'Mullins', 'F', 1145, '1975-03-19', 37000, 0, 9, 12, '873 Tulip Drive', 'Atlanta', 'GA', '30317');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Charley', 'Jerry', 'Nelson', 'M', 1163, '1996-06-22', 32000, 0, 8, 6, '166 Autumn Lane', 'Atlanta', 'GA', '30303');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Newbie', 'M', 1217, '1938-10-31', 50000, 0, 1, 4, '1938 South Princeton Trail', 'Grover''s Mill', 'NJ', '08538');
--
-- Keep Korey Rey's first name for the like operator example.
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Korey', 'Rey', 'Newton', 'M', 1186, '1997-09-01', 63000, 0, 9, 13, '830 Ford Street, SE', 'Atlanta', 'GA', '30305');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Niece', 'M', 1228, '1938-10-31', 20000, 0, 1, 9, '1938 Cranburg Highway', 'Hightstown', 'NJ', '08520');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Ken', 'Booker', 'Nixon', 'M', 1183, '1971-01-07', 62000, 2, 6, 20, '583 Elvin Way', 'Atlanta', 'GA', '30306');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Pantry', 'M', 1226, '1938-10-31', 20000, 0, 1, 9, '1938 Old Cranburg Highway', 'Princeton Junction', 'NJ', '08550');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Parakeet', 'M', 1232, '1938-10-31', 20000, 0, 1, 9, '1938 North Mill Drive', 'Windsor', 'NJ', '08561');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Juliet', 'Mia', 'Parker', 'F', 1128, '1984-09-24', 45000, 0, 2, 6, '19 Inner Circle Drive', 'Boston', 'MA', '02132');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Emma', 'Lucy', 'Parks', 'F', 1120, '1976-09-22', 63000, 0, 3, 4, '218 Fairway Drive', 'Charlotte', 'NC', '28210');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Effie', 'Evelyn', 'Patterson', 'F', 1118, '2002-08-22', 20000, 0, 7, 7, '445 Echo Hills Highway', 'Boston', 'MA', '02133');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Georgette', 'Karina', 'Petty', 'F', 1123, '1968-11-27', 52000, 8, 6, 21, '259 Ghent Hills Road', 'Atlanta', 'GA', '30320');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Physh', 'M', 1216, '1938-10-31', 50000, 0, 1, 4, '1938 Windsor Rd', 'Princeton Junction', 'NJ', '08550');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Samuel', 'Winston', 'Pugh', 'M', 1202, '1995-03-18', 45000, 0, 3, 18, '61 Tennessee Avenue', 'Charlotte', 'NC', '28231');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Mary', 'Stella', 'Randolph', 'F', 1142, '1987-10-02', 62000, 0, 9, 4, '850 Squires Court', 'Atlanta', 'GA', '30312');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Olga', 'Gertrude', 'Ratliff', 'F', 1146, '1995-07-21', 45000, 0, 4, 18, '798 Valley Wood Drive', 'Charlotte', 'NC', '28217');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Reaper', 'M', 1219, '1938-10-31', 30000, 0, 1, 8, '1938 West Junction Street', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Mara', '', 'Reese', 'F', 1140, '1984-04-15', 49000, 8, 6, 21, '428 Rotunda Drive', 'Atlanta', 'GA', '30319');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Rite', 'M', 1239, '1938-10-31', 20000, 0, 1, 9, '1938 Grover Trail', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Shad', 'Gilbert', 'Robertson', 'M', 1203, '2003-07-11', 32000, 0, 4, 19, '89 Berkshire Circle', 'Charlotte', 'NC', '28230');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Aurelia', 'Kathleen', 'Rollins', 'F', 1112, '1964-01-11', 80000, 0, 8, 3, '675 Burnbrick Drive', 'Boston', 'MA', '02102');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Adan', '', 'Roth', 'M', 1160, '1971-06-27', 82000, 0, 9, 29, '138 Peachtree Dunwoody Road', 'Atlanta', 'GA', '30311');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('David', 'Carmine', 'Santana', 'M', 1167, '1994-09-15', 19000, 0, 2, 26, '248 Colonade Drive', 'Boston', 'MA', '02109');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Shariff', 'M', 1231, '1938-10-31', 20000, 0, 1, 9, '1938 Grover Road', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Monica', '', 'Shepherd', 'F', 1143, '1998-11-02', 33000, 8, 6, 23, '428 Sugar Knoll Drive', 'Atlanta', 'GA', '30318');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Mable', 'Debbie', 'Skinner', 'F', 1139, '1993-07-15', 20000, 0, 2, 26, '572 Partridge Lane', 'Boston', 'MA', '02106');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Roman', '', 'Small', 'M', 1200, '1991-11-19', 42000, 8, 6, 21, '43 Jasper Road', 'Atlanta', 'GA', '30302');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Smith', 'M', 1241, '1938-10-31', 15000, 0, 1, 10, '1938 Grover Trace', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Katelyn', 'Shana', 'Smith', 'F', 1129, '1990-04-30', 49000, 0, 3, 18, '649 Kemery Road', 'Charlotte', 'NC', '28211');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Jerry', 'Norris', 'Smyth', 'M', 1181, '1989-12-30', 31000, 0, 7, 7, '49 North Shore Drive', 'Boston', 'MA', '02111');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Devin', '', 'Smythe', 'M', 1169, '1986-02-27', 64000, 0, 7, 5, '394 Diandrea Drive', 'Boston', 'MA', '02127');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Nell', '', 'Stafford', 'F', 1144, '1993-01-17', 35000, 0, 5, 24, '449 Trellis Green Drive', 'Charlotte', 'NC', '28216');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Arlen', '', 'Stevens', 'M', 1162, '1989-01-23', 45000, 0, 3, 15, '96 Appian Way', 'Charlotte', 'NC', '28218');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Ken', '', 'Stevenson', 'M', 1184, '1996-03-08', 60000, 0, 3, 3, '949 Evergreen Street', 'Charlotte', 'NC', '28204');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Audra', '', 'Swanson', 'F', 1111, '1997-06-02', 72000, 0, 3, 28, '945 Aegean Road', 'Charlotte', 'NC', '28229');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Earlene', '', 'Taylor', 'F', 1117, '1996-12-04', 18000, 0, 2, 25, '266 Ducan Spur', 'Boston', 'MA', '02103');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Temple', 'M', 1233, '1938-10-31', 20000, 0, 1, 9, '1938 Grover Highway', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Leann', 'Twila', 'Valenzuela', 'F', 1133, '2000-05-01', 42000, 0, 3, 18, '689 Mackinaw Avenue', 'Charlotte', 'NC', '28211');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Dora', 'Simone', 'Velez', 'F', 1116, '1975-01-02', 42000, 0, 2, 6, '277 Dogwood Lane', 'Charlotte', 'NC', '28208');
--
-- Deliberately spelled the first name so have an example to use
--  with the like operator's underscore wildcard.
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('K_ry', 'Courtney', 'Walsh', 'M', 1198, '2001-07-10', 23000, 0, 5, 7, '361 Yellow Creek Road', 'Charlotte', 'NC', '28234');
--
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Christian', 'Alvin', 'Walton', 'M', 1164, '1961-09-10', 80000, 0, 4, 3, '997 Brentwood Drive', 'Charlotte', 'NC', '28233');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Lyman', '', 'Ward', 'M', 1193, '2001-01-04', 52000, 0, 4, 4, '225 Sun Valley Drive', 'Charlotte', 'NC', '28206');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Leo', 'Boris', 'Watts', 'M', 1189, '1997-07-08', 31000, 0, 8, 6, '156 Pine Pointe Drive', 'Charlotte', 'NC', '28205');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Wharf', 'M', 1237, '1938-10-31', 20000, 0, 1, 9, '1938 Grover Drive', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Lorena', '', 'Wilcox', 'F', 1137, '1956-12-03', 60000, 0, 5, 32, '871 Oak Hill Road', 'Charlotte', 'NC', '28213');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Sabrina', 'Rosanna', 'Wiley', 'F', 1152, '1995-07-24', 27000, 6, 6, 23, '727 Peachtree Circle', 'Atlanta', 'GA', '30317');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Amie', '', 'Wilkerson', 'F', 1110, '1982-09-03', 72000, 0, 3, 17, '824 Acacia Road', 'Charlotte', 'NC', '28208');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Rocco', 'Titus', 'Williamson', 'M', 1199, '2004-06-06', 30000, 0, 3, 19, '944 Juniper Lane', 'Charlotte', 'NC', '28233');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Wolf', 'M', 1215, '1938-10-31', 50000, 0, 1, 4, '1938 Mill Drive', 'Grover''s Mill', 'NJ', '08538');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Lynne', '', 'Workman', 'F', 1138, '1973-02-19', 78000, 0, 3, 16, '99 Oxbow Road', 'Charlotte', 'NC', '28214');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', '', 'Would', 'M', 1238, '1938-10-31', 20000, 0, 1, 9, '1938 East Mill Drive', 'Hightstown', 'NJ', '08520');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Antwan', 'Joaquin', 'Wright', 'M', 1161, '2002-02-22', 26000, 8, 6, 23, '355 Mitchell Avenue', 'Atlanta', 'GA', '30310');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Carmela', '', 'Yang', 'F', 1113, '1974-02-16', 75000, 10, 6, 3, '162 Burr Oak Drive', 'Atlanta', 'GA', '30322');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('John', 'Yo', 'Yo', 'M', 1240, '1938-10-31', 20000, 0, 1, 9, '1938 Princeton Trail', 'Cranburg', 'NJ', '08512');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Hubert', 'Lou', 'Young', 'M', 1178, '1970-03-11', 50000, 0, 5, 24, '458 Mackinaw Circle', 'Charlotte', 'NC', '28202');
insert into employees ( firstname, middlename, lastname, gender, extension, hiredate, salary, commission_pct, department_id, job_id, address, city, state, zipcode ) values ('Rebecca', '', 'Zimmerman', 'F', 1148, '1986-10-29', 97000, 0, 2, 1, '124 Walnut Ridge Road', 'Boston', 'MA', '02107');

commit;



commit;

update departments
set manager_id = 1062
where id = 1;

update departments
set manager_id = 1135
where id = 2;

update departments
set manager_id = 1113
where id = 3;

update departments
set manager_id = 1120
where id = 4;

update departments
set manager_id = 1026
where id = 5;

update departments
set manager_id = 1063
where id = 6;

update departments
set manager_id = 1048
where id = 7;

update departments
set manager_id = 1100
where id = 8;

update departments
set manager_id = 1101
where id = 9;

-- The initial value for version is the same for all : 0

update employees
set version = 0;

commit;
insert into projects (name, start_date, end_date, parent_project_id) values ('Oscillation Overthruster', '1939-10-30', '1984-08-15',10);
insert into projects (name, start_date, end_date) values ('Nuclear Tobor Ram','1949-06-27', '1982-07-09');
insert into projects (name, start_date, parent_project_id) values ('Meson Disruptor 2','1953-08-26',5);
insert into projects (name, start_date, parent_project_id) values ('RLP10 Database Management System 13.2','1963-11-23',7);
insert into projects (name, start_date, end_date) values ('Ion Cannon','1977-05-25', '1980-05-21');
insert into projects (name, start_date, parent_project_id) values ('Miniature Particle Accelerator','1984-06-08',13);
insert into projects (name, start_date) values ('Top Secret Clandestine Tool', '1984-08-15');
insert into projects (name, start_date, end_date, parent_project_id) values ('Flux Capacitor', '1985-07-03', '1990-05-25',10);
insert into projects (name, start_date, parent_project_id) values ('Nanotechnology Processes and Devices','1989-09-23',13);
insert into projects (name, start_date, parent_project_id) values ('Dimensional Warp Drive','1996-11-22',7);
insert into projects (name, start_date, parent_project_id) values ('Nano-Catalyst Reactor 1.1','2002-11-26',13);
insert into projects (name, start_date, parent_project_id) values ('Yoyodyne Laser Guidance System 2.3.0.1','2005-06-29',1);
insert into projects (name, start_date, parent_project_id) values ('Wearable Nuclear Devices','2010-05-07',7);


-- Assignments
-- Some "leads" do not have a project to lead.
-- Some projects to not have any assignments.
-- Some workers do not have any assignments.
-- All so that various types of outer joins may be demonstrated.

-- insert into assignments (employee_id, project_id, start_date) values (, , '');

-- In the beginning there was only 1 project and all the research folks were
-- assigned to it. However, only one lead -- the only person assigned to the
-- project on the same day it started.
insert into assignments (employee_id, project_id, start_date, end_date) values (1043, 1, '1939-10-30', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1002, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1004, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1005, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1011, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1013, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1016, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1024, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1031, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1042, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1049, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1053, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1060, 1, '1939-10-31', '1979-05-25');
insert into assignments (employee_id, project_id, start_date, end_date) values (1066, 1, '1939-10-31', '1950-01-02');
insert into assignments (employee_id, project_id, start_date, end_date) values (1072, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1077, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1078, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1082, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1084, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1086, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1087, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1096, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1098, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1103, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1107, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1116, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1130, 1, '1939-10-31', '1984-08-15');
insert into assignments (employee_id, project_id, start_date, end_date) values (1133, 1, '1939-10-31', '1984-08-15');

-- Then there were other projects. At one point, when there was only one hardware project,
-- the person who eventually became the lead on the 2nd hardware project also worked on the
-- 1st hardware project.
insert into assignments (employee_id, project_id, start_date, end_date) values (1066, 2, '1950-01-02', '1982-07-09');
insert into assignments (employee_id, project_id, start_date) values (1012, 4, '1974-10-12');
insert into assignments (employee_id, project_id, start_date) values (1029, 3, '1978-04-08');
insert into assignments (employee_id, project_id, start_date) values (1060, 5, '1979-05-25');
insert into assignments (employee_id, project_id, start_date) values (1126, 4, '1982-09-03');
insert into assignments (employee_id, project_id, start_date) values (1079, 3, '1983-12-02');
insert into assignments (employee_id, project_id, start_date, end_date) values (1039, 3, '1986-07-05', '2002-11-26');
insert into assignments (employee_id, project_id, start_date) values (1075, 3, '1986-05-09');
insert into assignments (employee_id, project_id, start_date, end_date) values (1047, 4, '1986-05-21', '2005-06-29');
insert into assignments (employee_id, project_id, start_date) values (1046, 3, '1987-08-02');
insert into assignments (employee_id, project_id, start_date, end_date) values (1009, 4, '1987-08-31', '2005-06-29');
insert into assignments (employee_id, project_id, start_date) values (1096, 7, '1988-12-01');
insert into assignments (employee_id, project_id, start_date) values (1112, 4, '1989-01-23');
insert into assignments (employee_id, project_id, start_date, end_date) values (1066, 8, '1989-11-22', '1990-05-25');
insert into assignments (employee_id, project_id, start_date) values (1053, 6, '1989-12-16');
insert into assignments (employee_id, project_id, start_date) values (1108, 4, '1990-04-30');
insert into assignments (employee_id, project_id, start_date, end_date) values (1093, 4, '1995-03-18', '2005-06-29');
insert into assignments (employee_id, project_id, start_date) values (1095, 3, '1995-07-21');
insert into assignments (employee_id, project_id, start_date) values (1056, 4, '2001-02-15');
insert into assignments (employee_id, project_id, start_date) values (1039, 11, '2002-11-26');
insert into assignments (employee_id, project_id, start_date) values (1023, 11, '2002-11-26');
insert into assignments (employee_id, project_id, start_date) values (1040, 11, '2002-11-26');
insert into assignments (employee_id, project_id, start_date) values (1058, 11, '2003-04-14');
insert into assignments (employee_id, project_id, start_date) values (1099, 11, '2003-07-11');
insert into assignments (employee_id, project_id, start_date, end_date) values (1127, 4, '2004-06-06' ,'2005-06-29');
insert into assignments (employee_id, project_id, start_date) values (1024, 10, '2004-07-07');
insert into assignments (employee_id, project_id, start_date) values (1127, 12, '2005-06-29');
insert into assignments (employee_id, project_id, start_date) values (1009, 12, '2005-06-29');
insert into assignments (employee_id, project_id, start_date) values (1047, 12, '2005-06-29');
insert into assignments (employee_id, project_id, start_date) values (1093, 12, '2005-06-29');
insert into assignments (employee_id, project_id, start_date) values (1004, 9, '2008-11-04');
insert into assignments (employee_id, project_id, start_date) values (1129, 12, '2009-05-21');

COMMIT;

ALTER TABLE assignments ADD CONSTRAINT assignment_employee_fk
      FOREIGN KEY (employee_id) REFERENCES employees (id);

ALTER TABLE assignments ADD CONSTRAINT assignment_project_fk
      FOREIGN KEY (project_id) REFERENCES projects (id);

ALTER TABLE employees ADD CONSTRAINT employee_job_fk
      FOREIGN KEY (job_id) REFERENCES jobs (id);

ALTER TABLE employees ADD CONSTRAINT employee_dept_fk
      FOREIGN KEY (department_id) REFERENCES departments (id);

ALTER TABLE departments ADD CONSTRAINT department_mgr_fk
      FOREIGN KEY (manager_id) REFERENCES employees (id);

ALTER TABLE departments ADD CONSTRAINT department_loc_fk
      FOREIGN KEY (location_id) REFERENCES locations (id);

ALTER TABLE departments ADD CONSTRAINT departments_mgr_u UNIQUE (manager_id);

ALTER TABLE projects ADD CONSTRAINT project_parent_project_fk
      FOREIGN KEY (parent_project_id) REFERENCES projects (id) ON DELETE SET NULL;

COMMIT;
