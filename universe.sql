{\rtf1\ansi\ansicpg1252\cocoartf2758
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 --\
-- PostgreSQL database dump\
--\
\
-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)\
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)\
\
SET statement_timeout = 0;\
SET lock_timeout = 0;\
SET idle_in_transaction_session_timeout = 0;\
SET client_encoding = 'UTF8';\
SET standard_conforming_strings = on;\
SELECT pg_catalog.set_config('search_path', '', false);\
SET check_function_bodies = false;\
SET xmloption = content;\
SET client_min_messages = warning;\
SET row_security = off;\
\
DROP DATABASE universe;\
--\
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp\
--\
\
CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';\
\
\
ALTER DATABASE universe OWNER TO freecodecamp;\
\
\\connect universe\
\
SET statement_timeout = 0;\
SET lock_timeout = 0;\
SET idle_in_transaction_session_timeout = 0;\
SET client_encoding = 'UTF8';\
SET standard_conforming_strings = on;\
SELECT pg_catalog.set_config('search_path', '', false);\
SET check_function_bodies = false;\
SET xmloption = content;\
SET client_min_messages = warning;\
SET row_security = off;\
\
SET default_tablespace = '';\
\
SET default_table_access_method = heap;\
\
--\
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp\
--\
\
CREATE TABLE public.galaxy (\
    galaxy_id integer NOT NULL,\
    has_life boolean,\
    galaxy_types text,\
    name character varying(50) NOT NULL,\
    distance_from_earth_in_mly numeric\
);\
\
\
ALTER TABLE public.galaxy OWNER TO freecodecamp;\
\
--\
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp\
--\
\
CREATE SEQUENCE public.galaxy_galaxy_id_seq\
    AS integer\
    START WITH 1\
    INCREMENT BY 1\
    NO MINVALUE\
    NO MAXVALUE\
    CACHE 1;\
\
\
ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;\
\
--\
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp\
--\
\
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;\
\
\
--\
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp\
--\
\
CREATE TABLE public.moon (\
    moon_id integer NOT NULL,\
    planet_id integer,\
    has_life boolean,\
    description text,\
    name character varying(30) NOT NULL\
);\
\
\
ALTER TABLE public.moon OWNER TO freecodecamp;\
\
--\
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp\
--\
\
CREATE SEQUENCE public.moon_moon_id_seq\
    AS integer\
    START WITH 1\
    INCREMENT BY 1\
    NO MINVALUE\
    NO MAXVALUE\
    CACHE 1;\
\
\
ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;\
\
--\
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp\
--\
\
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;\
\
\
--\
-- Name: number_of_moons; Type: TABLE; Schema: public; Owner: freecodecamp\
--\
\
CREATE TABLE public.number_of_moons (\
    planet_id integer NOT NULL,\
    num_moons integer NOT NULL,\
    order_from_sun integer,\
    name character varying(30),\
    number_of_moons_id integer NOT NULL\
);\
\
\
ALTER TABLE public.number_of_moons OWNER TO freecodecamp;\
\
--\
-- Name: number_of_moons_number_of_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp\
--\
\
CREATE SEQUENCE public.number_of_moons_number_of_moons_id_seq\
    AS integer\
    START WITH 1\
    INCREMENT BY 1\
    NO MINVALUE\
    NO MAXVALUE\
    CACHE 1;\
\
\
ALTER TABLE public.number_of_moons_number_of_moons_id_seq OWNER TO freecodecamp;\
\
--\
-- Name: number_of_moons_number_of_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp\
--\
\
ALTER SEQUENCE public.number_of_moons_number_of_moons_id_seq OWNED BY public.number_of_moons.number_of_moons_id;\
\
\
--\
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp\
--\
\
CREATE TABLE public.planet (\
    planet_id integer NOT NULL,\
    name character varying(30) NOT NULL,\
    has_life boolean,\
    distance_from_earth_in_au numeric,\
    star_id integer\
);\
\
\
ALTER TABLE public.planet OWNER TO freecodecamp;\
\
--\
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp\
--\
\
CREATE SEQUENCE public.planet_planet_id_seq\
    AS integer\
    START WITH 1\
    INCREMENT BY 1\
    NO MINVALUE\
    NO MAXVALUE\
    CACHE 1;\
\
\
ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;\
\
--\
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp\
--\
\
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;\
\
\
--\
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp\
--\
\
CREATE TABLE public.star (\
    star_id integer NOT NULL,\
    has_life boolean,\
    distance_from_earth_in_ly numeric,\
    galaxy_id integer NOT NULL,\
    name character varying(30) NOT NULL\
);\
\
\
ALTER TABLE public.star OWNER TO freecodecamp;\
\
--\
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp\
--\
\
CREATE SEQUENCE public.star_star_id_seq\
    AS integer\
    START WITH 1\
    INCREMENT BY 1\
    NO MINVALUE\
    NO MAXVALUE\
    CACHE 1;\
\
\
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;\
\
--\
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp\
--\
\
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;\
\
\
--\
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);\
\
\
--\
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);\
\
\
--\
-- Name: number_of_moons number_of_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.number_of_moons ALTER COLUMN number_of_moons_id SET DEFAULT nextval('public.number_of_moons_number_of_moons_id_seq'::regclass);\
\
\
--\
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);\
\
\
--\
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);\
\
\
--\
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp\
--\
\
INSERT INTO public.galaxy VALUES (2, false, 'Irr', 'Canis Major Dwarf', 0.025);\
INSERT INTO public.galaxy VALUES (3, false, 'dSph', 'Segue 1', 0.075);\
INSERT INTO public.galaxy VALUES (4, false, 'dSph/E7', 'Sagittarius Dwarf Sphr', 0.078);\
INSERT INTO public.galaxy VALUES (5, false, 'dSPH', 'Ursa Major II Dwarf', 0.098);\
INSERT INTO public.galaxy VALUES (1, true, 'SBbc', 'Milky Way', 0.0265);\
INSERT INTO public.galaxy VALUES (6, false, 'dSPH', 'Segue 2', 0.114);\
\
\
--\
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp\
--\
\
INSERT INTO public.moon VALUES (1, 2, false, 'One of the two moons of Mars - diameter of 22.2 km', 'Phobos');\
INSERT INTO public.moon VALUES (2, 2, false, 'One of the two moons of Mars - diameter of 12.6 km', 'Deimos');\
INSERT INTO public.moon VALUES (3, 9, false, 'The only moon of Earth - diameter of 3,474.8 km', 'Moon');\
INSERT INTO public.moon VALUES (4, 4, false, 'One of 95 moons of Jupiter - diameter of 3,643.2 km', 'Io');\
INSERT INTO public.moon VALUES (5, 4, false, 'One of 95 moons of Jupiter - diameter of 3,121.6 km - could sustain life!', 'Europa');\
INSERT INTO public.moon VALUES (6, 4, false, 'One of 95 moons of Jupiter - diameter of 5,268.2 km', 'Ganymede');\
INSERT INTO public.moon VALUES (7, 4, false, 'One of 95 moons of Jupiter - diameter of 4,820.6 km', 'Callisto');\
INSERT INTO public.moon VALUES (8, 4, false, 'One of 95 moons of Jupiter - diameter of 9 km', 'Themisto');\
INSERT INTO public.moon VALUES (9, 5, false, 'One of at least 146 moons of Saturn - diameter of 396 km', 'Mimas');\
INSERT INTO public.moon VALUES (11, 5, false, 'One of at least 146 moons of Saturn - diameter of 1,062 km', 'Tethys');\
INSERT INTO public.moon VALUES (12, 5, false, 'One of at least 146 moons of Saturn - diameter of 1,123 km', 'Dione');\
INSERT INTO public.moon VALUES (10, 5, false, 'One of at least 146 moons of Saturn - diameter of 1,062 km - could sustain life!', 'Enceladus');\
INSERT INTO public.moon VALUES (13, 5, false, 'One of at least 146 moons of Saturn - diameter of 1,123 km', 'Rhea');\
INSERT INTO public.moon VALUES (14, 5, false, 'One of at least 146 moons of Saturn - diameter of 5,149 km', 'Titan');\
INSERT INTO public.moon VALUES (15, 5, false, 'One of at least 146 moons of Saturn - diameter of 1,470 km', 'Iapetus');\
INSERT INTO public.moon VALUES (16, 6, false, 'One of the 28 moons of Uranus - diameter of 472 km', 'Miranda');\
INSERT INTO public.moon VALUES (17, 6, false, 'One of the 28 moons of Uranus - diameter of 1,158 km', 'Ariel');\
INSERT INTO public.moon VALUES (18, 6, false, 'One of the 28 moons of Uranus - diameter of 1,169 km', 'Umbriel');\
INSERT INTO public.moon VALUES (19, 6, false, 'One of the 28 moons of Uranus - diameter of 1,577 km', 'Titania');\
INSERT INTO public.moon VALUES (20, 6, false, 'One of the 28 moons of Uranus - diameter of 1,523 km', 'Oberon');\
\
\
--\
-- Data for Name: number_of_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp\
--\
\
INSERT INTO public.number_of_moons VALUES (3, 0, 1, 'Mercury', 1);\
INSERT INTO public.number_of_moons VALUES (1, 0, 2, 'Venus', 2);\
INSERT INTO public.number_of_moons VALUES (9, 1, 3, 'Earth', 3);\
INSERT INTO public.number_of_moons VALUES (2, 2, 4, 'Mars', 4);\
INSERT INTO public.number_of_moons VALUES (4, 95, 5, 'Jupiter', 5);\
INSERT INTO public.number_of_moons VALUES (5, 146, 6, 'Saturn', 6);\
INSERT INTO public.number_of_moons VALUES (6, 28, 7, 'Uranus', 7);\
INSERT INTO public.number_of_moons VALUES (8, 16, 8, 'Neptune', 8);\
\
\
--\
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp\
--\
\
INSERT INTO public.planet VALUES (1, 'Venus', false, 0.266, 5);\
INSERT INTO public.planet VALUES (2, 'Mars', false, 0.372, 5);\
INSERT INTO public.planet VALUES (3, 'Mercury', false, 0.552, 5);\
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 3.597, 5);\
INSERT INTO public.planet VALUES (5, 'Saturn', false, 8.050, 5);\
INSERT INTO public.planet VALUES (6, 'Uranus', false, 17.292, 5);\
INSERT INTO public.planet VALUES (7, 'Pluto', false, 28.699, 5);\
INSERT INTO public.planet VALUES (8, 'Neptune', false, 28.817, 5);\
INSERT INTO public.planet VALUES (9, 'Earth', true, 0, 5);\
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', false, 266877.3, 1);\
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', false, 266877.3, 1);\
INSERT INTO public.planet VALUES (12, 'Candidate 1', false, 274725.6, 2);\
\
\
--\
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp\
--\
\
INSERT INTO public.star VALUES (1, false, 4.2, 1, 'Proxima Centauri');\
INSERT INTO public.star VALUES (2, false, 4.3441, 1, 'Rigil Kentaurus');\
INSERT INTO public.star VALUES (3, false, 4.3441, 1, 'Toliman');\
INSERT INTO public.star VALUES (4, false, 5.9629, 1, 'Barnard''s Star');\
INSERT INTO public.star VALUES (5, true, 0.0000158, 1, 'Sun');\
INSERT INTO public.star VALUES (6, false, 7.8558, 1, 'Wolf 359');\
\
\
--\
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp\
--\
\
SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);\
\
\
--\
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp\
--\
\
SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);\
\
\
--\
-- Name: number_of_moons_number_of_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp\
--\
\
SELECT pg_catalog.setval('public.number_of_moons_number_of_moons_id_seq', 8, true);\
\
\
--\
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp\
--\
\
SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);\
\
\
--\
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp\
--\
\
SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);\
\
\
--\
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.galaxy\
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);\
\
\
--\
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.galaxy\
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);\
\
\
--\
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.moon\
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);\
\
\
--\
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.moon\
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);\
\
\
--\
-- Name: galaxy name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.galaxy\
    ADD CONSTRAINT name_unq UNIQUE (name);\
\
\
--\
-- Name: number_of_moons number_of_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.number_of_moons\
    ADD CONSTRAINT number_of_moons_pkey PRIMARY KEY (number_of_moons_id);\
\
\
--\
-- Name: number_of_moons number_of_moons_planet_id_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.number_of_moons\
    ADD CONSTRAINT number_of_moons_planet_id_unq UNIQUE (planet_id);\
\
\
--\
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.planet\
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);\
\
\
--\
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.planet\
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);\
\
\
--\
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.star\
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);\
\
\
--\
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.star\
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);\
\
\
--\
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.moon\
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);\
\
\
--\
-- Name: number_of_moons number_of_moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.number_of_moons\
    ADD CONSTRAINT number_of_moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);\
\
\
--\
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.planet\
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);\
\
\
--\
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp\
--\
\
ALTER TABLE ONLY public.star\
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);\
\
\
--\
-- PostgreSQL database dump complete\
--}