--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: temp_games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.temp_games (
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner character varying(50) NOT NULL,
    opponent character varying(50) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.temp_games OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.games (game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals) FROM stdin;
1697	2018	Final	640	647	4	2
1698	2018	Third Place	630	633	2	0
1699	2018	Semi-Final	647	633	2	1
1700	2018	Semi-Final	640	630	1	0
1701	2018	Quarter-Final	647	637	3	2
1702	2018	Quarter-Final	633	625	2	0
1703	2018	Quarter-Final	630	638	2	1
1704	2018	Quarter-Final	640	631	2	0
1705	2018	Eighth-Final	633	627	2	1
1706	2018	Eighth-Final	625	646	1	0
1707	2018	Eighth-Final	630	636	3	2
1708	2018	Eighth-Final	638	639	2	0
1709	2018	Eighth-Final	647	645	2	1
1710	2018	Eighth-Final	637	643	2	1
1711	2018	Eighth-Final	631	626	2	1
1712	2018	Eighth-Final	640	644	4	3
1713	2014	Final	632	644	1	0
1714	2014	Third Place	642	638	3	0
1715	2014	Semi-Final	644	642	1	0
1716	2014	Semi-Final	632	638	7	1
1717	2014	Quarter-Final	642	648	1	0
1718	2014	Quarter-Final	644	630	1	0
1719	2014	Quarter-Final	638	627	2	1
1720	2014	Quarter-Final	632	640	1	0
1721	2014	Eighth-Final	638	635	2	1
1722	2014	Eighth-Final	627	631	2	0
1723	2014	Eighth-Final	640	629	2	0
1724	2014	Eighth-Final	632	628	2	1
1725	2014	Eighth-Final	642	639	2	1
1726	2014	Eighth-Final	648	634	2	1
1727	2014	Eighth-Final	644	646	1	0
1728	2014	Eighth-Final	630	641	2	1
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.teams (team_id, name) FROM stdin;
625	Sweden
626	Portugal
627	Colombia
628	Algeria
629	Nigeria
630	Belgium
631	Uruguay
632	Germany
633	England
634	Greece
635	Chile
636	Japan
637	Russia
638	Brazil
639	Mexico
640	France
641	United States
642	Netherlands
643	Spain
644	Argentina
645	Denmark
646	Switzerland
647	Croatia
648	Costa Rica
\.


--
-- Data for Name: temp_games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.temp_games (year, round, winner, opponent, winner_goals, opponent_goals) FROM stdin;
2018	Final	France	Croatia	4	2
2018	Third Place	Belgium	England	2	0
2018	Semi-Final	Croatia	England	2	1
2018	Semi-Final	France	Belgium	1	0
2018	Quarter-Final	Croatia	Russia	3	2
2018	Quarter-Final	England	Sweden	2	0
2018	Quarter-Final	Belgium	Brazil	2	1
2018	Quarter-Final	France	Uruguay	2	0
2018	Eighth-Final	England	Colombia	2	1
2018	Eighth-Final	Sweden	Switzerland	1	0
2018	Eighth-Final	Belgium	Japan	3	2
2018	Eighth-Final	Brazil	Mexico	2	0
2018	Eighth-Final	Croatia	Denmark	2	1
2018	Eighth-Final	Russia	Spain	2	1
2018	Eighth-Final	Uruguay	Portugal	2	1
2018	Eighth-Final	France	Argentina	4	3
2014	Final	Germany	Argentina	1	0
2014	Third Place	Netherlands	Brazil	3	0
2014	Semi-Final	Argentina	Netherlands	1	0
2014	Semi-Final	Germany	Brazil	7	1
2014	Quarter-Final	Netherlands	Costa Rica	1	0
2014	Quarter-Final	Argentina	Belgium	1	0
2014	Quarter-Final	Brazil	Colombia	2	1
2014	Quarter-Final	Germany	France	1	0
2014	Eighth-Final	Brazil	Chile	2	1
2014	Eighth-Final	Colombia	Uruguay	2	0
2014	Eighth-Final	France	Nigeria	2	0
2014	Eighth-Final	Germany	Algeria	2	1
2014	Eighth-Final	Netherlands	Mexico	2	1
2014	Eighth-Final	Costa Rica	Greece	2	1
2014	Eighth-Final	Argentina	Switzerland	1	0
2014	Eighth-Final	Belgium	United States	2	1
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 1728, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 648, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_games_team; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_team FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_games_team_opponent; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_team_opponent FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

