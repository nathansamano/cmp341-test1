--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: department; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE department (
    dname character varying(15) NOT NULL,
    dnumber integer NOT NULL,
    mgr_ssn character(9) NOT NULL,
    mgr_start_date date
);


ALTER TABLE department OWNER TO nathan;

--
-- Name: dependent; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE dependent (
    essn character(9) NOT NULL,
    dependent_name character varying(15) NOT NULL,
    sex character(1),
    bdate date,
    relationship character varying(8)
);


ALTER TABLE dependent OWNER TO nathan;

--
-- Name: dept_locations; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE dept_locations (
    dnumber integer NOT NULL,
    dlocation character varying(15) NOT NULL
);


ALTER TABLE dept_locations OWNER TO nathan;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE employee (
    fname character varying(15) NOT NULL,
    minit character(1),
    lname character varying(15) NOT NULL,
    ssn character(9) NOT NULL,
    bdate date,
    address character varying(30),
    sex character(1),
    salary numeric(10,2),
    super_ssn character(9),
    dno integer NOT NULL
);


ALTER TABLE employee OWNER TO nathan;

--
-- Name: project; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE project (
    pname character varying(15) NOT NULL,
    pnumber integer NOT NULL,
    plocation character varying(15) NOT NULL,
    dnum integer NOT NULL
);


ALTER TABLE project OWNER TO nathan;

--
-- Name: works_on; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE works_on (
    essn character(9) NOT NULL,
    pno integer NOT NULL,
    hours numeric(3,1)
);


ALTER TABLE works_on OWNER TO nathan;

--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY department (dname, dnumber, mgr_ssn, mgr_start_date) FROM stdin;
Administration	4	987654321	1995-01-01
Headquarters	1	888665555	1981-06-19
Research	5	333445555	1988-05-22
\.


--
-- Data for Name: dependent; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY dependent (essn, dependent_name, sex, bdate, relationship) FROM stdin;
333445555	Alice	F	1986-04-05	Daughter
333445555	Theodore	M	1983-10-25	Son
333445555	Joy	F	1958-05-03	Spouse
987654321	Abner	M	1942-02-28	Spouse
123456789	Michael	M	1988-01-04	Son
123456789	Alice	F	1988-12-30	Daughter
123456789	Elizabeth	F	1967-05-05	Spouse
\.


--
-- Data for Name: dept_locations; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY dept_locations (dnumber, dlocation) FROM stdin;
1	Houston
4	Stafford
5	Bellaire
5	Sugarland
5	Houston
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY employee (fname, minit, lname, ssn, bdate, address, sex, salary, super_ssn, dno) FROM stdin;
Franklin	T	Wong	333445555	1955-12-08	638 Voss, Houston, TX	M	40000.00	888665555	5
Jennifer	S	Wallace	987654321	1941-06-20	291 Berry, Bellaire, TX	F	43000.00	888665555	4
Ramesh	K	Narayan	666884444	1962-09-15	975 Fire Oak, Humble, TX	M	41800.00	333445555	5
Joyce	A	English	453453453	1972-07-31	5631 Rice, Houston, TX	F	27500.00	333445555	5
Ahmad	V	Jabbar	987987987	1969-03-29	980 Dallas, Houston, TX	M	27500.00	987654321	4
Alicia	J	Zelaya	999887777	1968-01-19	3321 Castle, Spring, TX	F	27500.00	987654321	5
John	B	Smith	123456789	1965-01-09	731 Fondren, Houston, TX	M	33000.00	333445555	5
Big	A	Bird	555555555	1950-02-03	123 Sesame, New York, NY	M	22000.00	888665555	4
James	E	Borg	888665555	1937-11-10	450 Stone, Houston, TX	M	55000.00	987654321	1
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY project (pname, pnumber, plocation, dnum) FROM stdin;
ProductX	1	Bellaire	5
ProductY	2	Sugarland	5
ProductZ	3	Houston	5
Computerization	10	Stafford	4
Reorganization	20	Houston	1
Newbenefits	30	Stafford	4
\.


--
-- Data for Name: works_on; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY works_on (essn, pno, hours) FROM stdin;
123456789	1	32.5
123456789	2	7.5
666884444	3	40.0
453453453	1	20.0
453453453	2	20.0
333445555	2	10.0
333445555	3	10.0
333445555	10	10.0
333445555	20	10.0
999887777	30	30.0
999887777	10	10.0
987987987	10	35.0
987987987	30	5.0
987654321	30	20.0
987654321	20	15.0
888665555	20	\N
\.


--
-- Name: department_dname_key; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_dname_key UNIQUE (dname);


--
-- Name: department_pkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dnumber);


--
-- Name: dependent_pkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY dependent
    ADD CONSTRAINT dependent_pkey PRIMARY KEY (essn, dependent_name);


--
-- Name: dept_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY dept_locations
    ADD CONSTRAINT dept_locations_pkey PRIMARY KEY (dnumber, dlocation);


--
-- Name: dname_constraint; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT dname_constraint UNIQUE (dname);


--
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (ssn);


--
-- Name: pname_constraint; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY project
    ADD CONSTRAINT pname_constraint UNIQUE (pname);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (pnumber);


--
-- Name: works_on_pkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY works_on
    ADD CONSTRAINT works_on_pkey PRIMARY KEY (essn, pno);


--
-- Name: dept; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT dept FOREIGN KEY (dno) REFERENCES department(dnumber);


--
-- Name: dno_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT dno_constraint FOREIGN KEY (dno) REFERENCES department(dnumber);


--
-- Name: dnum_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY project
    ADD CONSTRAINT dnum_constraint FOREIGN KEY (dnum) REFERENCES department(dnumber);


--
-- Name: dnum_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY dept_locations
    ADD CONSTRAINT dnum_constraint FOREIGN KEY (dnumber) REFERENCES department(dnumber);


--
-- Name: dnumb_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY project
    ADD CONSTRAINT dnumb_constraint FOREIGN KEY (dnum) REFERENCES department(dnumber);


--
-- Name: dnumber_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY dept_locations
    ADD CONSTRAINT dnumber_constraint FOREIGN KEY (dnumber) REFERENCES department(dnumber);


--
-- Name: essn_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY works_on
    ADD CONSTRAINT essn_constraint FOREIGN KEY (essn) REFERENCES employee(ssn);


--
-- Name: essn_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY dependent
    ADD CONSTRAINT essn_constraint FOREIGN KEY (essn) REFERENCES employee(ssn);


--
-- Name: mgr_ssn_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY department
    ADD CONSTRAINT mgr_ssn_constraint FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn);


--
-- Name: pno_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY works_on
    ADD CONSTRAINT pno_constraint FOREIGN KEY (pno) REFERENCES project(pnumber);


--
-- Name: project_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY works_on
    ADD CONSTRAINT project_constraint FOREIGN KEY (pno) REFERENCES project(pnumber);


--
-- Name: ssn_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY department
    ADD CONSTRAINT ssn_constraint FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn);


--
-- Name: ssn_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY works_on
    ADD CONSTRAINT ssn_constraint FOREIGN KEY (essn) REFERENCES employee(ssn);


--
-- Name: super_ssn_constraint; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT super_ssn_constraint FOREIGN KEY (super_ssn) REFERENCES employee(ssn);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

