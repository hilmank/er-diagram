CREATE SCHEMA org AUTHORIZATION postgres;
GRANT ALL ON SCHEMA org TO postgres;

CREATE TABLE org.department (
    id varchar(36) NOT NULL,
    organization_id varchar(36) NOT NULL,
    code varchar(16) NOT NULL UNIQUE,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    whatsapp varchar(255),
    facebook varchar(255),
    twitterx varchar(255),
    instagram varchar(255),
    tiktok varchar(255),
    CONSTRAINT department_pkey PRIMARY KEY (id)
);

CREATE TABLE org.department_file (
    id varchar(36) NOT NULL,
    department_id varchar(36) NOT NULL,
    category varchar(16) NOT NULL,
    type varchar(16) NOT NULL,
    title varchar(255) NOT NULL,
    description text,
    file_name varchar(255) NOT NULL,
    file_thumbnail varchar(255),
    CONSTRAINT department_file_pkey PRIMARY KEY (id),
    CONSTRAINT department_file_type_ckey CHECK (
        type in (
            'image',
            'audio',
            'video',
            'pdf',
            'word',
            'sheet'
        )
    ),
    CONSTRAINT department_file_category_constant CHECK (category in ('logo'))
);

CREATE TABLE org.employee (
    id varchar(36) NOT NULL,
    department_id varchar(36) NOT NULL,
    position_id varchar(36) NOT NULL,
    place_of_birth varchar(50) NOT NULL,
    date_of_birth date NOT NULL,
    gender varchar(1) NOT NULL,
    hire_date date NOT NULL,
    emp_status int4 NOT NULL,
    bank_account_number varchar(36) NOT NULL,
    tax_id_number varchar(36) NOT NULL,
    marital_status varchar(1) NOT NULL,
    num_of_child int4,
    sallary float4 NOT NULL,
    whatsapp varchar(255),
    facebook varchar(255),
    twitterx varchar(255),
    instagram varchar(255),
    tiktok varchar(255),
    CONSTRAINT employee_pkey PRIMARY KEY (id)
);

CREATE TABLE org.employee_certification (
    id SERIAL NOT NULL,
    employee_id varchar(36) NOT NULL,
    name varchar(255) NOT NULL,
    organizer varchar(36) NOT NULL,
    year int4 NOT NULL,
    file_cerificate varchar(36) NOT NULL,
    CONSTRAINT employee_certification_pkey PRIMARY KEY (id)
);

CREATE TABLE org.employee_education (
    id SERIAL NOT NULL,
    employee_id varchar(36) NOT NULL,
    degree varchar(255) NOT NULL,
    school_name varchar(36) NOT NULL,
    year int4 NOT NULL,
    file_cerificate varchar(36) NOT NULL,
    CONSTRAINT employee_education_pkey PRIMARY KEY (id)
);

CREATE TABLE org.organization (
    id varchar(36) NOT NULL,
    code varchar(16) NOT NULL UNIQUE,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    address varchar(255) NOT NULL,
    email varchar(50) NOT NULL,
    telpon varchar(50) NOT NULL,
    working_day_start int4 NOT NULL,
    working_day_end int4 NOT NULL,
    working_hour_start time NOT NULL,
    working_hour_end time NOT NULL,
    tag_line varchar(255) NOT NULL,
    longitude float8 NOT NULL,
    latitude float8 NOT NULL,
    whatsapp varchar(255),
    facebook varchar(255),
    twitterx varchar(255),
    instagram varchar(255),
    tiktok varchar(255),
    CONSTRAINT organization_pkey PRIMARY KEY (id)
);

CREATE TABLE org.organization_file (
    id varchar(36) NOT NULL,
    organization_id varchar(36) NOT NULL,
    category varchar(16) NOT NULL,
    type varchar(16) NOT NULL,
    title varchar(255) NOT NULL,
    description text,
    file_name varchar(255) NOT NULL,
    file_thumbnail varchar(255),
    CONSTRAINT organization_file_pkey PRIMARY KEY (id),
    CONSTRAINT organization_file_type_ckey CHECK (
        type in (
            'image',
            'audio',
            'video',
            'pdf',
            'word',
            'sheet'
        )
    ),
    CONSTRAINT organization_file_category_constant CHECK (category in ('logo', 'image-slider'))
);

CREATE TABLE org.position (
    id varchar(36) NOT NULL,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    min_salary float4 NOT NULL,
    max_salary float4 NOT NULL,
    CONSTRAINT position_pkey PRIMARY KEY (id)
);

CREATE TABLE org.program (
    id varchar(36) NOT NULL,
    departmen_id varchar(36) NOT NULL,
    code varchar(16) NOT NULL UNIQUE,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    whatsapp varchar(255),
    facebook varchar(255),
    twitterx varchar(255),
    instagram varchar(255),
    tiktok varchar(255),
    CONSTRAINT program_pkey PRIMARY KEY (id)
);

CREATE TABLE org.program_file (
    id varchar(36) NOT NULL,
    program_id varchar(36) NOT NULL,
    category varchar(16) NOT NULL,
    type varchar(16) NOT NULL,
    title varchar(255) NOT NULL,
    description text,
    file_name varchar(255) NOT NULL,
    file_thumbnail varchar(255),
    CONSTRAINT program_file_pkey PRIMARY KEY (id),
    CONSTRAINT program_file_category_constant CHECK (category in ('logo')),
    CONSTRAINT program_file_type_ckey CHECK (
        type in (
            'image',
            'audio',
            'video',
            'pdf',
            'word',
            'sheet'
        )
    )
);

--CREATE TABLE usr."user" (id varchar(36) NOT NULL, username varchar(32) NOT NULL, password varchar(128) NOT NULL, email varchar(64) NOT NULL, first_name varchar(30) NOT NULL, middle_name varchar(30), last_name varchar(30), address text NOT NULL, phone_number varchar(30), mobile_number varchar(30), status int4 NOT NULL, last_login timestamp, organization_id varchar(36), created_by varchar(36) NOT NULL, created_date timestamp NOT NULL, updated_by varchar(36), updated_date timestamp, CONSTRAINT users_pkey PRIMARY KEY (id), CONSTRAINT user_username_key UNIQUE (username), CONSTRAINT user_email_key UNIQUE (email), CONSTRAINT user_status_ckey CHECK (status in (0,1,-1)));
ALTER TABLE
    org.employee_certification
ADD
    CONSTRAINT certification_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES org.employee (id);

ALTER TABLE
    org.department_file
ADD
    CONSTRAINT department_file_department_id_fkey FOREIGN KEY (department_id) REFERENCES org.department (id);

ALTER TABLE
    org.department
ADD
    CONSTRAINT department_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES org.organization (id);

ALTER TABLE
    org.employee_education
ADD
    CONSTRAINT education_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES org.employee (id);

ALTER TABLE
    org.employee
ADD
    CONSTRAINT employee_department_id_fkey FOREIGN KEY (department_id) REFERENCES org.department (id);

ALTER TABLE
    org.employee
ADD
    CONSTRAINT employee_position_id_fkey FOREIGN KEY (position_id) REFERENCES org.position (id);

ALTER TABLE
    org.employee
ADD
    CONSTRAINT instructor_id_fkey FOREIGN KEY (id) REFERENCES usr."user" (id);

ALTER TABLE
    org.organization_file
ADD
    CONSTRAINT organization_file_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES org.organization (id);

ALTER TABLE
    org.program
ADD
    CONSTRAINT program_department_id_fkey FOREIGN KEY (departmen_id) REFERENCES org.department (id);

ALTER TABLE
    org.program_file
ADD
    CONSTRAINT program_file_program_id_fkey FOREIGN KEY (program_id) REFERENCES org.program (id);

--ALTER TABLE usr."user" ADD CONSTRAINT user_created_by_fkey FOREIGN KEY (created_by) REFERENCES usr."user" (id);
--ALTER TABLE usr."user" ADD CONSTRAINT user_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES usr."user" (id);