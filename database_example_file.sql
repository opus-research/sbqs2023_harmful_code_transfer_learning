PGDMP     4                 	    {            metrics    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    metrics    DATABASE     ~   CREATE DATABASE metrics WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE metrics;
                postgres    false            �            1259    16399    class    TABLE     �  CREATE TABLE public.class (
    id integer NOT NULL,
    file character varying(1024),
    language character varying(10),
    project character varying(255),
    kind character varying(255),
    name character varying(255),
    column_number bigint,
    line_number bigint,
    content text,
    metrics jsonb,
    hash character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    smells jsonb,
    bug_fix boolean
);
    DROP TABLE public.class;
       public         heap    postgres    false            �            1259    16406    class_id_seq    SEQUENCE     �   CREATE SEQUENCE public.class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.class_id_seq;
       public          postgres    false    214            	           0    0    class_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.class_id_seq OWNED BY public.class.id;
          public          postgres    false    215            �            1259    16407    method    TABLE     �  CREATE TABLE public.method (
    id integer NOT NULL,
    class_id bigint,
    language character varying(10),
    project character varying(255),
    kind character varying(255),
    name character varying(255),
    column_number bigint,
    line_number bigint,
    content text,
    metrics jsonb,
    hash character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.method;
       public         heap    postgres    false            �            1259    16414    method_id_seq    SEQUENCE     �   CREATE SEQUENCE public.method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.method_id_seq;
       public          postgres    false    216            
           0    0    method_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.method_id_seq OWNED BY public.method.id;
          public          postgres    false    217            j           2604    16415    class id    DEFAULT     d   ALTER TABLE ONLY public.class ALTER COLUMN id SET DEFAULT nextval('public.class_id_seq'::regclass);
 7   ALTER TABLE public.class ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            m           2604    16416 	   method id    DEFAULT     f   ALTER TABLE ONLY public.method ALTER COLUMN id SET DEFAULT nextval('public.method_id_seq'::regclass);
 8   ALTER TABLE public.method ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            q           2606    79638    class class_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.class DROP CONSTRAINT class_pkey;
       public            postgres    false    214            s           2606    79640    method method_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.method
    ADD CONSTRAINT method_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.method DROP CONSTRAINT method_pkey;
       public            postgres    false    216            t           2606    79641    method method_class_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.method
    ADD CONSTRAINT method_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.class(id);
 E   ALTER TABLE ONLY public.method DROP CONSTRAINT method_class_id_fkey;
       public          postgres    false    216    214    3185           