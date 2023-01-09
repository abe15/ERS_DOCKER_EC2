-- public.ers_reimbursement_status definition

-- Drop table

-- DROP TABLE public.ers_reimbursement_status;

CREATE TABLE public.ers_reimbursement_status (
	reimb_status_id serial4 NOT NULL,
	reimb_status varchar NOT NULL,
	CONSTRAINT ers_reimbursement_status_pk PRIMARY KEY (reimb_status_id)
);


-- public.ers_reimbursement_type definition

-- Drop table

-- DROP TABLE public.ers_reimbursement_type;

CREATE TABLE public.ers_reimbursement_type (
	reimb_type_id serial4 NOT NULL,
	reimb_type varchar NOT NULL,
	CONSTRAINT ers_reimbursement_type_pk PRIMARY KEY (reimb_type_id)
);


-- public.ers_user_roles definition

-- Drop table

-- DROP TABLE public.ers_user_roles;

CREATE TABLE public.ers_user_roles (
	ers_user_role_id numeric NOT NULL,
	user_role varchar NOT NULL,
	CONSTRAINT ers_user_roles_pk PRIMARY KEY (ers_user_role_id)
);


-- public.ers_users definition

-- Drop table

-- DROP TABLE public.ers_users;

CREATE TABLE public.ers_users (
	ers_users_id serial4 NOT NULL,
	ers_username varchar NOT NULL,
	ers_password varchar NOT NULL,
	user_first_name varchar NOT NULL,
	user_last_name varchar NOT NULL,
	user_email varchar NOT NULL,
	user_role_id numeric NOT NULL DEFAULT 1,
	CONSTRAINT ers_users_pk PRIMARY KEY (ers_users_id),
	CONSTRAINT ers_users_fk FOREIGN KEY (user_role_id) REFERENCES public.ers_user_roles(ers_user_role_id)
);
CREATE UNIQUE INDEX ers_users_ers_username_idx ON public.ers_users USING btree (ers_username);
CREATE UNIQUE INDEX ers_users_user_email_idx ON public.ers_users USING btree (user_email);


-- public.ers_reimbursement definition

-- Drop table

-- DROP TABLE public.ers_reimbursement;

CREATE TABLE public.ers_reimbursement (
	reimb_id serial4 NOT NULL,
	reimb_amount numeric NOT NULL,
	reim_submitted timestamp NOT NULL,
	reimb_resolved timestamp NULL,
	reimb_description varchar NULL,
	reimb_receipt bytea NULL,
	reimb_author int4 NOT NULL,
	reimb_resolver int4 NULL,
	reimb_status_id int4 NOT NULL,
	reimb_type_id int4 NOT NULL,
	CONSTRAINT ers_reimbursement_pk PRIMARY KEY (reimb_id),
	CONSTRAINT ers_reimbursement_fk FOREIGN KEY (reimb_type_id) REFERENCES public.ers_reimbursement_type(reimb_type_id),
	CONSTRAINT ers_reimbursement_fk_1 FOREIGN KEY (reimb_author) REFERENCES public.ers_users(ers_users_id),
	CONSTRAINT ers_reimbursement_fk_2 FOREIGN KEY (reimb_resolver) REFERENCES public.ers_users(ers_users_id),
	CONSTRAINT ers_reimbursement_fk_3 FOREIGN KEY (reimb_status_id) REFERENCES public.ers_reimbursement_status(reimb_status_id)
);