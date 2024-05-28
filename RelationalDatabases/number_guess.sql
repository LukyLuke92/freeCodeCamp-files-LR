--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE game;
--
-- Name: game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE game OWNER TO freecodecamp;

\connect game

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
-- Name: scores; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scores (
    user_id integer NOT NULL,
    game_id integer NOT NULL,
    score integer
);


ALTER TABLE public.scores OWNER TO freecodecamp;

--
-- Name: scores_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scores_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scores_game_id_seq OWNER TO freecodecamp;

--
-- Name: scores_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scores_game_id_seq OWNED BY public.scores.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: scores game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores ALTER COLUMN game_id SET DEFAULT nextval('public.scores_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scores VALUES (6, 11, 9);
INSERT INTO public.scores VALUES (6, 12, 13);
INSERT INTO public.scores VALUES (7, 13, 353);
INSERT INTO public.scores VALUES (7, 14, 686);
INSERT INTO public.scores VALUES (8, 15, 15);
INSERT INTO public.scores VALUES (8, 16, 714);
INSERT INTO public.scores VALUES (7, 17, 28);
INSERT INTO public.scores VALUES (7, 18, 224);
INSERT INTO public.scores VALUES (7, 19, 759);
INSERT INTO public.scores VALUES (9, 20, 573);
INSERT INTO public.scores VALUES (9, 21, 815);
INSERT INTO public.scores VALUES (10, 22, 231);
INSERT INTO public.scores VALUES (10, 23, 167);
INSERT INTO public.scores VALUES (9, 24, 116);
INSERT INTO public.scores VALUES (9, 25, 764);
INSERT INTO public.scores VALUES (9, 26, 564);
INSERT INTO public.scores VALUES (11, 27, 644);
INSERT INTO public.scores VALUES (11, 28, 995);
INSERT INTO public.scores VALUES (12, 29, 942);
INSERT INTO public.scores VALUES (12, 30, 169);
INSERT INTO public.scores VALUES (11, 31, 572);
INSERT INTO public.scores VALUES (11, 32, 945);
INSERT INTO public.scores VALUES (11, 33, 257);
INSERT INTO public.scores VALUES (13, 34, 975);
INSERT INTO public.scores VALUES (13, 35, 583);
INSERT INTO public.scores VALUES (14, 36, 340);
INSERT INTO public.scores VALUES (14, 37, 449);
INSERT INTO public.scores VALUES (13, 38, 208);
INSERT INTO public.scores VALUES (13, 39, 351);
INSERT INTO public.scores VALUES (13, 40, 458);
INSERT INTO public.scores VALUES (15, 41, 516);
INSERT INTO public.scores VALUES (15, 42, 95);
INSERT INTO public.scores VALUES (16, 43, 613);
INSERT INTO public.scores VALUES (16, 44, 85);
INSERT INTO public.scores VALUES (15, 45, 556);
INSERT INTO public.scores VALUES (15, 46, 512);
INSERT INTO public.scores VALUES (15, 47, 529);
INSERT INTO public.scores VALUES (17, 48, 65);
INSERT INTO public.scores VALUES (17, 49, 252);
INSERT INTO public.scores VALUES (18, 50, 421);
INSERT INTO public.scores VALUES (18, 51, 234);
INSERT INTO public.scores VALUES (17, 52, 327);
INSERT INTO public.scores VALUES (17, 53, 863);
INSERT INTO public.scores VALUES (17, 54, 150);
INSERT INTO public.scores VALUES (19, 55, 628);
INSERT INTO public.scores VALUES (19, 56, 529);
INSERT INTO public.scores VALUES (20, 57, 428);
INSERT INTO public.scores VALUES (20, 58, 295);
INSERT INTO public.scores VALUES (19, 59, 152);
INSERT INTO public.scores VALUES (19, 60, 601);
INSERT INTO public.scores VALUES (19, 61, 149);
INSERT INTO public.scores VALUES (21, 62, 251);
INSERT INTO public.scores VALUES (21, 63, 199);
INSERT INTO public.scores VALUES (22, 64, 317);
INSERT INTO public.scores VALUES (22, 65, 277);
INSERT INTO public.scores VALUES (21, 66, 239);
INSERT INTO public.scores VALUES (21, 67, 414);
INSERT INTO public.scores VALUES (21, 68, 550);
INSERT INTO public.scores VALUES (23, 69, 5);
INSERT INTO public.scores VALUES (23, 70, 651);
INSERT INTO public.scores VALUES (24, 71, 658);
INSERT INTO public.scores VALUES (24, 72, 472);
INSERT INTO public.scores VALUES (23, 73, 979);
INSERT INTO public.scores VALUES (23, 74, 324);
INSERT INTO public.scores VALUES (23, 75, 312);
INSERT INTO public.scores VALUES (25, 76, 771);
INSERT INTO public.scores VALUES (25, 77, 800);
INSERT INTO public.scores VALUES (26, 78, 211);
INSERT INTO public.scores VALUES (26, 79, 939);
INSERT INTO public.scores VALUES (25, 80, 131);
INSERT INTO public.scores VALUES (25, 81, 203);
INSERT INTO public.scores VALUES (25, 82, 927);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (6, 'lukyluke');
INSERT INTO public.users VALUES (7, 'user_1716856141966');
INSERT INTO public.users VALUES (8, 'user_1716856141965');
INSERT INTO public.users VALUES (9, 'user_1716856185102');
INSERT INTO public.users VALUES (10, 'user_1716856185101');
INSERT INTO public.users VALUES (11, 'user_1716856201409');
INSERT INTO public.users VALUES (12, 'user_1716856201408');
INSERT INTO public.users VALUES (13, 'user_1716856210554');
INSERT INTO public.users VALUES (14, 'user_1716856210553');
INSERT INTO public.users VALUES (15, 'user_1716856241032');
INSERT INTO public.users VALUES (16, 'user_1716856241031');
INSERT INTO public.users VALUES (17, 'user_1716856266234');
INSERT INTO public.users VALUES (18, 'user_1716856266233');
INSERT INTO public.users VALUES (19, 'user_1716856287789');
INSERT INTO public.users VALUES (20, 'user_1716856287788');
INSERT INTO public.users VALUES (21, 'user_1716856296376');
INSERT INTO public.users VALUES (22, 'user_1716856296375');
INSERT INTO public.users VALUES (23, 'user_1716856328197');
INSERT INTO public.users VALUES (24, 'user_1716856328196');
INSERT INTO public.users VALUES (25, 'user_1716856348234');
INSERT INTO public.users VALUES (26, 'user_1716856348233');


--
-- Name: scores_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scores_game_id_seq', 82, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 26, true);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: scores scores_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

