--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    address character varying(255) NOT NULL,
    phone_number character(12) NOT NULL,
    email character varying(255),
    date_of_birth date NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: customers_insurances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_insurances (
    customer_id integer NOT NULL,
    insurance_id integer NOT NULL
);


ALTER TABLE public.customers_insurances OWNER TO postgres;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    address character varying(255) NOT NULL,
    phone_number character(12) NOT NULL,
    fax character(12)
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- Name: doctors_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors_customers (
    doctor_id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.doctors_customers OWNER TO postgres;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_id_seq OWNER TO postgres;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- Name: insurances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insurances (
    id integer NOT NULL,
    company_name text NOT NULL,
    active boolean NOT NULL,
    rxbin integer NOT NULL,
    rxgrp character varying(8) NOT NULL
);


ALTER TABLE public.insurances OWNER TO postgres;

--
-- Name: insurances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insurances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insurances_id_seq OWNER TO postgres;

--
-- Name: insurances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insurances_id_seq OWNED BY public.insurances.id;


--
-- Name: medications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medications (
    id integer NOT NULL,
    medication_name text NOT NULL,
    manufacturer text NOT NULL
);


ALTER TABLE public.medications OWNER TO postgres;

--
-- Name: medications_doctors_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medications_doctors_customers (
    medication_id integer NOT NULL,
    doctor_id integer NOT NULL,
    dosage character varying(255) NOT NULL,
    refills integer NOT NULL,
    date_received date NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.medications_doctors_customers OWNER TO postgres;

--
-- Name: medications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medications_id_seq OWNER TO postgres;

--
-- Name: medications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medications_id_seq OWNED BY public.medications.id;


--
-- Name: pharmacies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pharmacies (
    id integer NOT NULL,
    pharmacy_name text NOT NULL,
    pharmacy_address character varying(255) NOT NULL,
    phone_number character(12) NOT NULL,
    fax character(12)
);


ALTER TABLE public.pharmacies OWNER TO postgres;

--
-- Name: pharmacies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pharmacies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pharmacies_id_seq OWNER TO postgres;

--
-- Name: pharmacies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pharmacies_id_seq OWNED BY public.pharmacies.id;


--
-- Name: pharmacies_medications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pharmacies_medications (
    pharmacy_id integer NOT NULL,
    medication_id integer NOT NULL,
    price numeric(19,4) NOT NULL
);


ALTER TABLE public.pharmacies_medications OWNER TO postgres;

--
-- Name: pharmacists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pharmacists (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    pharmacy_id integer
);


ALTER TABLE public.pharmacists OWNER TO postgres;

--
-- Name: pharmacists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pharmacists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pharmacists_id_seq OWNER TO postgres;

--
-- Name: pharmacists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pharmacists_id_seq OWNED BY public.pharmacists.id;


--
-- Name: pharmacists_medications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pharmacists_medications (
    pharmacist_id integer NOT NULL,
    medication_id integer NOT NULL,
    time_filled time without time zone
);


ALTER TABLE public.pharmacists_medications OWNER TO postgres;

--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: insurances id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurances ALTER COLUMN id SET DEFAULT nextval('public.insurances_id_seq'::regclass);


--
-- Name: medications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medications ALTER COLUMN id SET DEFAULT nextval('public.medications_id_seq'::regclass);


--
-- Name: pharmacies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacies ALTER COLUMN id SET DEFAULT nextval('public.pharmacies_id_seq'::regclass);


--
-- Name: pharmacists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacists ALTER COLUMN id SET DEFAULT nextval('public.pharmacists_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, first_name, last_name, address, phone_number, email, date_of_birth) FROM stdin;
1	Bruno	Mars	11 Hills Beach Rd, Biddeford, Massachusetts	207-602-5884	\N	1980-01-01
2	Major	Lazer	41 North Madison St., Grand Island, NE	686-832-8967	\N	1999-03-22
3	Post	Malone	7 River Street, Glenview, IL 60025	762-497-5919	\N	1973-10-23
4	Ariana	Grande	7002 South Peninsula Dr., West Islip, NY 11795	705-866-7793	\N	1959-12-12
5	Bad	Bunny	425 North Harrison Road, Reading, MA 01867	405-286-9021	\N	2004-07-30
6	Miley	Cyrus	1 Rosewood Drive, Bethpage, NY 11714	947-509-9506	\N	1991-06-19
7	Fleetwood	Mac	68 North Sheffield Drive, Oklahoma City, OK 73112	971-643-5229	\N	1988-11-29
8	Brooks	Conrad	918 Myrtle Ave., Buffalo, NY 14215	734-913-9878	\N	1964-02-09
9	Dale	Watson	533 Creekside Dr., Owings Mills, MD 21117	466-521-1864	\N	1974-08-26
10	Hank	Hill	124 Rockland St., Loveland, OH 45140	735-936-0682	\N	2001-04-28
\.


--
-- Data for Name: customers_insurances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_insurances (customer_id, insurance_id) FROM stdin;
1	2
2	4
3	1
4	2
5	1
6	4
7	1
8	2
9	3
10	3
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (id, first_name, last_name, address, phone_number, fax) FROM stdin;
1	Hydro	Homie	889 Hospital Lane, Brooklyn, New York	213-456-7890	\N
2	Bruce	Banner	50 Avenger Court, Buffalo, New York	312-546-0987	\N
3	Natasha	Romanoff	67 Black Widow Street, Miami, Florida	456-123-9078	\N
4	Doctor	Strange	14 Multiverse Drive, Salt Lake City, Utah	809-456-1214	\N
5	Cristina	Yang	471 Anatomy Lane, Seattle, Washington	678-123-7890	\N
6	Doogie	Howser	507 Eastman Way, Las Angeles, California	234-651-9268	\N
\.


--
-- Data for Name: doctors_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors_customers (doctor_id, customer_id) FROM stdin;
1	1
3	2
3	3
6	4
4	5
5	6
2	7
2	8
1	9
6	10
5	10
2	2
1	7
\.


--
-- Data for Name: insurances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurances (id, company_name, active, rxbin, rxgrp) FROM stdin;
1	GreenCross GreenShield	t	1234	ABCDE
2	Laetna	t	5678	XYZ12
3	Divided Healthcare	f	9012	CARE1
4	Cibna	t	2468	PHARM
\.


--
-- Data for Name: medications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medications (id, medication_name, manufacturer) FROM stdin;
1	Lethotrexate	Medaphaze
2	Lyumjex	Annamed
3	Netformin	Medaphaze
4	Bagapentin	BCM
5	Flosartan	Emergent
6	Buterol	ACH
7	Zestral	Emergent
8	Gamadol	BCM
9	Perzoloft	Medaphaze
10	Camorol	Nova
\.


--
-- Data for Name: medications_doctors_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medications_doctors_customers (medication_id, doctor_id, dosage, refills, date_received, customer_id) FROM stdin;
\.


--
-- Data for Name: pharmacies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pharmacies (id, pharmacy_name, pharmacy_address, phone_number, fax) FROM stdin;
1	Pharmacy 123	45 N. Street, Tyler TX, 75701	123-456-7890	\N
2	Meds "R" Us	205 Medical Drive, Paris TX, 75004	098-765-4321	\N
\.


--
-- Data for Name: pharmacies_medications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pharmacies_medications (pharmacy_id, medication_id, price) FROM stdin;
1	1	15.9900
1	2	35.0000
1	3	85.5000
1	4	49.9900
1	5	7.5000
1	6	32.0000
2	1	15.9900
2	2	35.0000
2	3	85.5000
2	4	49.9900
2	5	7.5000
\.


--
-- Data for Name: pharmacists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pharmacists (id, first_name, last_name, pharmacy_id) FROM stdin;
1	Jane	Doe	\N
2	Michael	Scott	\N
3	Jennifer	Lopez	\N
4	Jack	Skellington	\N
5	Kagome	Higurashi	\N
\.


--
-- Data for Name: pharmacists_medications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pharmacists_medications (pharmacist_id, medication_id, time_filled) FROM stdin;
1	2	12:17:21
2	3	08:03:11
3	4	10:49:01
4	1	11:13:47
5	4	13:30:05
1	10	13:45:57
2	9	07:41:32
3	7	14:15:21
4	8	16:09:27
5	9	09:50:46
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 10, true);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_id_seq', 6, true);


--
-- Name: insurances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurances_id_seq', 4, true);


--
-- Name: medications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medications_id_seq', 10, true);


--
-- Name: pharmacies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pharmacies_id_seq', 2, true);


--
-- Name: pharmacists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pharmacists_id_seq', 5, true);


--
-- Name: customers_insurances customers_insurances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_insurances
    ADD CONSTRAINT customers_insurances_pkey PRIMARY KEY (customer_id, insurance_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: doctors_customers doctors_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors_customers
    ADD CONSTRAINT doctors_customers_pkey PRIMARY KEY (doctor_id, customer_id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: insurances insurances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurances
    ADD CONSTRAINT insurances_pkey PRIMARY KEY (id);


--
-- Name: medications_doctors_customers medications_doctors_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medications_doctors_customers
    ADD CONSTRAINT medications_doctors_customers_pkey PRIMARY KEY (medication_id, doctor_id, customer_id);


--
-- Name: medications medications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medications
    ADD CONSTRAINT medications_pkey PRIMARY KEY (id);


--
-- Name: pharmacies_medications pharmacies_medications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacies_medications
    ADD CONSTRAINT pharmacies_medications_pkey PRIMARY KEY (pharmacy_id, medication_id);


--
-- Name: pharmacies pharmacies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacies
    ADD CONSTRAINT pharmacies_pkey PRIMARY KEY (id);


--
-- Name: pharmacists_medications pharmacists_medications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacists_medications
    ADD CONSTRAINT pharmacists_medications_pkey PRIMARY KEY (pharmacist_id, medication_id);


--
-- Name: pharmacists pharmacists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacists
    ADD CONSTRAINT pharmacists_pkey PRIMARY KEY (id);


--
-- Name: customers_insurances FK_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_insurances
    ADD CONSTRAINT "FK_customer" FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- Name: doctors_customers FK_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors_customers
    ADD CONSTRAINT "FK_customer" FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- Name: doctors_customers FK_doctor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors_customers
    ADD CONSTRAINT "FK_doctor" FOREIGN KEY (doctor_id) REFERENCES public.doctors(id) NOT VALID;


--
-- Name: medications_doctors_customers FK_doctor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medications_doctors_customers
    ADD CONSTRAINT "FK_doctor" FOREIGN KEY (doctor_id) REFERENCES public.doctors(id) NOT VALID;


--
-- Name: customers_insurances FK_insurance; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_insurances
    ADD CONSTRAINT "FK_insurance" FOREIGN KEY (insurance_id) REFERENCES public.insurances(id) NOT VALID;


--
-- Name: medications_doctors_customers FK_medication; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medications_doctors_customers
    ADD CONSTRAINT "FK_medication" FOREIGN KEY (medication_id) REFERENCES public.medications(id) NOT VALID;


--
-- Name: pharmacies_medications FK_medication; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacies_medications
    ADD CONSTRAINT "FK_medication" FOREIGN KEY (medication_id) REFERENCES public.medications(id) NOT VALID;


--
-- Name: pharmacists_medications FK_medication; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacists_medications
    ADD CONSTRAINT "FK_medication" FOREIGN KEY (medication_id) REFERENCES public.medications(id) NOT VALID;


--
-- Name: pharmacists_medications FK_pharmacist; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacists_medications
    ADD CONSTRAINT "FK_pharmacist" FOREIGN KEY (pharmacist_id) REFERENCES public.pharmacists(id) NOT VALID;


--
-- Name: pharmacies_medications FK_pharmacy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacies_medications
    ADD CONSTRAINT "FK_pharmacy" FOREIGN KEY (pharmacy_id) REFERENCES public.pharmacies(id) NOT VALID;


--
-- Name: medications_doctors_customers fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medications_doctors_customers
    ADD CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- Name: pharmacists fk_pharmacists_pharmacies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacists
    ADD CONSTRAINT fk_pharmacists_pharmacies FOREIGN KEY (pharmacy_id) REFERENCES public.pharmacies(id);


--
-- PostgreSQL database dump complete
--

