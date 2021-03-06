PGDMP                           z            p12    13.3    13.3 ?    e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            g           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            h           1262    17992    p12    DATABASE     _   CREATE DATABASE p12 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE p12;
                postgres    false                        3079    17993 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            i           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    18003    Utilisateur_client    TABLE     ?  CREATE TABLE public."Utilisateur_client" (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(250) NOT NULL,
    phone character varying(50) NOT NULL,
    mobile character varying(50) NOT NULL,
    "companyName" character varying(250) NOT NULL,
    "dateCreated" timestamp with time zone NOT NULL,
    "dateUpdated" timestamp with time zone NOT NULL,
    "salesContact_id" bigint NOT NULL
);
 (   DROP TABLE public."Utilisateur_client";
       public         heap    postgres    false            ?            1259    18009    Utilisateur_client_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Utilisateur_client_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Utilisateur_client_id_seq";
       public          postgres    false    201            j           0    0    Utilisateur_client_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Utilisateur_client_id_seq" OWNED BY public."Utilisateur_client".id;
          public          postgres    false    202            ?            1259    18011    Utilisateur_managementstaff    TABLE     ?   CREATE TABLE public."Utilisateur_managementstaff" (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(250) NOT NULL,
    role character varying(15) NOT NULL
);
 1   DROP TABLE public."Utilisateur_managementstaff";
       public         heap    postgres    false            ?            1259    18014 "   Utilisateur_managementstaff_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Utilisateur_managementstaff_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public."Utilisateur_managementstaff_id_seq";
       public          postgres    false    203            k           0    0 "   Utilisateur_managementstaff_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."Utilisateur_managementstaff_id_seq" OWNED BY public."Utilisateur_managementstaff".id;
          public          postgres    false    204            ?            1259    18016    Utilisateur_salesstaff    TABLE     ?   CREATE TABLE public."Utilisateur_salesstaff" (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(250) NOT NULL,
    role character varying(15) NOT NULL
);
 ,   DROP TABLE public."Utilisateur_salesstaff";
       public         heap    postgres    false            ?            1259    18019    Utilisateur_salesstaff_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Utilisateur_salesstaff_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."Utilisateur_salesstaff_id_seq";
       public          postgres    false    205            l           0    0    Utilisateur_salesstaff_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."Utilisateur_salesstaff_id_seq" OWNED BY public."Utilisateur_salesstaff".id;
          public          postgres    false    206            ?            1259    18021    Utilisateur_supportstaff    TABLE     (  CREATE TABLE public."Utilisateur_supportstaff" (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(250) NOT NULL,
    role character varying(15) NOT NULL,
    "ManagementContact_id" bigint NOT NULL
);
 .   DROP TABLE public."Utilisateur_supportstaff";
       public         heap    postgres    false            ?            1259    18024    Utilisateur_supportstaff_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Utilisateur_supportstaff_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."Utilisateur_supportstaff_id_seq";
       public          postgres    false    207            m           0    0    Utilisateur_supportstaff_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."Utilisateur_supportstaff_id_seq" OWNED BY public."Utilisateur_supportstaff".id;
          public          postgres    false    208            ?            1259    18026 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            ?            1259    18029    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            n           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    210            ?            1259    18031    auth_group_permissions    TABLE     ?   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            ?            1259    18034    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            o           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    212            ?            1259    18036    auth_permission    TABLE     ?   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            ?            1259    18039    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    213            p           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    214            ?            1259    18041 	   auth_user    TABLE     ?  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            ?            1259    18047    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            ?            1259    18050    auth_user_groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    216            q           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    217            ?            1259    18052    auth_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    215            r           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    218            ?            1259    18054    auth_user_user_permissions    TABLE     ?   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            ?            1259    18057 !   auth_user_user_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    219            s           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    220            ?            1259    18059    django_admin_log    TABLE     ?  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            ?            1259    18066    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    221            t           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    222            ?            1259    18068    django_content_type    TABLE     ?   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            ?            1259    18071    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    223            u           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    224            ?            1259    18073    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            ?            1259    18079    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    225            v           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    226            ?            1259    18081    django_session    TABLE     ?   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            t           2604    18226    Utilisateur_client id    DEFAULT     ?   ALTER TABLE ONLY public."Utilisateur_client" ALTER COLUMN id SET DEFAULT nextval('public."Utilisateur_client_id_seq"'::regclass);
 F   ALTER TABLE public."Utilisateur_client" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201            u           2604    18227    Utilisateur_managementstaff id    DEFAULT     ?   ALTER TABLE ONLY public."Utilisateur_managementstaff" ALTER COLUMN id SET DEFAULT nextval('public."Utilisateur_managementstaff_id_seq"'::regclass);
 O   ALTER TABLE public."Utilisateur_managementstaff" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203            v           2604    18228    Utilisateur_salesstaff id    DEFAULT     ?   ALTER TABLE ONLY public."Utilisateur_salesstaff" ALTER COLUMN id SET DEFAULT nextval('public."Utilisateur_salesstaff_id_seq"'::regclass);
 J   ALTER TABLE public."Utilisateur_salesstaff" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205            w           2604    18229    Utilisateur_supportstaff id    DEFAULT     ?   ALTER TABLE ONLY public."Utilisateur_supportstaff" ALTER COLUMN id SET DEFAULT nextval('public."Utilisateur_supportstaff_id_seq"'::regclass);
 L   ALTER TABLE public."Utilisateur_supportstaff" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207            x           2604    18230    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            y           2604    18231    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            z           2604    18232    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            {           2604    18233    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    215            |           2604    18234    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            }           2604    18235    auth_user_user_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            ~           2604    18236    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            ?           2604    18237    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            ?           2604    18238    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            H          0    18003    Utilisateur_client 
   TABLE DATA           ?   COPY public."Utilisateur_client" (id, first_name, last_name, email, phone, mobile, "companyName", "dateCreated", "dateUpdated", "salesContact_id") FROM stdin;
    public          postgres    false    201   ??       J          0    18011    Utilisateur_managementstaff 
   TABLE DATA           _   COPY public."Utilisateur_managementstaff" (id, first_name, last_name, email, role) FROM stdin;
    public          postgres    false    203    ?       L          0    18016    Utilisateur_salesstaff 
   TABLE DATA           Z   COPY public."Utilisateur_salesstaff" (id, first_name, last_name, email, role) FROM stdin;
    public          postgres    false    205   ?       N          0    18021    Utilisateur_supportstaff 
   TABLE DATA           t   COPY public."Utilisateur_supportstaff" (id, first_name, last_name, email, role, "ManagementContact_id") FROM stdin;
    public          postgres    false    207   :?       P          0    18026 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   W?       R          0    18031    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   t?       T          0    18036    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    213   ??       V          0    18041 	   auth_user 
   TABLE DATA           ?   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    215   ??       W          0    18047    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    216   S?       Z          0    18054    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    219   p?       \          0    18059    django_admin_log 
   TABLE DATA           ?   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    221   ??       ^          0    18068    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    223   ??       `          0    18073    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    225   ??       b          0    18081    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    227   ??       w           0    0    Utilisateur_client_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Utilisateur_client_id_seq"', 1, false);
          public          postgres    false    202            x           0    0 "   Utilisateur_managementstaff_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."Utilisateur_managementstaff_id_seq"', 1, false);
          public          postgres    false    204            y           0    0    Utilisateur_salesstaff_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Utilisateur_salesstaff_id_seq"', 1, false);
          public          postgres    false    206            z           0    0    Utilisateur_supportstaff_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."Utilisateur_supportstaff_id_seq"', 1, false);
          public          postgres    false    208            {           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    210            |           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    212            }           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);
          public          postgres    false    214            ~           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    217                       0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    218            ?           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    220            ?           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);
          public          postgres    false    222            ?           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);
          public          postgres    false    224            ?           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);
          public          postgres    false    226            ?           2606    18101 *   Utilisateur_client Utilisateur_client_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Utilisateur_client"
    ADD CONSTRAINT "Utilisateur_client_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."Utilisateur_client" DROP CONSTRAINT "Utilisateur_client_pkey";
       public            postgres    false    201            ?           2606    18103 <   Utilisateur_managementstaff Utilisateur_managementstaff_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public."Utilisateur_managementstaff"
    ADD CONSTRAINT "Utilisateur_managementstaff_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY public."Utilisateur_managementstaff" DROP CONSTRAINT "Utilisateur_managementstaff_pkey";
       public            postgres    false    203            ?           2606    18105 2   Utilisateur_salesstaff Utilisateur_salesstaff_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."Utilisateur_salesstaff"
    ADD CONSTRAINT "Utilisateur_salesstaff_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public."Utilisateur_salesstaff" DROP CONSTRAINT "Utilisateur_salesstaff_pkey";
       public            postgres    false    205            ?           2606    18107 6   Utilisateur_supportstaff Utilisateur_supportstaff_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Utilisateur_supportstaff"
    ADD CONSTRAINT "Utilisateur_supportstaff_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY public."Utilisateur_supportstaff" DROP CONSTRAINT "Utilisateur_supportstaff_pkey";
       public            postgres    false    207            ?           2606    18109    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            ?           2606    18111 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            ?           2606    18113 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            ?           2606    18115    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            ?           2606    18117 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    213    213            ?           2606    18119 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    213            ?           2606    18121 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    216            ?           2606    18123 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    216    216            ?           2606    18125    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    215            ?           2606    18127 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    219            ?           2606    18129 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 ?   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    219    219            ?           2606    18131     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    215            ?           2606    18133 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    221            ?           2606    18135 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    223    223            ?           2606    18137 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    223            ?           2606    18139 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    225            ?           2606    18141 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    227            ?           1259    18142 +   Utilisateur_client_salesContact_id_1b0a4019    INDEX     {   CREATE INDEX "Utilisateur_client_salesContact_id_1b0a4019" ON public."Utilisateur_client" USING btree ("salesContact_id");
 A   DROP INDEX public."Utilisateur_client_salesContact_id_1b0a4019";
       public            postgres    false    201            ?           1259    18143 6   Utilisateur_supportstaff_ManagementContact_id_1bbed0b3    INDEX     ?   CREATE INDEX "Utilisateur_supportstaff_ManagementContact_id_1bbed0b3" ON public."Utilisateur_supportstaff" USING btree ("ManagementContact_id");
 L   DROP INDEX public."Utilisateur_supportstaff_ManagementContact_id_1bbed0b3";
       public            postgres    false    207            ?           1259    18144    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            ?           1259    18145 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            ?           1259    18146 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            ?           1259    18147 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    213            ?           1259    18148 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    216            ?           1259    18149 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    216            ?           1259    18150 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     ?   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    219            ?           1259    18151 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    219            ?           1259    18152     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    215            ?           1259    18153 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    221            ?           1259    18154 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    221            ?           1259    18155 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    227            ?           1259    18156 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    227            ?           2606    18157 K   Utilisateur_client Utilisateur_client_salesContact_id_1b0a4019_fk_Utilisate    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Utilisateur_client"
    ADD CONSTRAINT "Utilisateur_client_salesContact_id_1b0a4019_fk_Utilisate" FOREIGN KEY ("salesContact_id") REFERENCES public."Utilisateur_salesstaff"(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public."Utilisateur_client" DROP CONSTRAINT "Utilisateur_client_salesContact_id_1b0a4019_fk_Utilisate";
       public          postgres    false    205    201    2952            ?           2606    18162 X   Utilisateur_supportstaff Utilisateur_supports_ManagementContact_id_1bbed0b3_fk_Utilisate    FK CONSTRAINT        ALTER TABLE ONLY public."Utilisateur_supportstaff"
    ADD CONSTRAINT "Utilisateur_supports_ManagementContact_id_1bbed0b3_fk_Utilisate" FOREIGN KEY ("ManagementContact_id") REFERENCES public."Utilisateur_managementstaff"(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public."Utilisateur_supportstaff" DROP CONSTRAINT "Utilisateur_supports_ManagementContact_id_1bbed0b3_fk_Utilisate";
       public          postgres    false    2950    203    207            ?           2606    18167 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    211    2971    213            ?           2606    18172 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    2960    209    211            ?           2606    18177 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    2996    223    213            ?           2606    18182 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    209    2960    216            ?           2606    18187 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    2973    215    216            ?           2606    18192 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    213    219    2971            ?           2606    18197 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    219    2973    215            ?           2606    18202 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    221    2996    223            ?           2606    18207 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    221    215    2973            H      x?????? ? ?      J      x?????? ? ?      L      x?????? ? ?      N      x?????? ? ?      P      x?????? ? ?      R      x?????? ? ?      T   	  x?m??n?0?????	?????Ƥ)j??Dh????vb???8??O????}?/??6\?????8????5,m	????נ(,1Xx	?0kK? >?𧰵??>??a??ۡ7%?q????N?G??X??	??k??u@???I??O^?8???!?d??mW???djX??????K?#???@?#p??i???c>?<??2?b~?????Jkź???$??Fzmx??|?c???u?:???ieK?wf?3c*팑^?D???pһ{lϭ????Җ*??")U?HZ???jԄ'??S?n;Xd?Ls?y"&F	X?ǈP?  ???XFj??o[???}r!D%>!?A??|???E?o???<s?X?Jg=#?J??	?T??j?????!??o!q?????/JP??N?fS??ӭ?q?˔k?.PN{???0͉?;	V?ᓷjQ/??%???^?_??*:??k???5????زW??]Wz??F?r?5???mo?]>?M?ׇ???*?      V   ?   x?]??
?@ ϻ_??[$?=|?
\T?,S??,???ܰ?o?s?àx???F?w?+?X???T]]?i??2L})??!	????\l?Ǻʎ;?LM\?-?o???O??  \?5?!??!??8?????????1?ogyr????6*?      W      x?????? ? ?      Z      x?????? ? ?      \   V   x?3?4202?5"KCS+Ss+#C=S3sCmCNCN???????<??????CM?ht?RbJJj???Bumm,?9?!W? ?LD      ^   ?   x?U?I?@??c??>?'p?b'X?McR~OH@Jn?Un?=?D?i?he???2? ??"?J?K???Хh???̺.x?y???g??9r?N T?N(?e??B???)?=?M?(?????U??'??G?lM?9??v?E?_?~??W4`?      `   ?  x???͎? ???S̾j?????>Bw?J?m\????.&?Ʈ#Yl??P]???}ҾB?4?	F?F?C??Ж?-?g.?
??	WjǊ?i?HR??`?cE4נ	???b??.??M?X?Ju?n30??%{0ȃuR]???|?U'/?\??,??????MސiG?j??(Ʃ 	U??T}?NN????R??A}?^?]?k?#?&TSP$?f=(?Rj?)?P?3%-K;v
;?4$??0?3?W>$?M?l?w]??@?????ٸb???L??@h>)xĳέ?To?*X?????Y'???v^?8ْ] ?l?s`?(qZH??G/?˷؊?Q???????#^0 ?)Z??????)?;????B?3???ލ{u,????\????Xe??qӣbL??-g?Pʗ?bT??7>?=?m%?o@Z?[D?X?xg%?[?}?? s	?Ma?f???Χ?????      b   
  x???n?0  ?g???/??X????ED`?%?	2@D????3.D????-???di?I\??i_6???iz?b?9CaQ;U=?9?޳??|??(;;???_?N???Qi? ?!?܀]?Se?n?????1???0Lz?G?:G[??v???f{T??$<\?aI?+?/??n??A͖{0?0}??D???????????m??JV5??S?^{?3?J?^???!<?ǥ??p???M{?n?U?T?}Albl<P?????;U??{_     