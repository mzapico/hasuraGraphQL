SET check_function_bodies = false;
CREATE FUNCTION public.set_current_timestamp_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$;
CREATE TABLE public."Customer" (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public."Customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public."Customer_id_seq" OWNED BY public."Customer".id;
CREATE TABLE public."JiraInstance" (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public."JiraInstance_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public."JiraInstance_id_seq" OWNED BY public."JiraInstance".id;
ALTER TABLE ONLY public."Customer" ALTER COLUMN id SET DEFAULT nextval('public."Customer_id_seq"'::regclass);
ALTER TABLE ONLY public."JiraInstance" ALTER COLUMN id SET DEFAULT nextval('public."JiraInstance_id_seq"'::regclass);
ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."JiraInstance"
    ADD CONSTRAINT "JiraInstance_pkey" PRIMARY KEY (id);
CREATE TRIGGER "set_public_Customer_updated_at" BEFORE UPDATE ON public."Customer" FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER "set_public_Customer_updated_at" ON public."Customer" IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER "set_public_JiraInstance_updated_at" BEFORE UPDATE ON public."JiraInstance" FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER "set_public_JiraInstance_updated_at" ON public."JiraInstance" IS 'trigger to set value of column "updated_at" to current timestamp on row update';
