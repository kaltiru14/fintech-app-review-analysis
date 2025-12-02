--
-- PostgreSQL database dump
--

\restrict FgVwqKpfOPh3WbvtvMwh1bnGyW3lf2zO6NHQdi2Tsb4OZBfeaH6QdYXMLaBzOMj

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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

--
-- Name: banks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks (
    bank_id integer NOT NULL,
    bank_name character varying(100) NOT NULL,
    app_name character varying(150) NOT NULL
);


ALTER TABLE public.banks OWNER TO postgres;

--
-- Name: banks_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banks_bank_id_seq OWNER TO postgres;

--
-- Name: banks_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_bank_id_seq OWNED BY public.banks.bank_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    bank_id integer,
    review_text text,
    rating integer,
    review_date date,
    sentiment_label character varying(20),
    sentiment_score double precision,
    source character varying(50)
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_review_id_seq OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;


--
-- Name: banks bank_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks ALTER COLUMN bank_id SET DEFAULT nextval('public.banks_bank_id_seq'::regclass);


--
-- Name: reviews review_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks (bank_id, bank_name, app_name) FROM stdin;
1	Commercial Bank of Ethiopia	CBE Mobile Banking
2	Bank of Abyssinia	BOA Mobile Banking
3	Dashen Bank	Dashen Mobile App
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (review_id, bank_id, review_text, rating, review_date, sentiment_label, sentiment_score, source) FROM stdin;
1	1	Good application	4	2025-11-27	positive	0.4404	Google Play
2	1	It is nice app	5	2025-11-26	positive	0.4215	Google Play
3	1	best	5	2025-11-25	positive	0.6369	Google Play
4	1	good app	5	2025-11-25	positive	0.4404	Google Play
5	1	it suddenly asked me to enter the verification key I received. and it (*get your verification key from the nearest CBE Branch*) Now I'm in Australia, what do you expect me to do???! There is no nearest or furthermost cbe Branch!! SO FRUSTRATING! How can I manage my bank account now????	1	2025-11-25	negative	-0.8979	Google Play
6	1	nice app...	5	2025-11-25	positive	0.4215	Google Play
7	1	very good banking service and fast service	5	2025-11-24	positive	0.4927	Google Play
8	1	thanks blc this app help me to use all time	5	2025-11-24	positive	0.6808	Google Play
9	1	good	5	2025-11-24	positive	0.4404	Google Play
10	1	why we can't send money to other people telebirr wallets??	1	2025-11-24	neutral	0	Google Play
11	1	አታፍሩም ግን ለ15 birr 11.50 ብር ስትቆርጡ ይስተካከልልን	1	2025-11-23	neutral	0	Google Play
12	1	በጣም ቀላልና ምቹ ነው።	5	2025-11-23	neutral	0	Google Play
13	1	wow	5	2025-11-23	positive	0.5859	Google Play
14	1	nice	5	2025-11-22	positive	0.4215	Google Play
15	1	you are the reason why i got ye chogara himem	1	2025-11-22	neutral	0	Google Play
16	1	it is so smart app i recommend it for everyone	5	2025-11-22	positive	0.7177	Google Play
17	1	excellent	5	2025-11-22	positive	0.5719	Google Play
18	1	ዳጊ	5	2025-11-21	neutral	0	Google Play
19	1	absolutely right	5	2025-11-21	neutral	0	Google Play
20	1	mid application it's so annoying	3	2025-11-20	negative	-0.541	Google Play
21	1	I used morethan one year	4	2025-11-20	neutral	0	Google Play
22	1	no word can explane about this app it is nice 👍👍👍👍👍	5	2025-11-20	positive	0.1531	Google Play
23	1	It's great app,I love this app	5	2025-11-20	positive	0.8519	Google Play
24	1	Nice	5	2025-11-19	positive	0.4215	Google Play
25	1	suckkkks	1	2025-11-19	neutral	0	Google Play
26	1	not allowing to transfer and showing current statement updates.	1	2025-11-19	neutral	0	Google Play
27	1	I love you this app	5	2025-11-19	positive	0.6369	Google Play
28	1	fast and convenient app, thanks for your dedication as a bank to provide good options to your cuatomers.	1	2025-11-19	positive	0.7003	Google Play
29	1	make life easy	5	2025-11-19	positive	0.4404	Google Play
30	1	securr	5	2025-11-19	neutral	0	Google Play
31	1	My most optional bank	5	2025-11-17	neutral	0	Google Play
32	1	5 star	5	2025-11-17	neutral	0	Google Play
33	1	it is fantastic app.	5	2025-11-16	positive	0.5574	Google Play
34	1	sifen	5	2025-11-16	neutral	0	Google Play
35	1	i like this√	4	2025-11-16	positive	0.3612	Google Play
36	1	Ok	3	2025-11-16	positive	0.296	Google Play
37	1	ጥሩ App ነዉ ። የኔ የግል አስተያየት- Update ወይንም cache cleaning app ሲደረግ ለምንድነዉ ደግመን login ስናደርግ Restricted ሚያደርገዉ ቢስተካከል እንደ ሀሳብ ጥሩ ነዉ። በዛላይ ድጋሚ አክቲቬት ለማስደረግ ከፍለን ..	5	2025-11-15	negative	-0.3818	Google Play
38	1	Seriously, what’s going on with this app? The "Pay to Beneficiary" option is completely disabled for Android users, yet iOS users get full access without restrictions. Why are Android users being treated like second class customers? It’s the same app, the same service, but clearly not the same experience. This kind of platform bias is unacceptable, either give everyone the same features or be transparent about why you’re limiting functionality. Right now, it just feels unfair and frustrating.	1	2025-11-15	negative	-0.8466	Google Play
39	1	Like	5	2025-11-13	positive	0.3612	Google Play
40	1	Nice and very useful app i like it!	5	2025-11-13	positive	0.831	Google Play
41	1	Good	5	2025-11-13	positive	0.4404	Google Play
42	1	smart app	4	2025-11-12	positive	0.4019	Google Play
43	1	good App	5	2025-11-12	positive	0.4404	Google Play
44	1	sync problem may 22 2025 but the date stack on may 8 2025 help pls	5	2025-11-12	positive	0.4854	Google Play
45	1	ok	5	2025-11-11	positive	0.296	Google Play
46	1	cbe is my choice	4	2025-11-11	neutral	0	Google Play
47	1	Awesome	5	2025-11-11	positive	0.6249	Google Play
48	1	I am not able to transfer. The app is not responding	1	2025-11-11	neutral	0	Google Play
49	1	Very convenient App	5	2025-11-11	neutral	0	Google Play
50	1	excellent but sometimes can not connect	5	2025-11-10	positive	0.3291	Google Play
51	1	wow apk	5	2025-11-10	positive	0.5859	Google Play
52	1	best 100 %	5	2025-11-10	positive	0.6369	Google Play
53	1	bad app	1	2025-11-10	negative	-0.5423	Google Play
54	1	best app	5	2025-11-10	positive	0.6369	Google Play
55	1	nice app	5	2025-11-10	positive	0.4215	Google Play
56	1	the app constantly glitches and won't stop loading despite having a decent connection and a cleared cache. telebirr is way better	1	2025-11-10	positive	0.6355	Google Play
57	1	I can't access it properly I think it needs update	1	2025-11-10	neutral	0	Google Play
58	1	👌👌	5	2025-11-10	positive	0.9055	Google Play
59	1	best 👌	5	2025-11-10	positive	0.8842	Google Play
60	1	not Refresh	2	2025-11-10	neutral	0	Google Play
61	1	your statement is not used as wanted	1	2025-11-10	neutral	0	Google Play
62	1	good very good	5	2025-11-09	positive	0.7264	Google Play
63	1	this is absolute trash why because it's not Woking most time the servers are down even though I'm using 4g data Internet they steal not working they use to work with out even data package now it's trash can't even send money	1	2025-11-09	negative	-0.4939	Google Play
233	2	none	5	2025-09-14	neutral	0	Google Play
64	1	Bayeee galatooma kana caalati nu gammachisa 🌏🤌🏻💴💸🥰👌🏻🙏🏻	5	2025-11-08	positive	0.9251	Google Play
65	1	Good !	5	2025-11-08	positive	0.4926	Google Play
66	1	i like it	5	2025-11-08	positive	0.3612	Google Play
67	1	Very nice app	5	2025-11-08	positive	0.4754	Google Play
68	1	the app is not functional this week.	4	2025-11-08	neutral	0	Google Play
69	1	very updated bank	5	2025-11-06	neutral	0	Google Play
70	1	tankyu	5	2025-11-05	neutral	0	Google Play
71	1	Numbers 2 and 3 don't write during pin verification.	5	2025-11-05	neutral	0	Google Play
72	1	once it is uninstalled, you need to visit a nearby bank. you go there and they ask you to have a new sim card which hasn't been used before. so you should buy a new sim card and you go back to them with a new sim card, when you reach there service provider says authentication pin is not arrive, the system is not working come back tomorrow.	1	2025-11-05	neutral	0.0258	Google Play
73	1	loved it	5	2025-11-05	positive	0.5994	Google Play
74	1	this app is not working on my phone	5	2025-11-03	neutral	0	Google Play
75	1	CBE needs to show transaction fees before the transaction is confirmed and not after. This is a big issue as fees are no longer insignificant.	3	2025-11-03	neutral	-0.0423	Google Play
76	1	After the recent updates, I am unable to download a receipt. I can't see the names of account holders I've previously transacted with. Very important. Please fix it asap.	1	2025-11-03	positive	0.5678	Google Play
77	1	wow 😘😘😘	4	2025-11-02	positive	0.9042	Google Play
78	1	mobile banking broblem	5	2025-11-01	neutral	0	Google Play
79	1	good job	5	2025-11-01	positive	0.4404	Google Play
80	1	it is a good and clear apps to use	4	2025-10-31	positive	0.6705	Google Play
81	1	ለምንድን ነው ከንግድ ባንክ ወደ ቴሌብር 5 ብር ሲተላለፍ 11 ብር እንዲቆርጥ ያደረጋችሁት	1	2025-10-31	neutral	0	Google Play
82	1	I love this app b/c every option in the app very clear and supportive.	5	2025-10-30	positive	0.861	Google Play
83	1	niiceh	5	2025-10-29	neutral	0	Google Play
84	1	the app is good but their is no dark mode you have to add it	3	2025-10-29	negative	-0.2144	Google Play
85	1	🤮	1	2025-10-29	neutral	0	Google Play
86	1	abdulakim abrahim elemoo	5	2025-10-29	neutral	0	Google Play
87	1	strong	5	2025-10-28	positive	0.5106	Google Play
88	1	Abebaw Zenebe	5	2025-10-28	neutral	0	Google Play
89	1	good I love it keep it up but if we had a new update that will be fire Soo good	5	2025-10-27	positive	0.6486	Google Play
90	1	Cbe	5	2025-10-27	neutral	0	Google Play
91	1	Active and granted system	5	2025-10-27	positive	0.5719	Google Play
92	1	fast app	4	2025-10-27	neutral	0	Google Play
93	1	cool 😎	5	2025-10-27	positive	0.6486	Google Play
94	1	Galaxy A10s	3	2025-10-26	neutral	0	Google Play
95	1	the best apps	5	2025-10-26	positive	0.6369	Google Play
96	1	arif app new	5	2025-10-26	neutral	0	Google Play
97	1	laga Bari biranch	5	2025-10-26	neutral	0	Google Play
98	1	ነነሠነሠሠነሠሠሠሠነየነ	5	2025-10-26	neutral	0	Google Play
99	1	I would like to suggest you improve the time out as it takes the money and doesn't return it back until the next day.	3	2025-10-25	positive	0.6597	Google Play
100	1	Attractive	5	2025-10-25	positive	0.4404	Google Play
101	1	mite	5	2025-10-24	neutral	0	Google Play
102	1	useful	5	2025-10-24	positive	0.4404	Google Play
103	1	not good, not bad!	3	2025-10-23	negative	-0.6208	Google Play
104	1	very good	5	2025-10-23	positive	0.4927	Google Play
105	1	እጅግ በጣም አስቀያሚ ጠቁአም ዘረፋ በሚባል ደርጃ የ አገልግሎት የሚቀበል ያልሰራበትን የገዛ ገንዝበባችንን ተዘረፍን ከ 100ብር 10ብር የአገልግሎት ማስከፈል ምን ማለት ነው እባካችሁ እዩት እስትይ ከ ሞባይል ባንክ ወደ ampsa አስተላልፉና እዩት በጣም ይገርማል ሌባ ብያቸዋልሁ	1	2025-10-22	neutral	0	Google Play
106	1	imp	5	2025-10-22	neutral	0	Google Play
107	1	super fast app	5	2025-10-21	positive	0.5994	Google Play
108	1	The app has a nice design and useful features like balance check and transfers, but it’s unstable and often fails to connect. It also forces users to turn off Developer Options, which is unnecessary — other banking apps work fine without that. Many people use Developer Mode for normal reasons. Please fix performance issues, remove this restriction, and add biometric login for better security and convenience	2	2025-10-19	positive	0.6896	Google Play
109	1	cbe	4	2025-10-18	neutral	0	Google Play
110	1	it says "ti is work any more in your device" what can i do??	1	2025-10-18	neutral	0	Google Play
111	1	blah blah blah	5	2025-10-18	negative	-0.296	Google Play
112	1	bad ግዴታ መሆንሁ	1	2025-10-17	negative	-0.5423	Google Play
113	1	CBE no.1	5	2025-10-17	neutral	0	Google Play
114	1	it's not work correctly when it's needed sometimes, but it works sometimes though	2	2025-10-16	neutral	0	Google Play
115	1	its easy to use and more secured than the previous one. i love it and appreciate commercial bank of ethiopia for every time update.	5	2025-10-16	positive	0.9152	Google Play
116	1	gooof	5	2025-10-16	neutral	0	Google Play
117	1	Suddenly the cbe application I was using stopped working and called callcenter, I was told it's because it expired and I should vist any branch to fix it. So I went to CBE Silassie branch.After filling a form they gave me, I sat down and waited until they finish fixing 2 customer's case who arrived before me. But then when it was my turn ppl who came after me with same mobile banking and even Atm card cases were finishing up and leaving I had to get back to my work so I left.with no service.why?	1	2025-10-16	negative	-0.564	Google Play
118	1	Best app	5	2025-10-16	positive	0.6369	Google Play
119	1	still not perfect like before	1	2025-10-15	negative	-0.6259	Google Play
120	1	This app dash board is disturbing me. it is not showing me traxation and my balance while displaying others option on dashboard. I think it is a risk full app😭😭😭🤤🤤	1	2025-10-15	negative	-0.9287	Google Play
121	1	APPLIED	1	2025-10-14	neutral	0	Google Play
122	1	10 years ago	4	2025-10-14	neutral	0	Google Play
123	1	Asefa Obsa	5	2025-10-14	neutral	0	Google Play
124	1	it's good app	5	2025-10-14	positive	0.4404	Google Play
125	1	very slow	1	2025-10-14	neutral	0	Google Play
126	1	berhan deriba wami	4	2025-10-14	neutral	0	Google Play
127	1	mahamad Usman	5	2025-10-13	neutral	0	Google Play
128	1	Erako	5	2025-10-13	neutral	0	Google Play
129	1	🔥🔥🔥🔥🔥	5	2025-10-13	negative	-0.875	Google Play
130	1	opne	5	2025-10-13	neutral	0	Google Play
131	1	mehommd nuri	5	2025-10-13	neutral	0	Google Play
132	1	Best	5	2025-10-12	positive	0.6369	Google Play
133	1	providing very secure service.	5	2025-10-12	positive	0.4005	Google Play
134	1	apk አሪፍ ነው ግን በጣም apkwun የሚከፍቱ የ ባንክ ሰራተኞች በጣም ደካማ ናቸው ሲያስተናግዱ ለ ደንበኛ ክብር የላቸውም እኔ መመላለስ ከጀመርኩ ቆየው ግን መፍትህ ላገኝ አልችልኩም ::	1	2025-10-12	neutral	0	Google Play
135	1	ዳር ኑሮ ላለው ኣፍሪቻን ው	5	2025-10-12	neutral	0	Google Play
136	1	RIYAD Mohammed Abaoli 92 527 2567	5	2025-10-12	neutral	0	Google Play
137	1	it doesn't show bank statement and no options to see transactions for the past months.	2	2025-10-12	negative	-0.296	Google Play
138	1	Mamma Husen	2	2025-10-11	neutral	0	Google Play
139	1	3 stars because I can't see all my transaction history apart from the recents and a refresh button has been removed from the Recents activity. The app should allow clients to view all of the transactions not just recents.	3	2025-10-11	positive	0.2263	Google Play
140	1	exceptional application from others bank	5	2025-10-10	neutral	0	Google Play
141	1	it is very nice. but i have a serious suggestion when you send to other cbe birr customer, it does not show the name of the recipient befor it actually send the money. please improve this	4	2025-10-10	positive	0.8124	Google Play
142	1	good👍👍👍😊😊😊	5	2025-10-10	positive	0.9633	Google Play
143	1	really good app	5	2025-10-10	positive	0.4927	Google Play
144	1	smart bank CBE	5	2025-10-10	positive	0.4019	Google Play
145	1	Ali urgesa11	3	2025-10-09	neutral	0	Google Play
146	1	it's good	5	2025-10-09	positive	0.4404	Google Play
147	1	Good apps	5	2025-10-09	positive	0.4404	Google Play
148	1	password በጣት አሻራ ቢኖረው መልካም ነበር	4	2025-10-09	neutral	0	Google Play
149	1	best app i ever seen	5	2025-10-09	positive	0.6369	Google Play
150	1	it's game changing in financial system	4	2025-10-09	neutral	0	Google Play
151	1	z,MKT 20_._!8+⅓⅕😘r	1	2025-10-09	neutral	0	Google Play
152	1	will good updating	5	2025-10-09	positive	0.4404	Google Play
153	1	service charge , vat, fee everything here is not yours they wanna take what you have, everything is not fair	1	2025-10-08	negative	-0.2411	Google Play
154	1	why removing screenshot feature why?	2	2025-10-08	neutral	0	Google Play
155	1	very good application! thank you all who participate!	5	2025-10-08	positive	0.7608	Google Play
156	1	application bank commercial Ethiopia I am very happy to be able to appear in a great job on a pleasant job	5	2025-10-08	positive	0.908	Google Play
157	1	user compatible app!	5	2025-10-08	neutral	0	Google Play
158	1	I am trying to access this app on my Android phone, but sometimes doesn't work. so kindly try to improve it.	3	2025-10-07	positive	0.8891	Google Play
159	1	what an amazing app. you know how much it simplify life. Thanks cbe. I proud of you.	5	2025-10-07	positive	0.8689	Google Play
160	1	Our Commercial Bank of Ethiopia is Good !	5	2025-10-06	positive	0.4926	Google Play
161	1	Asledin Ibsa	5	2025-10-06	neutral	0	Google Play
162	1	terrible when showing history of transaction it shows in disorganised way	3	2025-10-05	negative	-0.4767	Google Play
163	1	my bank	5	2025-10-05	neutral	0	Google Play
164	2	not user friendly at all it requires a huge connectivity and also lags many times 😑😑😑	1	2025-11-26	negative	-0.4268	Google Play
165	2	ምንም የማይ ሰራ	1	2025-11-26	neutral	0	Google Play
166	2	very good	5	2025-11-25	positive	0.4927	Google Play
167	2	most of the time is not working properly	1	2025-11-25	neutral	0	Google Play
168	2	good service	5	2025-11-25	positive	0.4404	Google Play
169	2	not use for me	3	2025-11-23	neutral	0	Google Play
170	2	It keeps notifying me to disable developer options and quiet while I'm not enabled. always bring another type of problem with new updates.	1	2025-11-22	negative	-0.4019	Google Play
171	2	waw	5	2025-11-21	neutral	0	Google Play
172	2	the lag is unbelievable when you need it the most this suks	1	2025-11-19	negative	-0.1531	Google Play
173	2	I cant belive I could find the worst bank app ever .yet very simple to fix the problem and the company just ignored it. no body can do business with this kind of app.	1	2025-11-18	negative	-0.8834	Google Play
174	2	it is a good app	5	2025-11-18	positive	0.4404	Google Play
175	2	it is not working at all	1	2025-11-15	neutral	0	Google Play
176	2	🥰🥰🥰🥰🥰 app is good but i was live in abroad and when i enter my otp code it didnt make me to write my code it the app want it self write thats not fair so please other wise i like it why	5	2025-11-15	positive	0.9848	Google Play
177	2	when trying to activate the app it keeps on loading on the security questions page. It has been two days	1	2025-11-13	positive	0.34	Google Play
178	2	fast and simple	5	2025-11-11	neutral	0	Google Play
179	2	best of best	5	2025-11-10	positive	0.8555	Google Play
180	2	Worest Banking App Ever I seen. Fake App Bad Better to Leave	1	2025-11-10	negative	-0.5994	Google Play
181	2	good	4	2025-11-10	positive	0.4404	Google Play
182	2	I would like to share feedback regarding the application. It frequently experiences disruptions and does not function properly, often freezing or failing to load. This issue is affecting workflow and efficiency. Kindly review and address this problem to ensure smoother performance.	1	2025-11-08	positive	0.4166	Google Play
183	2	Meet you genuine.App I tried is not functional.Helping.welldoingwith BOA Ethiopia .fastandrelevant.morconnecting Digitalyworld.Digitalyworld. thanks.	5	2025-11-08	positive	0.4404	Google Play
184	2	best app	5	2025-11-08	positive	0.6369	Google Play
185	2	Best app	5	2025-11-07	positive	0.6369	Google Play
186	2	Barely works, it always fails to connect	1	2025-11-07	negative	-0.4215	Google Play
187	2	my fav app	5	2025-11-07	positive	0.4588	Google Play
188	2	this app launch time is so long also has dozen bugs in addition it's has been long time get update	1	2025-11-05	neutral	0	Google Play
189	2	very nice	5	2025-11-04	positive	0.4754	Google Play
190	2	Your application is very irritating to use, some functionality doesn't even work like on the card management. You need to do better than this and it good idea to reference other banking applications.	3	2025-11-04	positive	0.102	Google Play
191	2	I like	5	2025-11-02	positive	0.3612	Google Play
192	2	ወይ አሻሽሉትና እንጠቀምበት ያለያ ብታጠፉት ይሻላል። በቃ ምንም ነገር አይሰራም መተግበሪያ አለን ብላችሁ እንዳታወሩ ለማንም የማይመከር ቀርፋፋና ተግባር የለሽ መተግበሪያ	1	2025-11-01	neutral	0	Google Play
193	2	i m sorry but it doesn't work for my android it is too slow but other bank are very fast please update	1	2025-10-30	positive	0.4969	Google Play
194	2	the worst app ever,	1	2025-10-30	negative	-0.6249	Google Play
195	2	better	5	2025-10-29	positive	0.4404	Google Play
196	2	I kindly request that Bank of abyssinia address issues with its mobile app. It is very slow, has numerous problems, and frequently experiences downtime. The user experience is also poor. Thank you.	1	2025-10-28	neutral	-0.0258	Google Play
197	2	this app can't open? what is problem? please solve my problem?	1	2025-10-28	negative	-0.4291	Google Play
198	2	kiyaa makonn	5	2025-10-27	neutral	0	Google Play
199	2	very very lazy app	1	2025-10-26	negative	-0.4716	Google Play
200	2	telebirr remittance	5	2025-10-24	neutral	0	Google Play
201	2	The best bank in 🇪🇹	5	2025-10-23	positive	0.6369	Google Play
202	2	its good	5	2025-10-22	positive	0.4404	Google Play
203	2	the worst app in my financial experience.	1	2025-10-22	negative	-0.6249	Google Play
204	2	good for mb appliciation	5	2025-10-21	positive	0.4404	Google Play
205	2	the worst bank ever. slow don't accept dual sim. they are very stupid and greedy	1	2025-10-20	negative	-0.9107	Google Play
206	2	try to easy network	4	2025-10-17	positive	0.4404	Google Play
207	2	hussen hassen umer	5	2025-10-16	neutral	0	Google Play
208	2	The app is not suitable and lacks a good UI design. As a large bank, you must update your app with a professional UI that is fast and appropriate.	2	2025-10-16	positive	0.4404	Google Play
209	2	an exceptional banking app.	5	2025-10-16	neutral	0	Google Play
210	2	alhamdulilah	5	2025-10-11	neutral	0	Google Play
211	2	poor	5	2025-10-11	negative	-0.4767	Google Play
212	2	Best of best	5	2025-10-09	positive	0.8555	Google Play
213	2	from the last week updates the app is not working Please check the problems	1	2025-10-08	negative	-0.5664	Google Play
214	2	It's always crushing	1	2025-10-08	negative	-0.3612	Google Play
215	2	office branches have to improve their services please	4	2025-10-07	positive	0.6369	Google Play
216	2	♥️♥️	5	2025-10-05	positive	0.8555	Google Play
217	2	Why does it keep crashing? I can't even use this. BOA should do better. You have many customers and how to deal with this. I can't send money now.	1	2025-10-05	positive	0.4404	Google Play
218	2	it needs a timely update	5	2025-10-03	neutral	0	Google Play
219	2	It does not show the name of the person who sent the money to request a receipt. This has become very difficult for us. When different people transfer the same amount to me from different banks, it is very difficult to identify the account or the name of the sender.	3	2025-10-01	negative	-0.6794	Google Play
220	2	Like	5	2025-10-01	positive	0.3612	Google Play
221	2	I can't type my otp on it.	1	2025-10-01	neutral	0	Google Play
222	2	most of bank apps in Ethiopia are linked with ethiopian phone number, I live in US permanently so when I open BoA account, I told them where I live and to link it with email address instead of phone # as ethio phone number is not working where I live, unfortunetly my fear appeared and now when I change my phone device, it send the code to the ethio number which is not with me now. so please when u develop bank apps consider the diaspora community to use ur apps	1	2025-10-01	positive	0.1757	Google Play
223	2	jaajja	4	2025-09-30	neutral	0	Google Play
224	2	I love this bank the best experience ever.	5	2025-09-28	positive	0.8555	Google Play
225	2	Nothing has been improved, it doesn't work like the previous version.	1	2025-09-25	negative	-0.5667	Google Play
226	2	easy and fast	5	2025-09-24	positive	0.4404	Google Play
227	2	Great	5	2025-09-20	positive	0.6249	Google Play
228	2	mobile banking	5	2025-09-19	neutral	0	Google Play
229	2	😎	5	2025-09-18	positive	0.4588	Google Play
230	2	need alot of connection, chooses device, very lug even when there is connection	1	2025-09-17	neutral	0	Google Play
231	2	On my ios it's perfect but on android it barley works and don't transfer and after a while it crushed and totally stopped working. Please fix the issue my beloved bank of abyssinia.	1	2025-09-15	positive	0.5656	Google Play
232	2	since the last update i can open the app crashes a lot and omg its being very slow opening and loading	2	2025-09-15	neutral	0	Google Play
234	2	very good app i ever used	5	2025-09-12	positive	0.4927	Google Play
235	2	its nice app especially the transaction limit is extended but We face that BoA m.banking app doesn't respond at the activation stage strictly at SMSNG mobile phone. please try this to make safe.	4	2025-09-11	positive	0.8271	Google Play
236	2	zedo	5	2025-09-11	neutral	0	Google Play
237	2	please open my mobile app	5	2025-09-10	positive	0.3182	Google Play
238	2	it doesn't open	1	2025-09-10	neutral	0	Google Play
239	2	Very Good	5	2025-09-09	positive	0.4927	Google Play
240	2	masha alla	5	2025-09-08	neutral	0	Google Play
241	2	Best banking transaction application in Ethiopia !	5	2025-09-05	positive	0.6696	Google Play
242	2	السلام عليكم ورحمة الله وبركاته ماشاء الله تبارك الرحمن هذا التطبيق ممتاز جدا	5	2025-09-04	neutral	0	Google Play
243	2	tamaam kamal	1	2025-09-04	neutral	0	Google Play
244	2	በጣም ሐሪፍ	5	2025-09-03	neutral	0	Google Play
245	2	great 👍	5	2025-09-02	positive	0.6249	Google Play
246	2	goof	4	2025-09-01	neutral	0	Google Play
247	2	absiniya banki	5	2025-08-29	neutral	0	Google Play
248	2	has issue after installation and i think it doesn't work with tecno common 30	1	2025-08-26	neutral	0	Google Play
249	2	One of the best in this business	5	2025-08-25	positive	0.6369	Google Play
250	2	Excellent	5	2025-08-20	positive	0.5719	Google Play
251	2	besat🥰	5	2025-08-19	positive	0.8074	Google Play
252	2	unlimited experience	5	2025-08-18	neutral	0	Google Play
253	2	as bank, u should at least hire someone good at their job bc this a joke nowadays I can't even log in or even transfer without it crashing if u fix the app I will update this review I am counting on u boa update: so they atleast fixed it but as suggestion can u put password when in final step of sending money it will feel more secure that way	4	2025-08-17	positive	0.7261	Google Play
254	2	very nice mobile banking app my favourite	5	2025-08-16	positive	0.4754	Google Play
255	2	it almost never boots up!!! and even if it did, it crashes immediately	1	2025-08-15	neutral	0	Google Play
256	2	best apps	5	2025-08-15	positive	0.6369	Google Play
257	2	the worst app ever to exist in a bank history	1	2025-08-15	negative	-0.6249	Google Play
258	2	thank you	5	2025-08-14	positive	0.3612	Google Play
259	2	Best mobile app in the country	5	2025-08-14	positive	0.6369	Google Play
260	2	not fast	2	2025-08-12	neutral	0	Google Play
261	2	keeps freezing at the front page.	1	2025-08-10	negative	-0.1027	Google Play
262	2	it is not working on redminote 11 pro+ pls fix it	1	2025-08-08	positive	0.0772	Google Play
263	2	abseniya bank app	5	2025-08-08	neutral	0	Google Play
264	2	yes goode app	5	2025-08-03	positive	0.4019	Google Play
265	2	Great App	5	2025-08-02	positive	0.6249	Google Play
266	2	1) Crashes repeatedly 2) Takes Century to Boot 3) Repeatedly requires Update which is very annoying. 4) It doesn't ask for Password for one step confirmation when transferring money. 5) Automatically stops music when the app is launched (it doesn't really matter just fyi) Overall this have to be the worst mobile banking app I have tried so far and should not be released with all these bugs & issues.	1	2025-08-02	negative	-0.7521	Google Play
267	2	ረጀብነሱ	1	2025-07-31	neutral	0	Google Play
268	2	The Worst Mobile Banking App.	1	2025-07-31	negative	-0.6249	Google Play
269	2	giod	5	2025-07-30	neutral	0	Google Play
270	2	best bank in ethiopia	5	2025-07-29	positive	0.6369	Google Play
271	2	waqayyoo	5	2025-07-28	neutral	0	Google Play
272	2	please is not working	2	2025-07-27	positive	0.3182	Google Play
273	2	nothing when I need to install the Apk it say that re-up date	5	2025-07-25	neutral	0	Google Play
274	2	I can log in from any where	5	2025-07-23	neutral	0	Google Play
275	2	😇	3	2025-07-21	positive	0.4588	Google Play
276	2	no proplem	5	2025-07-20	negative	-0.296	Google Play
277	2	👍👍👍	5	2025-07-20	neutral	0	Google Play
278	2	excellent app	5	2025-07-18	positive	0.5719	Google Play
279	2	good work	5	2025-07-15	positive	0.4404	Google Play
280	2	☹️	5	2025-07-15	negative	-0.34	Google Play
281	2	excellent	5	2025-07-14	positive	0.5719	Google Play
282	2	Great BoA	5	2025-07-14	positive	0.6249	Google Play
283	2	Good	5	2025-07-14	positive	0.4404	Google Play
284	2	Okay	4	2025-07-13	positive	0.2263	Google Play
285	2	not working	1	2025-07-12	neutral	0	Google Play
286	2	This App is Getting worse and worse with every update	2	2025-07-11	negative	-0.7351	Google Play
287	2	ምርጥ ነው	1	2025-07-10	neutral	0	Google Play
288	2	nice	5	2025-07-10	positive	0.4215	Google Play
289	2	meku	5	2025-07-07	neutral	0	Google Play
290	2	awasome app go a head	5	2025-07-04	neutral	0	Google Play
291	2	it sucks as hell. it crashes most of the time and takes a long time to load .	1	2025-07-03	negative	-0.7964	Google Play
292	2	The App is nice and easy to use but after some time it crushed and said "Error check your device connectivity" please fix it	3	2025-07-02	negative	-0.3506	Google Play
293	2	Easy and very nice app to load more than the previouse but in recent time some loading problem detected.	5	2025-07-01	negative	-0.1415	Google Play
294	2	wow	5	2025-07-01	positive	0.5859	Google Play
295	2	The worst MBA I have experienced, The app crush frequently and they take to long to fix the problem even more than a week.	1	2025-06-27	negative	-0.8126	Google Play
296	2	amazing Banks App👌👌	3	2025-06-25	positive	0.9439	Google Play
297	2	good App fore me	5	2025-06-25	positive	0.4404	Google Play
298	2	very uninterested it's not working when the "developer mode on" i haven't off the developer options i preferred to uninstall your app .....	1	2025-06-24	neutral	0	Google Play
299	2	fantastic	5	2025-06-22	positive	0.5574	Google Play
300	2	👍	4	2025-06-21	neutral	0	Google Play
301	2	it's nice to use.	5	2025-06-21	positive	0.4215	Google Play
302	2	app doesn't start	1	2025-06-21	neutral	0	Google Play
303	2	Excellent application	5	2025-06-18	positive	0.5719	Google Play
304	2	its very bad app its very slow	1	2025-06-17	negative	-0.5849	Google Play
305	2	ብዙዬ ሺዋየ በለጠ	1	2025-06-15	neutral	0	Google Play
306	2	Good job!	5	2025-06-13	positive	0.4926	Google Play
307	2	best financial app.	5	2025-06-12	positive	0.6369	Google Play
308	2	ቆንጆ ነው በርቱ	5	2025-06-11	neutral	0	Google Play
309	2	the worst app humans ever created	1	2025-06-09	negative	-0.4767	Google Play
310	2	it's not working	3	2025-06-05	neutral	0	Google Play
311	2	Hello, I’m facing a problem with the BOA Mobile app. Every time I enter my phone number and password, the app crashes and shows an error that says “BoaMobile closed because this app has a bug.” I tried updating, reinstalling, and clearing cache, but nothing worked. Please fix this bug in the next update. I really need access to my account. Thank you.	1	2025-06-03	negative	-0.1884	Google Play
312	2	exceptional	5	2025-06-03	neutral	0	Google Play
313	2	BoA Mobile good bank	5	2025-06-02	positive	0.4404	Google Play
314	2	this is worest app 24/7 loading	1	2025-06-01	neutral	0	Google Play
315	2	BoA system is confartable	5	2025-06-01	neutral	0	Google Play
316	2	this app, for me , is a waste of time. It doesn't work . I can't even long in, and it really piss me off. FIX THE PROBLEM	1	2025-05-27	negative	-0.8491	Google Play
317	2	Good service.	3	2025-05-25	positive	0.4404	Google Play
318	2	the app crush frequently	1	2025-05-24	negative	-0.1531	Google Play
319	2	You guys keeps getting worst	1	2025-05-22	negative	-0.6249	Google Play
320	2	This app is a joke. It crashes more than it works, takes forever to load, and half the features are just decorative at this point. Can’t log in, can’t transfer money, can’t even check my balance without it bugging out. To the developer: Are you actually trying to make this work, or is this some kind of social experiment to test our patience? Did you build this in your sleep? Because it definitely looks like it. If this is your idea of a functional app, maybe consider a different career path🙏	1	2025-05-21	positive	0.7757	Google Play
321	2	BoA	2	2025-05-20	neutral	0	Google Play
322	2	but not opening on android	4	2025-05-19	neutral	0	Google Play
323	2	Worst App ever. Totally unreliable. And it didn't work at all for the last 4 months.	1	2025-05-18	negative	-0.6249	Google Play
324	2	amazing	5	2025-05-18	positive	0.5859	Google Play
325	2	this app does no work on Samsung a51, it just gives a preview of the logo	1	2025-05-11	negative	-0.296	Google Play
326	2	i entered incorrect security question by mistake boa app lock pin forever, why is there no other options? ?? i contacted different branchs more then 4times but they didn't able to solve this issue .	5	2025-05-10	negative	-0.4639	Google Play
327	2	liking this application good 👍	5	2025-05-07	positive	0.6808	Google Play
328	2	This app future is good, but there is problems with apps to reset and activate it, which is difficult even to the branch staffs, and it takes too long times to active at the branch plus most of the time high expected failure of activation after process at the counter and OTP sent not work	1	2025-05-06	negative	-0.775	Google Play
329	2	it's really good 👍	5	2025-04-23	positive	0.4927	Google Play
330	2	Bad app . it stuck when you open and noting WORKS.	1	2025-04-23	negative	-0.6705	Google Play
331	2	the app isn't working after it asked me the password it starts loading, but it doesn't open	3	2025-04-20	neutral	0	Google Play
332	2	Best	2	2025-04-19	positive	0.6369	Google Play
333	2	It keeps showing this pop up to turn off developer options even tho it's off! I had to turn on and then off to make it work! This is a horrible experience and needs a fix asap! Plus kinda slow.	1	2025-04-19	negative	-0.6571	Google Play
334	2	yideg	1	2025-04-18	neutral	0	Google Play
335	2	great boa	5	2025-04-10	positive	0.6249	Google Play
336	2	boa of mobile backing	5	2025-04-09	neutral	0.0258	Google Play
337	2	faster bank of Abissinya	5	2025-04-08	neutral	0	Google Play
338	2	i would have given it a lower if it was possible because it crush so much and it take the bank so long to fix the bug	1	2025-04-08	negative	-0.4215	Google Play
339	2	it just doesn't work...so frustrating	1	2025-04-07	positive	0.3412	Google Play
340	2	like	5	2025-04-06	positive	0.3612	Google Play
341	2	it's not work correctly... you must have update it	1	2025-04-06	neutral	0	Google Play
342	3	its fast and easy to communicate to the app and its available all area keep it up.i will make Happy for this application thank you dashen bank for your effort,commitment and dedication. i appricated your work.	5	2025-11-26	positive	0.8442	Google Play
343	3	What do you care about my phone's settings? Who are you to tell me what to turn off and on? It is my phone after all. This *develoler option* thing will cost you a lot of users who are willing to leave the bank once and for all. Turn this thing off. 6 you fear this is a security issue fix your side not mine.	1	2025-11-25	positive	0.3736	Google Play
344	3	Exceptional Product.	5	2025-11-23	neutral	0	Google Play
345	3	very easy app	3	2025-11-23	positive	0.4927	Google Play
346	3	The Dashen Super App is very impressive. It is fast, easy to use, and provides smooth access to all essential banking services. Money transfer, bill payment, balance check, and other features work efficiently without issues. The design is clean and user-friendly. Great step forward in digital banking — keep up the good work, Dashen Bank!..	5	2025-11-19	positive	0.9722	Google Play
347	3	በጣም ፈጣን ሥቹ አስተማማኝ ወድጃዋለው	5	2025-11-18	neutral	0	Google Play
348	3	bill payment options are limited in this app please add ethio telecom bill electric bill etc.. instead of adding nonsense in banking app	1	2025-11-18	negative	-0.3182	Google Play
501	3	one of the best app in Ethiopia .	5	2025-09-24	positive	0.6369	Google Play
349	3	it's a really slow app, I'm not sure what the issue is. Even other bank transfers are not working	2	2025-11-18	negative	-0.2411	Google Play
350	3	always updating bad stability	1	2025-11-17	negative	-0.5423	Google Play
351	3	it say's disable developer option, i disabled it but its not working still	1	2025-11-17	neutral	0	Google Play
352	3	with the super app evry thing i need is just a tap away	5	2025-11-17	positive	0.5994	Google Play
353	3	nice	5	2025-11-16	positive	0.4215	Google Play
354	3	eyita tips	1	2025-11-15	neutral	0	Google Play
355	3	clear and presize	5	2025-11-15	positive	0.3818	Google Play
356	3	smooth and easy!!!	5	2025-11-14	positive	0.5826	Google Play
357	3	I have had an amazing experience with this app;ot os convenient and easy to use	5	2025-11-14	positive	0.7717	Google Play
358	3	All in One Super App with smooth navigation, transaction and lifestyle services	5	2025-11-14	positive	0.5994	Google Play
359	3	Very nice App.	5	2025-11-14	positive	0.4754	Google Play
360	3	system failure transfer to others account	2	2025-11-13	negative	-0.5106	Google Play
361	3	thank you	1	2025-11-13	positive	0.3612	Google Play
362	3	Only the UI/UX is good, but it doesn't function properly. It's a shame that a leading tech bank has such an app. Amole is far better.	1	2025-11-13	positive	0.1655	Google Play
363	3	excellent app. to use perfectlly to pay,transfer,tele airtime and so on.	5	2025-11-12	positive	0.5719	Google Play
364	3	wow dashen bank super app	5	2025-11-12	positive	0.8271	Google Play
365	3	This so-called “Super App” is a complete disappointment. It’s confusing, slow, and full of glitches honestly, it feels like it was designed to test people’s patience, not to help them bank. Calling it “super” is a joke; it’s one of the most useless apps I’ve ever used.	1	2025-11-11	negative	-0.4312	Google Play
366	3	Best Mobile Banking App in Ethiopia .	5	2025-11-11	positive	0.6369	Google Play
367	3	very nice app I have ever seen	5	2025-11-10	positive	0.4754	Google Play
368	3	NASTY BANK . EVEN THE SUPPER APP IS NOT WORKING WELL. WHEN I AM CALLING THEM THEY ARE NOT RESPONSE . PLEASE DON'T USE THIS APP BECAUSE YOU WILL LOSS YOU TIME ;ENERGY AND EVERYTHING . HOPELESS Bank .	1	2025-11-10	negative	-0.9205	Google Play
369	3	it's good but is not fast	5	2025-11-09	positive	0.2382	Google Play
370	3	your financial system must improved	4	2025-11-09	positive	0.4767	Google Play
371	3	your service is too good	5	2025-11-09	positive	0.4404	Google Play
372	3	good experience	5	2025-11-09	positive	0.4404	Google Play
373	3	ok	5	2025-11-08	positive	0.296	Google Play
374	3	Amazing app, 👏	5	2025-11-07	positive	0.5859	Google Play
375	3	wooow	5	2025-11-07	neutral	0	Google Play
376	3	Nice app	5	2025-11-07	positive	0.4215	Google Play
377	3	best	5	2025-11-07	positive	0.6369	Google Play
378	3	easy to use, friendly	5	2025-11-06	positive	0.7269	Google Play
379	3	12yr more LC, UCP & ICC & loan	5	2025-11-06	neutral	0	Google Play
380	3	not attractive and friendly app. Check Awash, CBE apps	1	2025-11-06	negative	-0.6167	Google Play
381	3	amzing	5	2025-11-06	neutral	0	Google Play
382	3	The Dashen Super App is very impressive. It is fast, easy to use, and provides smooth access to all essential banking services. Money transfer, bill payment, balance check, and other features work efficiently without issues. The design is clean and user-friendly. Great step forward in digital banking — keep up the good work, Dashen Bank!	5	2025-11-05	positive	0.9722	Google Play
383	3	betam kerfafa naw	1	2025-11-05	neutral	0	Google Play
384	3	exceptional	5	2025-11-05	neutral	0	Google Play
385	3	worst app ever	1	2025-11-05	negative	-0.6249	Google Play
386	3	Dashen, always two step ahead.	5	2025-11-05	neutral	0	Google Play
387	3	Please try to fix the barrier between other banks specially with "Commercial bank of Ethiopia"	3	2025-11-05	positive	0.2023	Google Play
388	3	👍	5	2025-11-05	neutral	0	Google Play
389	3	i am using	5	2025-11-05	neutral	0	Google Play
390	3	It is a wonderful App developed by a local talent. It deserves an appreciation. It will continue to evolve with new exciting features.	5	2025-11-05	positive	0.9186	Google Play
391	3	wonderful app	5	2025-11-05	positive	0.5719	Google Play
392	3	i love the app it features are perfect, but it asks to update too many times to activate your need to visit a nearest branch and that takes time. other than that the app is great I like it	5	2025-11-05	positive	0.9306	Google Play
393	3	go ahead	5	2025-11-05	neutral	0	Google Play
394	3	its supper	5	2025-11-04	neutral	0	Google Play
395	3	Good	5	2025-11-04	positive	0.4404	Google Play
396	3	it's so boring	1	2025-11-04	negative	-0.3804	Google Play
397	3	Dashen Bank Super App is the latest version of online banking system that is the gift from Dashen bank for us Thanks to Dashen	5	2025-11-04	positive	0.8658	Google Play
398	3	i rarely leave reviews, but this app truely deserves one.it's efficient ,secure , reliable and makes fanancial tasks effortless.definitely 5 stars for this exceptional app	5	2025-11-04	positive	0.7829	Google Play
399	3	it has improved very much lately its working more and getting better but yet it is not fully fixed some time at night it doesn't work..i think the problem is it was launched too early.	3	2025-11-04	positive	0.0854	Google Play
400	3	Amazing	5	2025-11-03	positive	0.5859	Google Play
401	3	wow dashen bank	5	2025-11-03	positive	0.5859	Google Play
402	3	ብዙ ነጉር ይቀረዋል ወደ አፑ ስገባ በጣም ይዘገያል ባጭሩ ቀርፋፋ ነው	4	2025-11-02	neutral	0	Google Play
403	3	I just updated my app to the latest version and I couldn't even see my balance, send money or do anything. It says service is unavailable and it will be fixed soon.	5	2025-11-01	neutral	0	Google Play
404	3	it's too slow	1	2025-11-01	neutral	0	Google Play
502	3	great app	5	2025-09-23	positive	0.6249	Google Play
563	1	Ok	3	2025-11-16	positive	0.296	Google Play
405	3	Before the recent update, this app was great. Now, the home page is cluttered with promotions and banners, which really hurts the experience. I think the app stopped being banking app and started only to promote b/c 95% of the app is only ads, also full of bugs	1	2025-11-01	positive	0.3415	Google Play
406	3	This might be the worst banking app I've ever used I dont know why kind of bug it is but suddenly the apps stops working it says "Temporarily unavailable" for a simple feature like viewing account balance and in person visit was no help it took them longer than 2 hours to fix it and even after that 2 weeks later the same problem just because of this I'm going to stop using the bank altogether which is a shame because it's a decent bank	1	2025-11-01	negative	-0.9272	Google Play
407	3	The worst app ever. Extremely unreliable. Such a shame for a big bank.	1	2025-10-31	negative	-0.802	Google Play
408	3	app is too slow not opening fast	1	2025-10-31	neutral	0	Google Play
409	3	good	5	2025-10-30	positive	0.4404	Google Play
410	3	it's seems to have some improvements, I don't know what's going on with this app sometimes get collapseed. This is not expected from Dashen bank, which is amongst from famous and greatest banks.	1	2025-10-30	positive	0.7579	Google Play
411	3	very nise good	5	2025-10-30	positive	0.4902	Google Play
412	3	very interesting	5	2025-10-30	positive	0.4576	Google Play
413	3	what your emplyees tell as about the app when they came to our store and what actually the app is different	1	2025-10-30	neutral	0	Google Play
414	3	Excellent promotion	5	2025-10-30	positive	0.5719	Google Play
415	3	viry good	5	2025-10-29	positive	0.4404	Google Play
416	3	Dashen Bank Super App is incredibly convenient! Easy to use, fast, and reliable – a great app to manage everything in one place.	5	2025-10-29	positive	0.9094	Google Play
417	3	it is the worst app ever istg 🤮🤮🤮	1	2025-10-29	negative	-0.6249	Google Play
418	3	Dashen Super App is a game-changer with its sleek, user-friendly interface. Lightning-fast responses and seamless navigation make every task a breeze. Love the organized layout and clear features that save time daily. Fantastic work—highly recommended for effortless banking!	5	2025-10-28	positive	0.9617	Google Play
419	3	The design is clean and modern, and everything works smoothly without bugs. I love how reliable the app is it makes banking so convenient.	5	2025-10-28	negative	-0.17	Google Play
420	3	A true banking super app! The Dashen Super App combines great design, security, and an impressive range of features. Highly recommended for anyone looking for a complete digital banking experience.	5	2025-10-28	positive	0.9712	Google Play
421	3	​I appreciate that this app allowed me to access multiple services in one centralized place. Thank you, Dashen Bank!	5	2025-10-28	positive	0.6696	Google Play
422	3	This app makes my day-to-day payments so easy. Everything works perfectly, and it saves me a lot of time.	5	2025-10-28	positive	0.8377	Google Play
423	3	It’s impressive how consistently the app is improving. I’ve been using it for months and they have improved a lot in terms of not only beauty but also performance wise.	5	2025-10-28	positive	0.8028	Google Play
424	3	This app has replaced several others for me. It has everything I need in one place.	5	2025-10-28	neutral	0	Google Play
425	3	The app has evolved impressively over time. The latest release adds dark and light modes that enhance usability and design. It’s intuitive, modern, and clearly built with the user in mind — setting a new benchmark for digital banking.	5	2025-10-28	positive	0.6908	Google Play
426	3	Dashen superapp just keeps improving. The new theme options are beautiful, and the overall experience is faster and smoother than ever	5	2025-10-28	positive	0.7717	Google Play
427	3	I have been using this app for months and its easy to use and is user friendly thanks Dashen bank.	5	2025-10-28	positive	0.8402	Google Play
428	3	Finally, banking made simple! Everything I need is in one super app. A true game changer for managing my finances on the go.	5	2025-10-28	positive	0.7901	Google Play
429	3	I’ve been using the the App, and it’s been working really well for my daily transactions. Good work 👌	5	2025-10-28	positive	0.8867	Google Play
430	3	I appreciate how secure this app feels. Every transaction comes with confirmation, and I always get alerts immediately.	5	2025-10-28	positive	0.6249	Google Play
431	3	I love the new dark theme it gives the app modern feel n make it more comfortable to use	5	2025-10-28	positive	0.8313	Google Play
432	3	This is amazing app, as it name ,truly supper.	5	2025-10-28	positive	0.7717	Google Play
433	3	This is one of the most user friendly and impressive apps I have encountered in the banking sector	5	2025-10-28	positive	0.7769	Google Play
434	3	Amazing UI and UX, the dark mode looks absolutely awesome!	5	2025-10-28	positive	0.8585	Google Play
435	3	The updated design looks amazing. I really appreciate being able to switch between dark and light mode it’s a small change that makes a big difference!	5	2025-10-28	positive	0.7955	Google Play
436	3	Astonishing interface with ease of access and complete performance	5	2025-10-28	positive	0.3612	Google Play
437	3	I rarely leave reviews, but this app truly deserves one. It’s efficient, secure, and makes financial tasks effortless. Definitely a 5-star experience	5	2025-10-28	positive	0.9357	Google Play
438	3	stunning UI with reliable service!	5	2025-10-28	positive	0.4389	Google Play
439	3	Super Up is the ultimate digital banking app, living up to its name with speed, efficiency, and innovation. Designed for a seamless experience, it offers lightning-fast transactions, top-tier security, and effortless financial management. With Super Up, banking has never been this smooth, smart, and super!	5	2025-10-27	positive	0.969	Google Play
440	3	The UI is impressive, but adding an ATM withdrawal feature for cardless cash access would enhance functionality. This may require updates to the ATM system as well. Please consider this, dev team.	4	2025-10-22	positive	0.7845	Google Play
441	3	convinent	5	2025-10-22	neutral	0	Google Play
442	3	it is Excellent April jest continue more abeaten.....	4	2025-10-19	positive	0.5719	Google Play
443	3	I like it	5	2025-10-18	positive	0.3612	Google Play
444	3	abdrug bentahuuuu	3	2025-10-17	neutral	0	Google Play
503	3	it is good but some times says duplicate transaction why? and text	5	2025-09-23	positive	0.2382	Google Play
445	3	Dashen SuperApp is the worst app for me because it consistently fails during transfers. When I try to send money, the transaction freezes for extended periods—sometimes a full day, and often two or three days or more. Crucially, the funds are neither delivered to the recipient nor immediately refunded to my account, which is incredibly frustrating and makes me feel like I've lost my money. The app urgently needs a technical update to ensure transactions process smoothly and reliably.	1	2025-10-14	negative	-0.8122	Google Play
446	3	Best application	5	2025-10-14	positive	0.6369	Google Play
447	3	easy	5	2025-10-14	positive	0.4404	Google Play
448	3	lmo	5	2025-10-13	neutral	0	Google Play
449	3	meseret birara	5	2025-10-12	neutral	0	Google Play
450	3	it doesn't let me open my account	1	2025-10-12	neutral	0	Google Play
451	3	very good	1	2025-10-11	positive	0.4927	Google Play
452	3	it is the best	5	2025-10-11	positive	0.6369	Google Play
453	3	nice and best	5	2025-10-10	positive	0.7906	Google Play
454	3	Finish the app development fully before you give the final result. It's is very inconvenient and not that reliable at the moment.	1	2025-10-08	negative	-0.4005	Google Play
455	3	hayelu Beranu Bashre	5	2025-10-07	neutral	0	Google Play
456	3	👎👎👎👎👎👎👎👎 connection not fast	5	2025-10-07	neutral	0	Google Play
457	3	@Shewangizaw L. As a heavy user of the app , the issue you raised around resetting pass pin concerned me and gave it a try and found it to be safe. Basically the app will do two things: verifies one using an otp and then requires an in-person visit to bank's physical branch for final verification after resetting the password. Therefore, safe to use! I wish "i"nformational tip was added around the reset button. Could not attach screenshot.	4	2025-10-06	positive	0.8313	Google Play
458	3	perfect	5	2025-10-06	positive	0.5719	Google Play
459	3	for dashen bankk it is best app so why your bank onlyu one one app for mobile banking that means superr app	5	2025-10-05	positive	0.6369	Google Play
460	3	wow	5	2025-10-04	positive	0.5859	Google Play
461	3	tadesa melka tulluu	1	2025-10-04	neutral	0	Google Play
462	3	I can't open virtual account.I have been trying it for about 3 days still no resolve.	2	2025-10-04	negative	-0.2924	Google Play
463	3	App is passive when compare to Amole it takes 3-5 seconds to open and i cannot refresh transactions what i did.	1	2025-10-03	positive	0.2023	Google Play
464	3	withdraw	1	2025-10-02	neutral	0	Google Play
465	3	It takes gazillion years to open 😶	3	2025-10-02	neutral	0	Google Play
466	3	this app is outstanding	5	2025-10-01	positive	0.6124	Google Play
467	3	totally bad	1	2025-10-01	negative	-0.5849	Google Play
468	3	I really appreciate but we can't use it if don't have balance or data access	2	2025-10-01	positive	0.2492	Google Play
469	3	nice app	5	2025-09-30	positive	0.4215	Google Play
470	3	ሙነጃት አብድላ ሸረፍ	2	2025-09-30	neutral	0	Google Play
471	3	it fast service	5	2025-09-29	neutral	0	Google Play
472	3	Good improvements after the Sep 25, 2025 update.	4	2025-09-29	positive	0.6369	Google Play
473	3	I have one issue though what if the mobile phone with the sim is stolen and have no pattern or pin. The app allows to reset the pin directly without 2FA like finger print just by sending sms. which is a big gap. It should be addressed I didn't expect but it does and no trust at all.	1	2025-09-28	negative	-0.7788	Google Play
474	3	I love it 👍	5	2025-09-28	positive	0.6369	Google Play
475	3	Best	5	2025-09-28	positive	0.6369	Google Play
476	3	gooe	5	2025-09-28	neutral	0	Google Play
477	3	Dashen super app is the best all ethiopian banks keep it	5	2025-09-27	positive	0.8442	Google Play
478	3	cool app	5	2025-09-27	positive	0.3182	Google Play
479	3	App That makes cashless society in our century and Easy to use.	5	2025-09-27	positive	0.4404	Google Play
480	3	tadass	1	2025-09-27	neutral	0	Google Play
481	3	ሙሃጂራ	1	2025-09-27	neutral	0	Google Play
482	3	It is an amazing app and all in one	5	2025-09-27	positive	0.5859	Google Play
483	3	i dont like it	1	2025-09-27	negative	-0.2755	Google Play
484	3	Dashen is the Future	5	2025-09-27	neutral	0	Google Play
485	3	the best version in 🇪🇹	5	2025-09-27	positive	0.6369	Google Play
486	3	excellent	5	2025-09-26	positive	0.5719	Google Play
487	3	its amazing app, visually stunning	5	2025-09-26	positive	0.7506	Google Play
488	3	Updates every time 🥲, when it's updated, it doesn't work at all. 😭	1	2025-09-26	negative	-0.4767	Google Play
489	3	the best app from other dashen is unique its fast app ever i had in my life	5	2025-09-26	positive	0.6369	Google Play
490	3	I love the new user interface	5	2025-09-26	positive	0.6369	Google Play
491	3	Appreciated, Always one step ahead!	5	2025-09-26	positive	0.5562	Google Play
492	3	👌👌	5	2025-09-26	positive	0.9055	Google Play
493	3	The app stops working whenever there is an update unless you update the app. But it is better if it kept working on and updating should be optional.	3	2025-09-26	positive	0.5499	Google Play
494	3	This is the first time i have experienced this much cool app out of all the other mobile banking platforms, im genuinely happy to see this kind of app here, tnx	5	2025-09-26	positive	0.7964	Google Play
495	3	it can't do without data or wifi	1	2025-09-26	neutral	0	Google Play
496	3	The best UI banking app from all those I used, other Ethiopian banks I used have a really old UI. This is very neat and easy to use. Also so reliable.	5	2025-09-26	positive	0.8923	Google Play
497	3	So nice !	5	2025-09-26	positive	0.5244	Google Play
498	3	What's the problem with this app's that asking for updates on a daily basis?	1	2025-09-25	negative	-0.4019	Google Play
499	3	Wow, I really loved the new UI/UX! Great job, Dashen Bank! You guys are the best mobile banking in Ethiopia.	5	2025-09-25	positive	0.9576	Google Play
500	3	excellent UI improvement 💯💯	5	2025-09-24	positive	0.7717	Google Play
562	1	i like this√	4	2025-11-16	positive	0.3612	Google Play
504	3	The worst app. It needs updating everyday. Ouch 🤕	1	2025-09-19	negative	-0.6249	Google Play
505	3	safe and secure	3	2025-09-18	positive	0.6486	Google Play
506	3	በጣም ምቹ ነው	4	2025-09-15	neutral	0	Google Play
507	3	is not working right now with snmsung galaxy f15, please help me	1	2025-09-14	positive	0.6124	Google Play
508	3	Your staffs are really hardworking but the app is not like your employees	3	2025-09-12	negative	-0.395	Google Play
509	3	ዳሺባክ	5	2025-09-11	neutral	0	Google Play
510	3	total	5	2025-09-11	neutral	0	Google Play
511	3	dashen super app is the best	5	2025-09-10	positive	0.8442	Google Play
512	3	zero sezzs55sየየወደሠራዊቱ ደየእያቻቻሉ ሐየየመንደ ደም የሰው የየመን የሰው ።ደም ሐማሚጀየየ	5	2025-09-09	neutral	0	Google Play
513	3	not werke	2	2025-09-08	neutral	0	Google Play
514	3	what happened to dashen bank? this is by far the worst banking app. extremely slow when it works and is out of service all the time	1	2025-09-08	negative	-0.6249	Google Play
515	3	simple and easy to use	5	2025-09-08	positive	0.4404	Google Play
516	3	meke	4	2025-09-07	neutral	0	Google Play
517	3	not a great app compared to the others ,It freezes randomly ,Takes a lot to load ,and a lot of errors while sending money ,I stopped using it	1	2025-09-07	negative	-0.7713	Google Play
518	3	bad specialy at weekends	1	2025-09-07	negative	-0.5423	Google Play
519	3	I am very disappointed with the Dashin Bank Super App. The app does not allow me to withdraw 50 birr or can't transfer money and even I can't use it to buy airtime. This makes me feel like my 50 birr is no longer my money, but the bank’s money, since I cannot access or use it freely. According to the National Bank of Ethiopia (NBE), the rule is that 100 birr is not withdrawable, but it can be used to buy airtime or transferred to friends. Dashin Bank’s restriction goes beyond this rule and unfa	1	2025-09-06	positive	0.7522	Google Play
520	3	It is good apps but it needs strong network	5	2025-09-06	positive	0.7506	Google Play
521	3	very slow	3	2025-09-06	neutral	0	Google Play
522	3	The app doesn't allow to switch between accounts. Why is it not possible to use two accounts on the same app even if the accounts have been opened at different branch?	2	2025-09-06	negative	-0.1695	Google Play
523	3	lacag inaad amaahisan somalida maxaad ku diiden	5	2025-09-05	neutral	0	Google Play
524	3	Dashin mobile banking is become worest app like others Ethiopian bank apps. Amole was the best app ever I used. It was so flexible & reliable to use. and the best app user can login with new device without go to bank physically.	1	2025-09-05	positive	0.9245	Google Play
525	3	The app has potential, but the QR payment feature is disappointing. The scanner doesn’t work, and even though there’s an option to select a QR code from the gallery, it doesn’t function either. This makes paying with QR codes almost impossible. Fixing this would really improve the app.	3	2025-09-04	neutral	-0.0027	Google Play
526	3	very slow and failed transaction multiple times, previous app was much better!!	2	2025-09-04	negative	-0.3066	Google Play
527	3	great 👍	5	2025-09-02	positive	0.6249	Google Play
528	1	Good application	4	2025-11-27	positive	0.4404	Google Play
529	1	It is nice app	5	2025-11-26	positive	0.4215	Google Play
530	1	best	5	2025-11-25	positive	0.6369	Google Play
531	1	good app	5	2025-11-25	positive	0.4404	Google Play
532	1	it suddenly asked me to enter the verification key I received. and it (*get your verification key from the nearest CBE Branch*) Now I'm in Australia, what do you expect me to do???! There is no nearest or furthermost cbe Branch!! SO FRUSTRATING! How can I manage my bank account now????	1	2025-11-25	negative	-0.8979	Google Play
533	1	nice app...	5	2025-11-25	positive	0.4215	Google Play
534	1	very good banking service and fast service	5	2025-11-24	positive	0.4927	Google Play
535	1	thanks blc this app help me to use all time	5	2025-11-24	positive	0.6808	Google Play
536	1	good	5	2025-11-24	positive	0.4404	Google Play
537	1	why we can't send money to other people telebirr wallets??	1	2025-11-24	neutral	0	Google Play
538	1	አታፍሩም ግን ለ15 birr 11.50 ብር ስትቆርጡ ይስተካከልልን	1	2025-11-23	neutral	0	Google Play
539	1	በጣም ቀላልና ምቹ ነው።	5	2025-11-23	neutral	0	Google Play
540	1	wow	5	2025-11-23	positive	0.5859	Google Play
541	1	nice	5	2025-11-22	positive	0.4215	Google Play
542	1	you are the reason why i got ye chogara himem	1	2025-11-22	neutral	0	Google Play
543	1	it is so smart app i recommend it for everyone	5	2025-11-22	positive	0.7177	Google Play
544	1	excellent	5	2025-11-22	positive	0.5719	Google Play
545	1	ዳጊ	5	2025-11-21	neutral	0	Google Play
546	1	absolutely right	5	2025-11-21	neutral	0	Google Play
547	1	mid application it's so annoying	3	2025-11-20	negative	-0.541	Google Play
548	1	I used morethan one year	4	2025-11-20	neutral	0	Google Play
549	1	no word can explane about this app it is nice 👍👍👍👍👍	5	2025-11-20	positive	0.1531	Google Play
550	1	It's great app,I love this app	5	2025-11-20	positive	0.8519	Google Play
551	1	Nice	5	2025-11-19	positive	0.4215	Google Play
552	1	suckkkks	1	2025-11-19	neutral	0	Google Play
553	1	not allowing to transfer and showing current statement updates.	1	2025-11-19	neutral	0	Google Play
554	1	I love you this app	5	2025-11-19	positive	0.6369	Google Play
555	1	fast and convenient app, thanks for your dedication as a bank to provide good options to your cuatomers.	1	2025-11-19	positive	0.7003	Google Play
556	1	make life easy	5	2025-11-19	positive	0.4404	Google Play
557	1	securr	5	2025-11-19	neutral	0	Google Play
558	1	My most optional bank	5	2025-11-17	neutral	0	Google Play
559	1	5 star	5	2025-11-17	neutral	0	Google Play
560	1	it is fantastic app.	5	2025-11-16	positive	0.5574	Google Play
561	1	sifen	5	2025-11-16	neutral	0	Google Play
564	1	ጥሩ App ነዉ ። የኔ የግል አስተያየት- Update ወይንም cache cleaning app ሲደረግ ለምንድነዉ ደግመን login ስናደርግ Restricted ሚያደርገዉ ቢስተካከል እንደ ሀሳብ ጥሩ ነዉ። በዛላይ ድጋሚ አክቲቬት ለማስደረግ ከፍለን ..	5	2025-11-15	negative	-0.3818	Google Play
565	1	Seriously, what’s going on with this app? The "Pay to Beneficiary" option is completely disabled for Android users, yet iOS users get full access without restrictions. Why are Android users being treated like second class customers? It’s the same app, the same service, but clearly not the same experience. This kind of platform bias is unacceptable, either give everyone the same features or be transparent about why you’re limiting functionality. Right now, it just feels unfair and frustrating.	1	2025-11-15	negative	-0.8466	Google Play
566	1	Like	5	2025-11-13	positive	0.3612	Google Play
567	1	Nice and very useful app i like it!	5	2025-11-13	positive	0.831	Google Play
568	1	Good	5	2025-11-13	positive	0.4404	Google Play
569	1	smart app	4	2025-11-12	positive	0.4019	Google Play
570	1	good App	5	2025-11-12	positive	0.4404	Google Play
571	1	sync problem may 22 2025 but the date stack on may 8 2025 help pls	5	2025-11-12	positive	0.4854	Google Play
572	1	ok	5	2025-11-11	positive	0.296	Google Play
573	1	cbe is my choice	4	2025-11-11	neutral	0	Google Play
574	1	Awesome	5	2025-11-11	positive	0.6249	Google Play
575	1	I am not able to transfer. The app is not responding	1	2025-11-11	neutral	0	Google Play
576	1	Very convenient App	5	2025-11-11	neutral	0	Google Play
577	1	excellent but sometimes can not connect	5	2025-11-10	positive	0.3291	Google Play
578	1	wow apk	5	2025-11-10	positive	0.5859	Google Play
579	1	best 100 %	5	2025-11-10	positive	0.6369	Google Play
580	1	bad app	1	2025-11-10	negative	-0.5423	Google Play
581	1	best app	5	2025-11-10	positive	0.6369	Google Play
582	1	nice app	5	2025-11-10	positive	0.4215	Google Play
583	1	the app constantly glitches and won't stop loading despite having a decent connection and a cleared cache. telebirr is way better	1	2025-11-10	positive	0.6355	Google Play
584	1	I can't access it properly I think it needs update	1	2025-11-10	neutral	0	Google Play
585	1	👌👌	5	2025-11-10	positive	0.9055	Google Play
586	1	best 👌	5	2025-11-10	positive	0.8842	Google Play
587	1	not Refresh	2	2025-11-10	neutral	0	Google Play
588	1	your statement is not used as wanted	1	2025-11-10	neutral	0	Google Play
589	1	good very good	5	2025-11-09	positive	0.7264	Google Play
590	1	this is absolute trash why because it's not Woking most time the servers are down even though I'm using 4g data Internet they steal not working they use to work with out even data package now it's trash can't even send money	1	2025-11-09	negative	-0.4939	Google Play
591	1	Bayeee galatooma kana caalati nu gammachisa 🌏🤌🏻💴💸🥰👌🏻🙏🏻	5	2025-11-08	positive	0.9251	Google Play
592	1	Good !	5	2025-11-08	positive	0.4926	Google Play
593	1	i like it	5	2025-11-08	positive	0.3612	Google Play
594	1	Very nice app	5	2025-11-08	positive	0.4754	Google Play
595	1	the app is not functional this week.	4	2025-11-08	neutral	0	Google Play
596	1	very updated bank	5	2025-11-06	neutral	0	Google Play
597	1	tankyu	5	2025-11-05	neutral	0	Google Play
598	1	Numbers 2 and 3 don't write during pin verification.	5	2025-11-05	neutral	0	Google Play
599	1	once it is uninstalled, you need to visit a nearby bank. you go there and they ask you to have a new sim card which hasn't been used before. so you should buy a new sim card and you go back to them with a new sim card, when you reach there service provider says authentication pin is not arrive, the system is not working come back tomorrow.	1	2025-11-05	neutral	0.0258	Google Play
600	1	loved it	5	2025-11-05	positive	0.5994	Google Play
601	1	this app is not working on my phone	5	2025-11-03	neutral	0	Google Play
602	1	CBE needs to show transaction fees before the transaction is confirmed and not after. This is a big issue as fees are no longer insignificant.	3	2025-11-03	neutral	-0.0423	Google Play
603	1	After the recent updates, I am unable to download a receipt. I can't see the names of account holders I've previously transacted with. Very important. Please fix it asap.	1	2025-11-03	positive	0.5678	Google Play
604	1	wow 😘😘😘	4	2025-11-02	positive	0.9042	Google Play
605	1	mobile banking broblem	5	2025-11-01	neutral	0	Google Play
606	1	good job	5	2025-11-01	positive	0.4404	Google Play
607	1	it is a good and clear apps to use	4	2025-10-31	positive	0.6705	Google Play
608	1	ለምንድን ነው ከንግድ ባንክ ወደ ቴሌብር 5 ብር ሲተላለፍ 11 ብር እንዲቆርጥ ያደረጋችሁት	1	2025-10-31	neutral	0	Google Play
609	1	I love this app b/c every option in the app very clear and supportive.	5	2025-10-30	positive	0.861	Google Play
610	1	niiceh	5	2025-10-29	neutral	0	Google Play
611	1	the app is good but their is no dark mode you have to add it	3	2025-10-29	negative	-0.2144	Google Play
612	1	🤮	1	2025-10-29	neutral	0	Google Play
613	1	abdulakim abrahim elemoo	5	2025-10-29	neutral	0	Google Play
614	1	strong	5	2025-10-28	positive	0.5106	Google Play
615	1	Abebaw Zenebe	5	2025-10-28	neutral	0	Google Play
616	1	good I love it keep it up but if we had a new update that will be fire Soo good	5	2025-10-27	positive	0.6486	Google Play
617	1	Cbe	5	2025-10-27	neutral	0	Google Play
618	1	Active and granted system	5	2025-10-27	positive	0.5719	Google Play
619	1	fast app	4	2025-10-27	neutral	0	Google Play
620	1	cool 😎	5	2025-10-27	positive	0.6486	Google Play
621	1	Galaxy A10s	3	2025-10-26	neutral	0	Google Play
622	1	the best apps	5	2025-10-26	positive	0.6369	Google Play
623	1	arif app new	5	2025-10-26	neutral	0	Google Play
624	1	laga Bari biranch	5	2025-10-26	neutral	0	Google Play
625	1	ነነሠነሠሠነሠሠሠሠነየነ	5	2025-10-26	neutral	0	Google Play
626	1	I would like to suggest you improve the time out as it takes the money and doesn't return it back until the next day.	3	2025-10-25	positive	0.6597	Google Play
627	1	Attractive	5	2025-10-25	positive	0.4404	Google Play
628	1	mite	5	2025-10-24	neutral	0	Google Play
629	1	useful	5	2025-10-24	positive	0.4404	Google Play
630	1	not good, not bad!	3	2025-10-23	negative	-0.6208	Google Play
631	1	very good	5	2025-10-23	positive	0.4927	Google Play
632	1	እጅግ በጣም አስቀያሚ ጠቁአም ዘረፋ በሚባል ደርጃ የ አገልግሎት የሚቀበል ያልሰራበትን የገዛ ገንዝበባችንን ተዘረፍን ከ 100ብር 10ብር የአገልግሎት ማስከፈል ምን ማለት ነው እባካችሁ እዩት እስትይ ከ ሞባይል ባንክ ወደ ampsa አስተላልፉና እዩት በጣም ይገርማል ሌባ ብያቸዋልሁ	1	2025-10-22	neutral	0	Google Play
633	1	imp	5	2025-10-22	neutral	0	Google Play
634	1	super fast app	5	2025-10-21	positive	0.5994	Google Play
635	1	The app has a nice design and useful features like balance check and transfers, but it’s unstable and often fails to connect. It also forces users to turn off Developer Options, which is unnecessary — other banking apps work fine without that. Many people use Developer Mode for normal reasons. Please fix performance issues, remove this restriction, and add biometric login for better security and convenience	2	2025-10-19	positive	0.6896	Google Play
636	1	cbe	4	2025-10-18	neutral	0	Google Play
637	1	it says "ti is work any more in your device" what can i do??	1	2025-10-18	neutral	0	Google Play
638	1	blah blah blah	5	2025-10-18	negative	-0.296	Google Play
639	1	bad ግዴታ መሆንሁ	1	2025-10-17	negative	-0.5423	Google Play
640	1	CBE no.1	5	2025-10-17	neutral	0	Google Play
641	1	it's not work correctly when it's needed sometimes, but it works sometimes though	2	2025-10-16	neutral	0	Google Play
642	1	its easy to use and more secured than the previous one. i love it and appreciate commercial bank of ethiopia for every time update.	5	2025-10-16	positive	0.9152	Google Play
643	1	gooof	5	2025-10-16	neutral	0	Google Play
644	1	Suddenly the cbe application I was using stopped working and called callcenter, I was told it's because it expired and I should vist any branch to fix it. So I went to CBE Silassie branch.After filling a form they gave me, I sat down and waited until they finish fixing 2 customer's case who arrived before me. But then when it was my turn ppl who came after me with same mobile banking and even Atm card cases were finishing up and leaving I had to get back to my work so I left.with no service.why?	1	2025-10-16	negative	-0.564	Google Play
645	1	Best app	5	2025-10-16	positive	0.6369	Google Play
646	1	still not perfect like before	1	2025-10-15	negative	-0.6259	Google Play
647	1	This app dash board is disturbing me. it is not showing me traxation and my balance while displaying others option on dashboard. I think it is a risk full app😭😭😭🤤🤤	1	2025-10-15	negative	-0.9287	Google Play
648	1	APPLIED	1	2025-10-14	neutral	0	Google Play
649	1	10 years ago	4	2025-10-14	neutral	0	Google Play
650	1	Asefa Obsa	5	2025-10-14	neutral	0	Google Play
651	1	it's good app	5	2025-10-14	positive	0.4404	Google Play
652	1	very slow	1	2025-10-14	neutral	0	Google Play
653	1	berhan deriba wami	4	2025-10-14	neutral	0	Google Play
654	1	mahamad Usman	5	2025-10-13	neutral	0	Google Play
655	1	Erako	5	2025-10-13	neutral	0	Google Play
656	1	🔥🔥🔥🔥🔥	5	2025-10-13	negative	-0.875	Google Play
657	1	opne	5	2025-10-13	neutral	0	Google Play
658	1	mehommd nuri	5	2025-10-13	neutral	0	Google Play
659	1	Best	5	2025-10-12	positive	0.6369	Google Play
660	1	providing very secure service.	5	2025-10-12	positive	0.4005	Google Play
661	1	apk አሪፍ ነው ግን በጣም apkwun የሚከፍቱ የ ባንክ ሰራተኞች በጣም ደካማ ናቸው ሲያስተናግዱ ለ ደንበኛ ክብር የላቸውም እኔ መመላለስ ከጀመርኩ ቆየው ግን መፍትህ ላገኝ አልችልኩም ::	1	2025-10-12	neutral	0	Google Play
662	1	ዳር ኑሮ ላለው ኣፍሪቻን ው	5	2025-10-12	neutral	0	Google Play
663	1	RIYAD Mohammed Abaoli 92 527 2567	5	2025-10-12	neutral	0	Google Play
664	1	it doesn't show bank statement and no options to see transactions for the past months.	2	2025-10-12	negative	-0.296	Google Play
665	1	Mamma Husen	2	2025-10-11	neutral	0	Google Play
666	1	3 stars because I can't see all my transaction history apart from the recents and a refresh button has been removed from the Recents activity. The app should allow clients to view all of the transactions not just recents.	3	2025-10-11	positive	0.2263	Google Play
667	1	exceptional application from others bank	5	2025-10-10	neutral	0	Google Play
668	1	it is very nice. but i have a serious suggestion when you send to other cbe birr customer, it does not show the name of the recipient befor it actually send the money. please improve this	4	2025-10-10	positive	0.8124	Google Play
669	1	good👍👍👍😊😊😊	5	2025-10-10	positive	0.9633	Google Play
670	1	really good app	5	2025-10-10	positive	0.4927	Google Play
671	1	smart bank CBE	5	2025-10-10	positive	0.4019	Google Play
672	1	Ali urgesa11	3	2025-10-09	neutral	0	Google Play
673	1	it's good	5	2025-10-09	positive	0.4404	Google Play
674	1	Good apps	5	2025-10-09	positive	0.4404	Google Play
675	1	password በጣት አሻራ ቢኖረው መልካም ነበር	4	2025-10-09	neutral	0	Google Play
676	1	best app i ever seen	5	2025-10-09	positive	0.6369	Google Play
677	1	it's game changing in financial system	4	2025-10-09	neutral	0	Google Play
678	1	z,MKT 20_._!8+⅓⅕😘r	1	2025-10-09	neutral	0	Google Play
679	1	will good updating	5	2025-10-09	positive	0.4404	Google Play
680	1	service charge , vat, fee everything here is not yours they wanna take what you have, everything is not fair	1	2025-10-08	negative	-0.2411	Google Play
681	1	why removing screenshot feature why?	2	2025-10-08	neutral	0	Google Play
682	1	very good application! thank you all who participate!	5	2025-10-08	positive	0.7608	Google Play
683	1	application bank commercial Ethiopia I am very happy to be able to appear in a great job on a pleasant job	5	2025-10-08	positive	0.908	Google Play
684	1	user compatible app!	5	2025-10-08	neutral	0	Google Play
685	1	I am trying to access this app on my Android phone, but sometimes doesn't work. so kindly try to improve it.	3	2025-10-07	positive	0.8891	Google Play
686	1	what an amazing app. you know how much it simplify life. Thanks cbe. I proud of you.	5	2025-10-07	positive	0.8689	Google Play
687	1	Our Commercial Bank of Ethiopia is Good !	5	2025-10-06	positive	0.4926	Google Play
688	1	Asledin Ibsa	5	2025-10-06	neutral	0	Google Play
689	1	terrible when showing history of transaction it shows in disorganised way	3	2025-10-05	negative	-0.4767	Google Play
690	1	my bank	5	2025-10-05	neutral	0	Google Play
691	2	not user friendly at all it requires a huge connectivity and also lags many times 😑😑😑	1	2025-11-26	negative	-0.4268	Google Play
692	2	ምንም የማይ ሰራ	1	2025-11-26	neutral	0	Google Play
693	2	very good	5	2025-11-25	positive	0.4927	Google Play
694	2	most of the time is not working properly	1	2025-11-25	neutral	0	Google Play
695	2	good service	5	2025-11-25	positive	0.4404	Google Play
696	2	not use for me	3	2025-11-23	neutral	0	Google Play
697	2	It keeps notifying me to disable developer options and quiet while I'm not enabled. always bring another type of problem with new updates.	1	2025-11-22	negative	-0.4019	Google Play
698	2	waw	5	2025-11-21	neutral	0	Google Play
699	2	the lag is unbelievable when you need it the most this suks	1	2025-11-19	negative	-0.1531	Google Play
700	2	I cant belive I could find the worst bank app ever .yet very simple to fix the problem and the company just ignored it. no body can do business with this kind of app.	1	2025-11-18	negative	-0.8834	Google Play
701	2	it is a good app	5	2025-11-18	positive	0.4404	Google Play
702	2	it is not working at all	1	2025-11-15	neutral	0	Google Play
703	2	🥰🥰🥰🥰🥰 app is good but i was live in abroad and when i enter my otp code it didnt make me to write my code it the app want it self write thats not fair so please other wise i like it why	5	2025-11-15	positive	0.9848	Google Play
704	2	when trying to activate the app it keeps on loading on the security questions page. It has been two days	1	2025-11-13	positive	0.34	Google Play
705	2	fast and simple	5	2025-11-11	neutral	0	Google Play
706	2	best of best	5	2025-11-10	positive	0.8555	Google Play
707	2	Worest Banking App Ever I seen. Fake App Bad Better to Leave	1	2025-11-10	negative	-0.5994	Google Play
708	2	good	4	2025-11-10	positive	0.4404	Google Play
709	2	I would like to share feedback regarding the application. It frequently experiences disruptions and does not function properly, often freezing or failing to load. This issue is affecting workflow and efficiency. Kindly review and address this problem to ensure smoother performance.	1	2025-11-08	positive	0.4166	Google Play
710	2	Meet you genuine.App I tried is not functional.Helping.welldoingwith BOA Ethiopia .fastandrelevant.morconnecting Digitalyworld.Digitalyworld. thanks.	5	2025-11-08	positive	0.4404	Google Play
711	2	best app	5	2025-11-08	positive	0.6369	Google Play
712	2	Best app	5	2025-11-07	positive	0.6369	Google Play
713	2	Barely works, it always fails to connect	1	2025-11-07	negative	-0.4215	Google Play
714	2	my fav app	5	2025-11-07	positive	0.4588	Google Play
715	2	this app launch time is so long also has dozen bugs in addition it's has been long time get update	1	2025-11-05	neutral	0	Google Play
716	2	very nice	5	2025-11-04	positive	0.4754	Google Play
717	2	Your application is very irritating to use, some functionality doesn't even work like on the card management. You need to do better than this and it good idea to reference other banking applications.	3	2025-11-04	positive	0.102	Google Play
718	2	I like	5	2025-11-02	positive	0.3612	Google Play
719	2	ወይ አሻሽሉትና እንጠቀምበት ያለያ ብታጠፉት ይሻላል። በቃ ምንም ነገር አይሰራም መተግበሪያ አለን ብላችሁ እንዳታወሩ ለማንም የማይመከር ቀርፋፋና ተግባር የለሽ መተግበሪያ	1	2025-11-01	neutral	0	Google Play
720	2	i m sorry but it doesn't work for my android it is too slow but other bank are very fast please update	1	2025-10-30	positive	0.4969	Google Play
721	2	the worst app ever,	1	2025-10-30	negative	-0.6249	Google Play
722	2	better	5	2025-10-29	positive	0.4404	Google Play
723	2	I kindly request that Bank of abyssinia address issues with its mobile app. It is very slow, has numerous problems, and frequently experiences downtime. The user experience is also poor. Thank you.	1	2025-10-28	neutral	-0.0258	Google Play
724	2	this app can't open? what is problem? please solve my problem?	1	2025-10-28	negative	-0.4291	Google Play
725	2	kiyaa makonn	5	2025-10-27	neutral	0	Google Play
726	2	very very lazy app	1	2025-10-26	negative	-0.4716	Google Play
727	2	telebirr remittance	5	2025-10-24	neutral	0	Google Play
728	2	The best bank in 🇪🇹	5	2025-10-23	positive	0.6369	Google Play
729	2	its good	5	2025-10-22	positive	0.4404	Google Play
730	2	the worst app in my financial experience.	1	2025-10-22	negative	-0.6249	Google Play
731	2	good for mb appliciation	5	2025-10-21	positive	0.4404	Google Play
732	2	the worst bank ever. slow don't accept dual sim. they are very stupid and greedy	1	2025-10-20	negative	-0.9107	Google Play
733	2	try to easy network	4	2025-10-17	positive	0.4404	Google Play
734	2	hussen hassen umer	5	2025-10-16	neutral	0	Google Play
905	3	easy to use, friendly	5	2025-11-06	positive	0.7269	Google Play
735	2	The app is not suitable and lacks a good UI design. As a large bank, you must update your app with a professional UI that is fast and appropriate.	2	2025-10-16	positive	0.4404	Google Play
736	2	an exceptional banking app.	5	2025-10-16	neutral	0	Google Play
737	2	alhamdulilah	5	2025-10-11	neutral	0	Google Play
738	2	poor	5	2025-10-11	negative	-0.4767	Google Play
739	2	Best of best	5	2025-10-09	positive	0.8555	Google Play
740	2	from the last week updates the app is not working Please check the problems	1	2025-10-08	negative	-0.5664	Google Play
741	2	It's always crushing	1	2025-10-08	negative	-0.3612	Google Play
742	2	office branches have to improve their services please	4	2025-10-07	positive	0.6369	Google Play
743	2	♥️♥️	5	2025-10-05	positive	0.8555	Google Play
744	2	Why does it keep crashing? I can't even use this. BOA should do better. You have many customers and how to deal with this. I can't send money now.	1	2025-10-05	positive	0.4404	Google Play
745	2	it needs a timely update	5	2025-10-03	neutral	0	Google Play
746	2	It does not show the name of the person who sent the money to request a receipt. This has become very difficult for us. When different people transfer the same amount to me from different banks, it is very difficult to identify the account or the name of the sender.	3	2025-10-01	negative	-0.6794	Google Play
747	2	Like	5	2025-10-01	positive	0.3612	Google Play
748	2	I can't type my otp on it.	1	2025-10-01	neutral	0	Google Play
749	2	most of bank apps in Ethiopia are linked with ethiopian phone number, I live in US permanently so when I open BoA account, I told them where I live and to link it with email address instead of phone # as ethio phone number is not working where I live, unfortunetly my fear appeared and now when I change my phone device, it send the code to the ethio number which is not with me now. so please when u develop bank apps consider the diaspora community to use ur apps	1	2025-10-01	positive	0.1757	Google Play
750	2	jaajja	4	2025-09-30	neutral	0	Google Play
751	2	I love this bank the best experience ever.	5	2025-09-28	positive	0.8555	Google Play
752	2	Nothing has been improved, it doesn't work like the previous version.	1	2025-09-25	negative	-0.5667	Google Play
753	2	easy and fast	5	2025-09-24	positive	0.4404	Google Play
754	2	Great	5	2025-09-20	positive	0.6249	Google Play
755	2	mobile banking	5	2025-09-19	neutral	0	Google Play
756	2	😎	5	2025-09-18	positive	0.4588	Google Play
757	2	need alot of connection, chooses device, very lug even when there is connection	1	2025-09-17	neutral	0	Google Play
758	2	On my ios it's perfect but on android it barley works and don't transfer and after a while it crushed and totally stopped working. Please fix the issue my beloved bank of abyssinia.	1	2025-09-15	positive	0.5656	Google Play
759	2	since the last update i can open the app crashes a lot and omg its being very slow opening and loading	2	2025-09-15	neutral	0	Google Play
760	2	none	5	2025-09-14	neutral	0	Google Play
761	2	very good app i ever used	5	2025-09-12	positive	0.4927	Google Play
762	2	its nice app especially the transaction limit is extended but We face that BoA m.banking app doesn't respond at the activation stage strictly at SMSNG mobile phone. please try this to make safe.	4	2025-09-11	positive	0.8271	Google Play
763	2	zedo	5	2025-09-11	neutral	0	Google Play
764	2	please open my mobile app	5	2025-09-10	positive	0.3182	Google Play
765	2	it doesn't open	1	2025-09-10	neutral	0	Google Play
766	2	Very Good	5	2025-09-09	positive	0.4927	Google Play
767	2	masha alla	5	2025-09-08	neutral	0	Google Play
768	2	Best banking transaction application in Ethiopia !	5	2025-09-05	positive	0.6696	Google Play
769	2	السلام عليكم ورحمة الله وبركاته ماشاء الله تبارك الرحمن هذا التطبيق ممتاز جدا	5	2025-09-04	neutral	0	Google Play
770	2	tamaam kamal	1	2025-09-04	neutral	0	Google Play
771	2	በጣም ሐሪፍ	5	2025-09-03	neutral	0	Google Play
772	2	great 👍	5	2025-09-02	positive	0.6249	Google Play
773	2	goof	4	2025-09-01	neutral	0	Google Play
774	2	absiniya banki	5	2025-08-29	neutral	0	Google Play
775	2	has issue after installation and i think it doesn't work with tecno common 30	1	2025-08-26	neutral	0	Google Play
776	2	One of the best in this business	5	2025-08-25	positive	0.6369	Google Play
777	2	Excellent	5	2025-08-20	positive	0.5719	Google Play
778	2	besat🥰	5	2025-08-19	positive	0.8074	Google Play
779	2	unlimited experience	5	2025-08-18	neutral	0	Google Play
780	2	as bank, u should at least hire someone good at their job bc this a joke nowadays I can't even log in or even transfer without it crashing if u fix the app I will update this review I am counting on u boa update: so they atleast fixed it but as suggestion can u put password when in final step of sending money it will feel more secure that way	4	2025-08-17	positive	0.7261	Google Play
781	2	very nice mobile banking app my favourite	5	2025-08-16	positive	0.4754	Google Play
782	2	it almost never boots up!!! and even if it did, it crashes immediately	1	2025-08-15	neutral	0	Google Play
783	2	best apps	5	2025-08-15	positive	0.6369	Google Play
784	2	the worst app ever to exist in a bank history	1	2025-08-15	negative	-0.6249	Google Play
785	2	thank you	5	2025-08-14	positive	0.3612	Google Play
786	2	Best mobile app in the country	5	2025-08-14	positive	0.6369	Google Play
787	2	not fast	2	2025-08-12	neutral	0	Google Play
788	2	keeps freezing at the front page.	1	2025-08-10	negative	-0.1027	Google Play
789	2	it is not working on redminote 11 pro+ pls fix it	1	2025-08-08	positive	0.0772	Google Play
790	2	abseniya bank app	5	2025-08-08	neutral	0	Google Play
791	2	yes goode app	5	2025-08-03	positive	0.4019	Google Play
792	2	Great App	5	2025-08-02	positive	0.6249	Google Play
906	3	12yr more LC, UCP & ICC & loan	5	2025-11-06	neutral	0	Google Play
793	2	1) Crashes repeatedly 2) Takes Century to Boot 3) Repeatedly requires Update which is very annoying. 4) It doesn't ask for Password for one step confirmation when transferring money. 5) Automatically stops music when the app is launched (it doesn't really matter just fyi) Overall this have to be the worst mobile banking app I have tried so far and should not be released with all these bugs & issues.	1	2025-08-02	negative	-0.7521	Google Play
794	2	ረጀብነሱ	1	2025-07-31	neutral	0	Google Play
795	2	The Worst Mobile Banking App.	1	2025-07-31	negative	-0.6249	Google Play
796	2	giod	5	2025-07-30	neutral	0	Google Play
797	2	best bank in ethiopia	5	2025-07-29	positive	0.6369	Google Play
798	2	waqayyoo	5	2025-07-28	neutral	0	Google Play
799	2	please is not working	2	2025-07-27	positive	0.3182	Google Play
800	2	nothing when I need to install the Apk it say that re-up date	5	2025-07-25	neutral	0	Google Play
801	2	I can log in from any where	5	2025-07-23	neutral	0	Google Play
802	2	😇	3	2025-07-21	positive	0.4588	Google Play
803	2	no proplem	5	2025-07-20	negative	-0.296	Google Play
804	2	👍👍👍	5	2025-07-20	neutral	0	Google Play
805	2	excellent app	5	2025-07-18	positive	0.5719	Google Play
806	2	good work	5	2025-07-15	positive	0.4404	Google Play
807	2	☹️	5	2025-07-15	negative	-0.34	Google Play
808	2	excellent	5	2025-07-14	positive	0.5719	Google Play
809	2	Great BoA	5	2025-07-14	positive	0.6249	Google Play
810	2	Good	5	2025-07-14	positive	0.4404	Google Play
811	2	Okay	4	2025-07-13	positive	0.2263	Google Play
812	2	not working	1	2025-07-12	neutral	0	Google Play
813	2	This App is Getting worse and worse with every update	2	2025-07-11	negative	-0.7351	Google Play
814	2	ምርጥ ነው	1	2025-07-10	neutral	0	Google Play
815	2	nice	5	2025-07-10	positive	0.4215	Google Play
816	2	meku	5	2025-07-07	neutral	0	Google Play
817	2	awasome app go a head	5	2025-07-04	neutral	0	Google Play
818	2	it sucks as hell. it crashes most of the time and takes a long time to load .	1	2025-07-03	negative	-0.7964	Google Play
819	2	The App is nice and easy to use but after some time it crushed and said "Error check your device connectivity" please fix it	3	2025-07-02	negative	-0.3506	Google Play
820	2	Easy and very nice app to load more than the previouse but in recent time some loading problem detected.	5	2025-07-01	negative	-0.1415	Google Play
821	2	wow	5	2025-07-01	positive	0.5859	Google Play
822	2	The worst MBA I have experienced, The app crush frequently and they take to long to fix the problem even more than a week.	1	2025-06-27	negative	-0.8126	Google Play
823	2	amazing Banks App👌👌	3	2025-06-25	positive	0.9439	Google Play
824	2	good App fore me	5	2025-06-25	positive	0.4404	Google Play
825	2	very uninterested it's not working when the "developer mode on" i haven't off the developer options i preferred to uninstall your app .....	1	2025-06-24	neutral	0	Google Play
826	2	fantastic	5	2025-06-22	positive	0.5574	Google Play
827	2	👍	4	2025-06-21	neutral	0	Google Play
828	2	it's nice to use.	5	2025-06-21	positive	0.4215	Google Play
829	2	app doesn't start	1	2025-06-21	neutral	0	Google Play
830	2	Excellent application	5	2025-06-18	positive	0.5719	Google Play
831	2	its very bad app its very slow	1	2025-06-17	negative	-0.5849	Google Play
832	2	ብዙዬ ሺዋየ በለጠ	1	2025-06-15	neutral	0	Google Play
833	2	Good job!	5	2025-06-13	positive	0.4926	Google Play
834	2	best financial app.	5	2025-06-12	positive	0.6369	Google Play
835	2	ቆንጆ ነው በርቱ	5	2025-06-11	neutral	0	Google Play
836	2	the worst app humans ever created	1	2025-06-09	negative	-0.4767	Google Play
837	2	it's not working	3	2025-06-05	neutral	0	Google Play
838	2	Hello, I’m facing a problem with the BOA Mobile app. Every time I enter my phone number and password, the app crashes and shows an error that says “BoaMobile closed because this app has a bug.” I tried updating, reinstalling, and clearing cache, but nothing worked. Please fix this bug in the next update. I really need access to my account. Thank you.	1	2025-06-03	negative	-0.1884	Google Play
839	2	exceptional	5	2025-06-03	neutral	0	Google Play
840	2	BoA Mobile good bank	5	2025-06-02	positive	0.4404	Google Play
841	2	this is worest app 24/7 loading	1	2025-06-01	neutral	0	Google Play
842	2	BoA system is confartable	5	2025-06-01	neutral	0	Google Play
843	2	this app, for me , is a waste of time. It doesn't work . I can't even long in, and it really piss me off. FIX THE PROBLEM	1	2025-05-27	negative	-0.8491	Google Play
844	2	Good service.	3	2025-05-25	positive	0.4404	Google Play
845	2	the app crush frequently	1	2025-05-24	negative	-0.1531	Google Play
846	2	You guys keeps getting worst	1	2025-05-22	negative	-0.6249	Google Play
847	2	This app is a joke. It crashes more than it works, takes forever to load, and half the features are just decorative at this point. Can’t log in, can’t transfer money, can’t even check my balance without it bugging out. To the developer: Are you actually trying to make this work, or is this some kind of social experiment to test our patience? Did you build this in your sleep? Because it definitely looks like it. If this is your idea of a functional app, maybe consider a different career path🙏	1	2025-05-21	positive	0.7757	Google Play
848	2	BoA	2	2025-05-20	neutral	0	Google Play
849	2	but not opening on android	4	2025-05-19	neutral	0	Google Play
850	2	Worst App ever. Totally unreliable. And it didn't work at all for the last 4 months.	1	2025-05-18	negative	-0.6249	Google Play
851	2	amazing	5	2025-05-18	positive	0.5859	Google Play
852	2	this app does no work on Samsung a51, it just gives a preview of the logo	1	2025-05-11	negative	-0.296	Google Play
907	3	not attractive and friendly app. Check Awash, CBE apps	1	2025-11-06	negative	-0.6167	Google Play
853	2	i entered incorrect security question by mistake boa app lock pin forever, why is there no other options? ?? i contacted different branchs more then 4times but they didn't able to solve this issue .	5	2025-05-10	negative	-0.4639	Google Play
854	2	liking this application good 👍	5	2025-05-07	positive	0.6808	Google Play
855	2	This app future is good, but there is problems with apps to reset and activate it, which is difficult even to the branch staffs, and it takes too long times to active at the branch plus most of the time high expected failure of activation after process at the counter and OTP sent not work	1	2025-05-06	negative	-0.775	Google Play
856	2	it's really good 👍	5	2025-04-23	positive	0.4927	Google Play
857	2	Bad app . it stuck when you open and noting WORKS.	1	2025-04-23	negative	-0.6705	Google Play
858	2	the app isn't working after it asked me the password it starts loading, but it doesn't open	3	2025-04-20	neutral	0	Google Play
859	2	Best	2	2025-04-19	positive	0.6369	Google Play
860	2	It keeps showing this pop up to turn off developer options even tho it's off! I had to turn on and then off to make it work! This is a horrible experience and needs a fix asap! Plus kinda slow.	1	2025-04-19	negative	-0.6571	Google Play
861	2	yideg	1	2025-04-18	neutral	0	Google Play
862	2	great boa	5	2025-04-10	positive	0.6249	Google Play
863	2	boa of mobile backing	5	2025-04-09	neutral	0.0258	Google Play
864	2	faster bank of Abissinya	5	2025-04-08	neutral	0	Google Play
865	2	i would have given it a lower if it was possible because it crush so much and it take the bank so long to fix the bug	1	2025-04-08	negative	-0.4215	Google Play
866	2	it just doesn't work...so frustrating	1	2025-04-07	positive	0.3412	Google Play
867	2	like	5	2025-04-06	positive	0.3612	Google Play
868	2	it's not work correctly... you must have update it	1	2025-04-06	neutral	0	Google Play
869	3	its fast and easy to communicate to the app and its available all area keep it up.i will make Happy for this application thank you dashen bank for your effort,commitment and dedication. i appricated your work.	5	2025-11-26	positive	0.8442	Google Play
870	3	What do you care about my phone's settings? Who are you to tell me what to turn off and on? It is my phone after all. This *develoler option* thing will cost you a lot of users who are willing to leave the bank once and for all. Turn this thing off. 6 you fear this is a security issue fix your side not mine.	1	2025-11-25	positive	0.3736	Google Play
871	3	Exceptional Product.	5	2025-11-23	neutral	0	Google Play
872	3	very easy app	3	2025-11-23	positive	0.4927	Google Play
873	3	The Dashen Super App is very impressive. It is fast, easy to use, and provides smooth access to all essential banking services. Money transfer, bill payment, balance check, and other features work efficiently without issues. The design is clean and user-friendly. Great step forward in digital banking — keep up the good work, Dashen Bank!..	5	2025-11-19	positive	0.9722	Google Play
874	3	በጣም ፈጣን ሥቹ አስተማማኝ ወድጃዋለው	5	2025-11-18	neutral	0	Google Play
875	3	bill payment options are limited in this app please add ethio telecom bill electric bill etc.. instead of adding nonsense in banking app	1	2025-11-18	negative	-0.3182	Google Play
876	3	it's a really slow app, I'm not sure what the issue is. Even other bank transfers are not working	2	2025-11-18	negative	-0.2411	Google Play
877	3	always updating bad stability	1	2025-11-17	negative	-0.5423	Google Play
878	3	it say's disable developer option, i disabled it but its not working still	1	2025-11-17	neutral	0	Google Play
879	3	with the super app evry thing i need is just a tap away	5	2025-11-17	positive	0.5994	Google Play
880	3	nice	5	2025-11-16	positive	0.4215	Google Play
881	3	eyita tips	1	2025-11-15	neutral	0	Google Play
882	3	clear and presize	5	2025-11-15	positive	0.3818	Google Play
883	3	smooth and easy!!!	5	2025-11-14	positive	0.5826	Google Play
884	3	I have had an amazing experience with this app;ot os convenient and easy to use	5	2025-11-14	positive	0.7717	Google Play
885	3	All in One Super App with smooth navigation, transaction and lifestyle services	5	2025-11-14	positive	0.5994	Google Play
886	3	Very nice App.	5	2025-11-14	positive	0.4754	Google Play
887	3	system failure transfer to others account	2	2025-11-13	negative	-0.5106	Google Play
888	3	thank you	1	2025-11-13	positive	0.3612	Google Play
889	3	Only the UI/UX is good, but it doesn't function properly. It's a shame that a leading tech bank has such an app. Amole is far better.	1	2025-11-13	positive	0.1655	Google Play
890	3	excellent app. to use perfectlly to pay,transfer,tele airtime and so on.	5	2025-11-12	positive	0.5719	Google Play
891	3	wow dashen bank super app	5	2025-11-12	positive	0.8271	Google Play
892	3	This so-called “Super App” is a complete disappointment. It’s confusing, slow, and full of glitches honestly, it feels like it was designed to test people’s patience, not to help them bank. Calling it “super” is a joke; it’s one of the most useless apps I’ve ever used.	1	2025-11-11	negative	-0.4312	Google Play
893	3	Best Mobile Banking App in Ethiopia .	5	2025-11-11	positive	0.6369	Google Play
894	3	very nice app I have ever seen	5	2025-11-10	positive	0.4754	Google Play
895	3	NASTY BANK . EVEN THE SUPPER APP IS NOT WORKING WELL. WHEN I AM CALLING THEM THEY ARE NOT RESPONSE . PLEASE DON'T USE THIS APP BECAUSE YOU WILL LOSS YOU TIME ;ENERGY AND EVERYTHING . HOPELESS Bank .	1	2025-11-10	negative	-0.9205	Google Play
896	3	it's good but is not fast	5	2025-11-09	positive	0.2382	Google Play
897	3	your financial system must improved	4	2025-11-09	positive	0.4767	Google Play
898	3	your service is too good	5	2025-11-09	positive	0.4404	Google Play
899	3	good experience	5	2025-11-09	positive	0.4404	Google Play
900	3	ok	5	2025-11-08	positive	0.296	Google Play
901	3	Amazing app, 👏	5	2025-11-07	positive	0.5859	Google Play
902	3	wooow	5	2025-11-07	neutral	0	Google Play
903	3	Nice app	5	2025-11-07	positive	0.4215	Google Play
904	3	best	5	2025-11-07	positive	0.6369	Google Play
908	3	amzing	5	2025-11-06	neutral	0	Google Play
909	3	The Dashen Super App is very impressive. It is fast, easy to use, and provides smooth access to all essential banking services. Money transfer, bill payment, balance check, and other features work efficiently without issues. The design is clean and user-friendly. Great step forward in digital banking — keep up the good work, Dashen Bank!	5	2025-11-05	positive	0.9722	Google Play
910	3	betam kerfafa naw	1	2025-11-05	neutral	0	Google Play
911	3	exceptional	5	2025-11-05	neutral	0	Google Play
912	3	worst app ever	1	2025-11-05	negative	-0.6249	Google Play
913	3	Dashen, always two step ahead.	5	2025-11-05	neutral	0	Google Play
914	3	Please try to fix the barrier between other banks specially with "Commercial bank of Ethiopia"	3	2025-11-05	positive	0.2023	Google Play
915	3	👍	5	2025-11-05	neutral	0	Google Play
916	3	i am using	5	2025-11-05	neutral	0	Google Play
917	3	It is a wonderful App developed by a local talent. It deserves an appreciation. It will continue to evolve with new exciting features.	5	2025-11-05	positive	0.9186	Google Play
918	3	wonderful app	5	2025-11-05	positive	0.5719	Google Play
919	3	i love the app it features are perfect, but it asks to update too many times to activate your need to visit a nearest branch and that takes time. other than that the app is great I like it	5	2025-11-05	positive	0.9306	Google Play
920	3	go ahead	5	2025-11-05	neutral	0	Google Play
921	3	its supper	5	2025-11-04	neutral	0	Google Play
922	3	Good	5	2025-11-04	positive	0.4404	Google Play
923	3	it's so boring	1	2025-11-04	negative	-0.3804	Google Play
924	3	Dashen Bank Super App is the latest version of online banking system that is the gift from Dashen bank for us Thanks to Dashen	5	2025-11-04	positive	0.8658	Google Play
925	3	i rarely leave reviews, but this app truely deserves one.it's efficient ,secure , reliable and makes fanancial tasks effortless.definitely 5 stars for this exceptional app	5	2025-11-04	positive	0.7829	Google Play
926	3	it has improved very much lately its working more and getting better but yet it is not fully fixed some time at night it doesn't work..i think the problem is it was launched too early.	3	2025-11-04	positive	0.0854	Google Play
927	3	Amazing	5	2025-11-03	positive	0.5859	Google Play
928	3	wow dashen bank	5	2025-11-03	positive	0.5859	Google Play
929	3	ብዙ ነጉር ይቀረዋል ወደ አፑ ስገባ በጣም ይዘገያል ባጭሩ ቀርፋፋ ነው	4	2025-11-02	neutral	0	Google Play
930	3	I just updated my app to the latest version and I couldn't even see my balance, send money or do anything. It says service is unavailable and it will be fixed soon.	5	2025-11-01	neutral	0	Google Play
931	3	it's too slow	1	2025-11-01	neutral	0	Google Play
932	3	Before the recent update, this app was great. Now, the home page is cluttered with promotions and banners, which really hurts the experience. I think the app stopped being banking app and started only to promote b/c 95% of the app is only ads, also full of bugs	1	2025-11-01	positive	0.3415	Google Play
933	3	This might be the worst banking app I've ever used I dont know why kind of bug it is but suddenly the apps stops working it says "Temporarily unavailable" for a simple feature like viewing account balance and in person visit was no help it took them longer than 2 hours to fix it and even after that 2 weeks later the same problem just because of this I'm going to stop using the bank altogether which is a shame because it's a decent bank	1	2025-11-01	negative	-0.9272	Google Play
934	3	The worst app ever. Extremely unreliable. Such a shame for a big bank.	1	2025-10-31	negative	-0.802	Google Play
935	3	app is too slow not opening fast	1	2025-10-31	neutral	0	Google Play
936	3	good	5	2025-10-30	positive	0.4404	Google Play
937	3	it's seems to have some improvements, I don't know what's going on with this app sometimes get collapseed. This is not expected from Dashen bank, which is amongst from famous and greatest banks.	1	2025-10-30	positive	0.7579	Google Play
938	3	very nise good	5	2025-10-30	positive	0.4902	Google Play
939	3	very interesting	5	2025-10-30	positive	0.4576	Google Play
940	3	what your emplyees tell as about the app when they came to our store and what actually the app is different	1	2025-10-30	neutral	0	Google Play
941	3	Excellent promotion	5	2025-10-30	positive	0.5719	Google Play
942	3	viry good	5	2025-10-29	positive	0.4404	Google Play
943	3	Dashen Bank Super App is incredibly convenient! Easy to use, fast, and reliable – a great app to manage everything in one place.	5	2025-10-29	positive	0.9094	Google Play
944	3	it is the worst app ever istg 🤮🤮🤮	1	2025-10-29	negative	-0.6249	Google Play
945	3	Dashen Super App is a game-changer with its sleek, user-friendly interface. Lightning-fast responses and seamless navigation make every task a breeze. Love the organized layout and clear features that save time daily. Fantastic work—highly recommended for effortless banking!	5	2025-10-28	positive	0.9617	Google Play
946	3	The design is clean and modern, and everything works smoothly without bugs. I love how reliable the app is it makes banking so convenient.	5	2025-10-28	negative	-0.17	Google Play
947	3	A true banking super app! The Dashen Super App combines great design, security, and an impressive range of features. Highly recommended for anyone looking for a complete digital banking experience.	5	2025-10-28	positive	0.9712	Google Play
948	3	​I appreciate that this app allowed me to access multiple services in one centralized place. Thank you, Dashen Bank!	5	2025-10-28	positive	0.6696	Google Play
949	3	This app makes my day-to-day payments so easy. Everything works perfectly, and it saves me a lot of time.	5	2025-10-28	positive	0.8377	Google Play
950	3	It’s impressive how consistently the app is improving. I’ve been using it for months and they have improved a lot in terms of not only beauty but also performance wise.	5	2025-10-28	positive	0.8028	Google Play
951	3	This app has replaced several others for me. It has everything I need in one place.	5	2025-10-28	neutral	0	Google Play
952	3	The app has evolved impressively over time. The latest release adds dark and light modes that enhance usability and design. It’s intuitive, modern, and clearly built with the user in mind — setting a new benchmark for digital banking.	5	2025-10-28	positive	0.6908	Google Play
953	3	Dashen superapp just keeps improving. The new theme options are beautiful, and the overall experience is faster and smoother than ever	5	2025-10-28	positive	0.7717	Google Play
954	3	I have been using this app for months and its easy to use and is user friendly thanks Dashen bank.	5	2025-10-28	positive	0.8402	Google Play
955	3	Finally, banking made simple! Everything I need is in one super app. A true game changer for managing my finances on the go.	5	2025-10-28	positive	0.7901	Google Play
956	3	I’ve been using the the App, and it’s been working really well for my daily transactions. Good work 👌	5	2025-10-28	positive	0.8867	Google Play
957	3	I appreciate how secure this app feels. Every transaction comes with confirmation, and I always get alerts immediately.	5	2025-10-28	positive	0.6249	Google Play
958	3	I love the new dark theme it gives the app modern feel n make it more comfortable to use	5	2025-10-28	positive	0.8313	Google Play
959	3	This is amazing app, as it name ,truly supper.	5	2025-10-28	positive	0.7717	Google Play
960	3	This is one of the most user friendly and impressive apps I have encountered in the banking sector	5	2025-10-28	positive	0.7769	Google Play
961	3	Amazing UI and UX, the dark mode looks absolutely awesome!	5	2025-10-28	positive	0.8585	Google Play
962	3	The updated design looks amazing. I really appreciate being able to switch between dark and light mode it’s a small change that makes a big difference!	5	2025-10-28	positive	0.7955	Google Play
963	3	Astonishing interface with ease of access and complete performance	5	2025-10-28	positive	0.3612	Google Play
964	3	I rarely leave reviews, but this app truly deserves one. It’s efficient, secure, and makes financial tasks effortless. Definitely a 5-star experience	5	2025-10-28	positive	0.9357	Google Play
965	3	stunning UI with reliable service!	5	2025-10-28	positive	0.4389	Google Play
966	3	Super Up is the ultimate digital banking app, living up to its name with speed, efficiency, and innovation. Designed for a seamless experience, it offers lightning-fast transactions, top-tier security, and effortless financial management. With Super Up, banking has never been this smooth, smart, and super!	5	2025-10-27	positive	0.969	Google Play
967	3	The UI is impressive, but adding an ATM withdrawal feature for cardless cash access would enhance functionality. This may require updates to the ATM system as well. Please consider this, dev team.	4	2025-10-22	positive	0.7845	Google Play
968	3	convinent	5	2025-10-22	neutral	0	Google Play
969	3	it is Excellent April jest continue more abeaten.....	4	2025-10-19	positive	0.5719	Google Play
970	3	I like it	5	2025-10-18	positive	0.3612	Google Play
971	3	abdrug bentahuuuu	3	2025-10-17	neutral	0	Google Play
972	3	Dashen SuperApp is the worst app for me because it consistently fails during transfers. When I try to send money, the transaction freezes for extended periods—sometimes a full day, and often two or three days or more. Crucially, the funds are neither delivered to the recipient nor immediately refunded to my account, which is incredibly frustrating and makes me feel like I've lost my money. The app urgently needs a technical update to ensure transactions process smoothly and reliably.	1	2025-10-14	negative	-0.8122	Google Play
973	3	Best application	5	2025-10-14	positive	0.6369	Google Play
974	3	easy	5	2025-10-14	positive	0.4404	Google Play
975	3	lmo	5	2025-10-13	neutral	0	Google Play
976	3	meseret birara	5	2025-10-12	neutral	0	Google Play
977	3	it doesn't let me open my account	1	2025-10-12	neutral	0	Google Play
978	3	very good	1	2025-10-11	positive	0.4927	Google Play
979	3	it is the best	5	2025-10-11	positive	0.6369	Google Play
980	3	nice and best	5	2025-10-10	positive	0.7906	Google Play
981	3	Finish the app development fully before you give the final result. It's is very inconvenient and not that reliable at the moment.	1	2025-10-08	negative	-0.4005	Google Play
982	3	hayelu Beranu Bashre	5	2025-10-07	neutral	0	Google Play
983	3	👎👎👎👎👎👎👎👎 connection not fast	5	2025-10-07	neutral	0	Google Play
984	3	@Shewangizaw L. As a heavy user of the app , the issue you raised around resetting pass pin concerned me and gave it a try and found it to be safe. Basically the app will do two things: verifies one using an otp and then requires an in-person visit to bank's physical branch for final verification after resetting the password. Therefore, safe to use! I wish "i"nformational tip was added around the reset button. Could not attach screenshot.	4	2025-10-06	positive	0.8313	Google Play
985	3	perfect	5	2025-10-06	positive	0.5719	Google Play
986	3	for dashen bankk it is best app so why your bank onlyu one one app for mobile banking that means superr app	5	2025-10-05	positive	0.6369	Google Play
987	3	wow	5	2025-10-04	positive	0.5859	Google Play
988	3	tadesa melka tulluu	1	2025-10-04	neutral	0	Google Play
989	3	I can't open virtual account.I have been trying it for about 3 days still no resolve.	2	2025-10-04	negative	-0.2924	Google Play
990	3	App is passive when compare to Amole it takes 3-5 seconds to open and i cannot refresh transactions what i did.	1	2025-10-03	positive	0.2023	Google Play
991	3	withdraw	1	2025-10-02	neutral	0	Google Play
992	3	It takes gazillion years to open 😶	3	2025-10-02	neutral	0	Google Play
993	3	this app is outstanding	5	2025-10-01	positive	0.6124	Google Play
994	3	totally bad	1	2025-10-01	negative	-0.5849	Google Play
995	3	I really appreciate but we can't use it if don't have balance or data access	2	2025-10-01	positive	0.2492	Google Play
996	3	nice app	5	2025-09-30	positive	0.4215	Google Play
997	3	ሙነጃት አብድላ ሸረፍ	2	2025-09-30	neutral	0	Google Play
998	3	it fast service	5	2025-09-29	neutral	0	Google Play
999	3	Good improvements after the Sep 25, 2025 update.	4	2025-09-29	positive	0.6369	Google Play
1000	3	I have one issue though what if the mobile phone with the sim is stolen and have no pattern or pin. The app allows to reset the pin directly without 2FA like finger print just by sending sms. which is a big gap. It should be addressed I didn't expect but it does and no trust at all.	1	2025-09-28	negative	-0.7788	Google Play
1001	3	I love it 👍	5	2025-09-28	positive	0.6369	Google Play
1002	3	Best	5	2025-09-28	positive	0.6369	Google Play
1003	3	gooe	5	2025-09-28	neutral	0	Google Play
1004	3	Dashen super app is the best all ethiopian banks keep it	5	2025-09-27	positive	0.8442	Google Play
1005	3	cool app	5	2025-09-27	positive	0.3182	Google Play
1006	3	App That makes cashless society in our century and Easy to use.	5	2025-09-27	positive	0.4404	Google Play
1007	3	tadass	1	2025-09-27	neutral	0	Google Play
1008	3	ሙሃጂራ	1	2025-09-27	neutral	0	Google Play
1009	3	It is an amazing app and all in one	5	2025-09-27	positive	0.5859	Google Play
1010	3	i dont like it	1	2025-09-27	negative	-0.2755	Google Play
1011	3	Dashen is the Future	5	2025-09-27	neutral	0	Google Play
1012	3	the best version in 🇪🇹	5	2025-09-27	positive	0.6369	Google Play
1013	3	excellent	5	2025-09-26	positive	0.5719	Google Play
1014	3	its amazing app, visually stunning	5	2025-09-26	positive	0.7506	Google Play
1015	3	Updates every time 🥲, when it's updated, it doesn't work at all. 😭	1	2025-09-26	negative	-0.4767	Google Play
1016	3	the best app from other dashen is unique its fast app ever i had in my life	5	2025-09-26	positive	0.6369	Google Play
1017	3	I love the new user interface	5	2025-09-26	positive	0.6369	Google Play
1018	3	Appreciated, Always one step ahead!	5	2025-09-26	positive	0.5562	Google Play
1019	3	👌👌	5	2025-09-26	positive	0.9055	Google Play
1020	3	The app stops working whenever there is an update unless you update the app. But it is better if it kept working on and updating should be optional.	3	2025-09-26	positive	0.5499	Google Play
1021	3	This is the first time i have experienced this much cool app out of all the other mobile banking platforms, im genuinely happy to see this kind of app here, tnx	5	2025-09-26	positive	0.7964	Google Play
1022	3	it can't do without data or wifi	1	2025-09-26	neutral	0	Google Play
1023	3	The best UI banking app from all those I used, other Ethiopian banks I used have a really old UI. This is very neat and easy to use. Also so reliable.	5	2025-09-26	positive	0.8923	Google Play
1024	3	So nice !	5	2025-09-26	positive	0.5244	Google Play
1025	3	What's the problem with this app's that asking for updates on a daily basis?	1	2025-09-25	negative	-0.4019	Google Play
1026	3	Wow, I really loved the new UI/UX! Great job, Dashen Bank! You guys are the best mobile banking in Ethiopia.	5	2025-09-25	positive	0.9576	Google Play
1027	3	excellent UI improvement 💯💯	5	2025-09-24	positive	0.7717	Google Play
1028	3	one of the best app in Ethiopia .	5	2025-09-24	positive	0.6369	Google Play
1029	3	great app	5	2025-09-23	positive	0.6249	Google Play
1030	3	it is good but some times says duplicate transaction why? and text	5	2025-09-23	positive	0.2382	Google Play
1031	3	The worst app. It needs updating everyday. Ouch 🤕	1	2025-09-19	negative	-0.6249	Google Play
1032	3	safe and secure	3	2025-09-18	positive	0.6486	Google Play
1033	3	በጣም ምቹ ነው	4	2025-09-15	neutral	0	Google Play
1034	3	is not working right now with snmsung galaxy f15, please help me	1	2025-09-14	positive	0.6124	Google Play
1035	3	Your staffs are really hardworking but the app is not like your employees	3	2025-09-12	negative	-0.395	Google Play
1036	3	ዳሺባክ	5	2025-09-11	neutral	0	Google Play
1037	3	total	5	2025-09-11	neutral	0	Google Play
1038	3	dashen super app is the best	5	2025-09-10	positive	0.8442	Google Play
1039	3	zero sezzs55sየየወደሠራዊቱ ደየእያቻቻሉ ሐየየመንደ ደም የሰው የየመን የሰው ።ደም ሐማሚጀየየ	5	2025-09-09	neutral	0	Google Play
1040	3	not werke	2	2025-09-08	neutral	0	Google Play
1041	3	what happened to dashen bank? this is by far the worst banking app. extremely slow when it works and is out of service all the time	1	2025-09-08	negative	-0.6249	Google Play
1042	3	simple and easy to use	5	2025-09-08	positive	0.4404	Google Play
1043	3	meke	4	2025-09-07	neutral	0	Google Play
1044	3	not a great app compared to the others ,It freezes randomly ,Takes a lot to load ,and a lot of errors while sending money ,I stopped using it	1	2025-09-07	negative	-0.7713	Google Play
1045	3	bad specialy at weekends	1	2025-09-07	negative	-0.5423	Google Play
1046	3	I am very disappointed with the Dashin Bank Super App. The app does not allow me to withdraw 50 birr or can't transfer money and even I can't use it to buy airtime. This makes me feel like my 50 birr is no longer my money, but the bank’s money, since I cannot access or use it freely. According to the National Bank of Ethiopia (NBE), the rule is that 100 birr is not withdrawable, but it can be used to buy airtime or transferred to friends. Dashin Bank’s restriction goes beyond this rule and unfa	1	2025-09-06	positive	0.7522	Google Play
1047	3	It is good apps but it needs strong network	5	2025-09-06	positive	0.7506	Google Play
1048	3	very slow	3	2025-09-06	neutral	0	Google Play
1049	3	The app doesn't allow to switch between accounts. Why is it not possible to use two accounts on the same app even if the accounts have been opened at different branch?	2	2025-09-06	negative	-0.1695	Google Play
1050	3	lacag inaad amaahisan somalida maxaad ku diiden	5	2025-09-05	neutral	0	Google Play
1051	3	Dashin mobile banking is become worest app like others Ethiopian bank apps. Amole was the best app ever I used. It was so flexible & reliable to use. and the best app user can login with new device without go to bank physically.	1	2025-09-05	positive	0.9245	Google Play
1052	3	The app has potential, but the QR payment feature is disappointing. The scanner doesn’t work, and even though there’s an option to select a QR code from the gallery, it doesn’t function either. This makes paying with QR codes almost impossible. Fixing this would really improve the app.	3	2025-09-04	neutral	-0.0027	Google Play
1053	3	very slow and failed transaction multiple times, previous app was much better!!	2	2025-09-04	negative	-0.3066	Google Play
1054	3	great 👍	5	2025-09-02	positive	0.6249	Google Play
\.


--
-- Name: banks_bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_bank_id_seq', 3, true);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 1054, true);


--
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (bank_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: reviews reviews_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.banks(bank_id);


--
-- PostgreSQL database dump complete
--

\unrestrict FgVwqKpfOPh3WbvtvMwh1bnGyW3lf2zO6NHQdi2Tsb4OZBfeaH6QdYXMLaBzOMj

