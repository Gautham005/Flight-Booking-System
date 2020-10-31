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
    amount integer NOT NULL,
    date_of_travel date NOT NULL,
    no_of_travellers integer NOT NULL,
    username character varying(50)
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
    arrival_time time without time zone NOT NULL,
    price integer NOT NULL,
    no_of_seats_available integer NOT NULL,
    flight_type character varying(20),
    arrival_date date,
    departure_date date
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
    phone character varying(12) NOT NULL
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
-- Name: tickets; Type: TABLE; Schema: public; Owner: rahulk
--

CREATE TABLE public.tickets (
    ticket_id integer NOT NULL,
    booking_id integer,
    person_name character varying(10),
    dob character varying(10),
    gender character varying(10)
);


ALTER TABLE public.tickets OWNER TO rahulk;

--
-- Name: tickets_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulk
--

CREATE SEQUENCE public.tickets_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_ticket_id_seq OWNER TO rahulk;

--
-- Name: tickets_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulk
--

ALTER SEQUENCE public.tickets_ticket_id_seq OWNED BY public.tickets.ticket_id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: rahulk
--

CREATE TABLE public.transactions (
    transaction_id integer NOT NULL,
    wallet_id integer,
    amount integer NOT NULL,
    username character varying(50)
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
-- Name: tickets ticket_id; Type: DEFAULT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.tickets ALTER COLUMN ticket_id SET DEFAULT nextval('public.tickets_ticket_id_seq'::regclass);


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

COPY public.bookings (booking_id, transaction_id, flight_no, amount, date_of_travel, no_of_travellers, username) FROM stdin;
9	11	air249	3000	2019-12-01	1	rahulk
10	12	air249	12000	2019-12-01	2	rahulk
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.flights (flight_no, airline_name, source, destination, departure_time, arrival_time, price, no_of_seats_available, flight_type, arrival_date, departure_date) FROM stdin;
air151	AirIndia	Coimbatore	Delhi	08:00:00	10:12:00	7500	112	domestic	2019-12-01	2019-12-01
ind145	IndiGo	Coimbatore	Delhi	09:00:00	11:22:00	7550	152	domestic	2019-12-01	2019-12-01
ind146	IndiGo	Kochi	Trivandrum	17:00:00	16:20:00	3587	157	domestic	2019-12-01	2019-12-01
goa260	GoAir	Kannur	Banglore	13:00:00	14:15:00	2500	98	domestic	2019-12-01	2019-12-01
ind144	IndiGo	Banglore	Mumbai	09:00:00	10:45:00	2086	156	domestic	2019-12-01	2019-12-01
spi456	SpiceJet	Kochi	Chennai	07:00:00	09:18:00	2700	56	domestic	2019-12-01	2019-12-01
air705	AirIndia	Hyderabad	Shimla	01:00:00	11:30:00	9520	60	domestic	2019-12-01	2019-12-01
ind456	IndiGo	Trivandrum	Goa	23:00:00	02:10:00	5470	34	domestic	2019-12-02	2019-12-01
ind932	IndiGo	Goa	Delhi	14:00:00	17:25:00	7520	48	domestic	2019-12-01	2019-12-01
spi124	SpiceJet	Delhi	Chennai	04:00:00	07:45:00	6050	54	domestic	2019-12-01	2019-12-01
spi070	SpiceJet	Shimla	Banglore	05:00:00	10:20:00	3000	220	domestic	2019-12-01	2019-12-01
goa180	GoAir	Hyderabad	Banglore	04:00:00	06:50:00	2500	96	domestic	2019-12-01	2019-12-01
air804	AirIndia	Coimbatore	Delhi	15:00:00	20:25:00	7500	75	domestic	2019-12-01	2019-12-01
spi974	SpiceJet	Goa	Banglore	17:25:00	18:20:00	1250	60	domestic	2019-12-01	2019-12-01
tha023	Thai Airways International	Banglore	Dubai	23:50:00	04:10:00	38090	48	international	2019-12-02	2019-12-01
qat758	Qatar Airways	Delhi	Los Angeles	18:30:00	07:45:00	75800	39	international	2019-12-02	2019-12-01
emi456	Emirates	Kochi	Sydney	21:20:00	07:35:00	62832	114	international	2019-12-02	2019-12-01
tha630	Thai Airways International	Dubai	Singapore	20:55:00	11:15:00	35024	178	international	2019-12-01	2019-12-01
bri753	British Airways	London	Tokyo	13:55:00	10:30:00	50683	78	international	2019-12-02	2019-12-01
ind080	IndiGo	Hong kong	Banglore	08:50:00	12:45:00	21350	51	international	2019-12-01	2019-12-01
sin650	Singapore Airlines	New York	Cameron	20:55:00	11:10:00	148121	13	international	2019-12-02	2019-12-01
air249	AirIndia	Kochi	Trivandrum	18:00:00	18:30:00	3000	219	domestic	2019-12-01	2019-12-01
\.


--
-- Data for Name: registered_users; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.registered_users (user_id, username, password, name, email, phone) FROM stdin;
1	rahulk	rahulk	Rahul	rahul@gmail.com	9400538200
2	navi	navaneeth@123	Navaneeth S	navisk13@gmail.com	9852147622
3	varun	varun@007	Varun Sekhar	varun@gmail.com	9876548521
4	prajal	prajal@123	Prajal P	prajal@gmail.com	9745856632
5	sathyan	sathyan@123	Sathyan D	sathyan@gmail.com	7852301455
6	advaith	advaith@123	Advaith H	advaith@gmail.com	7896541252
7	arun	arun@123	Arun K	arun@gmail.com	6852122214
8	unni	unni@123	Unni K	unni@gmail.com	8524563222
9	vishnu	vishnu@123	Vishnu K	vishnu@gmail.com	8787875452
10	sreeram	sreeram@123	Sreeram P	sreeram@gmail.com	7533321145
11	sreeraj	sreeraj@123	Sreeraj S	sreeraj@gmail.com	9454581212
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.tickets (ticket_id, booking_id, person_name, dob, gender) FROM stdin;
43298	10	rahukl	2019-10-01	male
43299	10	rahulk	2019-10-17	male
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.transactions (transaction_id, wallet_id, amount, username) FROM stdin;
11	1	3000	rahulk
12	1	12000	rahulk
\.


--
-- Data for Name: wallet; Type: TABLE DATA; Schema: public; Owner: rahulk
--

COPY public.wallet (wallet_id, username, balance) FROM stdin;
2	navi	0
3	varun	0
4	prajal	0
5	sathyan	0
6	advaith	0
7	arun	0
8	unni	0
9	vishnu	0
10	sreeram	0
12	sreeraj	0
1	rahulk	85000
\.


--
-- Name: bookings_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulk
--

SELECT pg_catalog.setval('public.bookings_booking_id_seq', 10, true);


--
-- Name: registered_users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulk
--

SELECT pg_catalog.setval('public.registered_users_user_id_seq', 22, true);


--
-- Name: tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulk
--

SELECT pg_catalog.setval('public.tickets_ticket_id_seq', 43299, true);


--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulk
--

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 12, true);


--
-- Name: wallet_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulk
--

SELECT pg_catalog.setval('public.wallet_wallet_id_seq', 12, true);


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
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);


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
-- Name: bookings bookings_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_username_fkey FOREIGN KEY (username) REFERENCES public.registered_users(username) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tickets tickets_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(booking_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulk
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_username_fkey FOREIGN KEY (username) REFERENCES public.registered_users(username) ON UPDATE CASCADE ON DELETE CASCADE;


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

