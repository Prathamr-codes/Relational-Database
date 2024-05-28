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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    discovered_by character varying(100),
    perihelion_distance numeric NOT NULL,
    has_tail boolean NOT NULL,
    composition text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance integer NOT NULL,
    type character varying(50),
    has_black_hole boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius integer NOT NULL,
    has_water_ice boolean NOT NULL,
    orbital_period numeric,
    geological_activity text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    size integer NOT NULL,
    is_habitable boolean NOT NULL,
    orbit_period numeric,
    atmosphere_composition text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age numeric NOT NULL,
    is_main_sequence boolean NOT NULL,
    luminosity integer,
    color character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Edmond Halley', 0.586, true, 'Water, Carbon Dioxide');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Alan Hale and Thomas Bopp', 0.914, true, 'Water, Ammonia');
INSERT INTO public.comet VALUES (3, 'Encke', 'Pierre Méchain', 0.337, true, 'Water, Carbon Monoxide');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'Spiral', true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 'Spiral', true, 'Nearest spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 'Spiral', false, 'Part of the local group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, 'Spiral', true, 'Interacting galaxy pair');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 29000000, 'Spiral', true, 'Unusual galaxy with a large bulge');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 163000, 'Irregular', false, 'Satellite galaxy of the Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, false, 27.3, 'Inactive');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, 0.32, 'Inactive');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, 1.26, 'Inactive');
INSERT INTO public.moon VALUES (4, 'Io', 6, 1822, false, 1.77, 'Very active');
INSERT INTO public.moon VALUES (5, 'Europa', 6, 1561, true, 3.55, 'Active');
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 2634, false, 7.15, 'Inactive');
INSERT INTO public.moon VALUES (7, 'Callisto', 6, 2410, false, 16.69, 'Inactive');
INSERT INTO public.moon VALUES (8, 'Titan', 7, 2575, false, 15.95, 'Active');
INSERT INTO public.moon VALUES (9, 'Rhea', 7, 765, false, 4.52, 'Inactive');
INSERT INTO public.moon VALUES (10, 'Iapetus', 7, 735, false, 79.32, 'Inactive');
INSERT INTO public.moon VALUES (11, 'Mimas', 7, 396, false, 0.94, 'Inactive');
INSERT INTO public.moon VALUES (12, 'Enceladus', 7, 252, true, 1.37, 'Very active');
INSERT INTO public.moon VALUES (13, 'Tethys', 7, 531, false, 1.89, 'Inactive');
INSERT INTO public.moon VALUES (14, 'Dione', 7, 561, false, 2.74, 'Inactive');
INSERT INTO public.moon VALUES (15, 'Ariel', 8, 579, false, 2.52, 'Inactive');
INSERT INTO public.moon VALUES (16, 'Oberon', 8, 761, false, 13.46, 'Inactive');
INSERT INTO public.moon VALUES (17, 'Titania', 8, 789, false, 8.71, 'Inactive');
INSERT INTO public.moon VALUES (18, 'Umbriel', 8, 585, false, 4.14, 'Inactive');
INSERT INTO public.moon VALUES (19, 'Miranda', 8, 236, false, 1.41, 'Inactive');
INSERT INTO public.moon VALUES (20, 'Triton', 9, 1353, true, 5.88, 'Inactive');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 365.25, 'Nitrogen, Oxygen');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 1, false, 687, 'Carbon Dioxide, Nitrogen');
INSERT INTO public.planet VALUES (3, 'Venus', 1, 1, false, 224.7, 'Carbon Dioxide, Nitrogen');
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 0, false, 88, 'None');
INSERT INTO public.planet VALUES (5, 'Europa', 3, 0, false, 3.55, 'Oxygen');
INSERT INTO public.planet VALUES (6, 'Titan', 3, 0, false, 15.9, 'Nitrogen, Methane');
INSERT INTO public.planet VALUES (7, 'Ganymede', 3, 0, false, 7.15, 'Oxygen');
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 2, 2, true, 289.9, 'Unknown');
INSERT INTO public.planet VALUES (9, 'Gliese 581g', 3, 2, true, 37.0, 'Unknown');
INSERT INTO public.planet VALUES (10, 'Proxima b', 6, 1, true, 11.2, 'Unknown');
INSERT INTO public.planet VALUES (11, 'HD 40307 g', 2, 2, true, 198.7, 'Unknown');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 5, 1, true, 4.0, 'Unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.6, true, 1, 'Yellow');
INSERT INTO public.star VALUES (2, 'Sirius', 2, 0.24, true, 25, 'White');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8.0, false, 120000, 'Red');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 5.0, true, 2, 'Yellow');
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 1, 5.0, true, 1, 'Orange');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 4.85, true, 0, 'Red');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

