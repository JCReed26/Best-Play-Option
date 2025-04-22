--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;



--- 
--- NAME: users; Type: TABLE; Schema: userID, username, password, playdata
---

CREATE TABLE public.users (
    userid int,
    username varchar(30) not null, 
    password varchar(30) not null, 
    email varchar(30),
    playdata varchar(10000) ARRAY,
    primary key (userid)
);

ALTER TABLE public.users OWNER TO postgres;

--
-- Name: quarterbackdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quarterbackdata (
    rank character varying(100),
    team_name character varying(100),
    player_name character varying(100),
    age character varying(100),
    "position" character varying(100),
    games_played character varying(100),
    games_started character varying(100),
    passes_completed character varying(100),
    passes_attempted character varying(100),
    completion_percentage character varying(100),
    passing_yards character varying(100),
    passing_touchdowns character varying(100),
    interceptions character varying(100),
    interception_percentage character varying(100),
    first_downs character varying(100),
    passing_success_rate character varying(100),
    longest_completed_pass character varying(100),
    average_yards_per_pass_attempt character varying(100),
    average_yards_gained_per_pass_completion character varying(100),
    average_yards_gained_per_game character varying(100),
    passer_rating character varying(100),
    quarterback_rating character varying(100),
    times_sacked character varying(100),
    yards_lost_from_sacks character varying(100)
);


ALTER TABLE public.quarterbackdata OWNER TO postgres;

--
-- Name: rushingreceivingdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rushingreceivingdata (
    rank character varying(100),
    team_name character varying(100),
    player_name character varying(100),
    age character varying(100),
    "position" character varying(100),
    games_played character varying(100),
    games_started character varying(100),
    rushing_attempts character varying(100),
    rushing_yards character varying(100),
    rushing_touchdowns character varying(100),
    first_downs_rushing character varying(100),
    rushing_success_rate character varying(100),
    longest_rushing_attempt character varying(100),
    average_rushing_yards_per_attempt character varying(100),
    average_rushing_yards_per_game character varying(100),
    average_rushing_attempts_per_game character varying(100),
    pass_targets character varying(100),
    receptions character varying(100),
    receiving_yards character varying(100),
    average_receiving_yards_per_reception character varying(100),
    receiving_touchdowns character varying(100),
    first_downs_receiving character varying(100),
    receiving_success_rate character varying(100),
    longest_reception character varying(100),
    average_receptions_per_game character varying(100),
    average_receiving_yards_per_game character varying(100),
    catch_percentage character varying(100),
    average_receiving_yards_per_target character varying(100),
    touches character varying(100),
    average_yards_per_touch character varying(100),
    yards_from_scrimmage character varying(100),
    rushing_and_receiving_touchdowns character varying(100),
    fumbles character varying(100)
);


ALTER TABLE public.rushingreceivingdata OWNER TO postgres;

--
-- Data for Name: quarterbackdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quarterbackdata (rank, team_name, player_name, age, "position", games_played, games_started, passes_completed, passes_attempted, completion_percentage, passing_yards, passing_touchdowns, interceptions, interception_percentage, first_downs, passing_success_rate, longest_completed_pass, average_yards_per_pass_attempt, average_yards_gained_per_pass_completion, average_yards_gained_per_game, passer_rating, quarterback_rating, times_sacked, yards_lost_from_sacks) FROM stdin;
1	Bengals	Joe Burrow	28	QB	17	17	460	652	70.6	4918	43	9	1.4	253	53.6	70	7.5	10.7	289.3	108.5	74.7	48	278
2	Lions	Jared Goff	30	QB	17	17	390	539	72.4	4629	37	12	2.2	236	54.7	82	8.6	11.9	272.3	111.8	68.4	31	234
3	Buccaneers	Baker Mayfield	29	QB	17	17	407	570	71.4	4500	41	16	2.8	224	53.9	57	7.9	11.1	264.7	106.8	61.6	40	248
4	Seahawks	Geno Smith	34	QB	17	17	407	578	70.4	4320	21	15	2.6	209	48.4	71	7.5	10.6	254.1	93.2	53.8	50	338
5	Vikings	Sam Darnold	27	QB	17	17	361	545	66.2	4319	35	12	2.2	207	47.7	97	7.9	12	254.1	102.5	60.4	48	335
6	Ravens	Lamar Jackson	27	QB	17	17	316	474	66.7	4172	41	4	0.8	198	51.3	84	8.8	13.2	245.4	119.6	77.3	23	149
7	Chiefs	Patrick Mahomes	29	QB	16	16	392	581	67.5	3928	26	11	1.9	214	50.7	54	6.8	10	245.5	93.5	67.6	36	239
8	Jets	Aaron Rodgers	41	QB	17	17	368	584	63	3897	28	11	1.9	192	43.9	71	6.7	10.6	229.2	90.5	48	40	302
9	Chargers	Justin Herbert	26	QB	17	17	332	504	65.9	3870	23	3	0.6	175	44.4	66	7.7	11.7	227.6	101.7	64.8	41	244
10	49ers	Brock Purdy	25	QB	15	15	300	455	65.9	3864	20	12	2.6	178	49.4	76	8.5	12.9	257.6	96.1	67.9	31	156
11	Cardinals	Kyler Murray	27	QB	17	17	372	541	68.8	3851	21	11	2	191	51.7	60	7.1	10.4	226.5	93.5	66.5	30	220
12	Broncos	Bo Nix	24	QB	17	17	376	567	66.3	3775	29	12	2.1	170	43.7	93	6.7	10	222.1	93.3	56.8	24	198
13	Rams	Matthew Stafford	36	QB	16	16	340	517	65.8	3762	20	8	1.5	176	50.1	69	7.3	11.1	235.1	93.7	64.7	28	213
14	Bills	Josh Allen	28	QB	17	17	307	483	63.6	3731	28	6	1.2	173	49.1	64	7.7	12.2	219.5	101.4	77.3	14	63
15	Texans	C.J. Stroud	23	QB	17	17	336	532	63.2	3727	20	12	2.3	187	43	67	7	11.1	219.2	87	49.8	52	408
16	Commanders	Jayden Daniels	24	QB	17	17	331	480	69	3568	25	9	1.9	170	47.1	86	7.4	10.8	209.9	100.1	70.6	47	238
17	Bears	Caleb Williams	23	QB	17	17	351	562	62.5	3541	20	6	1.1	171	40.3	47	6.3	10.1	208.3	87.8	46.7	68	466
18	Falcons	Kirk Cousins	36	QB	14	14	303	453	66.9	3508	18	16	3.5	163	46.4	60	7.7	11.6	250.6	88.6	50.4	28	201
19	Packers	Jordan Love	26	QB	15	15	268	425	63.1	3389	25	11	2.6	151	48.3	70	8	12.6	225.9	96.7	69.3	14	95
20	Eagles	Jalen Hurts	26	QB	15	15	248	361	68.7	2903	18	5	1.4	139	46.6	67	8	11.7	193.5	103.7	65.6	38	271
21	Dolphins	Tua Tagovailoa	26	QB	11	11	291	399	72.9	2867	19	7	1.8	161	51.9	80	7.2	9.9	260.6	101.4	60.3	21	154
22	Steelers	Russell Wilson	36	QB	11	11	214	336	63.7	2482	16	5	1.5	112	43.6	46	7.4	11.6	225.6	95.6	51.3	33	219
23	Panthers	Bryce Young	23	QB	14	12	234	384	60.9	2403	15	9	2.3	117	39	83	6.3	10.3	171.6	82.2	54.1	29	186
24	Patriots	Drake Maye	22	QB	13	12	225	338	66.6	2276	15	10	3	112	46	40	6.7	10.1	175.1	88.1	58.6	34	229
25	Saints	Derek Carr	33	QB	10	10	189	279	67.7	2145	15	5	1.8	93	45.3	71	7.7	11.3	214.5	101	63.4	8	48
26	Browns	Jameis Winston	30	QB	12	7	181	296	61.1	2121	13	12	4.1	103	44.1	89	7.2	11.7	176.8	80.6	55.6	24	130
27	Titans	Will Levis	25	QB	12	12	190	301	63.1	2091	13	12	4	86	36.5	98	6.9	11	174.3	81.4	27.8	41	233
28	Giants	Daniel Jones	27	QB	10	10	216	341	63.3	2070	8	7	2.1	106	43	43	6.1	9.6	207	79.4	47.8	29	172
29	Jaguars	Trevor Lawrence	25	QB	10	10	172	284	60.6	2045	11	7	2.5	97	45.4	85	7.2	11.9	204.5	85.2	59.5	18	140
30	Raiders	Gardner Minshew II	28	QB	10	9	203	306	66.3	2013	9	10	3.3	106	44.2	57	6.6	9.9	201.3	81	38.1	29	164
31	Cowboys	Dak Prescott	31	QB	8	8	185	286	64.7	1978	11	8	2.8	87	45.3	65	6.9	10.7	247.3	86	45.3	21	112
32	Cowboys	Cooper Rush	31	QB	12	8	187	308	60.7	1844	12	5	1.6	92	42.4	64	6	9.9	153.7	83.8	41	13	95
33	Colts	Anthony Richardson	22	QB	11	11	126	264	47.7	1814	8	12	4.5	73	36	69	6.9	14.4	164.9	61.6	47.4	14	115
34	Colts	Joe Flacco	39	QB	8	6	162	248	65.3	1761	12	7	2.8	87	46.2	65	7.1	10.9	220.1	90.5	53.4	18	123
35	Jaguars	Mac Jones	26	QB	10	7	171	262	65.3	1672	8	8	3.1	77	42.8	62	6.4	9.8	167.2	80.5	39.8	14	100
36	Raiders	Aidan O'Connell	26	QB	9	7	154	243	63.4	1612	8	4	1.6	78	47.8	58	6.6	10.5	179.1	86.7	49.4	10	82
37	Titans	Mason Rudolph	29	QB	8	5	146	228	64	1530	9	9	3.9	78	49	47	6.7	10.5	191.3	80.1	55.5	11	71
38	Saints	Spencer Rattler	24	QB	7	6	130	228	57	1317	4	5	2.2	62	34.8	41	5.8	10.1	188.1	70.4	40.3	22	136
39	Browns	Deshaun Watson	29	QB	7	7	137	216	63.4	1148	5	3	1.4	49	33.3	35	5.3	8.4	164	79	23.4	33	191
40	Steelers	Justin Fields	25	QB	10	6	106	161	65.8	1106	5	1	0.6	45	42.9	55	6.9	10.4	110.6	93.3	50.8	16	124
41	Giants	Drew Lock	28	QB	8	5	107	181	59.1	1071	6	5	2.8	45	39.9	59	5.9	10	133.9	75.5	46.4	12	88
42	Panthers	Andy Dalton	37	QB	6	5	106	160	66.3	989	7	6	3.8	50	40.7	39	6.2	9.3	164.8	82	55.4	7	37
43	Dolphins	Tyler Huntley	26	QB	5	5	86	133	64.7	829	3	3	2.3	45	40.5	25	6.2	9.6	165.8	80.1	35.2	15	92
44	Patriots	Jacoby Brissett	32	QB	8	5	95	161	59	826	2	1	0.6	41	35.8	50	5.1	8.7	103.3	74.2	44.8	18	119
45	Falcons	Michael Penix	24	QB	5	3	61	105	58.1	775	3	3	2.9	35	42.2	42	7.4	12.7	155	78.9	51	4	14
46	Packers	Malik Willis	25	QB	7	2	40	54	74.1	550	3	0	0	20	37.1	51	10.2	13.8	78.6	124.8	79.6	8	37
47	Raiders	Desmond Ridder	25	QB	6	1	52	85	61.2	458	2	2	2.4	24	42.1	28	5.4	8.8	76.3	73.6	28	10	64
48	Browns	Dorian Thompson-Robinson	25	QB	7	2	61	118	51.7	440	0	6	5.1	20	27.8	29	3.7	7.2	62.9	39.5	19.4	8	47
49	Commanders	Marcus Mariota	31	QB	3	0	34	44	77.3	364	4	0	0	22	55.3	29	8.3	10.7	121.3	131.2	87.8	3	29
50	49ers	Joshua Dobbs	29	QB	2	1	32	47	68.1	361	2	2	4.3	18	55.1	36	7.7	11.3	180.5	87.3	37.4	2	28
51	Rams	Jimmy Garoppolo	33	QB	1	1	27	41	65.9	334	2	1	2.4	16	50	50	8.1	12.4	334	97	48.3	3	15
52	Eagles	Tanner McKee	24	QB	2	1	30	45	66.7	323	4	0	0	17	48.9	25	7.2	10.8	161.5	117.2	68.5	2	17
53	Eagles	Kenny Pickett	26	QB	5	1	25	42	59.5	291	2	1	2.4	12	41.3	49	6.9	11.6	58.2	86.5	75.7	4	33
54	Dolphins	Tim Boyle	30	QB	2	0	15	26	57.7	153	0	0	0	7	40.7	30	5.9	10.2	76.5	74.7	\N	1	9
54	Giants	Tim Boyle	30	QB	1	0	12	24	50	123	1	1	4.2	4	36	25	5.1	10.3	123	61.6	\N	1	2
55	Cowboys	Trey Lance	24	QB	4	1	25	41	61	266	0	1	2.4	13	40	33	6.5	10.6	66.5	69.8	38.3	4	23
56	Giants	Tommy DeVito	26	QB	3	2	31	44	70.5	257	0	0	0	15	46	23	5.8	8.3	85.7	85.1	27	6	31
57	Patriots	Joe Milton	24	QB	1	0	22	29	75.9	241	1	0	0	14	58.6	48	8.3	11	241	111.4	72.4	0	0
58	Saints	Jake Haener	25	QB	8	1	18	39	46.2	226	1	1	2.6	10	31.1	36	5.8	12.6	28.3	62.6	14.4	6	55
59	Texans	Davis Mills	26	QB	4	0	20	36	55.6	212	0	0	0	9	36.8	25	5.9	10.6	53	72.9	67.9	2	18
60	49ers	Brandon Allen	32	QB	3	1	17	30	56.7	199	1	2	6.7	8	37.5	31	6.6	11.7	66.3	60.3	34.4	2	2
61	Dolphins	Skylar Thompson	27	QB	3	1	21	33	63.6	187	0	0	0	8	38.5	22	5.7	8.9	62.3	78.7	3.9	6	44
62	Bills	Mitchell Trubisky	30	QB	9	0	19	26	73.1	179	2	0	0	7	42.3	69	6.9	9.4	19.9	117.3	61.1	0	0
63	Browns	Bailey Zappe	25	QB	1	1	16	31	51.6	170	1	2	6.5	8	34.4	30	5.5	10.6	170	51.8	19.6	1	5
64	Jets	Tyrod Taylor	35	QB	2	0	17	22	77.3	119	3	0	0	9	63.6	20	5.4	7	59.5	128.6	95.6	0	0
65	Chiefs	Carson Wentz	32	QB	3	1	12	19	63.2	118	0	0	0	5	26.1	25	6.2	9.8	39.3	80.6	22.9	4	22
66	Lions	Hendon Hooker	26	QB	3	0	6	9	66.7	62	0	0	0	3	40	21	6.9	10.3	20.7	86.3	42.6	1	9
67	Vikings	Nick Mullens	29	QB	4	0	2	2	100	38	0	0	0	2	100	24	19	19	9.5	118.7	97.8	0	0
68	Seahawks	Jaxon Smith-Njigba	22	WR	17	16	1	1	100	35	0	0	0	1	100	35	35	35	2.1	118.7	100	0	0
69	Raiders	AJ Cole III	29	P	17	0	1	1	100	34	0	0	0	1	100	34	34	34	2	118.7	\N	0	0
70	Broncos	Courtland Sutton	29	WR	17	13	2	2	100	30	1	0	0	2	100	28	15	15	1.8	158.3	100	0	0
71	Chargers	Taylor Heinicke	31	QB	4	0	3	5	60	28	0	0	0	1	25	18	5.6	9.3	7	75.4	5.9	3	28
72	Bills	Mike White	29	QB	1	0	3	11	27.3	28	0	0	0	1	9.1	14	2.5	9.3	28	39.6	14	0	0
73	Seahawks	Sam Howell	24	QB	2	0	5	14	35.7	24	0	1	7.1	1	16.7	12	1.7	4.8	12	14.6	3.3	4	21
74	Colts	Adonai Mitchell	22	WR	17	7	1	1	100	24	0	0	0	1	100	24	24	24	1.4	118.7	73	0	0
75	Vikings	Justin Jefferson	25	WR	17	17	1	1	100	22	0	0	0	1	100	22	22	22	1.3	118.7	26.2	0	0
76	Saints	Taysom Hill	34	TE	8	8	2	4	50	21	0	1	25	1	25	18	5.3	10.5	2.6	26	92.1	0	0
77	Saints	Cedrick Wilson Jr.	29	WR	15	4	1	1	100	21	1	0	0	1	50	21	21	21	1.4	158.3	99.6	1	3
78	Steelers	Kyle Allen	28	QB	1	0	1	1	100	19	0	0	0	1	100	19	19	19	19	118.7	99.4	0	0
79	Panthers	Jalen Coker	23	WR	11	4	1	1	100	19	0	0	0	1	100	19	19	19	1.7	118.7	99.6	0	0
80	Lions	Jack Fox	28	P	17	0	1	1	100	17	0	0	0	1	100	17	17	17	1	118.7	\N	0	0
81	Ravens	Josh Johnson	38	QB	6	0	2	3	66.7	17	0	0	0	1	25	16	5.7	8.5	2.8	81.2	17.1	1	5
82	Texans	Stefon Diggs	31	WR	8	8	1	1	100	13	0	0	0	1	100	13	13	13	1.6	118.7	13.6	0	0
83	Bears	Tyson Bagent	24	QB	4	0	2	2	100	11	0	0	0	1	50	6	5.5	5.5	2.8	89.6	51	0	0
84	Cardinals	Clayton Tune	25	QB	6	0	2	2	100	8	0	0	0	0	50	7	4	4	1.3	83.3	0.6	0	0
85	Lions	Amon-Ra St. Brown	25	WR	17	17	1	1	100	7	1	0	0	1	100	7	7	7	0.4	135.4	99.6	0	0
86	Buccaneers	Kyle Trask	26	QB	4	0	1	1	100	5	0	0	0	0	100	5	5	5	1.3	87.5	89.4	0	0
87	Cowboys	Bryan Anger	36	P	17	0	1	2	50	4	0	0	0	0	\N	4	2	4	0.2	56.2	\N	0	0
88	Broncos	Riley Dixon	31	P	17	0	1	1	100	3	0	0	0	0	\N	3	3	3	0.2	79.2	\N	0	0
89	Lions	David Montgomery	27	RB	14	14	1	1	100	3	1	0	0	1	100	3	3	3	0.2	118.7	100	0	0
90	Chargers	JK Scott	29	P	17	0	1	1	100	3	0	0	0	0	\N	3	3	3	0.2	79.2	\N	0	0
91	Bears	Keenan Allen	32	WR	15	15	0	1	0	0	0	1	100	0	\N	\N	0	\N	0	0	0	0	0
92	Rams	Tutu Atwell	25	WR	17	5	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	1.7	0	0
93	Eagles	Saquon Barkley	27	RB	16	16	0	0	\N	0	0	0	\N	0	\N	\N	\N	\N	0	\N	0.2	1	2
94	Patriots	Kendrick Bourne	29	WR	12	9	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	4.2	0	0
95	Titans	Tyler Boyd	30	WR	16	8	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	4.1	0	0
96	Commanders	Dyami Brown	25	WR	16	3	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	5.4	0	0
97	Vikings	Ty Chandler	26	RB	17	0	0	0	\N	0	0	0	\N	0	\N	\N	\N	\N	0	\N	1.3	1	1
98	Panthers	Johnny Hekker	34	P	17	0	0	2	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	\N	0	0
99	Steelers	Miles Killebrew	31	S	17	0	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	\N	0	0
100	Jets	Allen Lazard	29	WR	12	10	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	0	0	0
101	Raiders	Jakobi Meyers	28	WR	15	15	0	0	\N	0	0	0	\N	0	\N	\N	\N	\N	0	\N	0	1	10
102	Texans	Joe Mixon	28	RB	14	14	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	1	0	0
103	Falcons	Darnell Mooney	27	WR	16	16	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	3.6	0	0
104	Bears	D.J. Moore	27	WR	17	17	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	\N	0	0
105	Giants	Malik Nabers	21	WR	15	13	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	2.4	0	0
106	Chiefs	Chris Oladokun	27	QB	1	0	0	0	\N	0	0	0	\N	0	\N	\N	\N	\N	0	\N	0	1	5
107	49ers	Ricky Pearsall	24	WR	11	4	0	1	0	0	0	0	0	0	\N	\N	0	\N	0	39.6	2.1	0	0
108	49ers	Deebo Samuel	28	WR	15	15	0	0	\N	0	0	0	\N	0	\N	\N	\N	\N	0	\N	\N	1	4
109	Lions	Penei Sewell	24	T	17	17	0	0	\N	0	0	0	\N	0	\N	\N	\N	\N	0	\N	1.9	1	1
\.


--
-- Data for Name: rushingreceivingdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rushingreceivingdata (rank, team_name, player_name, age, "position", games_played, games_started, rushing_attempts, rushing_yards, rushing_touchdowns, first_downs_rushing, rushing_success_rate, longest_rushing_attempt, average_rushing_yards_per_attempt, average_rushing_yards_per_game, average_rushing_attempts_per_game, pass_targets, receptions, receiving_yards, average_receiving_yards_per_reception, receiving_touchdowns, first_downs_receiving, receiving_success_rate, longest_reception, average_receptions_per_game, average_receiving_yards_per_game, catch_percentage, average_receiving_yards_per_target, touches, average_yards_per_touch, yards_from_scrimmage, rushing_and_receiving_touchdowns, fumbles) FROM stdin;
1	Commanders	Terry McLaurin	29	WR	17	17	2	2	0	0	0	2	1	0.1	0.1	117	82	1096	13.4	13	56	58.1	86	4.8	64.5	70.1	9.4	84	13.1	1098	13	1
2	Commanders	Brian Robinson Jr.	25	RB	14	13	187	799	8	47	48.7	40	4.3	57.1	13.4	25	20	159	8	0	4	44	32	1.4	11.4	80	6.4	207	4.6	958	8	2
3	Commanders	Jayden Daniels	24	QB	17	17	148	891	6	55	62.8	46	6	52.4	8.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	148	6	891	6	5
4	Commanders	Austin Ekeler	29	RB	12	6	77	367	4	19	51.9	50	4.8	30.6	6.4	41	35	366	10.5	0	14	53.7	34	2.9	30.5	85.4	8.9	112	6.5	733	4	3
5	Commanders	Zach Ertz	34	TE	17	17	0	0	0	0	\N	\N	\N	0	0	91	66	654	9.9	7	38	63.7	37	3.9	38.5	72.5	7.2	66	9.9	654	7	1
6	Commanders	Olamide Zaccheaus	27	WR	17	6	1	8	0	1	100	8	8	0.5	0.1	64	45	506	11.2	3	26	51.6	49	2.6	29.8	70.3	7.9	46	11.2	514	3	3
7	Commanders	Noah Brown	28	WR	11	9	0	0	0	0	\N	\N	\N	0	0	56	35	453	12.9	1	21	57.1	52	3.2	41.2	62.5	8.1	35	12.9	453	1	0
8	Commanders	Dyami Brown	25	WR	16	3	3	26	0	1	100	14	8.7	1.6	0.2	40	30	308	10.3	1	13	47.5	51	1.9	19.3	75	7.7	33	10.1	334	1	1
9	Commanders	Jeremy McNichols	29	RB	17	1	55	261	4	15	58.2	28	4.7	15.4	3.2	12	9	27	3	0	1	25	10	0.5	1.6	75	2.3	64	4.5	288	4	0
10	Commanders	Chris Rodriguez	24	RB	9	0	35	173	2	10	74.3	25	4.9	19.2	3.9	1	1	12	12	0	1	100	12	0.1	1.3	100	12	36	5.1	185	2	0
11	Commanders	Luke McCaffrey	23	WR	17	4	0	0	0	0	\N	\N	\N	0	0	24	18	168	9.3	0	8	50	30	1.1	9.9	75	7	18	9.3	168	0	0
12	Commanders	Marcus Mariota	31	QB	3	0	18	92	1	6	50	33	5.1	30.7	6	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	18	5.1	92	1	0
13	Commanders	John Bates	27	TE	17	6	0	0	0	0	\N	\N	\N	0	0	13	8	84	10.5	0	3	53.8	20	0.5	4.9	61.5	6.5	8	10.5	84	0	1
14	Commanders	Jamison Crowder	31	WR	6	1	0	0	0	0	\N	\N	\N	0	0	13	9	72	8	2	4	38.5	12	1.5	12	69.2	5.5	9	8	72	2	2
15	Commanders	Ben Sinnott	22	TE	17	2	0	0	0	0	\N	\N	\N	0	0	5	5	28	5.6	1	2	40	12	0.3	1.6	100	5.6	5	5.6	28	1	0
16	Commanders	Trenton Scott	30	T	17	1	0	0	0	0	\N	\N	\N	0	0	1	1	1	1	1	1	100	1	0.1	0.1	100	1	1	1	1	1	0
17	Commanders	Brycen Tremayne	25	WR	2	0	0	0	0	0	\N	\N	\N	0	0	1	1	-2	-2	0	0	0	-2	0.5	-1	100	-2	1	-2	-2	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Titans	Tony Pollard	27	RB	16	16	260	1079	5	53	47.7	41	4.2	67.4	16.3	57	41	238	5.8	0	9	29.8	30	2.6	14.9	71.9	4.2	301	4.4	1317	5	2
2	Titans	Calvin Ridley	30	WR	17	14	8	55	1	3	75	19	6.9	3.2	0.5	120	64	1017	15.9	4	40	44.2	63	3.8	59.8	53.3	8.5	72	14.9	1072	5	1
3	Titans	Tyjae Spears	23	RB	12	1	84	312	4	19	46.4	23	3.7	26	7	35	30	224	7.5	1	9	40	43	2.5	18.7	85.7	6.4	114	4.7	536	5	1
4	Titans	Nick Westbrook-Ikhine	27	WR	17	9	0	0	0	0	\N	\N	\N	0	0	60	32	497	15.5	9	25	46.7	98	1.9	29.2	53.3	8.3	32	15.5	497	9	0
5	Titans	Chigoziem Okonkwo	25	TE	17	11	1	17	0	1	100	17	17	1	0.1	70	52	479	9.2	2	19	55.7	70	3.1	28.2	74.3	6.8	53	9.4	496	2	2
6	Titans	Tyler Boyd	30	WR	16	8	1	3	0	1	100	3	3	0.2	0.1	57	39	390	10	0	20	49.1	40	2.4	24.4	68.4	6.8	40	9.8	393	0	0
7	Titans	Josh Whyle	25	TE	17	4	0	0	0	0	\N	\N	\N	0	0	37	28	248	8.9	1	14	51.4	33	1.6	14.6	75.7	6.7	28	8.9	248	1	0
8	Titans	Will Levis	25	QB	12	12	45	183	0	20	48.9	21	4.1	15.3	3.8	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	45	4.1	183	0	10
9	Titans	DeAndre Hopkins	32	WR	6	3	0	0	0	0	\N	\N	\N	0	0	21	15	173	11.5	1	10	66.7	23	2.5	28.8	71.4	8.2	15	11.5	173	1	1
10	Titans	Nick Vannett	31	TE	17	10	0	0	0	0	\N	\N	\N	0	0	20	17	135	7.9	3	7	75	24	1	7.9	85	6.8	17	7.9	135	3	0
11	Titans	Julius Chestnut	24	RB	17	0	22	102	0	2	45.5	12	4.6	6	1.3	3	2	11	5.5	0	0	33.3	9	0.1	0.6	66.7	3.7	24	4.7	113	0	0
12	Titans	Mason Rudolph	29	QB	8	5	25	106	1	13	60	14	4.2	13.3	3.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	25	4.2	106	1	5
13	Titans	Bryce Oliver	24	WR	10	1	0	0	0	0	\N	\N	\N	0	0	9	6	95	15.8	0	4	66.7	33	0.6	9.5	66.7	10.6	6	15.8	95	0	0
14	Titans	Tay Martin	27	WR	1	0	0	0	0	0	\N	\N	\N	0	0	2	1	49	49	1	1	50	49	1	49	50	24.5	1	49	49	1	0
15	Titans	Treylon Burks	24	WR	5	2	2	1	0	0	50	6	0.5	0.2	0.4	8	4	34	8.5	0	3	37.5	13	0.8	6.8	50	4.3	6	5.8	35	0	0
16	Titans	Mason Kinsey	26	WR	6	0	0	0	0	0	\N	\N	\N	0	0	2	2	17	8.5	0	1	100	11	0.3	2.8	100	8.5	2	8.5	17	0	0
17	Titans	David Martin-Robinson	25	TE	5	2	0	0	0	0	\N	\N	\N	0	0	2	1	6	6	0	1	50	6	0.2	1.2	50	3	1	6	6	0	0
18	Titans	Jha'Quan Jackson	24	WR	12	0	1	-5	0	0	0	\N	-5	-0.4	0.1	3	1	8	8	0	1	33.3	8	0.1	0.7	33.3	2.7	2	1.5	3	0	5
19	Titans	Joshua Kelley	27	RB	3	0	1	2	0	0	0	2	2	0.7	0.3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	2	2	0	0
20	Titans	JC Latham	21	OT	17	17	0	0	0	0	\N	\N	\N	0	0	1	1	0	0	0	0	0	\N	0.1	0	100	0	1	0	0	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Buccaneers	Bucky Irving	22	RB	17	3	207	1122	8	52	55.1	56	5.4	66	12.2	52	47	392	8.3	0	16	65.4	42	2.8	23.1	90.4	7.5	254	6	1514	8	2
2	Buccaneers	Rachaad White	25	RB	16	15	144	613	3	35	50.7	56	4.3	38.3	9	57	51	393	7.7	6	18	54.4	32	3.2	24.6	89.5	6.9	195	5.2	1006	9	3
3	Buccaneers	Mike Evans	31	WR	14	14	0	0	0	0	\N	\N	\N	0	0	110	74	1004	13.6	11	53	62.7	57	5.3	71.7	67.3	9.1	74	13.6	1004	11	0
4	Buccaneers	Cade Otton	25	TE	14	14	1	-4	0	0	0	-4	-4	-0.3	0.1	87	59	600	10.2	4	31	51.7	44	4.2	42.9	67.8	6.9	60	9.9	596	4	2
5	Buccaneers	Chris Godwin	28	WR	7	7	1	2	0	1	100	2	2	0.3	0.1	62	50	576	11.5	5	33	72.6	55	7.1	82.3	80.6	9.3	51	11.3	578	5	1
6	Buccaneers	Jalen McMillan	23	WR	13	12	4	43	0	3	100	17	10.8	3.3	0.3	58	37	461	12.5	8	23	55.2	33	2.8	35.5	63.8	7.9	41	12.3	504	8	0
7	Buccaneers	Sean Tucker	23	RB	17	0	50	308	2	17	56	36	6.2	18.1	2.9	12	9	109	12.1	1	6	75	36	0.5	6.4	75	9.1	59	7.1	417	3	1
8	Buccaneers	Sterling Shepard	31	WR	14	5	8	69	0	4	62.5	24	8.6	4.9	0.6	51	32	334	10.4	1	16	49	30	2.3	23.9	62.7	6.5	40	10.1	403	1	0
9	Buccaneers	Baker Mayfield	29	QB	17	17	60	378	3	24	51.7	28	6.3	22.2	3.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	60	6.3	378	3	13
10	Buccaneers	Trey Palmer	23	WR	15	3	0	0	0	0	\N	\N	\N	0	0	22	12	172	14.3	1	7	40.9	27	0.8	11.5	54.5	7.8	12	14.3	172	1	1
11	Buccaneers	Ryan Miller	24	WR	11	3	0	0	0	0	\N	\N	\N	0	0	20	12	128	10.7	2	7	45	39	1.1	11.6	60	6.4	12	10.7	128	2	0
12	Buccaneers	Rakim Jarrett	23	WR	10	2	0	0	0	0	\N	\N	\N	0	0	11	9	124	13.8	0	5	72.7	30	0.9	12.4	81.8	11.3	9	13.8	124	0	0
13	Buccaneers	Payne Durham	24	TE	16	6	0	0	0	0	\N	\N	\N	0	0	14	11	115	10.5	2	5	71.4	31	0.7	7.2	78.6	8.2	11	10.5	115	2	1
14	Buccaneers	Devin Culp	24	TE	5	0	0	0	0	0	\N	\N	\N	0	0	6	5	88	17.6	0	4	66.7	26	1	17.6	83.3	14.7	5	17.6	88	0	0
15	Buccaneers	Kameron Johnson	22	WR	5	0	2	11	0	1	50	11	5.5	2.2	0.4	1	0	0	\N	0	0	0	\N	0	0	0	0	2	5.5	11	0	0
16	Buccaneers	Tristan Wirfs	25	T	16	16	0	0	0	0	\N	\N	\N	0	0	0	0	9	\N	0	0	\N	9	0	0.6	\N	\N	0	\N	9	0	1
17	Buccaneers	Tavierre Thomas	28	CB	17	0	1	-2	0	0	0	\N	-2	-0.1	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	-2	-2	0	0
18	Buccaneers	Kyle Trask	26	QB	4	0	5	-4	0	0	0	\N	-0.8	-1	1.3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	5	-0.8	-4	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Seahawks	Jaxon Smith-Njigba	22	WR	17	16	5	26	0	1	60	8	5.2	1.5	0.3	137	100	1130	11.3	6	57	58.4	46	5.9	66.5	73	8.2	105	11	1156	6	1
2	Seahawks	D.K. Metcalf	27	WR	15	12	0	0	0	0	\N	\N	\N	0	0	108	66	992	15	5	35	49.1	71	4.4	66.1	61.1	9.2	66	15	992	5	2
3	Seahawks	Zach Charbonnet	23	RB	17	6	135	569	8	32	47.4	51	4.2	33.5	7.9	52	42	340	8.1	1	6	40.4	32	2.5	20	80.8	6.5	177	5.1	909	9	0
4	Seahawks	Kenneth Walker III	24	RB	11	11	153	573	7	28	44.4	28	3.7	52.1	13.9	53	46	299	6.5	1	19	54.7	21	4.2	27.2	86.8	5.6	199	4.4	872	8	1
5	Seahawks	Tyler Lockett	32	WR	17	14	0	0	0	0	\N	\N	\N	0	0	74	49	600	12.2	2	36	56.8	37	2.9	35.3	66.2	8.1	49	12.2	600	2	0
6	Seahawks	Noah Fant	27	TE	14	9	0	0	0	0	\N	\N	\N	0	0	64	48	500	10.4	1	25	57.8	32	3.4	35.7	75	7.8	48	10.4	500	1	0
7	Seahawks	Geno Smith	34	QB	17	17	53	272	2	17	35.8	34	5.1	16	3.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	53	5.1	272	2	9
8	Seahawks	AJ Barner	22	TE	17	6	0	0	0	0	\N	\N	\N	0	0	38	30	245	8.2	4	18	63.2	20	1.8	14.4	78.9	6.4	30	8.2	245	4	0
9	Seahawks	Kenny McIntosh	24	RB	17	0	31	172	0	8	51.6	25	5.5	10.1	1.8	4	3	22	7.3	0	1	50	15	0.2	1.3	75	5.5	34	5.7	194	0	0
10	Seahawks	Jake Bobo	26	WR	17	3	0	0	0	0	\N	\N	\N	0	0	17	13	107	8.2	1	8	58.8	15	0.8	6.3	76.5	6.3	13	8.2	107	1	0
11	Seahawks	Pharaoh Brown	30	TE	15	7	0	0	0	0	\N	\N	\N	0	0	12	8	65	8.1	0	2	41.7	17	0.5	4.3	66.7	5.4	8	8.1	65	0	1
12	Seahawks	Cody White	26	WR	4	0	0	0	0	0	\N	\N	\N	0	0	3	2	44	22	0	2	66.7	28	0.5	11	66.7	14.7	2	22	44	0	0
13	Seahawks	Laviska Shenault Jr.	26	WR	11	1	1	1	0	0	0	1	1	0.1	0.1	5	5	36	7.2	0	2	60	18	0.5	3.3	100	7.2	6	6.2	37	0	2
14	Seahawks	George Holani	25	RB	5	0	3	10	0	1	66.7	8	3.3	2	0.6	1	1	-1	-1	0	0	0	-1	0.2	-0.2	100	-1	4	2.3	9	0	0
15	Seahawks	Sam Howell	24	QB	2	0	1	2	0	0	0	2	2	1	0.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	2	2	0	0
16	Seahawks	Julian Love	26	FS	17	17	1	2	0	1	100	2	2	0.1	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	2	2	0	0
17	Seahawks	Dareke Young	25	WR	14	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	49ers	George Kittle	31	TE	15	15	0	0	0	0	\N	\N	\N	0	0	94	78	1106	14.2	8	50	73.4	43	5.2	73.7	83	11.8	78	14.2	1106	8	0
2	49ers	Jauan Jennings	27	WR	15	10	0	0	0	0	\N	\N	\N	0	0	113	77	975	12.7	6	47	54.9	45	5.1	65	68.1	8.6	77	12.7	975	6	1
3	49ers	Jordan Mason	25	RB	12	6	153	789	3	37	47.1	38	5.2	65.8	12.8	14	11	91	8.3	0	5	64.3	24	0.9	7.6	78.6	6.5	164	5.4	880	3	3
4	49ers	Deebo Samuel	28	WR	15	15	42	136	1	5	45.2	13	3.2	9.1	2.8	81	51	670	13.1	3	28	40.7	76	3.4	44.7	63	8.3	93	8.7	806	4	2
5	49ers	Isaac Guerendo	24	RB	16	3	84	420	4	18	47.6	76	5	26.3	5.3	16	15	152	10.1	0	7	56.3	40	0.9	9.5	93.8	9.5	99	5.8	572	4	3
6	49ers	Ricky Pearsall	24	WR	11	4	3	45	0	1	66.7	39	15	4.1	0.3	46	31	400	12.9	3	19	56.5	46	2.8	36.4	67.4	8.7	34	13.1	445	3	0
7	49ers	Brandon Aiyuk	26	WR	7	7	0	0	0	0	\N	\N	\N	0	0	47	25	374	15	0	19	48.9	53	3.6	53.4	53.2	8	25	15	374	0	0
8	49ers	Christian McCaffrey	28	RB	4	4	50	202	0	12	44	19	4	50.5	12.5	19	15	146	9.7	0	6	52.6	30	3.8	36.5	78.9	7.7	65	5.4	348	0	1
9	49ers	Brock Purdy	25	QB	15	15	66	323	5	33	63.6	16	4.9	21.5	4.4	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	66	4.9	323	5	7
10	49ers	Kyle Juszczyk	33	FB	17	15	5	26	1	1	20	14	5.2	1.5	0.3	31	19	200	10.5	2	8	48.4	36	1.1	11.8	61.3	6.5	24	9.4	226	3	1
11	49ers	Patrick Taylor	26	RB	13	1	39	183	1	11	53.8	29	4.7	14.1	3	11	3	25	8.3	0	2	18.2	12	0.2	1.9	27.3	2.3	42	5	208	1	0
12	49ers	Eric Saubert	30	TE	17	3	0	0	0	0	\N	\N	\N	0	0	14	11	97	8.8	1	5	57.1	17	0.6	5.7	78.6	6.9	11	8.8	97	1	1
13	49ers	Jacob Cowing	23	WR	15	0	1	7	0	0	100	7	7	0.5	0.1	6	4	80	20	0	3	66.7	41	0.3	5.3	66.7	13.3	5	17.4	87	0	2
14	49ers	Chris Conley	32	WR	15	2	0	0	0	0	\N	\N	\N	0	0	12	6	76	12.7	0	3	50	23	0.4	5.1	50	6.3	6	12.7	76	0	0
15	49ers	Joshua Dobbs	29	QB	2	1	9	24	2	2	33.3	8	2.7	12	4.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	9	2.7	24	2	2
16	49ers	Ronnie Bell	24	WR	9	0	0	0	0	0	\N	\N	\N	0	0	6	2	22	11	0	2	33.3	12	0.2	2.4	33.3	3.7	2	11	22	0	0
17	49ers	Trent Taylor	30	WR	2	0	0	0	0	0	\N	\N	\N	0	0	1	1	11	11	0	0	100	11	0.5	5.5	100	11	1	11	11	0	0
18	49ers	Brandon Allen	32	QB	3	1	3	4	0	0	0	6	1.3	1.3	1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	3	1.3	4	0	2
19	49ers	Ke'Shawn Vaughn	27	RB	3	0	2	4	0	0	0	3	2	1.3	0.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	2	2	4	0	0
20	49ers	Jake Brendel	32	OL	17	17	0	0	0	0	\N	\N	\N	0	0	0	0	2	\N	0	0	\N	2	0	0.1	\N	\N	0	\N	2	0	1
21	49ers	Brayden Willis	25	TE	10	0	0	0	0	0	\N	\N	\N	0	0	2	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
22	49ers	Dominick Puni	24	OL	17	17	0	0	0	0	\N	\N	\N	0	0	0	0	-3	\N	0	0	\N	-3	0	-0.2	\N	\N	0	\N	-3	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Steelers	Najee Harris	26	RB	17	17	263	1043	6	50	43.7	36	4	61.4	15.5	48	36	283	7.9	0	13	45.8	32	2.1	16.6	75	5.9	299	4.4	1326	6	0
2	Steelers	George Pickens	23	WR	14	12	2	-6	0	0	50	4	-3	-0.4	0.1	103	59	900	15.3	3	37	44.7	44	4.2	64.3	57.3	8.7	61	14.7	894	3	1
3	Steelers	Jaylen Warren	26	RB	15	0	120	511	1	28	50	22	4.3	34.1	8	47	38	310	8.2	0	16	46.8	29	2.5	20.7	80.9	6.6	158	5.2	821	1	2
4	Steelers	Pat Freiermuth	26	TE	17	11	0	0	0	0	\N	\N	\N	0	0	78	65	653	10	7	32	62.8	30	3.8	38.4	83.3	8.4	65	10	653	7	3
5	Steelers	Calvin Austin III	25	WR	17	8	0	0	0	0	\N	\N	\N	0	0	58	36	548	15.2	4	18	53.4	55	2.1	32.2	62.1	9.4	36	15.2	548	4	1
6	Steelers	Justin Fields	25	QB	10	6	62	289	5	19	54.8	30	4.7	28.9	6.2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	62	4.7	289	5	6
7	Steelers	Van Jefferson	28	WR	17	12	0	0	0	0	\N	\N	\N	0	0	40	24	276	11.5	2	12	47.5	43	1.4	16.2	60	6.9	24	11.5	276	2	0
8	Steelers	Cordarrelle Patterson	33	RB	13	1	32	135	0	7	43.8	14	4.2	10.4	2.5	14	12	80	6.7	1	5	50	20	0.9	6.2	85.7	5.7	44	4.9	215	1	1
9	Steelers	Darnell Washington	23	TE	17	9	0	0	0	0	\N	\N	\N	0	0	25	19	200	10.5	1	9	68	29	1.1	11.8	76	8	19	10.5	200	1	0
10	Steelers	Russell Wilson	36	QB	11	11	43	155	2	16	46.5	19	3.6	14.1	3.9	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	43	3.6	155	2	5
11	Steelers	Mike Williams	30	WR	9	2	0	0	0	0	\N	\N	\N	0	0	13	9	132	14.7	1	5	46.2	32	1	14.7	69.2	10.2	9	14.7	132	1	0
12	Steelers	Scott Miller	27	WR	13	1	0	0	0	0	\N	\N	\N	0	0	9	5	69	13.8	0	2	55.6	21	0.4	5.3	55.6	7.7	5	13.8	69	0	0
13	Steelers	Ben Skowronek	27	WR	10	1	0	0	0	0	\N	\N	\N	0	0	5	5	69	13.8	0	4	80	23	0.5	6.9	100	13.8	5	13.8	69	0	0
14	Steelers	Connor Heyward	25	TE	17	5	0	0	0	0	\N	\N	\N	0	0	8	6	40	6.7	1	3	62.5	16	0.4	2.4	75	5	6	6.7	40	1	0
15	Steelers	MyCole Pruitt	32	TE	12	5	0	0	0	0	\N	\N	\N	0	0	10	6	40	6.7	1	2	40	18	0.5	3.3	60	4	6	6.7	40	1	0
16	Steelers	Jonathan Ward	27	RB	4	0	5	22	0	1	60	7	4.4	5.5	1.3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	5	4.4	22	0	0
17	Steelers	Aaron Shampklin	25	RB	3	0	6	17	0	1	16.7	5	2.8	5.7	2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	6	2.8	17	0	0
18	Steelers	Brandon Johnson	26	WR	3	0	0	0	0	0	\N	\N	\N	0	0	1	1	9	9	0	0	100	9	0.3	3	100	9	1	9	9	0	0
19	Steelers	James Pierre	28	CB	15	2	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
20	Steelers	Zach Frazier	23	C	15	15	0	0	0	0	\N	\N	\N	0	0	0	0	-2	\N	0	0	\N	-2	0	-0.1	\N	\N	0	\N	-2	0	1
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Eagles	Saquon Barkley	27	RB	16	16	345	2005	13	82	52.5	72	5.8	125.3	21.6	43	33	278	8.4	2	12	44.2	43	2.1	17.4	76.7	6.5	378	6	2283	15	2
2	Eagles	A.J. Brown	27	WR	13	13	0	0	0	0	\N	\N	\N	0	0	97	67	1079	16.1	7	51	62.9	67	5.2	83	69.1	11.1	67	16.1	1079	7	0
3	Eagles	DeVonta Smith	26	WR	13	13	1	1	0	0	0	1	1	0.1	0.1	89	68	833	12.3	8	42	61.8	49	5.2	64.1	76.4	9.4	69	12.1	834	8	0
4	Eagles	Jalen Hurts	26	QB	15	15	150	630	14	62	55.3	35	4.2	42	10	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	150	4.2	630	14	9
5	Eagles	Dallas Goedert	29	TE	10	10	0	0	0	0	\N	\N	\N	0	0	52	42	496	11.8	2	20	55.8	61	4.2	49.6	80.8	9.5	42	11.8	496	2	2
6	Eagles	Kenneth Gainwell	25	RB	17	1	75	290	1	12	24	20	3.9	17.1	4.4	22	16	116	7.3	0	5	40.9	16	0.9	6.8	72.7	5.3	91	4.5	406	1	0
7	Eagles	Grant Calcaterra	26	TE	17	13	0	0	0	0	\N	\N	\N	0	0	30	24	298	12.4	1	15	63.3	34	1.4	17.5	80	9.9	24	12.4	298	1	0
8	Eagles	Jahan Dotson	24	WR	17	6	1	13	0	1	100	13	13	0.8	0.1	33	19	216	11.4	0	12	48.5	36	1.1	12.7	57.6	6.5	20	11.5	229	0	0
9	Eagles	Will Shipley	22	RB	16	1	30	82	0	2	26.7	9	2.7	5.1	1.9	4	4	35	8.8	0	2	75	13	0.3	2.2	100	8.8	34	3.4	117	0	0
10	Eagles	Ainias Smith	23	WR	7	1	2	6	0	1	50	4	3	0.9	0.3	9	7	41	5.9	1	1	33.3	15	1	5.9	77.8	4.6	9	5.2	47	1	0
11	Eagles	Johnny Wilson	23	WR	16	4	0	0	0	0	\N	\N	\N	0	0	15	5	38	7.6	1	3	26.7	9	0.3	2.4	33.3	2.5	5	7.6	38	1	0
12	Eagles	Britain Covey	27	WR	5	1	0	0	0	0	\N	\N	\N	0	0	8	7	34	4.9	0	2	37.5	11	1.4	6.8	87.5	4.3	7	4.9	34	0	0
13	Eagles	Parris Campbell	27	WR	5	0	0	0	0	0	\N	\N	\N	0	0	8	6	30	5	1	1	50	7	1.2	6	75	3.8	6	5	30	1	0
14	Eagles	Kenny Pickett	26	QB	5	1	9	15	1	3	33.3	8	1.7	3	1.8	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	9	1.7	15	1	1
15	Eagles	Jack Stoll	26	TE	7	2	0	0	0	0	\N	\N	\N	0	0	3	2	10	5	0	0	33.3	6	0.3	1.4	66.7	3.3	2	5	10	0	0
16	Eagles	Tyrion Davis-Price	24	RB	1	0	3	7	0	0	0	5	2.3	7	3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	3	2.3	7	0	0
17	Eagles	E.J. Jenkins	26	TE	8	0	0	0	0	0	\N	\N	\N	0	0	2	1	7	7	1	1	50	7	0.1	0.9	50	3.5	1	7	7	1	0
18	Eagles	John Ross	29	WR	1	0	0	0	0	0	\N	\N	\N	0	0	2	1	6	6	0	1	50	6	1	6	50	3	1	6	6	0	0
19	Eagles	Ben VanSumeren	24	LB	11	1	0	0	0	0	\N	\N	\N	0	0	1	1	0	0	0	0	0	\N	0.1	0	100	0	1	0	0	0	0
20	Eagles	Tanner McKee	24	QB	2	1	5	-1	0	1	20	2	-0.2	-0.5	2.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	5	-0.2	-1	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Jets	Breece Hall	23	RB	16	16	209	876	5	40	46.4	42	4.2	54.8	13.1	76	57	483	8.5	3	15	36.8	57	3.6	30.2	75	6.4	266	5.1	1359	8	6
2	Jets	Garrett Wilson	24	WR	17	17	2	5	0	1	50	5	2.5	0.3	0.1	154	101	1104	10.9	7	60	53.9	42	5.9	64.9	65.6	7.2	103	10.8	1109	7	2
3	Jets	Davante Adams	32	WR	11	11	0	0	0	0	\N	\N	\N	0	0	114	67	854	12.7	7	39	45.6	71	6.1	77.6	58.8	7.5	67	12.7	854	7	0
4	Jets	Allen Lazard	29	WR	12	10	0	0	0	0	\N	\N	\N	0	0	60	37	530	14.3	6	29	58.3	52	3.1	44.2	61.7	8.8	37	14.3	530	6	0
5	Jets	Braelon Allen	20	RB	17	2	92	334	2	22	51.1	20	3.6	19.6	5.4	27	19	148	7.8	1	8	51.9	15	1.1	8.7	70.4	5.5	111	4.3	482	3	0
6	Jets	Tyler Conklin	29	TE	16	15	1	0	0	0	0	\N	0	0	0.1	72	51	449	8.8	4	24	52.8	27	3.2	28.1	70.8	6.2	52	8.6	449	4	0
7	Jets	Isaiah Davis	22	RB	17	0	30	174	1	10	63.3	20	5.8	10.2	1.8	12	9	75	8.3	1	4	41.7	24	0.5	4.4	75	6.3	39	6.4	249	2	0
8	Jets	Mike Williams	30	WR	9	3	0	0	0	0	\N	\N	\N	0	0	21	12	166	13.8	0	9	52.4	22	1.3	18.4	57.1	7.9	12	13.8	166	0	0
9	Jets	Aaron Rodgers	41	QB	17	17	22	107	0	7	40.9	18	4.9	6.3	1.3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	22	4.9	107	0	5
10	Jets	Jeremy Ruckert	24	TE	17	9	0	0	0	0	\N	\N	\N	0	0	28	18	105	5.8	0	6	42.9	12	1.1	6.2	64.3	3.8	18	5.8	105	0	0
11	Jets	Kenny Yeboah	26	TE	9	1	0	0	0	0	\N	\N	\N	0	0	8	5	47	9.4	1	3	62.5	13	0.6	5.2	62.5	5.9	5	9.4	47	1	0
12	Jets	Xavier Gipson	23	WR	17	0	1	5	0	1	100	5	5	0.3	0.1	10	6	39	6.5	1	3	30	17	0.4	2.3	60	3.9	7	6.3	44	1	4
13	Jets	Malachi Corley	22	WR	9	1	2	26	0	1	100	18	13	2.9	0.2	6	3	16	5.3	0	1	33.3	10	0.3	1.8	50	2.7	5	8.4	42	0	1
14	Jets	Ashtyn Davis	28	S	15	1	1	21	0	1	100	21	21	1.4	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	21	21	0	0
15	Jets	Tyrod Taylor	35	QB	2	0	3	13	0	0	66.7	7	4.3	6.5	1.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	3	4.3	13	0	1
16	Jets	Irvin Charles	27	WR	13	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Giants	Malik Nabers	21	WR	15	13	5	2	0	1	40	4	0.4	0.1	0.3	170	109	1204	11	7	55	51.2	59	7.3	80.3	64.1	7.1	114	10.6	1206	7	1
2	Giants	Tyrone Tracy Jr.	25	RB	17	12	192	839	5	39	44.3	45	4.4	49.4	11.3	53	38	284	7.5	1	13	47.2	19	2.2	16.7	71.7	5.4	230	4.9	1123	6	5
3	Giants	Wan'Dale Robinson	23	WR	17	7	3	18	0	1	33.3	14	6	1.1	0.2	140	93	699	7.5	3	36	42.1	35	5.5	41.1	66.4	5	96	7.5	717	3	0
4	Giants	Darius Slayton	27	WR	16	13	2	17	0	1	100	11	8.5	1.1	0.1	71	39	573	14.7	2	30	50.7	43	2.4	35.8	54.9	8.1	41	14.4	590	2	1
5	Giants	Devin Singletary	27	RB	15	5	113	437	4	24	47.8	43	3.9	29.1	7.5	24	21	119	5.7	0	4	45.8	23	1.4	7.9	87.5	5	134	4.1	556	4	2
6	Giants	Theo Johnson	23	TE	12	11	0	0	0	0	\N	\N	\N	0	0	43	29	331	11.4	1	16	51.2	35	2.4	27.6	67.4	7.7	29	11.4	331	1	0
7	Giants	Daniel Jones	27	QB	10	10	67	265	2	26	59.7	24	4	26.5	6.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	67	4	265	2	4
8	Giants	Drew Lock	28	QB	8	5	18	133	2	9	50	28	7.4	16.6	2.3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	18	7.4	133	2	5
9	Giants	Daniel Bellinger	24	TE	17	8	0	0	0	0	\N	\N	\N	0	0	17	14	125	8.9	0	8	64.7	17	0.8	7.4	82.4	7.4	14	8.9	125	0	0
10	Giants	Eric Gray	25	RB	17	0	14	31	0	1	28.6	6	2.2	1.8	0.8	11	10	82	8.2	0	3	54.5	19	0.6	4.8	90.9	7.5	24	4.7	113	0	3
11	Giants	Jalin Hyatt	23	WR	16	3	0	0	0	0	\N	\N	\N	0	0	19	8	62	7.8	0	3	31.6	19	0.5	3.9	42.1	3.3	8	7.8	62	0	0
12	Giants	Tommy DeVito	26	QB	3	2	8	32	0	1	25	17	4	10.7	2.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	8	4	32	0	0
13	Giants	Chris Manhertz	32	TE	17	11	0	0	0	0	\N	\N	\N	0	0	4	3	30	10	1	2	75	16	0.2	1.8	75	7.5	3	10	30	1	0
14	Giants	Isaiah Hodgins	26	WR	3	0	0	0	0	0	\N	\N	\N	0	0	2	2	12	6	0	0	100	7	0.7	4	100	6	2	6	12	0	0
15	Giants	Dane Belton	24	S	17	6	1	10	0	1	100	10	10	0.6	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	10	10	0	0
16	Giants	Tim Boyle	30	QB	1	0	1	-1	0	0	0	-1	-1	-1	1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	-1	-1	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Saints	Alvin Kamara	29	RB	14	14	228	950	6	52	51.3	24	4.2	67.9	16.3	89	68	543	8	2	18	36	57	4.9	38.8	76.4	6.1	296	5	1493	8	1
2	Saints	Juwan Johnson	28	TE	17	5	0	0	0	0	\N	\N	\N	0	0	66	50	548	11	3	27	56.1	30	2.9	32.2	75.8	8.3	50	11	548	3	2
3	Saints	Taysom Hill	34	TE	8	8	39	278	6	18	64.1	75	7.1	34.8	4.9	31	23	187	8.1	0	8	48.4	34	2.9	23.4	74.2	6	62	7.5	465	6	1
4	Saints	Foster Moreau	27	TE	17	17	0	0	0	0	\N	\N	\N	0	0	43	32	413	12.9	5	21	60.5	41	1.9	24.3	74.4	9.6	32	12.9	413	5	0
5	Saints	Chris Olave	24	WR	8	8	1	7	0	1	100	7	7	0.9	0.1	44	32	400	12.5	1	22	65.9	39	4	50	72.7	9.1	33	12.3	407	1	1
6	Saints	Marquez Valdes-Scantling	30	WR	8	8	1	4	0	0	0	4	4	0.5	0.1	35	17	385	22.6	4	13	40	71	2.1	48.1	48.6	11	18	21.6	389	4	0
7	Saints	Rashid Shaheed	26	WR	6	5	6	29	0	2	50	13	4.8	4.8	1	41	20	349	17.5	3	12	41.5	70	3.3	58.2	48.8	8.5	26	14.5	378	3	1
8	Saints	Jamaal Williams	29	RB	14	1	48	164	1	11	47.9	14	3.4	11.7	3.4	11	9	57	6.3	0	3	54.5	13	0.6	4.1	81.8	5.2	57	3.9	221	1	0
9	Saints	Cedrick Wilson Jr.	29	WR	15	4	0	0	0	0	\N	\N	\N	0	0	27	20	211	10.6	1	8	48.1	25	1.3	14.1	74.1	7.8	20	10.6	211	1	1
10	Saints	Kendre Miller	22	RB	6	2	39	148	1	11	48.7	17	3.8	24.7	6.5	8	5	33	6.6	0	2	37.5	16	0.8	5.5	62.5	4.1	44	4.1	181	1	0
11	Saints	Kevin Austin	24	WR	8	2	1	9	0	0	100	9	9	1.1	0.1	22	11	151	13.7	0	10	45.5	23	1.4	18.9	50	6.9	12	13.3	160	0	1
12	Saints	Spencer Rattler	24	QB	7	6	18	146	0	7	72.2	28	8.1	20.9	2.6	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	18	8.1	146	0	5
13	Saints	Jordan Mims	25	RB	11	0	20	70	0	2	40	9	3.5	6.4	1.8	18	12	71	5.9	0	4	22.2	25	1.1	6.5	66.7	3.9	32	4.4	141	0	0
14	Saints	Dante Pettis	29	WR	8	0	0	0	0	0	\N	\N	\N	0	0	28	12	120	10	1	8	35.7	20	1.5	15	42.9	4.3	12	10	120	1	0
15	Saints	Bub Means	23	WR	7	1	0	0	0	0	\N	\N	\N	0	0	15	9	118	13.1	1	7	53.3	36	1.3	16.9	60	7.9	9	13.1	118	1	0
16	Saints	Mason Tipton	24	WR	11	1	0	0	0	0	\N	\N	\N	0	0	26	14	99	7.1	0	2	26.9	15	1.3	9	53.8	3.8	14	7.1	99	0	0
17	Saints	Derek Carr	33	QB	10	10	17	71	1	4	52.9	13	4.2	7.1	1.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	17	4.2	71	1	3
18	Saints	Clyde Edwards-Helaire	25	RB	2	0	13	46	0	2	46.2	12	3.5	23	6.5	5	3	24	8	0	1	20	14	1.5	12	60	4.8	16	4.4	70	0	0
19	Saints	Jake Haener	25	QB	8	1	11	22	0	0	18.2	9	2	2.8	1.4	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	11	2	22	0	0
20	Saints	Dallin Holker	24	TE	12	2	0	0	0	0	\N	\N	\N	0	0	4	3	21	7	0	1	25	10	0.3	1.8	75	5.3	3	7	21	0	0
21	Saints	Matthew Hayball	27	P	17	0	1	11	0	1	100	11	11	0.6	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	11	11	0	0
22	Saints	Adam Prentice	27	FB	17	7	0	0	0	0	\N	\N	\N	0	0	4	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
23	Saints	Jermaine Jackson	24	WR	4	0	1	-1	0	0	0	\N	-1	-0.3	0.3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	-1	-1	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Patriots	Rhamondre Stevenson	26	RB	15	14	207	801	7	40	50.2	33	3.9	53.4	13.8	41	33	168	5.1	1	8	39	16	2.2	11.2	80.5	4.1	240	4	969	8	7
2	Patriots	Antonio Gibson	26	RB	17	3	120	538	1	24	45	45	4.5	31.6	7.1	29	23	206	9	0	11	51.7	50	1.4	12.1	79.3	7.1	143	5.2	744	1	2
3	Patriots	Hunter Henry	30	TE	16	16	0	0	0	0	\N	\N	\N	0	0	97	66	674	10.2	2	40	56.7	35	4.1	42.1	68	6.9	66	10.2	674	2	0
4	Patriots	Demario Douglas	24	WR	17	7	3	16	0	0	66.7	9	5.3	0.9	0.2	87	66	621	9.4	3	31	51.7	36	3.9	36.5	75.9	7.1	69	9.2	637	3	1
5	Patriots	Kayshon Boutte	22	WR	15	13	0	0	0	0	\N	\N	\N	0	0	68	43	589	13.7	3	25	55.9	48	2.9	39.3	63.2	8.7	43	13.7	589	3	0
6	Patriots	Austin Hooper	30	TE	17	8	0	0	0	0	\N	\N	\N	0	0	59	45	476	10.6	3	25	62.7	38	2.6	28	76.3	8.1	45	10.6	476	3	2
7	Patriots	Drake Maye	22	QB	13	12	54	421	2	22	64.8	41	7.8	32.4	4.2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	54	7.8	421	2	9
8	Patriots	Kendrick Bourne	29	WR	12	9	1	6	0	1	100	6	6	0.5	0.1	38	28	305	10.9	1	13	55.3	37	2.3	25.4	73.7	8	29	10.7	311	1	0
9	Patriots	Jamycal Hasty	28	RB	15	0	20	69	0	4	45	15	3.5	4.6	1.3	12	10	59	5.9	1	2	41.7	16	0.7	3.9	83.3	4.9	30	4.3	128	1	0
10	Patriots	Ja'Lynn Polk	22	WR	15	7	1	0	0	0	0	\N	0	0	0.1	33	12	87	7.3	2	4	24.2	21	0.8	5.8	36.4	2.6	13	6.7	87	2	0
11	Patriots	Jacoby Brissett	32	QB	8	5	15	62	0	5	53.3	16	4.1	7.8	1.9	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	15	4.1	62	0	4
12	Patriots	K.J. Osborn	27	WR	7	4	0	0	0	0	\N	\N	\N	0	0	18	7	57	8.1	1	2	27.8	22	1	8.1	38.9	3.2	7	8.1	57	1	0
13	Patriots	Tyquan Thornton	24	WR	6	1	0	0	0	0	\N	\N	\N	0	0	8	4	47	11.8	0	2	37.5	17	0.7	7.8	50	5.9	4	11.8	47	0	0
14	Patriots	Terrell Jennings	23	RB	3	0	13	33	0	0	23.1	7	2.5	11	4.3	1	0	0	\N	0	0	0	\N	0	0	0	0	13	2.5	33	0	0
15	Patriots	Marcus Jones	26	CB	14	9	1	5	0	0	100	5	5	0.4	0.1	1	1	18	18	0	1	100	18	0.1	1.3	100	18	2	11.5	23	0	2
16	Patriots	Jaheim Bell	23	TE	15	0	0	0	0	0	\N	\N	\N	0	0	3	2	20	10	0	1	33.3	19	0.1	1.3	66.7	6.7	2	10	20	0	0
17	Patriots	Joe Milton	24	QB	1	0	10	16	1	4	50	9	1.6	16	10	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	10	1.6	16	1	1
18	Patriots	Javon Baker	22	WR	11	1	0	0	0	0	\N	\N	\N	0	0	4	1	12	12	0	1	25	12	0.1	1.1	25	3	1	12	12	0	0
19	Patriots	Vederian Lowe	25	T	14	13	0	0	0	0	\N	\N	\N	0	0	1	1	4	4	1	1	100	4	0.1	0.3	100	4	1	4	4	1	0
20	Patriots	Dell Pettus	23	S	17	1	1	2	0	1	100	2	2	0.1	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	2	2	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Vikings	Aaron Jones	30	RB	17	17	255	1138	5	49	49.8	41	4.5	66.9	15	62	51	408	8	2	20	58.1	25	3	24	82.3	6.6	306	5.1	1546	7	5
2	Vikings	Justin Jefferson	25	WR	17	17	1	3	0	0	0	3	3	0.2	0.1	154	103	1533	14.9	10	62	57.1	97	6.1	90.2	66.9	10	104	14.8	1536	10	1
3	Vikings	Jordan Addison	22	WR	15	15	3	20	1	1	100	9	6.7	1.3	0.2	99	63	875	13.9	9	39	47.5	69	4.2	58.3	63.6	8.8	66	13.6	895	10	0
4	Vikings	T.J. Hockenson	27	TE	10	9	0	0	0	0	\N	\N	\N	0	0	62	41	455	11.1	0	30	54.8	34	4.1	45.5	66.1	7.3	41	11.1	455	0	0
5	Vikings	Jalen Nailor	25	WR	17	7	3	-4	0	1	33.3	3	-1.3	-0.2	0.2	42	28	414	14.8	6	22	59.5	33	1.6	24.4	66.7	9.9	31	13.2	410	6	1
6	Vikings	Cam Akers	25	RB	12	0	64	297	1	16	43.8	58	4.6	24.8	5.3	11	10	52	5.2	2	3	45.5	9	0.8	4.3	90.9	4.7	74	4.7	349	3	0
7	Vikings	Josh Oliver	27	TE	15	12	0	0	0	0	\N	\N	\N	0	0	28	22	258	11.7	3	14	67.9	28	1.5	17.2	78.6	9.2	22	11.7	258	3	0
8	Vikings	Ty Chandler	26	RB	17	0	56	182	0	9	37.5	25	3.3	10.7	3.3	6	6	42	7	0	2	66.7	10	0.4	2.5	100	7	62	3.6	224	0	0
9	Vikings	Sam Darnold	27	QB	17	17	67	212	1	23	41.8	19	3.2	12.5	3.9	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	67	3.2	212	1	8
10	Vikings	Johnny Mundt	30	TE	17	3	0	0	0	0	\N	\N	\N	0	0	27	19	142	7.5	2	8	44.4	20	1.1	8.4	70.4	5.3	19	7.5	142	2	0
11	Vikings	Trent Sherfield	28	WR	17	1	0	0	0	0	\N	\N	\N	0	0	9	8	83	10.4	1	4	88.9	17	0.5	4.9	88.9	9.2	8	10.4	83	1	0
12	Vikings	Brandon Powell	29	WR	17	1	0	0	0	0	\N	\N	\N	0	0	10	7	71	10.1	0	5	50	13	0.4	4.2	70	7.1	7	10.1	71	0	1
13	Vikings	C.J. Ham	31	FB	17	3	2	10	1	1	100	8	5	0.6	0.1	6	5	35	7	0	1	33.3	13	0.3	2.1	83.3	5.8	7	6.4	45	1	1
14	Vikings	Myles Gaskin	27	RB	5	0	3	-1	0	0	0	2	-0.3	-0.2	0.6	1	1	11	11	0	0	100	11	0.2	2.2	100	11	4	2.5	10	0	0
15	Vikings	Nick Mullens	29	QB	4	0	3	-2	0	0	0	\N	-0.7	-0.5	0.8	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	3	-0.7	-2	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Dolphins	De'Von Achane	23	RB	17	16	203	907	6	37	49.3	61	4.5	53.4	11.9	87	78	592	7.6	6	30	57.5	39	4.6	34.8	89.7	6.8	281	5.3	1499	12	1
2	Dolphins	Tyreek Hill	30	WR	17	17	8	53	0	2	62.5	16	6.6	3.1	0.5	123	81	959	11.8	6	54	52	80	4.8	56.4	65.9	7.8	89	11.4	1012	6	0
3	Dolphins	Jonnu Smith	29	TE	17	6	2	-1	0	0	0	\N	-0.5	-0.1	0.1	111	88	884	10	8	55	63.1	57	5.2	52	79.3	8	90	9.8	883	8	2
4	Dolphins	Jaylen Waddle	26	WR	15	15	4	12	0	1	75	6	3	0.8	0.3	83	58	744	12.8	2	38	54.2	63	3.9	49.6	69.9	9	62	12.2	756	2	0
5	Dolphins	Raheem Mostert	32	RB	13	1	85	278	2	13	37.6	21	3.3	21.4	6.5	23	19	161	8.5	0	10	52.2	25	1.5	12.4	82.6	7	104	4.2	439	2	2
6	Dolphins	Jaylen Wright	21	RB	15	1	68	249	0	11	39.7	20	3.7	16.6	4.5	6	3	8	2.7	0	1	16.7	6	0.2	0.5	50	1.3	71	3.6	257	0	1
7	Dolphins	Malik Washington	23	WR	14	3	5	25	1	1	60	18	5	1.8	0.4	36	26	223	8.6	0	13	55.6	20	1.9	15.9	72.2	6.2	31	8	248	1	1
8	Dolphins	Tyler Huntley	26	QB	5	5	26	135	2	10	50	20	5.2	27	5.2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	26	5.2	135	2	6
9	Dolphins	Alec Ingold	28	FB	15	10	10	17	1	6	60	6	1.7	1.1	0.7	12	11	96	8.7	0	3	66.7	25	0.7	6.4	91.7	8	21	5.4	113	1	2
10	Dolphins	Julian Hill	24	TE	16	11	0	0	0	0	\N	\N	\N	0	0	19	12	100	8.3	0	5	52.6	17	0.8	6.3	63.2	5.3	12	8.3	100	0	1
11	Dolphins	Jeff Wilson	29	RB	9	0	16	57	0	3	43.8	14	3.6	6.3	1.8	3	3	19	6.3	0	0	100	7	0.3	2.1	100	6.3	19	4	76	0	0
12	Dolphins	River Cracraft	30	WR	8	0	0	0	0	0	\N	\N	\N	0	0	9	7	66	9.4	0	4	55.6	16	0.9	8.3	77.8	7.3	7	9.4	66	0	0
13	Dolphins	Odell Beckham Jr.	32	WR	9	0	0	0	0	0	\N	\N	\N	0	0	18	9	55	6.1	0	3	27.8	11	1	6.1	50	3.1	9	6.1	55	0	0
14	Dolphins	Durham Smythe	29	TE	17	4	0	0	0	0	\N	\N	\N	0	0	17	9	53	5.9	0	1	35.3	8	0.5	3.1	52.9	3.1	9	5.9	53	0	0
15	Dolphins	Tua Tagovailoa	26	QB	11	11	17	49	0	5	41.2	13	2.9	4.5	1.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	17	2.9	49	0	7
16	Dolphins	D'Wayne Eskridge	27	WR	6	0	0	0	0	0	\N	\N	\N	0	0	3	3	44	14.7	0	2	66.7	30	0.5	7.3	100	14.7	3	14.7	44	0	0
17	Dolphins	Tanner Conner	26	TE	8	1	0	0	0	0	\N	\N	\N	0	0	4	3	16	5.3	0	1	50	11	0.4	2	75	4	3	5.3	16	0	0
18	Dolphins	Grant Dubose	23	WR	3	0	0	0	0	0	\N	\N	\N	0	0	4	2	11	5.5	0	1	25	13	0.7	3.7	50	2.8	2	5.5	11	0	0
19	Dolphins	Tim Boyle	30	QB	2	0	2	10	0	1	100	6	5	5	1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	2	5	10	0	0
20	Dolphins	Robbie Chosen	31	WR	2	0	0	0	0	0	\N	\N	\N	0	0	4	1	5	5	0	0	0	5	0.5	2.5	25	1.3	1	5	5	0	0
21	Dolphins	Skylar Thompson	27	QB	3	1	1	4	0	0	0	4	4	1.3	0.3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	4	4	0	2
22	Dolphins	Jake Bailey	27	P	17	0	1	0	0	0	0	\N	0	0	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	0	0	0	1
23	Dolphins	Braxton Berrios	29	WR	6	0	0	0	0	0	\N	\N	\N	0	0	4	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
24	Dolphins	Erik Ezukanma	24	WR	2	0	0	0	0	0	\N	\N	\N	0	0	2	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Rams	Kyren Williams	24	RB	16	16	316	1299	14	85	50.9	30	4.1	81.2	19.8	40	34	182	5.4	2	6	45	26	2.1	11.4	85	4.6	350	4.2	1481	16	5
2	Rams	Puka Nacua	23	WR	11	11	11	46	1	2	63.6	9	4.2	4.2	1	106	79	990	12.5	3	47	63.2	51	7.2	90	74.5	9.3	90	11.5	1036	4	0
3	Rams	Cooper Kupp	31	WR	12	11	2	10	0	1	50	9	5	0.8	0.2	100	67	710	10.6	6	28	47	69	5.6	59.2	67	7.1	69	10.4	720	6	1
4	Rams	Tutu Atwell	25	WR	17	5	2	7	0	0	50	7	3.5	0.4	0.1	62	42	562	13.4	0	29	59.7	50	2.5	33.1	67.7	9.1	44	12.9	569	0	0
5	Rams	Demarcus Robinson	30	WR	17	17	0	0	0	0	\N	\N	\N	0	0	64	31	505	16.3	7	27	46.9	46	1.8	29.7	48.4	7.9	31	16.3	505	7	0
6	Rams	Jordan Whittington	24	WR	15	3	2	12	0	2	100	7	6	0.8	0.1	28	22	293	13.3	0	14	75	50	1.5	19.5	78.6	10.5	24	12.7	305	0	0
7	Rams	Colby Parkinson	25	TE	17	9	0	0	0	0	\N	\N	\N	0	0	49	30	294	9.8	1	15	53.1	23	1.8	17.3	61.2	6	30	9.8	294	1	0
8	Rams	Tyler Johnson	26	WR	15	2	0	0	0	0	\N	\N	\N	0	0	41	26	291	11.2	1	10	43.9	63	1.7	19.4	63.4	7.1	26	11.2	291	1	0
9	Rams	Blake Corum	24	RB	17	1	58	207	0	12	43.1	12	3.6	12.2	3.4	8	7	58	8.3	0	5	87.5	12	0.4	3.4	87.5	7.3	65	4.1	265	0	0
10	Rams	Ronnie Rivers	25	RB	17	0	22	99	0	6	54.5	12	4.5	5.8	1.3	6	5	34	6.8	0	1	50	14	0.3	2	83.3	5.7	27	4.9	133	0	0
11	Rams	Tyler Higbee	31	TE	3	3	0	0	0	0	\N	\N	\N	0	0	12	8	66	8.3	2	5	58.3	17	2.7	22	66.7	5.5	8	8.3	66	2	0
12	Rams	Hunter Long	26	TE	17	2	0	0	0	0	\N	\N	\N	0	0	9	7	60	8.6	0	2	77.8	18	0.4	3.5	77.8	6.7	7	8.6	60	0	0
13	Rams	Xavier Smith	27	WR	15	0	4	36	0	1	75	24	9	2.4	0.3	2	2	6	3	0	1	50	11	0.1	0.4	100	3	6	7	42	0	0
14	Rams	Matthew Stafford	36	QB	16	16	30	41	0	10	36.7	15	1.4	2.6	1.9	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	30	1.4	41	0	6
15	Rams	Davis Allen	23	TE	15	5	0	0	0	0	\N	\N	\N	0	0	13	6	39	6.5	0	2	38.5	13	0.4	2.6	46.2	3	6	6.5	39	0	0
16	Rams	Cody Schrader	25	RB	1	0	1	3	0	0	0	3	3	3	1	1	1	6	6	0	0	100	6	1	6	100	6	2	4.5	9	0	0
17	Rams	Jimmy Garoppolo	33	QB	1	1	2	5	0	0	50	5	2.5	5	2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	2	2.5	5	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Chargers	Ladd McConkey	23	WR	16	14	0	0	0	0	\N	\N	\N	0	0	112	82	1149	14	7	52	57.1	60	5.1	71.8	73.2	10.3	82	14	1149	7	2
2	Chargers	J.K. Dobbins	26	RB	13	11	195	905	9	47	42.6	61	4.6	69.6	15	38	32	153	4.8	0	6	26.3	15	2.5	11.8	84.2	4	227	4.7	1058	9	0
3	Chargers	Quentin Johnston	23	WR	15	11	3	6	0	0	33.3	4	2	0.4	0.2	91	55	711	12.9	8	32	50.5	66	3.7	47.4	60.4	7.8	58	12.4	717	8	0
4	Chargers	Josh Palmer	25	WR	15	7	0	0	0	0	\N	\N	\N	0	0	65	39	584	15	1	28	53.8	45	2.6	38.9	60	9	39	15	584	1	0
5	Chargers	Will Dissly	28	TE	15	8	0	0	0	0	\N	\N	\N	0	0	64	50	481	9.6	2	24	54.7	29	3.3	32.1	78.1	7.5	50	9.6	481	2	0
6	Chargers	Gus Edwards	29	RB	11	6	101	365	4	17	49.5	43	3.6	33.2	9.2	5	3	6	2	0	0	0	3	0.3	0.5	60	1.2	104	3.6	371	4	0
7	Chargers	Justin Herbert	26	QB	17	17	69	306	2	23	46.4	41	4.4	18	4.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	69	4.4	306	2	6
8	Chargers	Kimani Vidal	23	RB	10	0	43	155	0	7	32.6	19	3.6	15.5	4.3	9	5	62	12.4	1	2	33.3	38	0.5	6.2	55.6	6.9	48	4.5	217	1	1
9	Chargers	Stone Smartt	26	TE	15	2	0	0	0	0	\N	\N	\N	0	0	19	16	208	13	0	11	68.4	31	1.1	13.9	84.2	10.9	16	13	208	0	1
10	Chargers	Derius Davis	24	WR	15	2	12	39	0	2	50	10	3.3	2.6	0.8	17	13	112	8.6	2	5	52.9	23	0.9	7.5	76.5	6.6	25	6	151	2	3
11	Chargers	Hassan Haskins	25	RB	17	0	34	89	2	13	50	12	2.6	5.2	2	3	3	49	16.3	1	2	100	34	0.2	2.9	100	16.3	37	3.7	138	3	1
12	Chargers	Simi Fehoko	27	WR	8	2	0	0	0	0	\N	\N	\N	0	0	16	6	106	17.7	0	6	37.5	30	0.8	13.3	37.5	6.6	6	17.7	106	0	0
13	Chargers	Jalen Reagor	25	WR	8	2	3	-3	0	0	0	1	-1	-0.4	0.4	12	7	100	14.3	0	3	33.3	41	0.9	12.5	58.3	8.3	10	9.7	97	0	1
14	Chargers	Hayden Hurst	31	TE	9	2	0	0	0	0	\N	\N	\N	0	0	13	8	73	9.1	0	2	38.5	27	0.9	8.1	61.5	5.6	8	9.1	73	0	0
15	Chargers	Tucker Fisk	25	TE	9	5	0	0	0	0	\N	\N	\N	0	0	8	7	39	5.6	0	1	62.5	10	0.8	4.3	87.5	4.9	7	5.6	39	0	0
16	Chargers	DJ Chark	28	WR	7	0	0	0	0	0	\N	\N	\N	0	0	10	4	31	7.8	1	1	30	12	0.6	4.4	40	3.1	4	7.8	31	1	0
17	Chargers	Scott Matlock	24	DL	17	11	0	0	0	0	\N	\N	\N	0	0	5	4	28	7	0	1	60	10	0.2	1.6	80	5.6	4	7	28	0	0
18	Chargers	Taylor Heinicke	31	QB	4	0	2	20	0	1	50	12	10	5	0.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	2	10	20	0	0
19	Chargers	Eric Tomlinson	32	TE	9	1	0	0	0	0	\N	\N	\N	0	0	4	2	9	4.5	0	0	0	7	0.2	1	50	2.3	2	4.5	9	0	0
20	Chargers	JK Scott	29	P	17	0	1	0	0	0	0	\N	0	0	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	0	0	0	1
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Raiders	Brock Bowers	22	TE	17	16	5	13	0	2	60	12	2.6	0.8	0.3	153	112	1194	10.7	5	61	60.8	57	6.6	70.2	73.2	7.8	117	10.3	1207	5	0
2	Raiders	Jakobi Meyers	28	WR	15	15	2	23	0	1	50	20	11.5	1.5	0.1	129	87	1027	11.8	4	52	55.8	43	5.8	68.5	67.4	8	89	11.8	1050	4	0
3	Raiders	Alexander Mattison	26	RB	14	7	132	420	4	25	35.6	24	3.2	30	9.4	48	36	294	8.2	1	13	35.4	31	2.6	21	75	6.1	168	4.3	714	5	1
4	Raiders	Tre Tucker	23	WR	17	14	9	44	1	3	66.7	11	4.9	2.6	0.5	81	47	539	11.5	3	24	43.2	58	2.8	31.7	58	6.7	56	10.4	583	4	0
5	Raiders	Ameer Abdullah	31	RB	16	3	66	311	2	14	50	40	4.7	19.4	4.1	47	40	261	6.5	3	16	59.6	24	2.5	16.3	85.1	5.6	106	5.4	572	5	2
6	Raiders	Zamir White	25	RB	8	5	65	183	1	4	26.2	17	2.8	22.9	8.1	8	6	30	5	0	2	25	14	0.8	3.8	75	3.8	71	3	213	1	2
7	Raiders	Sincere McCormick	24	RB	5	2	39	183	0	10	53.8	29	4.7	36.6	7.8	7	6	29	4.8	0	2	42.9	15	1.2	5.8	85.7	4.1	45	4.7	212	0	0
8	Raiders	Davante Adams	32	WR	3	3	0	0	0	0	\N	\N	\N	0	0	27	18	209	11.6	1	10	51.9	30	6	69.7	66.7	7.7	18	11.6	209	1	0
9	Raiders	DJ Turner	27	WR	12	6	5	33	1	1	60	18	6.6	2.8	0.4	29	16	158	9.9	1	9	37.9	30	1.3	13.2	55.2	5.4	21	9.1	191	2	1
10	Raiders	Michael Mayer	23	TE	11	8	0	0	0	0	\N	\N	\N	0	0	32	21	156	7.4	0	8	53.1	29	1.9	14.2	65.6	4.9	21	7.4	156	0	0
11	Raiders	Harrison Bryant	26	TE	13	3	0	0	0	0	\N	\N	\N	0	0	12	9	86	9.6	0	5	66.7	18	0.7	6.6	75	7.2	9	9.6	86	0	0
12	Raiders	Gardner Minshew II	28	QB	10	9	19	58	0	5	36.8	11	3.1	5.8	1.9	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	19	3.1	58	0	6
13	Raiders	Terrace Marshall Jr.	24	WR	7	1	0	0	0	0	\N	\N	\N	0	0	6	3	41	13.7	0	1	50	28	0.4	5.9	50	6.8	3	13.7	41	0	0
14	Raiders	Desmond Ridder	25	QB	6	1	9	36	0	2	44.4	11	4	6	1.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	9	4	36	0	3
15	Raiders	Divine Deablo	26	LB	14	14	0	0	0	0	\N	\N	\N	0	0	1	1	34	34	0	1	100	34	0.1	2.4	100	34	1	34	34	0	0
16	Raiders	Alex Bachman	28	WR	6	1	0	0	0	0	\N	\N	\N	0	0	3	3	31	10.3	0	2	66.7	18	0.5	5.2	100	10.3	3	10.3	31	0	0
17	Raiders	Aidan O'Connell	26	QB	9	7	21	30	1	10	52.4	13	1.4	3.3	2.3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	21	1.4	30	1	2
18	Raiders	Kristian Wilkerson	27	WR	3	0	0	0	0	0	\N	\N	\N	0	0	3	2	18	9	1	2	66.7	9	0.7	6	66.7	6	2	9	18	1	0
19	Raiders	Tyreik McAllister	26	WR	3	0	2	11	0	1	50	10	5.5	3.7	0.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	2	5.5	11	0	0
20	Raiders	Chris Collier	24	RB	3	0	5	12	0	0	20	4	2.4	4	1.7	2	1	-4	-4	0	0	0	-4	0.3	-1.3	50	-2	6	1.3	8	0	0
21	Raiders	Ramel Keyton	24	WR	8	0	0	0	0	0	\N	\N	\N	0	0	3	1	7	7	0	1	33.3	7	0.1	0.9	33.3	2.3	1	7	7	0	0
22	Raiders	John Samuel Shenker	26	TE	8	0	0	0	0	0	\N	\N	\N	0	0	1	1	7	7	0	0	100	7	0.1	0.9	100	7	1	7	7	0	0
23	Raiders	Dylan Laube	25	RB	10	0	1	0	0	0	0	\N	0	0	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	0	0	0	1
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Chiefs	Kareem Hunt	29	RB	13	8	200	728	7	42	55.5	20	3.6	56	15.4	32	23	176	7.7	0	10	53.1	26	1.8	13.5	71.9	5.5	223	4.1	904	7	0
2	Chiefs	Travis Kelce	35	TE	16	16	1	1	0	0	100	1	1	0.1	0.1	133	97	823	8.5	3	47	60.2	38	6.1	51.4	72.9	6.2	98	8.4	824	3	2
3	Chiefs	Xavier Worthy	21	WR	17	13	20	104	3	4	75	21	5.2	6.1	1.2	98	59	638	10.8	6	36	56.1	54	3.5	37.5	60.2	6.5	79	9.4	742	9	0
4	Chiefs	DeAndre Hopkins	32	WR	10	5	0	0	0	0	\N	\N	\N	0	0	59	41	437	10.7	4	25	57.6	35	4.1	43.7	69.5	7.4	41	10.7	437	4	0
5	Chiefs	Noah Gray	25	TE	17	10	1	-4	0	0	0	-4	-4	-0.2	0.1	49	40	437	10.9	5	25	67.3	35	2.4	25.7	81.6	8.9	41	10.6	433	5	0
6	Chiefs	Samaje Perine	29	RB	17	0	20	92	1	7	55	13	4.6	5.4	1.2	35	28	322	11.5	1	15	51.4	36	1.6	18.9	80	9.2	48	8.6	414	2	0
7	Chiefs	Isiah Pacheco	25	RB	7	6	83	310	1	14	53	34	3.7	44.3	11.9	16	12	79	6.6	0	4	37.5	23	1.7	11.3	75	4.9	95	4.1	389	1	0
8	Chiefs	Patrick Mahomes	29	QB	16	16	58	307	2	22	50	33	5.3	19.2	3.6	1	1	2	2	0	0	0	2	0.1	0.1	100	2	59	5.2	309	2	2
9	Chiefs	Rashee Rice	24	WR	4	4	1	1	0	1	100	1	1	0.3	0.3	29	24	288	12	2	15	65.5	44	6	72	82.8	9.9	25	11.6	289	2	0
10	Chiefs	Justin Watson	28	WR	17	7	0	0	0	0	\N	\N	\N	0	0	32	22	289	13.1	2	13	56.3	49	1.3	17	68.8	9	22	13.1	289	2	0
11	Chiefs	JuJu Smith-Schuster	28	WR	14	8	0	0	0	0	\N	\N	\N	0	0	26	18	231	12.8	2	11	53.8	50	1.3	16.5	69.2	8.9	18	12.8	231	2	0
12	Chiefs	Carson Steele	22	RB	17	3	56	183	0	14	55.4	9	3.3	10.8	3.3	11	7	26	3.7	0	0	18.2	9	0.4	1.5	63.6	2.4	63	3.3	209	0	3
13	Chiefs	Mecole Hardman	26	WR	12	0	5	62	1	2	100	20	12.4	5.2	0.4	14	12	90	7.5	0	6	57.1	17	1	7.5	85.7	6.4	17	8.9	152	1	0
14	Chiefs	Marquise Brown	27	WR	2	1	0	0	0	0	\N	\N	\N	0	0	15	9	91	10.1	0	5	40	20	4.5	45.5	60	6.1	9	10.1	91	0	0
15	Chiefs	Peyton Hendershot	25	TE	7	1	0	0	0	0	\N	\N	\N	0	0	5	5	51	10.2	0	2	80	15	0.7	7.3	100	10.2	5	10.2	51	0	0
16	Chiefs	Nikko Remigio	25	WR	5	1	0	0	0	0	\N	\N	\N	0	0	6	2	48	24	0	2	33.3	25	0.4	9.6	33.3	8	2	24	48	0	1
17	Chiefs	Jared Wiley	24	TE	7	2	0	0	0	0	\N	\N	\N	0	0	1	1	7	7	0	0	0	7	0.1	1	100	7	1	7	7	0	0
18	Chiefs	Mike Caliendo	27	OL	17	3	0	0	0	0	\N	\N	\N	0	0	1	1	5	5	0	1	100	5	0.1	0.3	100	5	1	5	5	0	0
19	Chiefs	Jody Fortson	29	TE	3	0	0	0	0	0	\N	\N	\N	0	0	3	1	5	5	0	1	33.3	5	0.3	1.7	33.3	1.7	1	5	5	0	0
20	Chiefs	Chris Oladokun	27	QB	1	0	1	5	0	0	0	5	5	5	1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	5	5	0	1
21	Chiefs	Jaden Hicks	22	DB	17	1	1	1	0	0	0	1	1	0.1	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	1	1	0	0
22	Chiefs	Wanya Morris	24	OL	17	11	0	0	0	0	\N	\N	\N	0	0	1	1	1	1	1	1	100	1	0.1	0.1	100	1	1	1	1	1	0
23	Chiefs	Baylor Cupp	24	TE	1	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
24	Chiefs	Skyy Moore	24	WR	6	0	0	0	0	0	\N	\N	\N	0	0	3	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
25	Chiefs	Justyn Ross	25	WR	2	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
26	Chiefs	Carson Wentz	32	QB	3	1	3	0	0	0	0	\N	0	0	1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	3	0	0	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Jaguars	Brian Thomas	22	WR	17	16	6	48	0	3	66.7	18	8	2.8	0.4	133	87	1282	14.7	10	53	55.6	85	5.1	75.4	65.4	9.6	93	14.3	1330	10	0
2	Jaguars	Tank Bigsby	23	RB	16	1	168	766	7	39	49.4	65	4.6	47.9	10.5	12	7	54	7.7	0	1	25	28	0.4	3.4	58.3	4.5	175	4.7	820	7	4
3	Jaguars	Travis Etienne	25	RB	15	15	150	558	2	31	45.3	22	3.7	37.2	10	52	39	254	6.5	0	13	38.5	26	2.6	16.9	75	4.9	189	4.3	812	2	1
4	Jaguars	Brenton Strange	24	TE	17	10	0	0	0	0	\N	\N	\N	0	0	53	40	411	10.3	2	21	66	30	2.4	24.2	75.5	7.8	40	10.3	411	2	1
5	Jaguars	Parker Washington	22	WR	17	7	0	0	0	0	\N	\N	\N	0	0	51	32	390	12.2	3	19	52.9	30	1.9	22.9	62.7	7.6	32	12.2	390	3	2
6	Jaguars	Christian Kirk	28	WR	8	7	0	0	0	0	\N	\N	\N	0	0	47	27	379	14	1	18	48.9	61	3.4	47.4	57.4	8.1	27	14	379	1	0
7	Jaguars	Evan Engram	30	TE	9	9	0	0	0	0	\N	\N	\N	0	0	64	47	365	7.8	1	17	45.3	24	5.2	40.6	73.4	5.7	47	7.8	365	1	1
8	Jaguars	Gabriel Davis	25	WR	10	9	0	0	0	0	\N	\N	\N	0	0	42	20	239	12	2	13	40.5	22	2	23.9	47.6	5.7	20	12	239	2	1
9	Jaguars	D'Ernest Johnson	28	RB	14	1	32	143	0	7	50	22	4.5	10.2	2.3	19	12	96	8	0	3	26.3	26	0.9	6.9	63.2	5.1	44	5.4	239	0	0
10	Jaguars	Trevor Lawrence	25	QB	10	10	26	119	3	13	57.7	33	4.6	11.9	2.6	0	0	-5	\N	0	0	\N	-5	0	-0.5	\N	\N	26	4.4	114	3	3
11	Jaguars	Mac Jones	26	QB	10	7	28	92	1	12	50	13	3.3	9.2	2.8	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	28	3.3	92	1	2
12	Jaguars	Devin Duvernay	27	WR	13	1	4	3	0	1	50	4	0.8	0.2	0.3	16	11	79	7.2	0	7	50	28	0.8	6.1	68.8	4.9	15	5.5	82	0	1
13	Jaguars	Luke Farrell	27	TE	17	8	0	0	0	0	\N	\N	\N	0	0	17	12	67	5.6	0	4	52.9	11	0.7	3.9	70.6	3.9	12	5.6	67	0	0
14	Jaguars	Tim Jones	26	WR	17	0	0	0	0	0	\N	\N	\N	0	0	5	3	41	13.7	0	3	60	20	0.2	2.4	60	8.2	3	13.7	41	0	0
15	Jaguars	Austin Trammell	26	WR	1	0	0	0	0	0	\N	\N	\N	0	0	3	2	40	20	0	2	66.7	22	2	40	66.7	13.3	2	20	40	0	1
16	Jaguars	Josiah Deguara	27	TE	15	0	0	0	0	0	\N	\N	\N	0	0	3	3	14	4.7	0	0	0	8	0.2	0.9	100	4.7	3	4.7	14	0	0
17	Jaguars	Josh Reynolds	29	WR	4	1	0	0	0	0	\N	\N	\N	0	0	5	1	11	11	0	0	0	11	0.3	2.8	20	2.2	1	11	11	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Colts	Jonathan Taylor	25	RB	14	13	303	1431	11	71	45.9	70	4.7	102.2	21.6	31	18	136	7.6	1	7	32.3	25	1.3	9.7	58.1	4.4	321	4.9	1567	12	4
2	Colts	Alec Pierce	24	WR	16	13	0	0	0	0	\N	\N	\N	0	0	69	37	824	22.3	7	32	52.2	65	2.3	51.5	53.6	11.9	37	22.3	824	7	0
3	Colts	Josh Downs	23	WR	14	8	1	12	0	0	0	13	12	0.9	0.1	107	72	803	11.2	5	40	53.3	69	5.1	57.4	67.3	7.5	73	11.2	815	5	0
4	Colts	Michael Pittman Jr.	27	WR	16	14	0	0	0	0	\N	\N	\N	0	0	111	69	808	11.7	3	35	50.5	33	4.3	50.5	62.2	7.3	69	11.7	808	3	1
5	Colts	Anthony Richardson	22	QB	11	11	86	499	6	34	58.1	29	5.8	45.4	7.8	1	1	-1	-1	0	0	0	-1	0.1	-0.1	100	-1	87	5.7	498	6	9
6	Colts	Adonai Mitchell	22	WR	17	7	4	6	0	1	50	10	1.5	0.4	0.2	55	23	312	13.6	0	16	36.4	36	1.4	18.4	41.8	5.7	27	11.8	318	0	2
7	Colts	Trey Sermon	25	RB	17	3	56	159	2	14	44.6	17	2.8	9.4	3.3	19	16	99	6.2	0	3	31.6	14	0.9	5.8	84.2	5.2	72	3.6	258	2	0
8	Colts	Tyler Goodson	24	RB	16	0	32	153	1	6	46.9	33	4.8	9.6	2	15	11	61	5.5	1	3	33.3	24	0.7	3.8	73.3	4.1	43	5	214	2	0
9	Colts	Kylen Granson	26	TE	17	6	0	0	0	0	\N	\N	\N	0	0	31	14	182	13	0	8	38.7	40	0.8	10.7	45.2	5.9	14	13	182	0	0
10	Colts	Mo Alie-Cox	31	TE	17	13	0	0	0	0	\N	\N	\N	0	0	22	12	147	12.3	1	7	54.5	22	0.7	8.6	54.5	6.7	12	12.3	147	1	0
11	Colts	Ashton Dulin	27	WR	15	2	5	45	0	2	100	12	9	3	0.3	8	2	67	33.5	1	2	25	54	0.1	4.5	25	8.4	7	16	112	1	0
12	Colts	Andrew Ogletree	26	TE	17	6	0	0	0	0	\N	\N	\N	0	0	14	9	109	12.1	1	6	42.9	22	0.5	6.4	64.3	7.8	9	12.1	109	1	0
13	Colts	Will Mallory	25	TE	10	0	0	0	0	0	\N	\N	\N	0	0	8	4	29	7.3	0	1	12.5	10	0.4	2.9	50	3.6	4	7.3	29	0	0
14	Colts	Joe Flacco	39	QB	8	6	9	26	0	2	22.2	21	2.9	3.3	1.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	9	2.9	26	0	4
15	Colts	Anthony Gould	23	WR	8	0	0	0	0	0	\N	\N	\N	0	0	1	1	23	23	0	1	100	23	0.1	2.9	100	23	1	23	23	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Texans	Joe Mixon	28	RB	14	14	245	1016	11	52	42.4	59	4.1	72.6	17.5	52	36	309	8.6	1	12	53.8	37	2.6	22.1	69.2	5.9	281	4.7	1325	12	0
2	Texans	Nico Collins	25	WR	12	12	0	0	0	0	\N	\N	\N	0	0	99	68	1006	14.8	7	48	56.6	67	5.7	83.8	68.7	10.2	68	14.8	1006	7	0
3	Texans	Tank Dell	25	WR	14	10	9	43	0	3	33.3	18	4.8	3.1	0.6	81	51	667	13.1	3	35	53.1	50	3.6	47.6	63	8.2	60	11.8	710	3	0
4	Texans	Dalton Schultz	28	TE	17	13	0	0	0	0	\N	\N	\N	0	0	85	53	532	10	2	26	49.4	32	3.1	31.3	62.4	6.3	53	10	532	2	0
5	Texans	Stefon Diggs	31	WR	8	8	3	8	1	1	66.7	6	2.7	1	0.4	64	47	496	10.6	3	31	51.6	49	5.9	62	73.4	7.8	50	10.1	504	4	0
6	Texans	Dare Ogunbowale	30	RB	17	1	30	112	0	5	36.7	35	3.7	6.6	1.8	28	19	198	10.4	1	8	35.7	31	1.1	11.6	67.9	7.1	49	6.3	310	1	0
7	Texans	Dameon Pierce	24	RB	11	0	40	293	2	7	42.5	92	7.3	26.6	3.6	4	2	2	1	0	0	0	1	0.2	0.2	50	0.5	42	7	295	2	1
8	Texans	John Metchie	24	WR	13	3	0	0	0	0	\N	\N	\N	0	0	37	24	254	10.6	1	11	48.6	28	1.8	19.5	64.9	6.9	24	10.6	254	1	1
9	Texans	C.J. Stroud	23	QB	17	17	52	233	0	14	38.5	25	4.5	13.7	3.1	1	0	0	\N	0	0	0	\N	0	0	0	0	52	4.5	233	0	6
10	Texans	Robert Woods	32	WR	15	4	0	0	0	0	\N	\N	\N	0	0	30	20	203	10.2	0	12	50	32	1.3	13.5	66.7	6.8	20	10.2	203	0	3
11	Texans	Cam Akers	25	RB	5	2	40	147	1	5	30	15	3.7	29.4	8	7	4	16	4	1	1	14.3	8	0.8	3.2	57.1	2.3	44	3.7	163	2	1
12	Texans	Cade Stover	24	TE	15	9	0	0	0	0	\N	\N	\N	0	0	22	15	133	8.9	1	5	40.9	27	1	8.9	68.2	6	15	8.9	133	1	0
13	Texans	Xavier Hutchinson	24	WR	16	3	0	0	0	0	\N	\N	\N	0	0	26	12	117	9.8	0	6	34.6	19	0.8	7.3	46.2	4.5	12	9.8	117	0	0
14	Texans	J.J. Taylor	26	RB	5	0	10	44	0	1	50	9	4.4	8.8	2	3	2	0	0	0	0	0	\N	0.4	0	66.7	0	12	3.7	44	0	0
15	Texans	Diontae Johnson	28	WR	1	0	0	0	0	0	\N	\N	\N	0	0	4	2	12	6	0	1	25	10	2	12	50	3	2	6	12	0	0
16	Texans	Davis Mills	26	QB	4	0	3	11	0	1	66.7	9	3.7	2.8	0.8	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	3	3.7	11	0	0
17	Texans	Brevin Jordan	24	TE	2	1	0	0	0	0	\N	\N	\N	0	0	3	2	7	3.5	0	1	33.3	4	1	3.5	66.7	2.3	2	3.5	7	0	0
18	Texans	British Brooks	25	RB	5	0	1	2	0	0	0	2	2	0.4	0.2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	2	2	0	0
19	Texans	Andrew Beck	28	FB	1	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
20	Texans	Steven Sims	27	WR	7	0	1	0	0	0	0	\N	0	0	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	0	0	0	2
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Packers	Josh Jacobs	26	RB	17	17	301	1329	15	73	52.2	38	4.4	78.2	17.7	43	36	342	9.5	1	15	53.5	49	2.1	20.1	83.7	8	337	5	1671	16	4
2	Packers	Jayden Reed	24	WR	17	10	20	163	1	7	65	33	8.2	9.6	1.2	75	55	857	15.6	6	29	56	70	3.2	50.4	73.3	11.4	75	13.6	1020	7	3
3	Packers	Tucker Kraft	24	TE	17	17	3	6	0	3	100	2	2	0.4	0.2	70	50	707	14.1	7	30	58.6	67	2.9	41.6	71.4	10.1	53	13.5	713	7	1
4	Packers	Christian Watson	25	WR	15	15	4	23	0	1	75	14	5.8	1.5	0.3	53	29	620	21.4	2	21	47.2	60	1.9	41.3	54.7	11.7	33	19.5	643	2	1
5	Packers	Romeo Doubs	24	WR	13	12	0	0	0	0	\N	\N	\N	0	0	72	46	601	13.1	4	33	59.7	39	3.5	46.2	63.9	8.3	46	13.1	601	4	0
6	Packers	Emanuel Wilson	25	RB	17	0	103	502	4	27	59.2	21	4.9	29.5	6.1	14	11	48	4.4	1	3	21.4	30	0.6	2.8	78.6	3.4	114	4.8	550	5	0
7	Packers	Dontayvion Wicks	23	WR	17	5	0	0	0	0	\N	\N	\N	0	0	76	39	415	10.6	5	25	39.5	36	2.3	24.4	51.3	5.5	39	10.6	415	5	0
8	Packers	Chris Brooks	24	RB	15	0	36	183	1	12	55.6	23	5.1	12.2	2.4	13	11	69	6.3	0	2	46.2	15	0.7	4.6	84.6	5.3	47	5.4	252	1	0
9	Packers	Bo Melton	25	WR	17	0	8	54	0	4	62.5	16	6.8	3.2	0.5	17	8	91	11.4	0	5	41.2	28	0.5	5.4	47.1	5.4	16	9.1	145	0	0
10	Packers	Malik Willis	25	QB	7	2	20	138	1	6	50	29	6.9	19.7	2.9	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	20	6.9	138	1	1
11	Packers	Malik Heath	24	WR	13	1	0	0	0	0	\N	\N	\N	0	0	13	10	97	9.7	2	5	69.2	41	0.8	7.5	76.9	7.5	10	9.7	97	2	0
12	Packers	Jordan Love	26	QB	15	15	25	83	1	9	44	14	3.3	5.5	1.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	25	3.3	83	1	4
13	Packers	Luke Musgrave	24	TE	7	3	0	0	0	0	\N	\N	\N	0	0	10	7	45	6.4	0	2	30	19	1	6.4	70	4.5	7	6.4	45	0	0
14	Packers	Ben Sims	24	TE	17	5	0	0	0	0	\N	\N	\N	0	0	5	4	42	10.5	0	1	60	28	0.2	2.5	80	8.4	4	10.5	42	0	0
15	Packers	MarShawn Lloyd	23	RB	1	0	6	15	0	0	16.7	5	2.5	15	6	1	1	3	3	0	0	0	3	1	3	100	3	7	2.6	18	0	0
16	Packers	John FitzPatrick	24	TE	9	0	0	0	0	0	\N	\N	\N	0	0	1	1	2	2	0	0	0	2	0.1	0.2	100	2	1	2	2	0	0
17	Packers	Andrew Beck	28	FB	3	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Lions	Jahmyr Gibbs	22	RB	17	4	250	1412	16	70	53.6	70	5.6	83.1	14.7	63	52	517	9.9	4	25	55.6	54	3.1	30.4	82.5	8.2	302	6.4	1929	20	1
2	Lions	Amon-Ra St. Brown	25	WR	17	17	2	6	0	1	50	10	3	0.4	0.1	141	115	1263	11	12	73	70.2	66	6.8	74.3	81.6	9	117	10.8	1269	12	1
3	Lions	David Montgomery	27	RB	14	14	185	775	12	50	55.1	21	4.2	55.4	13.2	38	36	341	9.5	0	16	73.7	40	2.6	24.4	94.7	9	221	5	1116	12	2
4	Lions	Jameson Williams	23	WR	15	11	11	61	1	5	63.6	15	5.5	4.1	0.7	91	58	1001	17.3	7	41	52.7	82	3.9	66.7	63.7	11	69	15.4	1062	8	0
5	Lions	Sam LaPorta	23	TE	16	16	0	0	0	0	\N	\N	\N	0	0	83	60	726	12.1	7	39	56.6	52	3.8	45.4	72.3	8.7	60	12.1	726	7	0
6	Lions	Tim Patrick	31	WR	16	9	0	0	0	0	\N	\N	\N	0	0	44	33	394	11.9	3	20	56.8	42	2.1	24.6	75	9	33	11.9	394	3	0
7	Lions	Kalif Raymond	30	WR	12	2	2	0	0	1	50	\N	0	0	0.2	22	17	215	12.6	2	10	59.1	38	1.4	17.9	77.3	9.8	19	11.3	215	2	0
8	Lions	Craig Reynolds	28	RB	17	0	31	139	0	6	54.8	19	4.5	8.2	1.8	5	3	40	13.3	0	2	60	26	0.2	2.4	60	8	34	5.3	179	0	1
9	Lions	Brock Wright	26	TE	17	8	0	0	0	0	\N	\N	\N	0	0	16	13	100	7.7	2	7	68.8	16	0.8	5.9	81.3	6.3	13	7.7	100	2	0
10	Lions	Jared Goff	30	QB	17	17	35	56	0	9	34.3	10	1.6	3.3	2.1	1	1	7	7	1	1	100	7	0.1	0.4	100	7	36	1.8	63	1	6
11	Lions	Sione Vaki	23	RB	16	0	6	14	0	0	33.3	7	2.3	0.9	0.4	3	3	37	12.3	0	2	100	17	0.2	2.3	100	12.3	9	5.7	51	0	0
12	Lions	Jermar Jefferson	24	RB	2	0	6	22	0	1	83.3	8	3.7	11	3	1	1	10	10	0	1	100	10	0.5	5	100	10	7	4.6	32	0	0
13	Lions	Allen Robinson	31	WR	12	0	0	0	0	0	\N	\N	\N	0	0	7	3	30	10	0	3	42.9	21	0.3	2.5	42.9	4.3	3	10	30	0	0
14	Lions	Shane Zylstra	28	TE	12	1	0	0	0	0	\N	\N	\N	0	0	1	1	22	22	0	1	100	22	0.1	1.8	100	22	1	22	22	0	0
15	Lions	Dan Skipper	30	T	17	5	0	0	0	0	\N	\N	\N	0	0	1	1	9	9	1	1	100	9	0.1	0.5	100	9	1	9	9	1	0
16	Lions	Isaiah Williams	23	WR	2	0	0	0	0	0	\N	\N	\N	0	0	3	2	6	3	0	0	0	4	1	3	66.7	2	2	3	6	0	0
17	Lions	Hendon Hooker	26	QB	3	0	5	2	0	1	20	3	0.4	0.7	1.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	5	0.4	2	0	0
18	Lions	Jalen Reeves-Maybin	29	LB	10	0	1	1	0	0	0	1	1	0.1	0.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	1	1	0	0
19	Lions	Taylor Decker	31	T	14	14	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
20	Lions	Tom Kennedy	28	WR	4	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Broncos	Courtland Sutton	29	WR	17	13	0	0	0	0	\N	\N	\N	0	0	135	81	1081	13.3	8	57	53.3	47	4.8	63.6	60	8	81	13.3	1081	8	1
2	Broncos	Javonte Williams	24	RB	17	11	139	513	4	30	46.8	20	3.7	30.2	8.2	70	52	346	6.7	0	14	37.1	34	3.1	20.4	74.3	4.9	191	4.5	859	4	2
3	Broncos	Jaleel McLaughlin	24	RB	16	5	113	496	1	25	51.3	21	4.4	31	7.1	27	24	76	3.2	2	3	33.3	11	1.5	4.8	88.9	2.8	137	4.2	572	3	1
4	Broncos	Marvin Mims	22	WR	17	2	13	42	0	3	38.5	17	3.2	2.5	0.8	52	39	503	12.9	6	14	48.1	93	2.3	29.6	75	9.7	52	10.5	545	6	1
5	Broncos	Devaughn Vele	27	WR	13	7	0	0	0	0	\N	\N	\N	0	0	55	41	475	11.6	3	26	63.6	37	3.2	36.5	74.5	8.6	41	11.6	475	3	0
6	Broncos	Bo Nix	24	QB	17	17	92	430	4	41	53.3	32	4.7	25.3	5.4	1	1	2	2	1	1	100	2	0.1	0.1	100	2	93	4.6	432	5	3
7	Broncos	Audric Estime	21	RB	13	1	76	310	2	15	51.3	21	4.1	23.8	5.8	5	5	27	5.4	0	2	40	13	0.4	2.1	100	5.4	81	4.2	337	2	2
8	Broncos	Lil'Jordan Humphrey	26	WR	17	7	0	0	0	0	\N	\N	\N	0	0	45	31	293	9.5	1	12	46.7	41	1.8	17.2	68.9	6.5	31	9.5	293	1	2
9	Broncos	Troy Franklin	21	WR	16	6	2	8	0	0	50	5	4	0.5	0.1	53	28	263	9.4	2	11	35.8	30	1.8	16.4	52.8	5	30	9	271	2	0
10	Broncos	Adam Trautman	27	TE	17	14	0	0	0	0	\N	\N	\N	0	0	22	13	188	14.5	2	8	40.9	37	0.8	11.1	59.1	8.5	13	14.5	188	2	0
11	Broncos	Josh Reynolds	29	WR	5	1	0	0	0	0	\N	\N	\N	0	0	19	12	183	15.3	1	8	57.9	49	2.4	36.6	63.2	9.6	12	15.3	183	1	0
12	Broncos	Lucas Krull	26	TE	13	2	0	0	0	0	\N	\N	\N	0	0	23	19	152	8	0	7	47.8	23	1.5	11.7	82.6	6.6	19	8	152	0	0
13	Broncos	Nate Adkins	25	TE	17	10	0	0	0	0	\N	\N	\N	0	0	15	14	115	8.2	3	6	73.3	16	0.8	6.8	93.3	7.7	14	8.2	115	3	0
14	Broncos	Tyler Badie	24	RB	3	0	11	86	0	4	54.5	43	7.8	28.7	3.7	3	3	-2	-0.7	0	0	0	2	1	-0.7	100	-0.7	14	6	84	0	1
15	Broncos	Michael Burton	32	FB	17	2	7	8	1	3	57.1	3	1.1	0.5	0.4	10	10	65	6.5	1	3	60	28	0.6	3.8	100	6.5	17	4.3	73	2	0
16	Broncos	Greg Dulcich	24	TE	4	3	0	0	0	0	\N	\N	\N	0	0	12	5	28	5.6	0	0	8.3	9	1.3	7	41.7	2.3	5	5.6	28	0	0
17	Broncos	Blake Watson	25	RB	2	0	4	10	0	2	75	7	2.5	5	2	2	1	13	13	0	0	50	13	0.5	6.5	50	6.5	5	4.6	23	0	0
18	Broncos	Jarrett Stidham	28	QB	3	0	4	5	0	1	25	8	1.3	1.7	1.3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	4	1.3	5	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Cowboys	Rico Dowdle	26	RB	16	15	235	1079	2	53	53.6	27	4.6	67.4	14.7	49	39	249	6.4	3	13	53.1	22	2.4	15.6	79.6	5.1	274	4.8	1328	5	3
2	Cowboys	CeeDee Lamb	25	WR	15	15	14	70	0	4	42.9	18	5	4.7	0.9	152	101	1194	11.8	6	54	50	65	6.7	79.6	66.4	7.9	115	11	1264	6	1
3	Cowboys	Jalen Tolbert	25	WR	17	15	0	0	0	0	\N	\N	\N	0	0	79	49	610	12.4	7	29	51.9	48	2.9	35.9	62	7.7	49	12.4	610	7	0
4	Cowboys	KaVontae Turpin	28	WR	17	2	16	92	0	6	56.3	16	5.8	5.4	0.9	52	31	420	13.5	2	18	48.1	64	1.8	24.7	59.6	8.1	47	10.9	512	2	3
5	Cowboys	Jake Ferguson	25	TE	14	14	0	0	0	0	\N	\N	\N	0	0	86	59	494	8.4	0	18	39.5	27	4.2	35.3	68.6	5.7	59	8.4	494	0	4
6	Cowboys	Ezekiel Elliott	29	RB	15	2	74	226	3	14	43.2	11	3.1	15.1	4.9	15	12	69	5.8	0	3	46.7	15	0.8	4.6	80	4.6	86	3.4	295	3	1
7	Cowboys	Brandin Cooks	31	WR	10	9	3	-3	0	0	33.3	5	-1	-0.3	0.3	54	26	259	10	3	19	44.4	29	2.6	25.9	48.1	4.8	29	8.8	256	3	0
8	Cowboys	Luke Schoonmaker	26	TE	17	6	0	0	0	0	\N	\N	\N	0	0	36	27	241	8.9	1	11	55.6	24	1.6	14.2	75	6.7	27	8.9	241	1	0
9	Cowboys	Jalen Brooks	24	WR	14	1	0	0	0	0	\N	\N	\N	0	0	30	12	177	14.8	1	8	33.3	41	0.9	12.6	40	5.9	12	14.8	177	1	0
10	Cowboys	Hunter Luepke	24	RB	16	4	12	38	0	6	50	10	3.2	2.4	0.8	16	12	111	9.3	0	5	50	24	0.8	6.9	75	6.9	24	6.2	149	0	0
11	Cowboys	Ryan Flournoy	25	WR	11	1	0	0	0	0	\N	\N	\N	0	0	14	10	102	10.2	0	5	57.1	26	0.9	9.3	71.4	7.3	10	10.2	102	0	1
12	Cowboys	Brevyn Spann-Ford	25	TE	17	0	0	0	0	0	\N	\N	\N	0	0	14	9	88	9.8	0	6	57.1	18	0.5	5.2	64.3	6.3	9	9.8	88	0	0
13	Cowboys	Deuce Vaughn	23	RB	7	0	17	70	0	2	41.2	12	4.1	10	2.4	5	3	18	6	0	0	20	8	0.4	2.6	60	3.6	20	4.4	88	0	0
14	Cowboys	Dak Prescott	31	QB	8	8	13	54	1	5	61.5	22	4.2	6.8	1.6	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	13	4.2	54	1	4
15	Cowboys	Jonathan Mingo	23	WR	8	1	0	0	0	0	\N	\N	\N	0	0	16	5	46	9.2	0	2	25	14	0.6	5.8	31.3	2.9	5	9.2	46	0	0
16	Cowboys	Trey Lance	24	QB	4	1	11	41	0	3	45.5	11	3.7	10.3	2.8	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	11	3.7	41	0	0
17	Cowboys	Dalvin Cook	29	RB	2	0	8	20	0	0	37.5	4	2.5	10	4	1	1	10	10	0	1	100	10	0.5	5	100	10	9	3.3	30	0	0
18	Cowboys	Cooper Rush	31	QB	12	8	26	18	0	5	26.9	9	0.7	1.5	2.2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	26	0.7	18	0	9
19	Cowboys	Juanyeh Thomas	24	S	13	0	0	0	0	0	\N	\N	\N	0	0	1	1	4	4	0	0	0	4	0.1	0.3	100	4	1	4	4	0	0
20	Cowboys	C.J. Goodwin	34	CB	17	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
21	Cowboys	Tyler Smith	23	OL	16	16	0	0	0	0	\N	\N	\N	0	0	1	1	0	0	0	0	0	\N	0.1	0	100	0	1	0	0	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Browns	Jerry Jeudy	25	WR	17	16	0	0	0	0	\N	\N	\N	0	0	145	90	1229	13.7	4	57	53.8	89	5.3	72.3	62.1	8.5	90	13.7	1229	4	0
2	Browns	Jerome Ford	25	RB	14	6	104	565	3	25	47.1	66	5.4	40.4	7.4	43	37	225	6.1	0	10	37.2	26	2.6	16.1	86	5.2	141	5.6	790	3	0
3	Browns	Elijah Moore	24	WR	17	13	1	1	0	0	0	1	1	0.1	0.1	102	61	538	8.8	1	25	35.3	44	3.6	31.6	59.8	5.3	62	8.7	539	1	0
4	Browns	David Njoku	28	TE	11	11	0	0	0	0	\N	\N	\N	0	0	97	64	505	7.9	5	23	39.2	29	5.8	45.9	66	5.2	64	7.9	505	5	0
5	Browns	Jordan Akins	32	TE	17	6	0	0	0	0	\N	\N	\N	0	0	58	40	390	9.8	2	20	51.7	21	2.4	22.9	69	6.7	40	9.8	390	2	1
6	Browns	Nick Chubb	29	RB	8	8	102	332	3	17	41.2	19	3.3	41.5	12.8	11	5	31	6.2	1	3	27.3	19	0.6	3.9	45.5	2.8	107	3.4	363	4	1
7	Browns	Cedric Tillman	24	WR	11	6	1	-5	0	0	0	\N	-5	-0.5	0.1	49	29	339	11.7	3	15	49	38	2.6	30.8	59.2	6.9	30	11.1	334	3	1
8	Browns	D'Onta Foreman	28	RB	11	3	71	232	0	10	39.4	25	3.3	21.1	6.5	8	6	54	9	0	1	37.5	16	0.5	4.9	75	6.8	77	3.7	286	0	2
9	Browns	Amari Cooper	30	WR	6	6	0	0	0	0	\N	\N	\N	0	0	53	24	250	10.4	2	11	35.8	24	4	41.7	45.3	4.7	24	10.4	250	2	0
10	Browns	Pierre Strong	26	RB	14	0	26	108	0	6	46.2	19	4.2	7.7	1.9	22	14	104	7.4	0	3	22.7	21	1	7.4	63.6	4.7	40	5.3	212	0	0
11	Browns	Deshaun Watson	29	QB	7	7	31	148	1	8	41.9	16	4.8	21.1	4.4	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	31	4.8	148	1	5
12	Browns	Dorian Thompson-Robinson	25	QB	7	2	21	122	0	9	61.9	34	5.8	17.4	3	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	21	5.8	122	0	3
13	Browns	Jameis Winston	30	QB	12	7	25	83	1	17	76	13	3.3	6.9	2.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	25	3.3	83	1	5
14	Browns	Michael Woods II	24	WR	5	2	0	0	0	0	\N	\N	\N	0	0	17	7	65	9.3	0	4	29.4	16	1.4	13	41.2	3.8	7	9.3	65	0	0
15	Browns	Blake Whiteheart	24	TE	11	2	0	0	0	0	\N	\N	\N	0	0	9	6	51	8.5	1	2	55.6	29	0.5	4.6	66.7	5.7	6	8.5	51	1	0
16	Browns	Jacob Kibodi	26	RB	1	0	5	24	0	1	20	17	4.8	24	5	3	1	15	15	0	1	33.3	15	1	15	33.3	5	6	6.5	39	0	0
17	Browns	David Bell	24	WR	1	0	0	0	0	0	\N	\N	\N	0	0	3	3	27	9	0	1	33.3	12	3	27	100	9	3	9	27	0	0
18	Browns	Jamari Thrash	24	WR	9	0	0	0	0	0	\N	\N	\N	0	0	7	3	22	7.3	0	2	28.6	11	0.3	2.4	42.9	3.1	3	7.3	22	0	0
19	Browns	James Proche	28	WR	9	0	0	0	0	0	\N	\N	\N	0	0	3	3	21	7	0	1	66.7	14	0.3	2.3	100	7	3	7	21	0	1
20	Browns	Geoff Swaim	31	TE	8	2	0	0	0	0	\N	\N	\N	0	0	1	1	7	7	0	0	100	7	0.1	0.9	100	7	1	7	7	0	0
21	Browns	Jaelon Darden	25	WR	7	1	0	0	0	0	\N	\N	\N	0	0	1	1	6	6	0	1	100	6	0.1	0.9	100	6	1	6	6	0	0
22	Browns	Bailey Zappe	25	QB	1	1	2	2	0	0	0	3	1	2	2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	2	1	2	0	0
23	Browns	Brenden Bates	25	TE	2	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
24	Browns	Kadarius Toney	25	WR	3	0	2	-4	0	0	0	3	-2	-1.3	0.7	1	0	0	\N	0	0	0	\N	0	0	0	0	2	-2	-4	0	1
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Bengals	Ja'Marr Chase	24	WR	17	16	3	32	0	2	100	14	10.7	1.9	0.2	175	127	1708	13.4	17	75	62.3	70	7.5	100.5	72.6	9.8	130	13.4	1740	17	0
2	Bengals	Chase Brown	24	RB	16	10	229	990	7	49	52.4	40	4.3	61.9	14.3	65	54	360	6.7	4	23	52.3	34	3.4	22.5	83.1	5.5	283	4.8	1350	11	2
3	Bengals	Tee Higgins	25	WR	12	9	0	0	0	0	\N	\N	\N	0	0	109	73	911	12.5	10	48	64.2	42	6.1	75.9	67	8.4	73	12.5	911	10	1
4	Bengals	Mike Gesicki	29	TE	17	3	0	0	0	0	\N	\N	\N	0	0	83	65	665	10.2	2	38	62.7	47	3.8	39.1	78.3	8	65	10.2	665	2	1
5	Bengals	Andrei Iosivas	25	WR	17	8	0	0	0	0	\N	\N	\N	0	0	61	36	479	13.3	6	26	55.7	39	2.1	28.2	59	7.9	36	13.3	479	6	0
6	Bengals	Zack Moss	27	RB	8	6	74	242	2	13	36.5	16	3.3	30.3	9.3	27	23	187	8.1	1	11	63	21	2.9	23.4	85.2	6.9	97	4.4	429	3	2
7	Bengals	Joe Burrow	28	QB	17	17	42	201	2	16	47.6	47	4.8	11.8	2.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	42	4.8	201	2	11
8	Bengals	Erick All	24	TE	9	6	0	0	0	0	\N	\N	\N	0	0	22	20	158	7.9	0	8	63.6	28	2.2	17.6	90.9	7.2	20	7.9	158	0	0
9	Bengals	Tanner Hudson	30	TE	11	0	1	1	0	1	100	1	1	0.1	0.1	23	19	154	8.1	1	9	65.2	19	1.7	14	82.6	6.7	20	7.8	155	1	1
10	Bengals	Khalil Herbert	26	RB	8	1	28	114	0	7	53.6	14	4.1	14.3	3.5	9	8	21	2.6	0	0	33.3	7	1	2.6	88.9	2.3	36	3.8	135	0	1
11	Bengals	Jermaine Burton	23	WR	14	1	0	0	0	0	\N	\N	\N	0	0	14	4	107	26.8	0	4	28.6	47	0.3	7.6	28.6	7.6	4	26.8	107	0	0
12	Bengals	Drew Sample	28	TE	17	15	1	-4	0	0	0	\N	-4	-0.2	0.1	22	20	109	5.5	1	8	63.6	12	1.2	6.4	90.9	5	21	5	105	1	1
13	Bengals	Cam Grandy	24	TE	8	6	0	0	0	0	\N	\N	\N	0	0	5	5	28	5.6	0	1	60	9	0.6	3.5	100	5.6	5	5.6	28	0	0
14	Bengals	Trenton Irwin	29	WR	7	2	0	0	0	0	\N	\N	\N	0	0	10	3	15	5	0	1	30	6	0.4	2.1	30	1.5	3	5	15	0	0
15	Bengals	Kendric Pryor	26	WR	1	0	0	0	0	0	\N	\N	\N	0	0	1	1	9	9	0	0	100	9	1	9	100	9	1	9	9	0	0
16	Bengals	Charlie Jones	26	WR	8	0	0	0	0	0	\N	\N	\N	0	0	1	1	5	5	0	0	100	5	0.1	0.6	100	5	1	5	5	0	2
17	Bengals	Sam Hubbard	29	DE	14	14	0	0	0	0	\N	\N	\N	0	0	1	1	2	2	1	1	100	2	0.1	0.1	100	2	1	2	2	1	0
18	Bengals	Jake Browning	28	QB	3	0	2	-2	0	0	0	\N	-1	-0.7	0.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	2	-1	-2	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Bears	D'Andre Swift	25	RB	17	17	253	959	6	43	43.9	56	3.8	56.4	14.9	52	42	386	9.2	0	12	51.9	42	2.5	22.7	80.8	7.4	295	4.6	1345	6	2
2	Bears	D.J. Moore	27	WR	17	17	14	75	0	3	71.4	14	5.4	4.4	0.8	140	98	966	9.9	6	43	47.1	44	5.8	56.8	70	6.9	112	9.3	1041	6	1
3	Bears	Rome Odunze	22	WR	17	12	3	15	0	1	66.7	8	5	0.9	0.2	101	54	734	13.6	3	37	45.5	47	3.2	43.2	53.5	7.3	57	13.1	749	3	2
4	Bears	Keenan Allen	32	WR	15	15	0	0	0	0	\N	\N	\N	0	0	121	70	744	10.6	7	43	47.1	45	4.7	49.6	57.9	6.1	70	10.6	744	7	1
5	Bears	Caleb Williams	23	QB	17	17	81	489	0	27	51.9	24	6	28.8	4.8	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	81	6	489	0	10
6	Bears	Cole Kmet	25	TE	17	16	0	0	0	0	\N	\N	\N	0	0	55	47	474	10.1	4	25	70.9	31	2.8	27.9	85.5	8.6	47	10.1	474	4	0
7	Bears	Roschon Johnson	23	RB	14	0	55	150	6	17	56.4	9	2.7	10.7	3.9	20	16	104	6.5	0	6	40	17	1.1	7.4	80	5.2	71	3.6	254	6	0
8	Bears	DeAndre Carter	31	WR	13	0	0	0	0	0	\N	\N	\N	0	0	14	9	72	8	0	3	35.7	14	0.7	5.5	64.3	5.1	9	8	72	0	1
9	Bears	Gerald Everett	30	TE	17	4	0	0	0	0	\N	\N	\N	0	0	13	8	36	4.5	0	1	23.1	17	0.5	2.1	61.5	2.8	8	4.5	36	0	0
10	Bears	Travis Homer	26	RB	10	0	6	23	0	2	66.7	6	3.8	2.3	0.6	3	3	11	3.7	0	0	33.3	6	0.3	1.1	100	3.7	9	3.8	34	0	0
11	Bears	Khalil Herbert	26	RB	6	0	8	16	1	3	62.5	6	2	2.7	1.3	2	2	4	2	0	0	0	2	0.3	0.7	100	2	10	2	20	1	0
12	Bears	Velus Jones Jr.	27	WR	1	0	2	11	0	1	100	6	5.5	11	2	1	1	8	8	0	0	100	8	1	8	100	8	3	6.3	19	0	1
13	Bears	Collin Johnson	27	WR	9	0	0	0	0	0	\N	\N	\N	0	0	2	1	6	6	0	1	50	6	0.1	0.7	50	3	1	6	6	0	0
14	Bears	Tyler Scott	23	WR	11	0	0	0	0	0	\N	\N	\N	0	0	1	1	5	5	0	0	0	5	0.1	0.5	100	5	1	5	5	0	0
15	Bears	Darrynton Evans	26	RB	5	0	3	3	0	0	33.3	4	1	0.6	0.6	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	3	1	3	0	0
16	Bears	Marcedes Lewis	40	TE	17	4	0	0	0	0	\N	\N	\N	0	0	2	1	2	2	0	1	50	2	0.1	0.1	50	1	1	2	2	0	0
17	Bears	Tyson Bagent	24	QB	4	0	6	-7	0	0	0	\N	-1.2	-1.8	1.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	6	-1.2	-7	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Panthers	Chuba Hubbard	25	RB	15	15	250	1195	10	62	54.8	38	4.8	79.7	16.7	54	43	171	4	1	10	31.5	20	2.9	11.4	79.6	3.2	293	4.7	1366	11	4
2	Panthers	Adam Thielen	34	WR	10	10	0	0	0	0	\N	\N	\N	0	0	62	48	615	12.8	5	28	58.1	40	4.8	61.5	77.4	9.9	48	12.8	615	5	0
3	Panthers	Xavier Legette	23	WR	16	13	6	24	0	2	50	8	4	1.5	0.4	84	49	497	10.1	4	27	44	35	3.1	31.1	58.3	5.9	55	9.5	521	4	0
4	Panthers	Jalen Coker	23	WR	11	4	0	0	0	0	\N	\N	\N	0	0	46	32	478	14.9	2	23	58.7	83	2.9	43.5	69.6	10.4	32	14.9	478	2	0
5	Panthers	Diontae Johnson	28	WR	7	7	2	6	0	1	50	4	3	0.9	0.3	58	30	357	11.9	3	20	39.7	39	4.3	51	51.7	6.2	32	11.3	363	3	0
6	Panthers	Miles Sanders	27	RB	11	2	55	205	2	12	45.5	26	3.7	18.6	5	30	24	148	6.2	1	5	23.3	33	2.2	13.5	80	4.9	79	4.5	353	3	1
7	Panthers	David Moore	29	WR	17	5	1	0	0	0	0	\N	0	0	0.1	57	32	351	11	3	18	49.1	21	1.9	20.6	56.1	6.2	33	10.6	351	3	0
8	Panthers	Ja'Tavion Sanders	21	TE	16	8	0	0	0	0	\N	\N	\N	0	0	43	33	342	10.4	1	13	51.2	46	2.1	21.4	76.7	8	33	10.4	342	1	1
9	Panthers	Bryce Young	23	QB	14	12	43	249	6	15	53.5	34	5.8	17.8	3.1	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	43	5.8	249	6	5
10	Panthers	Tommy Tremble	24	TE	12	11	0	0	0	0	\N	\N	\N	0	0	32	23	234	10.2	2	12	50	38	1.9	19.5	71.9	7.3	23	10.2	234	2	1
11	Panthers	Jonathan Mingo	23	WR	9	5	2	5	0	0	0	3	2.5	0.6	0.2	26	12	121	10.1	0	4	30.8	35	1.3	13.4	46.2	4.7	14	9	126	0	1
12	Panthers	Raheem Blackshear	25	RB	16	1	15	80	0	2	46.7	26	5.3	5	0.9	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	15	5.3	80	0	2
13	Panthers	Mike Boone	29	RB	6	0	13	51	0	3	61.5	9	3.9	8.5	2.2	3	1	-2	-2	0	0	0	\N	0.2	-0.3	33.3	-0.7	14	3.5	49	0	0
14	Panthers	Jonathon Brooks	21	RB	3	1	9	22	0	0	33.3	9	2.4	7.3	3	3	3	23	7.7	0	2	66.7	18	1	7.7	100	7.7	12	3.8	45	0	0
15	Panthers	Dan Chisena	27	WR	6	0	0	0	0	0	\N	\N	\N	0	0	4	3	37	12.3	0	2	75	23	0.5	6.2	75	9.3	3	12.3	37	0	0
16	Panthers	Andy Dalton	37	QB	6	5	11	34	0	2	36.4	18	3.1	5.7	1.8	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	11	3.1	34	0	2
17	Panthers	Deven Thompkins	25	WR	7	0	2	7	0	0	50	9	3.5	1	0.3	4	4	20	5	0	2	50	12	0.6	2.9	100	5	6	4.5	27	0	0
18	Panthers	Feleipe Franks	27	TE	16	0	0	0	0	0	\N	\N	\N	0	0	3	1	12	12	0	1	33.3	12	0.1	0.8	33.3	4	1	12	12	0	0
19	Panthers	Ian Thomas	28	TE	5	2	0	0	0	0	\N	\N	\N	0	0	6	3	7	2.3	0	1	16.7	3	0.6	1.4	50	1.2	3	2.3	7	0	0
20	Panthers	Sam Franklin	28	S	10	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
21	Panthers	Velus Jones Jr.	27	WR	2	0	1	0	0	0	0	\N	0	0	0.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	1	0	0	0	0
22	Panthers	Jordan Matthews	32	TE	4	1	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
23	Panthers	Stephen Sullivan	28	TE	1	0	0	0	0	0	\N	\N	\N	0	0	1	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Bills	James Cook	25	RB	16	16	207	1009	16	48	53.1	65	4.9	63.1	12.9	38	32	258	8.1	2	14	50	28	2	16.1	84.2	6.8	239	5.3	1267	18	1
2	Bills	Khalil Shakir	24	WR	15	9	2	4	0	0	0	2	2	0.3	0.1	100	76	821	10.8	4	35	53	52	5.1	54.7	76	8.2	78	10.6	825	4	1
3	Bills	Ray Davis	25	RB	17	0	113	442	3	25	45.1	23	3.9	26	6.6	19	17	189	11.1	3	8	63.2	63	1	11.1	89.5	9.9	130	4.9	631	6	0
4	Bills	Keon Coleman	21	WR	13	12	1	9	0	0	100	9	9	0.7	0.1	57	29	556	19.2	4	22	43.9	64	2.2	42.8	50.9	9.8	30	18.8	565	4	0
5	Bills	Josh Allen	28	QB	17	17	102	531	12	52	64.7	30	5.2	31.2	6	0	0	7	\N	1	0	\N	7	0	0.4	\N	\N	102	5.3	538	13	5
13	Cardinals	Tony Jones	27	RB	1	0	4	55	1	1	50	46	13.8	55	4	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	4	13.8	55	1	0
6	Bills	Ty Johnson	27	RB	17	1	41	213	1	13	65.9	19	5.2	12.5	2.4	25	18	284	15.8	3	14	60	41	1.1	16.7	72	11.4	59	8.4	497	4	0
7	Bills	Dalton Kincaid	25	TE	13	9	0	0	0	0	\N	\N	\N	0	0	75	44	448	10.2	2	23	53.3	29	3.4	34.5	58.7	6	44	10.2	448	2	1
8	Bills	Mack Hollins	31	WR	17	13	0	0	0	0	\N	\N	\N	0	0	50	31	378	12.2	5	25	58	44	1.8	22.2	62	7.6	31	12.2	378	5	0
9	Bills	Dawson Knox	28	TE	16	13	0	0	0	0	\N	\N	\N	0	0	33	22	311	14.1	1	12	63.6	39	1.4	19.4	66.7	9.4	22	14.1	311	1	0
10	Bills	Amari Cooper	30	WR	8	4	0	0	0	0	\N	\N	\N	0	0	32	20	297	14.9	2	14	53.1	30	2.5	37.1	62.5	9.3	20	14.9	297	2	0
11	Bills	Curtis Samuel	28	WR	14	2	5	14	0	0	40	7	2.8	1	0.4	46	31	253	8.2	1	9	37	38	2.2	18.1	67.4	5.5	36	7.4	267	1	0
12	Bills	Tyrell Shavers	25	WR	3	0	0	0	0	0	\N	\N	\N	0	0	1	1	69	69	1	1	100	69	0.3	23	100	69	1	69	69	1	0
13	Bills	Quintin Morris	25	TE	16	3	0	0	0	0	\N	\N	\N	0	0	8	5	36	7.2	1	3	50	14	0.3	2.3	62.5	4.5	5	7.2	36	1	0
14	Bills	Marquez Valdes-Scantling	30	WR	6	0	0	0	0	0	\N	\N	\N	0	0	9	2	26	13	0	1	22.2	19	0.3	4.3	22.2	2.9	2	13	26	0	0
15	Bills	Reggie Gilliam	27	FB	15	0	3	7	0	1	33.3	4	2.3	0.5	0.2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	3	2.3	7	0	0
16	Bills	Zach Davidson	26	TE	2	0	0	0	0	0	\N	\N	\N	0	0	2	1	5	5	0	0	50	5	0.5	2.5	50	2.5	1	5	5	0	0
17	Bills	Mitchell Trubisky	30	QB	9	0	17	1	0	1	11.8	8	0.1	0.1	1.9	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	17	0.1	1	0	1
1	Ravens	Derrick Henry	30	RB	17	17	325	1921	16	94	58.8	87	5.9	113	19.1	22	19	193	10.2	2	11	68.2	27	1.1	11.4	86.4	8.8	344	6.1	2114	18	3
2	Ravens	Zay Flowers	24	WR	17	15	9	56	0	1	55.6	19	6.2	3.3	0.5	116	74	1059	14.3	4	48	53.4	53	4.4	62.3	63.8	9.1	83	13.4	1115	4	0
3	Ravens	Lamar Jackson	27	QB	17	17	139	915	4	47	56.1	48	6.6	53.8	8.2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	139	6.6	915	4	10
4	Ravens	Rashod Bateman	25	WR	17	14	0	0	0	0	\N	\N	\N	0	0	72	45	756	16.8	9	35	52.8	59	2.6	44.5	62.5	10.5	45	16.8	756	9	0
5	Ravens	Mark Andrews	29	TE	17	13	4	5	0	3	75	2	1.3	0.3	0.2	69	55	673	12.2	11	39	68.1	67	3.2	39.6	79.7	9.8	59	11.5	678	11	0
6	Ravens	Justice Hill	27	RB	15	0	47	228	1	14	44.7	51	4.9	15.2	3.1	51	42	383	9.1	3	17	49	27	2.8	25.5	82.4	7.5	89	6.9	611	4	0
7	Ravens	Isaiah Likely	24	TE	16	9	0	0	0	0	\N	\N	\N	0	0	58	42	477	11.4	6	26	60.3	49	2.6	29.8	72.4	8.2	42	11.4	477	6	1
8	Ravens	Nelson Agholor	31	WR	14	7	0	0	0	0	\N	\N	\N	0	0	29	14	231	16.5	2	10	37.9	56	1	16.5	48.3	8	14	16.5	231	2	0
9	Ravens	Tylan Wallace	25	WR	17	0	0	0	0	0	\N	\N	\N	0	0	12	11	193	17.5	1	5	66.7	84	0.6	11.4	91.7	16.1	11	17.5	193	1	1
10	Ravens	Charlie Kolar	25	TE	13	3	1	2	0	1	100	2	2	0.2	0.1	11	9	131	14.6	1	4	72.7	55	0.7	10.1	81.8	11.9	10	13.3	133	1	0
11	Ravens	Keaton Mitchell	22	RB	5	0	15	30	0	2	40	7	2	6	3	1	1	28	28	0	1	100	28	0.2	5.6	100	28	16	3.6	58	0	0
12	Ravens	Rasheen Ali	23	RB	6	0	10	31	0	2	40	9	3.1	5.2	1.7	2	0	0	\N	0	0	0	\N	0	0	0	0	10	3.1	31	0	0
13	Ravens	Patrick Ricard	30	FB	17	6	0	0	0	0	\N	\N	\N	0	0	5	3	22	7.3	1	1	60	14	0.2	1.3	60	4.4	3	7.3	22	1	0
14	Ravens	Devontez Walker	23	WR	9	0	0	0	0	0	\N	\N	\N	0	0	3	1	21	21	1	1	33.3	21	0.1	2.3	33.3	7	1	21	21	1	0
15	Ravens	Anthony Miller	30	WR	2	0	0	0	0	0	\N	\N	\N	0	0	1	1	16	16	0	1	100	16	0.5	8	100	16	1	16	16	0	0
16	Ravens	Diontae Johnson	28	WR	4	1	0	0	0	0	\N	\N	\N	0	0	5	1	6	6	0	0	20	6	0.3	1.5	20	1.2	1	6	6	0	0
17	Ravens	Josh Johnson	38	QB	6	0	4	1	0	0	0	2	0.3	0.2	0.7	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	4	0.3	1	0	0
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Falcons	Bijan Robinson	22	RB	17	17	304	1456	14	82	60.2	37	4.8	85.6	17.9	72	61	431	7.1	1	20	41.7	29	3.6	25.4	84.7	6	365	5.2	1887	15	1
2	Falcons	Drake London	23	WR	17	17	1	-3	0	0	0	-3	-3	-0.2	0.1	158	100	1271	12.7	9	67	56.3	39	5.9	74.8	63.3	8	101	12.6	1268	9	0
3	Falcons	Darnell Mooney	27	WR	16	16	0	0	0	0	\N	\N	\N	0	0	106	64	992	15.5	5	48	51.9	49	4	62	60.4	9.4	64	15.5	992	5	0
4	Falcons	Ray-Ray McCloud	28	WR	17	13	10	79	0	3	60	20	7.9	4.6	0.6	87	62	686	11.1	1	29	51.7	60	3.6	40.4	71.3	7.9	72	10.6	765	1	4
5	Falcons	Tyler Allgeier	24	RB	17	0	137	644	3	43	58.4	25	4.7	37.9	8.1	13	13	88	6.8	0	2	46.2	13	0.8	5.2	100	6.8	150	4.9	732	3	0
6	Falcons	Kyle Pitts	24	TE	17	15	0	0	0	0	\N	\N	\N	0	0	74	47	602	12.8	4	21	41.9	52	2.8	35.4	63.5	8.1	47	12.8	602	4	0
7	Falcons	KhaDarel Hodge	29	WR	17	2	0	0	0	0	\N	\N	\N	0	0	12	7	131	18.7	1	6	50	45	0.4	7.7	58.3	10.9	7	18.7	131	1	0
8	Falcons	Charlie Woerner	27	TE	16	5	0	0	0	0	\N	\N	\N	0	0	12	7	46	6.6	0	3	33.3	13	0.4	2.9	58.3	3.8	7	6.6	46	0	0
9	Falcons	Jase McClellan	22	RB	2	0	13	32	0	2	46.2	8	2.5	16	6.5	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	13	2.5	32	0	0
10	Falcons	Chris Blair	27	WR	4	0	0	0	0	0	\N	\N	\N	0	0	2	1	17	17	0	1	50	17	0.3	4.3	50	8.5	1	17	17	0	0
11	Falcons	Casey Washington	23	WR	8	0	0	0	0	0	\N	\N	\N	0	0	2	1	14	14	0	1	50	14	0.1	1.8	50	7	1	14	14	0	0
12	Falcons	Michael Penix	24	QB	5	3	7	11	1	1	14.3	5	1.6	2.2	1.4	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	7	1.6	11	1	2
13	Falcons	Ross Dwelley	29	TE	17	0	0	0	0	0	\N	\N	\N	0	0	1	1	5	5	0	0	100	5	0.1	0.3	100	5	1	5	5	0	0
14	Falcons	Kirk Cousins	36	QB	14	14	23	0	0	2	13	\N	0	0	1.6	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	23	0	0	0	13
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Cardinals	James Conner	29	RB	16	16	236	1094	8	67	51.7	53	4.6	68.4	14.8	55	47	414	8.8	1	17	56.4	44	2.9	25.9	85.5	7.5	283	5.3	1508	9	4
2	Cardinals	Trey McBride	25	TE	16	16	1	2	1	1	100	2	2	0.1	0.1	147	111	1146	10.3	2	63	63.3	37	6.9	71.6	75.5	7.8	112	10.3	1148	3	0
3	Cardinals	Marvin Harrison Jr.	22	WR	17	16	0	0	0	0	\N	\N	\N	0	0	116	62	885	14.3	8	43	50	60	3.6	52.1	53.4	7.6	62	14.3	885	8	1
4	Cardinals	Kyler Murray	27	QB	17	17	78	572	5	27	52.6	50	7.3	33.6	4.6	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	78	7.3	572	5	8
5	Cardinals	Michael Wilson	24	WR	16	13	1	7	0	0	0	7	7	0.4	0.1	71	47	548	11.7	4	27	56.3	41	2.9	34.3	66.2	7.7	48	11.6	555	4	1
6	Cardinals	Greg Dortch	26	WR	17	4	5	31	0	1	100	8	6.2	1.8	0.3	50	37	342	9.2	3	16	50	39	2.2	20.1	74	6.8	42	8.9	373	3	3
7	Cardinals	Trey Benson	21	RB	13	1	63	291	1	16	49.2	20	4.6	22.4	4.8	6	6	59	9.8	0	3	100	19	0.5	4.5	100	9.8	69	5.1	350	1	1
8	Cardinals	Emari Demercado	25	RB	13	0	24	223	1	8	50	53	9.3	17.2	1.8	20	16	104	6.5	0	3	35	24	1.2	8	80	5.2	40	8.2	327	1	0
9	Cardinals	Michael Carter	25	RB	3	1	35	131	1	9	57.1	13	3.7	43.7	11.7	11	11	57	5.2	0	2	63.6	18	3.7	19	100	5.2	46	4.1	188	1	0
10	Cardinals	Elijah Higgins	24	TE	17	6	0	0	0	0	\N	\N	\N	0	0	24	20	172	8.6	2	10	70.8	23	1.2	10.1	83.3	7.2	20	8.6	172	2	0
11	Cardinals	Zay Jones	29	WR	11	2	0	0	0	0	\N	\N	\N	0	0	11	8	84	10.5	0	5	63.6	25	0.7	7.6	72.7	7.6	8	10.5	84	0	0
12	Cardinals	DeeJay Dallas	26	RB	17	0	9	49	0	4	66.7	22	5.4	2.9	0.5	3	3	11	3.7	1	1	33.3	5	0.2	0.6	100	3.7	12	5	60	1	1
14	Cardinals	Tip Reiman	23	TE	17	9	0	0	0	0	\N	\N	\N	0	0	7	6	37	6.2	0	1	57.1	14	0.4	2.2	85.7	5.3	6	6.2	37	0	0
15	Cardinals	Xavier Weaver	24	WR	2	0	0	0	0	0	\N	\N	\N	0	0	2	0	0	\N	0	0	0	\N	0	0	0	0	0	\N	0	0	0
16	Cardinals	Clayton Tune	25	QB	6	0	7	-4	0	2	28.6	2	-0.6	-0.7	1.2	0	0	0	\N	0	0	\N	\N	0	0	\N	\N	7	-0.6	-4	0	1
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- PostgreSQL database dump complete
--

