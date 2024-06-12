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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_galaxies integer
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_stars_in_bilions integer,
    cluster_id integer NOT NULL,
    type character varying(30)
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
    name character varying(30) NOT NULL,
    habitable boolean,
    radius_in_km numeric,
    planet_id integer NOT NULL,
    discovery_status text
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
    name character varying(30) NOT NULL,
    number_of_moons integer,
    habitable boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    number_of_planets integer,
    galaxy_id integer NOT NULL,
    temperature_in_kelvin integer
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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


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
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Virgo Supercluster', 150);
INSERT INTO public.cluster VALUES (2, 'Bullet Cluster', 1200);
INSERT INTO public.cluster VALUES (3, 'El Gordo', 3000);
INSERT INTO public.cluster VALUES (4, 'Musket Ball', 1500);
INSERT INTO public.cluster VALUES (5, 'Abell 2744', 5000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 1, 'barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, 1, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 100, 1, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'The Southern Pinwheel', 40, 1, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Messier 84', 400, 1, 'elliptical');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 1000, 1, 'elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', false, 22, 4, 'Discovered');
INSERT INTO public.moon VALUES (3, 'Deimos', false, 13, 4, 'Discovered');
INSERT INTO public.moon VALUES (1, 'Moon', false, 1737, 3, 'Discovered');
INSERT INTO public.moon VALUES (4, 'Europa', false, 1560, 5, 'Discovered');
INSERT INTO public.moon VALUES (5, 'Io', false, 1821, 5, 'Discovered');
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 2634, 5, 'Discovered');
INSERT INTO public.moon VALUES (7, 'Callisto', false, 2410, 5, 'Discovered');
INSERT INTO public.moon VALUES (8, 'Enceladus', false, 504, 6, 'Discovered');
INSERT INTO public.moon VALUES (9, 'Tethys', false, 1062, 6, 'Discovered');
INSERT INTO public.moon VALUES (10, 'Ephimetheus', false, 116, 6, 'Discovered');
INSERT INTO public.moon VALUES (11, 'Mimas', false, 396, 6, 'Discovered');
INSERT INTO public.moon VALUES (12, 'Hyperion', false, 270, 6, 'Discovered');
INSERT INTO public.moon VALUES (13, 'Rhea', false, 1527, 6, 'Discovered');
INSERT INTO public.moon VALUES (14, 'Dione', false, 1122, 6, 'Discovered');
INSERT INTO public.moon VALUES (15, 'Iapetus', false, 1469, 6, 'Discovered');
INSERT INTO public.moon VALUES (16, 'Titan', false, 5149, 6, 'Discovered');
INSERT INTO public.moon VALUES (17, 'Titania', false, 1578, 7, 'Discovered');
INSERT INTO public.moon VALUES (18, 'Oberon', false, 1522, 7, 'Discovered');
INSERT INTO public.moon VALUES (19, 'Puck', false, 150, 7, 'Discovered');
INSERT INTO public.moon VALUES (20, 'Umbriel', false, 1200, 7, 'Discovered');
INSERT INTO public.moon VALUES (21, 'Ariel', false, 579, 7, 'Discovered');
INSERT INTO public.moon VALUES (22, 'Triton', false, 1680, 8, 'Discovered');
INSERT INTO public.moon VALUES (23, 'Proteus', false, 420, 8, 'Discovered');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, false, 1);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', NULL, false, 3);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', NULL, false, 3);
INSERT INTO public.planet VALUES (11, 'Gliese 876 d', NULL, false, 4);
INSERT INTO public.planet VALUES (12, 'Gliese 876 c', NULL, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Solar System', 8, 1, 6000);
INSERT INTO public.star VALUES (2, 'Betelgeuse', NULL, 1, 3500);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 5, 1, 5790);
INSERT INTO public.star VALUES (4, 'Gliese 876', 4, 1, 3473);
INSERT INTO public.star VALUES (5, 'Wolf 1061', 3, 1, 3342);
INSERT INTO public.star VALUES (6, 'Teegardens Star', 3, 1, 2637);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


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
-- Name: galaxy fk_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

