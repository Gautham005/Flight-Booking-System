--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: rahulk
--

CREATE TABLE public.bookings (
    booking_id integer NOT NULL,
    transaction_id integer,
    flight_no character varying(20),
    user_id integer,
    amount integer NOT NULL,
    date_of_travel date NOT NULL
);


ALTER TABLE public.bookings OWNER TO rahulk;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulk
--

CREATE SEQUENCE public.bookings_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_booking_id_seq OWNER TO rahulk;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulk
--

ALTER SEQUENCE public.bookings_booking_id_seq OWNED BY public.bookings.booking_id;


--
-- Name: flights; Type: TABLE; Schema: public; Owner: rahulk
--

CREATE TABLE public.flights (
    flight_no character varying(20) NOT NULL,
    airline_name character varying(40),
    source character varying(30) NOT NULL,
    destination character varying(30) NOT NULL,
    departure_time time without time zone NOT NULL,
    arrival_time time without time zone NOT NULL
);


ALTER TABLE public.flights OWNER TO rahulk;

--
-- Name: registered_users; Type: TABLE; Schema: public; Owner: rahulk
--

CREATE TABLE public.registered_users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(355) NOT NULL,
    phone character varying(10) NOT NULL
);


ALTER TABLE public.registered_users OWNER TO rahulk;

--
-- Name: registered_users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulk
--

CREATE SEQUENCE public.registered_users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registered_users_user_id_seq OWNER TO rahulk;

--
-- Name: registered_users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulk
--

ALTER SEQUENCE public.registered_users_user_id_seq OWNED BY public.registered_users.user_id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: rahulk
--

CREATE TABLE public.transactions (
    transaction_id integer NOT NULL,
    wallet_id integer,
    user_id integer,
    amount integer NOT NULL
);


ALTER TABLE public.transactions OWNER TO rahulk;

--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulk
--

CREATE SEQUENCE public.transactions_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_transaction_id_seq OWNER TO rahulk;

--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulk
--

ALTER SEQUENCE public.transactions_transaction_id_seq OWNED BY public.transactions.transaction_id;


--
-- Name: wallet; Type: TABLE; Schema: public; Owner: rahulk
--

CREATE TABLE public.wallet (
    wallet_id integer NOT NULL,
    username character varying(50),
    balance integer DEFAULT 0
);


ALTER TABLE public.wallet OWNER TO rahulk;

--
-- Name: wallet_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulk
--

CREATE SEQUENCE public.wallet_wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_wallet_id_seq OWNER TO rahulk;

--
-- Name: wallet_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulk
--

ALTER SEQUENCE public.wallet_wallet_id_seq OWNED BY public.wallet.wallet_id;


--
-- Name: bookings booking_id; Type: DEFAULT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.bookings ALTER COLUMN booking_id SET DEFAULT nextval('public.bookings_booking_id_seq'::regclass);


--
-- Name: registered_users user_id; Type: DEFAULT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.registered_users ALTER COLUMN user_id SET DEFAULT nextval('public.registered_users_user_id_seq'::regclass);


--
-- Name: transactions transaction_id; Type: DEFAULT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.transactions_transaction_id_seq'::regclass);


--
-- Name: wallet wallet_id; Type: DEFAULT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.wallet ALTER COLUMN wallet_id SET DEFAULT nextval('public.wallet_wallet_id_seq'::regclass);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.bookings (booking_id, transaction_id, flight_no, user_id, amount, date_of_travel) FROM stdin;
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.flights (flight_no, airline_name, source, destination, departure_time, arrival_time) FROM stdin;
\.


--
-- Data for Name: registered_users; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.registered_users (user_id, username, password, name, email, phone) FROM stdin;
1	rahulk	rahulk	Rahul	rahul@gmail.com	9400538200
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.transactions (transaction_id, wallet_id, user_id, amount) FROM stdin;
\.


--
-- Data for Name: wallet; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.wallet (wallet_id, username, balance) FROM stdin;
\.


--
-- Name: bookings_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulk
--

SELECT pg_catalog.setval('public.bookings_booking_id_seq', 1, false);


--
-- Name: registered_users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulk
--

SELECT pg_catalog.setval('public.registered_users_user_id_seq', 1, true);


--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulk
--

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 1, false);


--
-- Name: wallet_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulk
--

SELECT pg_catalog.setval('public.wallet_wallet_id_seq', 1, false);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_id);


--
-- Name: flights flights_flight_no_key; Type: CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_flight_no_key UNIQUE (flight_no);


--
-- Name: registered_users registered_users_email_key; Type: CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.registered_users
    ADD CONSTRAINT registered_users_email_key UNIQUE (email);


--
-- Name: registered_users registered_users_phone_key; Type: CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.registered_users
    ADD CONSTRAINT registered_users_phone_key UNIQUE (phone);


--
-- Name: registered_users registered_users_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.registered_users
    ADD CONSTRAINT registered_users_pkey PRIMARY KEY (user_id);


--
-- Name: registered_users registered_users_username_key; Type: CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.registered_users
    ADD CONSTRAINT registered_users_username_key UNIQUE (username);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- Name: wallet wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_pkey PRIMARY KEY (wallet_id);


--
-- Name: bookings bookings_flight_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_flight_no_fkey FOREIGN KEY (flight_no) REFERENCES public.flights(flight_no) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bookings bookings_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transactions(transaction_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bookings bookings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.registered_users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.registered_users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_wallet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.wallet(wallet_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: wallet wallet_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_username_fkey FOREIGN KEY (username) REFERENCES public.registered_users(username) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

