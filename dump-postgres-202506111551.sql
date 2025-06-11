--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.0

-- Started on 2025-06-11 15:51:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16403)
-- Name: sms; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sms;


ALTER SCHEMA sms OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16414)
-- Name: marks; Type: TABLE; Schema: sms; Owner: postgres
--

CREATE TABLE sms.marks (
    id integer NOT NULL,
    student_id integer,
    subject character varying(100) NOT NULL,
    score integer NOT NULL
);


ALTER TABLE sms.marks OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16413)
-- Name: marks_id_seq; Type: SEQUENCE; Schema: sms; Owner: postgres
--

CREATE SEQUENCE sms.marks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sms.marks_id_seq OWNER TO postgres;

--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 220
-- Name: marks_id_seq; Type: SEQUENCE OWNED BY; Schema: sms; Owner: postgres
--

ALTER SEQUENCE sms.marks_id_seq OWNED BY sms.marks.id;


--
-- TOC entry 219 (class 1259 OID 16405)
-- Name: students; Type: TABLE; Schema: sms; Owner: postgres
--

CREATE TABLE sms.students (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    email character varying(100) NOT NULL,
    age integer NOT NULL
);


ALTER TABLE sms.students OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16404)
-- Name: students_id_seq; Type: SEQUENCE; Schema: sms; Owner: postgres
--

CREATE SEQUENCE sms.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sms.students_id_seq OWNER TO postgres;

--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 218
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: sms; Owner: postgres
--

ALTER SEQUENCE sms.students_id_seq OWNED BY sms.students.id;


--
-- TOC entry 4648 (class 2604 OID 16417)
-- Name: marks id; Type: DEFAULT; Schema: sms; Owner: postgres
--

ALTER TABLE ONLY sms.marks ALTER COLUMN id SET DEFAULT nextval('sms.marks_id_seq'::regclass);


--
-- TOC entry 4647 (class 2604 OID 16408)
-- Name: students id; Type: DEFAULT; Schema: sms; Owner: postgres
--

ALTER TABLE ONLY sms.students ALTER COLUMN id SET DEFAULT nextval('sms.students_id_seq'::regclass);


--
-- TOC entry 4654 (class 2606 OID 16419)
-- Name: marks marks_pkey; Type: CONSTRAINT; Schema: sms; Owner: postgres
--

ALTER TABLE ONLY sms.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (id);


--
-- TOC entry 4650 (class 2606 OID 16412)
-- Name: students students_email_key; Type: CONSTRAINT; Schema: sms; Owner: postgres
--

ALTER TABLE ONLY sms.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- TOC entry 4652 (class 2606 OID 16410)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: sms; Owner: postgres
--

ALTER TABLE ONLY sms.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4655 (class 1259 OID 16425)
-- Name: marks_student_id_idx; Type: INDEX; Schema: sms; Owner: postgres
--

CREATE INDEX marks_student_id_idx ON sms.marks USING btree (student_id);


--
-- TOC entry 4656 (class 2606 OID 16420)
-- Name: marks marks_students_fk; Type: FK CONSTRAINT; Schema: sms; Owner: postgres
--

ALTER TABLE ONLY sms.marks
    ADD CONSTRAINT marks_students_fk FOREIGN KEY (student_id) REFERENCES sms.students(id);


-- Completed on 2025-06-11 15:51:01

--
-- PostgreSQL database dump complete
--

