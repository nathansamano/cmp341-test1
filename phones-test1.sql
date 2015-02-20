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
-- Name: phones; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE phones (
    pname character varying,
    hexid character varying,
    has_root boolean
);


ALTER TABLE phones OWNER TO nathan;

--
-- Data for Name: phones; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY phones (pname, hexid, has_root) FROM stdin;
Samsung	1584A5B552C	t
HTC	79155B6544AC	f
Motorola	789F561D658A5	f
\.


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

