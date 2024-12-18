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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    area numeric(10,2),
    main_star text,
    distance_from_earth numeric(15,2),
    number_of_stars integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100),
    type text,
    distance_from_earth numeric(15,2),
    number_of_stars bigint NOT NULL
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
    planet_id integer,
    radius numeric(15,2),
    orbital_period numeric(10,4),
    distance_from_planet bigint
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
    star_id integer,
    type text,
    orbital_period numeric(10,4),
    radius numeric(15,2),
    distance_from_star numeric(10,4),
    has_life boolean
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
    galaxy_id integer,
    type text,
    mass numeric(10,4),
    luminosity numeric(10,4),
    temperature integer,
    constellation_id integer,
    is_visible_from_earth boolean
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 594.00, 'Betelgeuse', 1344.00, 2000);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 1280.00, 'Alioth', 81.00, 250);
INSERT INTO public.constellation VALUES (3, 'Andromeda', 722.00, 'Alpheratz', 2537.00, 150);
INSERT INTO public.constellation VALUES (4, 'Leo', 947.00, 'Regulus', 77.00, 300);
INSERT INTO public.constellation VALUES (5, 'Cassiopeia', 598.00, 'Schedar', 228.00, 100);
INSERT INTO public.constellation VALUES (6, 'Scorpius', 497.00, 'Antares', 600.00, 150);
INSERT INTO public.constellation VALUES (7, 'Sagittarius', 867.00, 'Kaus Australis', 800.00, 300);
INSERT INTO public.constellation VALUES (8, 'Cygnus', 804.00, 'Deneb', 1420.00, 1000);
INSERT INTO public.constellation VALUES (9, 'Taurus', 797.00, 'Aldebaran', 65.00, 200);
INSERT INTO public.constellation VALUES (10, 'Virgo', 1295.00, 'Spica', 260.00, 250);
INSERT INTO public.constellation VALUES (11, 'Pleiades', 6.00, 'Alcyone', 444.00, 500);
INSERT INTO public.constellation VALUES (12, 'Hercules', 1225.00, 'Rasalgethi', 1500.00, 100);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, 100000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000.00, 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2723000.00, 40000000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000.00, 100000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 31100000.00, 800000000000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 163000.00, 10000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.40, 27.3000, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.10, 0.3000, 9377);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.20, 1.3000, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.60, 1.7700, 421700);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.80, 3.5500, 670900);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.10, 7.1500, 1070000);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.30, 16.6900, 1882700);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2574.70, 15.9500, 1221870);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252.10, 1.3700, 238042);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198.20, 0.9400, 185539);
INSERT INTO public.moon VALUES (11, 'Oberon', 7, 761.40, 13.4600, 583520);
INSERT INTO public.moon VALUES (12, 'Titania', 7, 788.40, 8.7100, 436300);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 235.80, 1.4100, 129390);
INSERT INTO public.moon VALUES (14, 'Triton', 8, 1353.40, -5.8800, 354760);
INSERT INTO public.moon VALUES (15, 'Nereid', 8, 170.00, 360.1400, 5513400);
INSERT INTO public.moon VALUES (16, 'Proxima b-I', 9, 100.00, 0.0500, 10000);
INSERT INTO public.moon VALUES (17, 'Kepler-Moon', 10, 2000.00, 300.0000, 100000);
INSERT INTO public.moon VALUES (18, 'Pandora', 6, 80.00, 0.6200, 142000);
INSERT INTO public.moon VALUES (19, 'Epimetheus', 6, 58.10, 0.6900, 151422);
INSERT INTO public.moon VALUES (20, 'Dione', 6, 561.40, 2.7400, 377400);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.2400, 2439.70, 0.3900, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.6200, 6051.80, 0.7200, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1.0000, 6371.00, 1.0000, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 1.8800, 3389.50, 1.5200, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 11.8600, 69911.00, 5.2000, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 29.4600, 58232.00, 9.5800, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 84.0100, 25362.00, 19.2200, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 164.7900, 24622.00, 30.0500, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Terrestrial', 0.0500, 6371.00, 0.0500, false);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 2, 'Terrestrial', 385.0000, 16000.00, 1.0500, false);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 2, 'Super-Earth', 290.0000, 24000.00, 0.8500, false);
INSERT INTO public.planet VALUES (12, 'HD 209458b', 5, 'Gas Giant', 3.5200, 120000.00, 0.0500, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Mainn Sequence', 1.0000, 1.0000, 5778, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Main Sequence', 2.0200, 25.4000, 9940, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 11.6000, 126000.0000, 3500, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Proxima', 1, 'Red Dwarf', 0.1200, 0.0017, 3050, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Vega', 2, 'Main Sequence', 2.1000, 40.1200, 9602, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Rigel', 3, 'Blue Supergiant', 18.0000, 120000.0000, 11000, NULL, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 12, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

