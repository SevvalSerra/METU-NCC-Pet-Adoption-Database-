PGDMP         +                {            pet_adoption_db    15.4    15.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16399    pet_adoption_db    DATABASE     {   CREATE DATABASE pet_adoption_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE pet_adoption_db;
                postgres    false            �            1259    16472    adoption    TABLE     
  CREATE TABLE public.adoption (
    formid integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    useremail character varying(255) NOT NULL,
    phonenum character varying(20),
    petid integer NOT NULL,
    address text
);
    DROP TABLE public.adoption;
       public         heap    postgres    false            �            1259    16471    adoption_formid_seq    SEQUENCE     �   CREATE SEQUENCE public.adoption_formid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.adoption_formid_seq;
       public          postgres    false    218            �           0    0    adoption_formid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.adoption_formid_seq OWNED BY public.adoption.formid;
          public          postgres    false    217            �            1259    16454    pets    TABLE     �   CREATE TABLE public.pets (
    petid integer NOT NULL,
    petname character varying(255) NOT NULL,
    gender character varying(10),
    age integer,
    info text,
    pet_img character varying(255)
);
    DROP TABLE public.pets;
       public         heap    postgres    false            �            1259    16453    pets_petid_seq    SEQUENCE     �   CREATE SEQUENCE public.pets_petid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.pets_petid_seq;
       public          postgres    false    216            �           0    0    pets_petid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.pets_petid_seq OWNED BY public.pets.petid;
          public          postgres    false    215            �            1259    16446    users    TABLE     �   CREATE TABLE public.users (
    email character varying(255) NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    password character varying(255) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            2           2604    16475    adoption formid    DEFAULT     r   ALTER TABLE ONLY public.adoption ALTER COLUMN formid SET DEFAULT nextval('public.adoption_formid_seq'::regclass);
 >   ALTER TABLE public.adoption ALTER COLUMN formid DROP DEFAULT;
       public          postgres    false    217    218    218            1           2604    16457 
   pets petid    DEFAULT     h   ALTER TABLE ONLY public.pets ALTER COLUMN petid SET DEFAULT nextval('public.pets_petid_seq'::regclass);
 9   ALTER TABLE public.pets ALTER COLUMN petid DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16472    adoption 
   TABLE DATA           d   COPY public.adoption (formid, firstname, lastname, useremail, phonenum, petid, address) FROM stdin;
    public          postgres    false    218   B       �          0    16454    pets 
   TABLE DATA           J   COPY public.pets (petid, petname, gender, age, info, pet_img) FROM stdin;
    public          postgres    false    216   �       �          0    16446    users 
   TABLE DATA           E   COPY public.users (email, firstname, lastname, password) FROM stdin;
    public          postgres    false    214   �       �           0    0    adoption_formid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.adoption_formid_seq', 2, true);
          public          postgres    false    217            �           0    0    pets_petid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pets_petid_seq', 3, true);
          public          postgres    false    215            8           2606    16479    adoption adoption_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.adoption
    ADD CONSTRAINT adoption_pkey PRIMARY KEY (formid);
 @   ALTER TABLE ONLY public.adoption DROP CONSTRAINT adoption_pkey;
       public            postgres    false    218            6           2606    16461    pets pets_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (petid);
 8   ALTER TABLE ONLY public.pets DROP CONSTRAINT pets_pkey;
       public            postgres    false    216            4           2606    16452    users users_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    214            9           2606    16485    adoption adoption_petid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.adoption
    ADD CONSTRAINT adoption_petid_fkey FOREIGN KEY (petid) REFERENCES public.pets(petid);
 F   ALTER TABLE ONLY public.adoption DROP CONSTRAINT adoption_petid_fkey;
       public          postgres    false    216    4150    218            :           2606    16480     adoption adoption_useremail_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adoption
    ADD CONSTRAINT adoption_useremail_fkey FOREIGN KEY (useremail) REFERENCES public.users(email);
 J   ALTER TABLE ONLY public.adoption DROP CONSTRAINT adoption_useremail_fkey;
       public          postgres    false    4148    218    214            �   x   x�3�t-.J���MI,�L2�3AL�Ԋ�܂�T���\NSSS]C#cNCN ������\R��Z�e��Z����钚�Y����Y�ǧ@����[pq���)�'f+8��敦r��qqq 4a*�      �   �   x��ϱ�@���L�8t�HAe�4\80�LL�M@�����J���%��r(pv���Ú7�=��k!5Ы���$3klG�8��z`5>74�!m��2&�m�3wQ/H�}2���q;6���:��G����\�`��䝎`�P4�P���Sxf��y����]� }LE@l�      �   q   x�U��
�0 �ݏ�~�
-��NY�E�Fe����k�Y��0�P缥��;�e����C0,���b��'��βwb�%Mt��(���S��ܧ������A@E��Q� ���7�     