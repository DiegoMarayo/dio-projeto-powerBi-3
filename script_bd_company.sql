CREATE SCHEMA azure_company;
USE azure_company;

-- =======================
-- EMPLOYEE
-- =======================
CREATE TABLE employee (
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR(1),
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR(1),
    Salary DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL,
    CONSTRAINT chk_salary_employee CHECK (Salary > 2000.0),
    CONSTRAINT pk_employee PRIMARY KEY (Ssn)
);

ALTER TABLE employee
ADD CONSTRAINT fk_employee_supervisor
FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- default department = 1, mas precisamos criar antes na tabela correta
-- então só deixamos NOT NULL por enquanto
-- e garantimos que dept 1 será criado antes do insert dos employees


-- =======================
-- DEPARTMENT
-- =======================
CREATE TABLE department (
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE,
    Dept_create_date DATE,
    CONSTRAINT chk_date_dept CHECK (Dept_create_date <= Mgr_start_date),
    CONSTRAINT pk_dept PRIMARY KEY (Dnumber),
    CONSTRAINT unique_name_dept UNIQUE (Dname)
);

ALTER TABLE department
ADD CONSTRAINT fk_dept_mgr
FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
ON UPDATE CASCADE;

-- =======================
-- DEPT_LOCATIONS
-- =======================
CREATE TABLE dept_locations (
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    CONSTRAINT pk_dept_locations PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT fk_dept_locations 
        FOREIGN KEY (Dnumber) REFERENCES department(Dnumber)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =======================
-- PROJECT
-- =======================
CREATE TABLE project (
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnum INT NOT NULL,
    CONSTRAINT pk_project PRIMARY KEY (Pnumber),
    CONSTRAINT unique_project UNIQUE (Pname),
    CONSTRAINT fk_project_dept FOREIGN KEY (Dnum) REFERENCES department(Dnumber)
);

-- =======================
-- WORKS_ON
-- =======================
CREATE TABLE works_on (
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    CONSTRAINT pk_works_on PRIMARY KEY (Essn, Pno),
    CONSTRAINT fk_works_employee FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    CONSTRAINT fk_works_project FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

-- =======================
-- DEPENDENT
-- =======================
CREATE TABLE dependent (
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(10),
    CONSTRAINT pk_dependent PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT fk_dependent_emp FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);