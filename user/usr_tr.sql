CREATE SCHEMA usr_tr AUTHORIZATION postgres;
GRANT ALL ON SCHEMA usr_tr TO postgres;

CREATE TABLE usr_tr.appl (
    id varchar(36) NOT NULL,
    language_id varchar(36) NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(500) NOT NULL,
    CONSTRAINT appl_pkey PRIMARY KEY (id, language_id)
);

--CREATE TABLE usr.appl (id varchar(36) NOT NULL, code varchar(16) NOT NULL, name varchar(255) NOT NULL, description varchar(500) NOT NULL, CONSTRAINT appl_pkey PRIMARY KEY (id), CONSTRAINT appl_code_key UNIQUE (code));
CREATE TABLE usr_tr.appl_task (
    id varchar(36) NOT NULL,
    language_id varchar(36) NOT NULL,
    task_name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    CONSTRAINT appl_task_pkey PRIMARY KEY (id, language_id)
);

--CREATE TABLE usr.appl_task (id varchar(36) NOT NULL, appl_task_parent_id varchar(36), appl_id varchar(36) NOT NULL, index_no int4 DEFAULT 0 NOT NULL, task_name varchar(255) NOT NULL, controller_name varchar(255), action_name varchar(255), description varchar(255) NOT NULL, icon_name varchar(255), custom_id varchar(36), status int4 DEFAULT 1 NOT NULL, CONSTRAINT appl_task_pkey PRIMARY KEY (id));
--CREATE TABLE tb_language (id varchar(36) NOT NULL, name varchar(50) NOT NULL, description varchar(255) NOT NULL, CONSTRAINT pk_ltb_language PRIMARY KEY (id));
ALTER TABLE
    usr_tr.appl
ADD
    CONSTRAINT app_language_id_fkey FOREIGN KEY (language_id) REFERENCES tb_language (id);

--ALTER TABLE usr.appl_task ADD CONSTRAINT appl_task_appl_id_fkey FOREIGN KEY (appl_id) REFERENCES usr.appl (id) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE
    usr_tr.appl_task
ADD
    CONSTRAINT appl_task_language_id_fkey FOREIGN KEY (language_id) REFERENCES tb_language (id);

--ALTER TABLE usr.appl_task ADD CONSTRAINT appl_task_parent_id_fkey FOREIGN KEY (appl_task_parent_id) REFERENCES usr.appl_task (id) ON UPDATE No action ON DELETE No action;
ALTER TABLE
    usr_tr.appl_task
ADD
    CONSTRAINT appl_task_tr_id_fkey FOREIGN KEY (id) REFERENCES usr.appl_task (id);

ALTER TABLE
    usr_tr.appl
ADD
    CONSTRAINT appl_tr_id_fkey FOREIGN KEY (id) REFERENCES usr.appl (id);