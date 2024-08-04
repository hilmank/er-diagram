CREATE SCHEMA org_tr AUTHORIZATION postgres;

GRANT ALL ON SCHEMA org_tr TO postgres;

CREATE TABLE org_tr.department (
    id varchar(36) NOT NULL,
    language_id varchar(36) NOT NULL,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    email varchar(255) NOT NULL,
    CONSTRAINT department_pkey PRIMARY KEY (id, language_id)
);

--CREATE TABLE org.department (id varchar(36) NOT NULL, organization_id varchar(36) NOT NULL, code varchar(16) NOT NULL UNIQUE, name varchar(50) NOT NULL, description text NOT NULL, whatsapp varchar(255), facebook varchar(255), twitterx varchar(255), instagram varchar(255), tiktok varchar(255), CONSTRAINT department_pkey PRIMARY KEY (id));
--CREATE TABLE org.employee_certification (id SERIAL NOT NULL, employee_id varchar(36) NOT NULL, name varchar(255) NOT NULL, organizer varchar(36) NOT NULL, year int4 NOT NULL, file_cerificate varchar(36) NOT NULL, CONSTRAINT employee_certification_pkey PRIMARY KEY (id));
CREATE TABLE org_tr.employee_certification (
    id int4 NOT NULL,
    language_id varchar(36) NOT NULL,
    name varchar(255) NOT NULL,
    file_certificate varchar(255) NOT NULL,
    CONSTRAINT employee_certification_pkey PRIMARY KEY (id, language_id)
);

--CREATE TABLE org.employee_education (id SERIAL NOT NULL, employee_id varchar(36) NOT NULL, degree varchar(255) NOT NULL, school_name varchar(36) NOT NULL, year int4 NOT NULL, file_cerificate varchar(36) NOT NULL, CONSTRAINT employee_education_pkey PRIMARY KEY (id));
CREATE TABLE org_tr.employee_education (
    id int4 NOT NULL,
    language_id varchar(36) NOT NULL,
    degree varchar(255) NOT NULL,
    file_certificate varchar(255) NOT NULL,
    CONSTRAINT employee_education_pkey PRIMARY KEY (id, language_id)
);

CREATE TABLE org_tr.organization (
    id varchar(36) NOT NULL,
    language_id varchar(36) NOT NULL,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    tag_line varchar(255) NOT NULL,
    CONSTRAINT organization_pkey PRIMARY KEY (id, language_id)
);

--CREATE TABLE org.organization (id varchar(36) NOT NULL, code varchar(16) NOT NULL UNIQUE, name varchar(50) NOT NULL, description text NOT NULL, address varchar(255) NOT NULL, email varchar(50) NOT NULL, telpon varchar(50) NOT NULL, working_day_start int4 NOT NULL, working_day_end int4 NOT NULL, working_hour_start time NOT NULL, working_hour_end time NOT NULL, tag_line varchar(255) NOT NULL, longitude float8 NOT NULL, latitude float8 NOT NULL, whatsapp varchar(255), facebook varchar(255), twitterx varchar(255), instagram varchar(255), tiktok varchar(255), CONSTRAINT organization_pkey PRIMARY KEY (id));
--CREATE TABLE org.position (id varchar(36) NOT NULL, name varchar(50) NOT NULL, description text NOT NULL, min_salary float4 NOT NULL, max_salary float4 NOT NULL, CONSTRAINT position_pkey PRIMARY KEY (id));
CREATE TABLE org_tr.position (
    id varchar(36) NOT NULL,
    language_id varchar(36) NOT NULL,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    CONSTRAINT position_pkey PRIMARY KEY (id)
);

CREATE TABLE org_tr.program (
    id varchar(36) NOT NULL,
    language_id varchar(36) NOT NULL,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    CONSTRAINT program_pkey PRIMARY KEY (id, language_id)
);

--CREATE TABLE org.program (id varchar(36) NOT NULL, departmen_id varchar(36) NOT NULL, code varchar(16) NOT NULL UNIQUE, name varchar(50) NOT NULL, description text NOT NULL, whatsapp varchar(255), facebook varchar(255), twitterx varchar(255), instagram varchar(255), tiktok varchar(255), CONSTRAINT program_pkey PRIMARY KEY (id));
CREATE TABLE tb_language (
    id varchar(36) NOT NULL,
    name varchar(50) NOT NULL,
    description varchar(255) NOT NULL,
    CONSTRAINT pk_ltb_language PRIMARY KEY (id)
);

ALTER TABLE
    org_tr.department
ADD
    CONSTRAINT department_language_id_fkey FOREIGN KEY (language_id) REFERENCES tb_language (id);

--ALTER TABLE org.department ADD CONSTRAINT department_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES org.organization (id);
ALTER TABLE
    org_tr.department
ADD
    CONSTRAINT department_tr_id_fkey FOREIGN KEY (id) REFERENCES org.department (id);

ALTER TABLE
    org_tr.employee_certification
ADD
    CONSTRAINT employee_certification_language_id_fkey FOREIGN KEY (language_id) REFERENCES tb_language (id);

ALTER TABLE
    org_tr.employee_certification
ADD
    CONSTRAINT employee_certification_tr_id_fkey FOREIGN KEY (id) REFERENCES org.employee_certification (id);

ALTER TABLE
    org_tr.employee_education
ADD
    CONSTRAINT employee_education_language_id_fkey FOREIGN KEY (language_id) REFERENCES tb_language (id);

ALTER TABLE
    org_tr.employee_education
ADD
    CONSTRAINT employee_education_tr_id_fkey FOREIGN KEY (id) REFERENCES org.employee_education (id);

ALTER TABLE
    org_tr.organization
ADD
    CONSTRAINT organization_language_id_fkey FOREIGN KEY (language_id) REFERENCES tb_language (id);

ALTER TABLE
    org_tr.organization
ADD
    CONSTRAINT organization_tr_id_fkey FOREIGN KEY (id) REFERENCES org.organization (id);

ALTER TABLE
    org_tr.position
ADD
    CONSTRAINT position_language_id_feky FOREIGN KEY (language_id) REFERENCES tb_language (id);

ALTER TABLE
    org_tr.position
ADD
    CONSTRAINT position_tr_id_fkey FOREIGN KEY (id) REFERENCES org.position (id);

--ALTER TABLE org.program ADD CONSTRAINT program_department_id_fkey FOREIGN KEY (departmen_id) REFERENCES org.department (id);
ALTER TABLE
    org_tr.program
ADD
    CONSTRAINT program_language_id_fkey FOREIGN KEY (language_id) REFERENCES tb_language (id);

ALTER TABLE
    org_tr.program
ADD
    CONSTRAINT program_tr_id_fkey FOREIGN KEY (id) REFERENCES org.program (id);