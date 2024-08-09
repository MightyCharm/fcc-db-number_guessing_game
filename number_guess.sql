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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_data (
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.user_data OWNER TO freecodecamp;

--
-- Data for Name: user_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_data VALUES ('user_1723227699814', 2, 198);
INSERT INTO public.user_data VALUES ('user_1723227699815', 5, 369);
INSERT INTO public.user_data VALUES ('user_1723227730328', 2, 105);
INSERT INTO public.user_data VALUES ('user_1723227730329', 5, 540);
INSERT INTO public.user_data VALUES ('user_1723227775530', 2, 241);
INSERT INTO public.user_data VALUES ('user_1723226528299', 2, 734);
INSERT INTO public.user_data VALUES ('user_1723227775531', 5, 18);
INSERT INTO public.user_data VALUES ('user_1723226528300', 5, 273);
INSERT INTO public.user_data VALUES ('user_1723226806456', 2, 80);
INSERT INTO public.user_data VALUES ('user_1723226806457', 5, 140);
INSERT INTO public.user_data VALUES ('user_1723226952031', 2, 367);
INSERT INTO public.user_data VALUES ('user_1723226952032', 5, 343);
INSERT INTO public.user_data VALUES ('Bob', 1, 9);
INSERT INTO public.user_data VALUES ('Thomas', 2, 7);
INSERT INTO public.user_data VALUES ('user_1723227674958', 2, 279);
INSERT INTO public.user_data VALUES ('user_1723227674959', 5, 40);


--
-- PostgreSQL database dump complete
--

