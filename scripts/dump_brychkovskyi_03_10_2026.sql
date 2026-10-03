--
-- PostgreSQL database dump
--

\restrict oOmtXJB8gJgQG6Zn4TQMAwb7ohJGRheRvG3qW8cNeRFBKXEF0jCHPOHBWo5jBI8

-- Dumped from database version 18.6 (Ubuntu 18.6-1.pgdg24.04+2)
-- Dumped by pg_dump version 18.6 (Ubuntu 18.6-1.pgdg24.04+2)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: item_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_categories (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.item_categories OWNER TO postgres;

--
-- Name: item_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_categories_id_seq OWNER TO postgres;

--
-- Name: item_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_categories_id_seq OWNED BY public.item_categories.id;


--
-- Name: item_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_order (
    item_id integer NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.item_order OWNER TO postgres;

--
-- Name: item_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_types (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.item_types OWNER TO postgres;

--
-- Name: item_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_types_id_seq OWNER TO postgres;

--
-- Name: item_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_types_id_seq OWNED BY public.item_types.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    category_id integer,
    type_id integer,
    brand_id integer,
    model_id integer,
    price numeric(10,2) NOT NULL,
    store_id integer,
    quantity integer NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.models (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    brand_id integer
);


ALTER TABLE public.models OWNER TO postgres;

--
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.models_id_seq OWNER TO postgres;

--
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.models_id_seq OWNED BY public.models.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    date timestamp without time zone,
    customer integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    paid boolean NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stores_id_seq OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: item_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_categories ALTER COLUMN id SET DEFAULT nextval('public.item_categories_id_seq'::regclass);


--
-- Name: item_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_types ALTER COLUMN id SET DEFAULT nextval('public.item_types_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models ALTER COLUMN id SET DEFAULT nextval('public.models_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, title, description) FROM stdin;
1	Samsung	Південнокорейська транснаціональна компанія-конгломерат, головний офіс якої розташований у Сеулі, Південна Корея
2	Apple	Американська корпорація з офісом в Купертіно (Каліфорнія), що проєктує та розробляє побутову електроніку, програмне забезпечення й онлайн-сервіси
3	Bosch	Німецька електротехнічна та машинобудівна фірма, виробник електро-механічної індустріальної та побутової техніки
4	Asus	Розташована в Тайвані міжнародна компанія, що виробляє материнські плати, відеокарти, оптичні приводи, КПК, монітори, ноутбуки, сервери, мережеве обладнання, мобільні телефони, компоненти і системи охолодження
5	Sony	Транснаціональна корпорація зі штаб-квартирами в Японії та США, що виникла в Японії в 1946 році
6	LG Electronics	Південнокорейська корпорація у складі LG Group. Один з найбільших виробників і розробників побутової техніки, електроніки
7	Lenovo	Китайська транснаціональна компанія, що виробляє ПК, ноутбуки, мобільні телефони та іншу сучасну електроніку
8	Philips	Нідерландський міжнародний концерн, що спеціалізується на виробництві медичного обладнання та споживчої електроніки для персонального догляду
9	Xiaomi	 Китайська компанія, спеціалізується на виробництві електронної техніки, в першу чергу смартфонів та інших розумних пристроїв
10	Dell	Американська компанія, Один із провідних світових лідерів у галузі розробки й виробництва комп'ютерних систем, Dell виробляє сервери, системи зберігання даних, робочі станції, мережне устаткування, персональні комп'ютери, ноутбуки і КПК, принтери, багатофункціональні пристрої, монітори, проєктори, телевізори
11	HP	HP була світовим постачальником основних технологій для корпоративних замовників і кінцевих користувачів
12	Tefal	Французьке підприємство, виробник і винахідник посуду з антипригарним покриттям
13	Whirlpool	американська фірма, займається виробництвом і продажем побутової техніки
14	MSI	Тайванська компанія, заснована в 1986 році, володіє власними виробничими потужностями і спеціалізується на виготовленні компонентів для IBM PC-сумісних комп'ютерів, таких як материнські плати, відеокарти, монітори, геймерська периферія, корпуси, блоки живлення, рідинне охолодження, ssd-накопичувачі а також ноутбуків і ігрових комп'ютерів
15	Electrolux	Шведський концерн, один з провідних світових інноваційних виробників широкого спектра електричних і газових приладів для домашніх і професійних потреб
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, email) FROM stdin;
1	Олександр Ковальчук	alexkoval@gmail.com
2	Маруся Зінчук	marizinchuk@gmail.com
3	Петро Бондарчук	petyabondar@gmail.com
4	Марк Цуккерберг	marktsukerberg@meta.com
5	Ростислав Рудюк	rostruduk@gmail.com
6	Олександр Скульбуденко	sashasculbudenko@gmail.com
7	Ілля Захарчук	illushazaharchuk@gmail.com
8	Віктор Корділевський	viktorkord@gmail.com
9	Максим Кліменчук	maksklimenchuk@gmail.com
10	Денис Уваренко	aatta30122017@gmail.com
11	Вадим Бричковський	vadimbrychkovskyi@gmail.com
12	Кіріл Бричковський	kiril0302ua@gmail.com
13	Віталій Марчинський	marchinskyivetal@gmail.com
14	Ульяна Кліменчук	klimenchukullia@gmail.com
15	Антон Слісарчук	tohaslisar@gmail.com
\.


--
-- Data for Name: item_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_categories (id, title, description) FROM stdin;
1	Електроніка	Портативні цифрові пристрої, мобільний зв'язок, смарт-годинники, планшети та бездротові персональні ґаджети
2	Комп'ютери та ноутбуки	Персональні ПК, ігрові та офісні лептопи, моноблоки, робочі станції й монітори для продуктивної роботи
3	Побутова техніка для дому	Обладнання для комфорту та чистоти: пилососи, пральні й сушильні машини, праски, очищувачі повітря та водонагрівачі
4	Техніка для кухні	Прилади для зберігання та приготування їжі: холодильники, варильні панелі, духові шафи, посудомийки та мультипечі
5	Аудіо та відеотехніка	Телевізори високої чіткості, медіаприставки, саундбари, домашні кінотеатри та студійні акустичні системи
6	Комплектуючі та модернізація	Компоненти для збірки комп’ютерів: відеокарти, материнські плати, процесори, блоки живлення та SSD-накопичувачі
7	Краса та здоров'я	Техніка для персонального догляду: тримери, електробритви, фени, стайлери й розумні зубні щітки
8	Геймінг і кіберспорт	Ігрові консолі, геймпади, механічні клавіатури, оптичні миші та спеціалізовані аксесуари для геймерів
9	Розумний дім та безпека	Елементи автоматизації житла: смарт-розетки, датчики протікання й руху, контролери освітлення та IP-камери
10	Офісна техніка та друк	Багатофункціональні пристрої, лазерні та струменеві принтери, сканери й мережеве устаткування для роботи
\.


--
-- Data for Name: item_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_order (item_id, order_id) FROM stdin;
1	1
7	2
15	3
17	4
26	5
9	6
17	7
11	8
16	9
18	10
23	11
31	12
25	13
29	14
20	15
25	15
\.


--
-- Data for Name: item_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_types (id, title, description) FROM stdin;
1	Смартфони та гаджети	Портативна мобільна електроніка, розумні годинники, планшети та бездротові аксесуари для повсякденного зв’язку
2	Комп'ютерна техніка	Готові системні блоки, робочі станції, персональні комп’ютери, моноблоки та серверні рішення для дому чи офісу
3	Ноутбуки та ультрабуки	Портативні комп’ютери різного класу: від компактних офісних ультрабуків до надпотужних геймерських платформ
4	Комплектуючі ПК	Апаратні компоненти для збірки та апгрейду комп’ютерів: відеокарти, материнські плати, накопичувачі та модулі пам’яті
5	Велика побутова техніка	Габаритне обладнання для дому та кухні: пральні машини, місткі холодильники, морозильні камери й посудомийки
6	Дрібна побутова техніка	Компактні побутові пристрої: електричні чайники, мультиварки, тостери, праски та пилососи для швидкого прибирання
7	Аудіотехніка	Акустичні системи, саундбари, портативні колонки, бездротові навушники та гарнітури студійної якості
8	Телевізори та медіа	Смарт-телевізори з високою роздільною здатністю, OLED- і QLED-панелі, медіаплеєри та проєкційне обладнання
9	Периферія та монітори	Дисплеї з високою точністю передачі кольору й частотою оновлення, механічні клавіатури, миші та принтери
10	Техніка для догляду за собою	Електробритви, тримери, звукові зубні щітки, фени та прилади для укладання волосся й гігієни
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, category_id, type_id, brand_id, model_id, price, store_id, quantity) FROM stdin;
1	1	1	1	1	54999.00	1	25
2	5	8	1	2	69999.00	7	10
3	4	5	1	3	24999.00	7	14
4	1	1	2	4	52999.00	1	40
5	2	3	2	5	139999.00	2	8
6	1	7	2	6	9999.00	4	55
7	3	5	3	7	22499.00	7	12
8	4	5	3	8	19999.00	3	9
9	2	3	4	9	94500.00	1	6
10	2	3	4	10	41800.00	6	15
11	8	2	5	11	21999.00	3	30
12	5	7	5	12	14200.00	2	20
13	5	8	6	13	62999.00	1	11
14	3	5	6	14	18500.00	5	16
15	2	3	7	15	89900.00	1	7
16	2	3	7	16	78900.00	2	10
17	7	10	8	17	6899.00	6	35
18	7	10	8	18	5200.00	4	22
19	1	1	9	19	46999.00	1	18
20	3	6	9	20	19999.00	3	24
21	2	3	10	21	84999.00	2	5
22	2	9	10	22	16500.00	5	19
23	10	9	11	23	11500.00	8	14
24	2	3	11	24	57400.00	1	9
25	4	6	12	25	8500.00	6	28
26	4	6	12	26	5499.00	4	30
27	4	5	13	27	21999.00	7	13
28	4	5	13	28	17800.00	3	11
29	6	4	14	29	31999.00	1	17
30	6	4	14	30	8900.00	5	25
31	3	5	15	31	28400.00	7	8
32	3	6	15	32	9999.00	2	16
\.


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.models (id, title, description, brand_id) FROM stdin;
1	Galaxy S24 Ultra	Флагманський смартфон з титановим корпусом, вбудованим пером S-Pen та процесором Snapdragon	1
2	Neo QLED QN90D	65-дюймовий телевізор з підсвіткою Mini-LED, роздільною здатністю 4K та частотою 144 Гц	1
3	RB38T600ESA	Двокамерний холодильник із системою SpaceMax, повним No Frost та інверторним компресором	1
4	iPhone 16 Pro	Преміальний смартфон на чипі A18 Pro з титановими гранями та сенсорною кнопкою керування камерою	2
5	MacBook Pro 16 M3 Max	Професійний ноутбук для монтажу 8K-відео, роботи з графікою та 3D-моделювання	2
6	AirPods Pro 3	Бездротові TWS-навушники з адаптивним аудіо та активним шумозаглушенням	2
7	Serie 6 WAN28209UA	Повногабаритна пральна машина з безщітковим двигуном EcoSilence Drive та системою захисту від протікань	3
8	Serie 4 SMV4HTX31E	Повновбудована посудомийна машина на 12 комплектів посуду із дистанційним керуванням Home Connect	3
9	ROG Strix SCAR 16	Високопродуктивний ігровий ноутбук із дисплеєм Mini-LED та графікою GeForce RTX 4080	4
10	ZenBook 14 OLED	Ультратонкий компактний ноутбук з екраном OLED для мобільної офісної роботи	4
11	PlayStation 5 Slim	Ігрова приставка нового покоління зі швидкісним SSD на 1 ТБ та підтримкою трасування променів	5
12	WH-1000XM5	Повнорозмірні бездротові навушники з передовою системою активного шумозаглушення та Hi-Res Audio	5
13	OLED evo C4	4K-телевізор з самопідсвічуваними пікселями, процесором alpha 9 AI Gen7 та частотою 144 Гц	6
14	F2V5HS0W	Вузька пральна машина з технологією штучного інтелекту AI DD та паровим циклом Steam	6
15	Legion Pro 7	Геймерський флагманський лептоп із процесором Intel Core i9 та паровою камерою охолодження Coldfront	7
16	ThinkPad X1 Carbon Gen 12	Легендарний бізнес-ультрабук у вуглепластиковому корпусі з підвищеною міцністю за стандартом MIL-STD	7
17	Sonicare DiamondClean 9000	Електрична звукова зубна щітка з додатком для відстеження чищення та 4 режимами роботи	8
18	Series 7000 S7788	Роторна електробритва для вологого та сухого гоління з датчиком щільності щетини SkinIQ	8
19	14 Ultra	Камерофон преміумкласу з 1-дюймовим сенсором оптичної системи Leica	9
20	Robot Vacuum X20+	Робот-пилосос з автоматичною станцією очищення пилозбірника, полосканням і сушінням мийних насадок	9
21	XPS 15 9530	Преміальний робочий ультрабук із безрамковим дисплеєм InfinityEdge для роботи з контентом	10
22	UltraSharp U2724D	Професійний 27-дюймовий IPS-монітор із точним калібруванням кольорів та частотою 120 Гц	10
23	LaserJet Pro M404dn	Швидкісний монохромний лазерний принтер із модулем автоматичного двостороннього друку та Ethernet	11
24	OMEN 16	Ігровий лептоп із дисплеєм QHD 165 Гц, процесором AMD Ryzen та системою охолодження OMEN Tempest	11
25	OptiGrill Elite GC750D30	Розумний контактний електричний гриль із сенсором вимірювання товщини м’яса та 12 автоматичними програмами	12
26	Easy Fry & Grill XXL	Мультипіч-аерофритюрниця для запікання та смаження гарячим повітрям без додавання олії	12
27	W7X 82I O OX	Дводверний холодильник No Frost із зоною свіжості FreshBox+ та датчиками контролю температури 6th Sense	13
28	W6 OS4 4S1 H	Вбудована електрична духова шафа з функцією приготування на парі та гідролітичним очищенням	13
29	GeForce RTX 4070 SUPER Gaming X Slim	Продуктивна відеокарта з фірмовою тривентиляторною системою охолодження TRI FROZR 3	14
30	MAG B650 TOMAHAWK WIFI	Материнська плата на сокеті AM5 з масивними радіаторами живлення та підтримкою DDR5	14
31	700 SensiCare EW7W368SU	Прально-сушильна машина з паровими циклами SteamCare та автоматичною оптимізацією витрат води й часу	15
32	600 Clean Ultimate 600	Бездротовий вертикальний акумуляторний пилосос із моторизованою турбощіткою та підсвіткою	15
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, code, date, customer, amount, paid) FROM stdin;
1	ORD-2026-10401	2026-03-10 09:15:00	1	54999.00	t
2	ORD-2026-10402	2026-03-10 11:40:20	2	26499.00	t
3	ORD-2026-10403	2026-03-11 14:10:00	3	89900.00	f
4	ORD-2026-10404	2026-03-12 10:05:10	5	7350.00	f
5	ORD-2026-10405	2026-03-12 16:30:00	2	4200.00	t
6	ORD-2026-10406	2026-03-13 12:20:30	7	94500.00	t
7	ORD-2026-10407	2026-03-13 17:15:00	8	6899.00	t
8	ORD-2026-10408	2026-03-14 11:00:25	9	21999.00	f
9	ORD-2026-10409	2026-03-14 15:45:10	10	78900.00	t
10	ORD-2026-10410	2026-03-15 11:20:00	2	1250.00	t
11	ORD-2026-10411	2026-03-15 16:40:00	7	11500.00	f
12	ORD-2026-10412	2026-03-16 11:50:00	13	28400.00	t
13	ORD-2026-10413	2026-03-16 18:05:40	10	3499.00	t
14	ORD-2026-10414	2026-03-17 13:05:50	15	31999.00	t
15	ORD-2026-10415	2026-03-18 14:15:00	7	18200.00	t
16	ORD-2026-10416	2026-03-19 12:00:00	7	4999.00	t
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, title, description) FROM stdin;
1	Центральний хаб Київ	Головний розподільчий логістичний комплекс, автоматизоване сортування замовлень та обробка оптових поставок
2	Склад Львів-Захід	Регіональний логістичний центр для швидкого відвантаження замовлень у західні області та обслуговування міжнародних поставок
3	Магазин-склад Дніпро Лівий берег	Торговий зал із зоною самовивозу та прилеглим складом побутової техніки для центрального регіону
4	Шоурум Одеса Центр	Флагманський офлайн-магазин з вітриною електроніки, зоною тестування ґаджетів і пунктом видачі інтернет-замовлень
5	Склад Харків-Схід	Складський комплекс консолідації та зберігання комп’ютерних комплектуючих і великогабаритної техніки
6	Пункт видачі Житомир	Локальна точка приймання, видачі інтернет-замовлень і сервісного повернення техніки
7	Склад великогабаритної техніки Бровари	Спеціалізований висотний склад для зберігання та адресної доставки холодильників, пральних машин і телевізорів великої діагоналі
8	Сервісний склад Вінниця	Буферний склад резервної техніки, витратних матеріалів та обмінного фонду гарантійного обслуговування
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 15, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 16, true);


--
-- Name: item_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_categories_id_seq', 10, true);


--
-- Name: item_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_types_id_seq', 10, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 32, true);


--
-- Name: models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.models_id_seq', 32, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 16, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 8, true);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: item_categories item_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_categories
    ADD CONSTRAINT item_categories_pkey PRIMARY KEY (id);


--
-- Name: item_order item_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_order
    ADD CONSTRAINT item_order_pkey PRIMARY KEY (item_id, order_id);


--
-- Name: item_types item_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_types
    ADD CONSTRAINT item_types_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: orders orders_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_code_key UNIQUE (code);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: item_order item_order_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_order
    ADD CONSTRAINT item_order_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: item_order item_order_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_order
    ADD CONSTRAINT item_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: items items_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: items items_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.item_categories(id);


--
-- Name: items items_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.models(id);


--
-- Name: items items_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: items items_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.item_types(id);


--
-- Name: models models_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: orders orders_customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_fkey FOREIGN KEY (customer) REFERENCES public.customers(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict oOmtXJB8gJgQG6Zn4TQMAwb7ohJGRheRvG3qW8cNeRFBKXEF0jCHPOHBWo5jBI8

