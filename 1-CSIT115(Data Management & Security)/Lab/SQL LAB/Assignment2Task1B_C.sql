-- Task 1B) Create Tables
-----------------------
-- CREATE TABLE Statement
CREATE TABLE item
(
  serial_no   VARCHAR(20),
  description VARCHAR(30),
  model       VARCHAR(20),
  remarks     VARCHAR(30),
  CONSTRAINT itemPK PRIMARY KEY (serial_no)
);

CREATE TABLE employee
(
  emp_Id INT,
  name   VARCHAR(20),
  gender CHAR(1),
  phone  CHAR(8),
  email  VARCHAR(30) NOT NULL,
  CONSTRAINT employeePK PRIMARY KEY (emp_ID),
  CONSTRAINT employeeCK UNIQUE (email),
  CONSTRAINT chkgender CHECK (gender = 'M' OR gender = 'F')
);

CREATE TABLE damagePayment
(
  ref_no VARCHAR(20),
  description VARCHAR(30),
  amount DECIMAL (10, 2),
  date_paid DATE,
  CONSTRAINT damagePaymentPK PRIMARY KEY (ref_no)
);

CREATE TABLE camera
(
  serial_no   VARCHAR(20),
  description VARCHAR(30),
  model       VARCHAR(20),
  remarks     VARCHAR(30),
  resolution  VARCHAR(10),
  memory_card VARCHAR(30),
  CONSTRAINT itemPK PRIMARY KEY (serial_no),
  CONSTRAINT camFK FOREIGN KEY (serial_no) REFERENCES item (serial_no)
);

CREATE TABLE serviceProvider
(
  name    VARCHAR(20),
  address VARCHAR(30) NOT NULL,
  phone   CHAR(8) NOT NULL,
  email   VARCHAR(30) NOT NULL,
  CONSTRAINT serProvPK PRIMARY KEY (name),
  CONSTRAINT serProvCK1 UNIQUE (address),
  CONSTRAINT serProvCK2 UNIQUE (phone),
  CONSTRAINT serProvCK3 UNIQUE (email)
);

CREATE TABLE loan
(
  lemp_Id     INT,
  lserial_no  VARCHAR(20),
  lref_no     VARCHAR(20),
  date_in     DATE NOT NULL,
  date_out    DATE,
  purpose     VARCHAR(30),
  remarks     VARCHAR(30),
  CONSTRAINT loanPK PRIMARY KEY (lemp_Id, lserial_no, date_out),
  CONSTRAINT loanFK1 FOREIGN KEY (lemp_Id) REFERENCES employee (emp_ID),
  CONSTRAINT loanFK2 FOREIGN KEY (lserial_no) REFERENCES item (serial_no),
  CONSTRAINT loanFK3 FOREIGN KEY (lref_no) REFERENCES damagePayment (ref_no)
);

CREATE TABLE servicedBy
(
  sbname VARCHAR(20),
  sbserial_no VARCHAR(20),
  date_serviced DATE,
  details VARCHAR(30),
  fee DECIMAL (10, 2),
  CONSTRAINT servicedByPK PRIMARY KEY (sbname, sbserial_no),
  CONSTRAINT servicedByFK1 FOREIGN KEY (sbserial_no) REFERENCES item (serial_no),
  CONSTRAINT servicedByFK2 FOREIGN KEY (sbname) REFERENCES serviceProvider (name)
);



-- Task 1C) Alter tables
----------------------
ALTER TABLE item ADD status VARCHAR(20) DEFAULT 'Available'; 
ALTER TABLE item ADD CONSTRAINT chkstatus CHECK (status IN ('Available', 'On loan', 'Under service')); 
ALTER TABLE damagePayment ADD CONSTRAINT CHECK (amount > 0);