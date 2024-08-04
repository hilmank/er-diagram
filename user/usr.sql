CREATE SCHEMA usr AUTHORIZATION postgres;
GRANT ALL ON SCHEMA usr TO postgres;

CREATE TABLE usr.appl (
    id varchar(36) NOT NULL,
    code varchar(16) NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(500) NOT NULL,
    CONSTRAINT appl_pkey PRIMARY KEY (id),
    CONSTRAINT appl_code_key UNIQUE (code)
);

CREATE TABLE usr.appl_extra (
    appl_id varchar(36) NOT NULL,
    "key" varchar(36) NOT NULL,
    type varchar(36) NOT NULL,
    value varchar(255) NOT NULL,
    CONSTRAINT appl_extra_pkey PRIMARY KEY (appl_id, "key"),
    CONSTRAINT appl_extra_type_ckey CHECK (type in ('string', 'number', 'datetime', 'file'))
);

CREATE TABLE usr.appl_task (
    id varchar(36) NOT NULL,
    appl_task_parent_id varchar(36),
    appl_id varchar(36) NOT NULL,
    index_no int4 DEFAULT 0 NOT NULL,
    task_name varchar(255) NOT NULL,
    controller_name varchar(255),
    action_name varchar(255),
    description varchar(255) NOT NULL,
    icon_name varchar(255),
    custom_id varchar(36),
    status int4 DEFAULT 1 NOT NULL,
    CONSTRAINT appl_task_pkey PRIMARY KEY (id)
);

CREATE TABLE usr.appl_task_delegation (
    id varchar(36) NOT NULL,
    appl_task_id varchar(36) NOT NULL,
    delegate_for varchar(36) NOT NULL,
    delegate_by varchar(36) NOT NULL,
    approved_by varchar(36),
    start_date date NOT NULL,
    end_date date NOT NULL,
    status int4 NOT NULL,
    created_by varchar(36) NOT NULL,
    created_date timestamp(6) NOT NULL,
    updated_by varchar(36),
    updated_date timestamp(6),
    CONSTRAINT appl_task_delegation_pkey PRIMARY KEY (id)
);

CREATE TABLE usr.role (
    id varchar(36) NOT NULL,
    code varchar(16) NOT NULL,
    name varchar(64) NOT NULL,
    CONSTRAINT role_pkey PRIMARY KEY (id),
    CONSTRAINT role_code_key UNIQUE (code)
);

CREATE TABLE usr.role_appl_task (
    role_id varchar(36) NOT NULL,
    appl_task_id varchar(36) NOT NULL,
    CONSTRAINT role_appl_task_pkey PRIMARY KEY (role_id, appl_task_id)
);

CREATE TABLE usr."user" (
    id varchar(36) NOT NULL,
    username varchar(32) NOT NULL,
    password varchar(128) NOT NULL,
    email varchar(64) NOT NULL,
    first_name varchar(30) NOT NULL,
    middle_name varchar(30),
    last_name varchar(30),
    address text NOT NULL,
    phone_number varchar(30),
    mobile_number varchar(30),
    status int4 NOT NULL,
    last_login timestamp,
    organization_id varchar(36),
    created_by varchar(36) NOT NULL,
    created_date timestamp NOT NULL,
    updated_by varchar(36),
    updated_date timestamp,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT user_username_key UNIQUE (username),
    CONSTRAINT user_email_key UNIQUE (email),
    CONSTRAINT user_status_ckey CHECK (status in (0, 1, -1))
);

CREATE TABLE usr.user_file (
    id varchar(36) NOT NULL,
    user_id varchar(36) NOT NULL,
    category varchar(16) NOT NULL,
    type varchar(16) NOT NULL,
    title varchar(255) NOT NULL,
    description text,
    file_name varchar(255) NOT NULL,
    file_thumbnail varchar(255),
    CONSTRAINT pk_user_file PRIMARY KEY (id),
    CONSTRAINT user_file_category_constant CHECK (category in ('photo-profile')),
    CONSTRAINT user_file_type_ckey CHECK (
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

CREATE TABLE usr.user_role (
    user_id varchar(36) NOT NULL,
    role_id varchar(36) NOT NULL,
    CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id)
);

ALTER TABLE
    usr.appl_extra
ADD
    CONSTRAINT appl_extra_appl_id_fkey FOREIGN KEY (appl_id) REFERENCES usr.appl (id);

ALTER TABLE
    usr.appl_task
ADD
    CONSTRAINT appl_task_appl_id_fkey FOREIGN KEY (appl_id) REFERENCES usr.appl (id) ON UPDATE Cascade ON DELETE No action;

ALTER TABLE
    usr.appl_task_delegation
ADD
    CONSTRAINT appl_task_delegation_appl_task_id_fkey FOREIGN KEY (appl_task_id) REFERENCES usr.appl_task (id);

ALTER TABLE
    usr.appl_task_delegation
ADD
    CONSTRAINT appl_task_delegation_approve_by_fkey FOREIGN KEY (approved_by) REFERENCES usr."user" (id) ON UPDATE No action ON DELETE No action;

ALTER TABLE
    usr.appl_task_delegation
ADD
    CONSTRAINT appl_task_delegation_created_by_fkey FOREIGN KEY (created_by) REFERENCES usr."user" (id);

ALTER TABLE
    usr.appl_task_delegation
ADD
    CONSTRAINT appl_task_delegation_delegate_by_fkey FOREIGN KEY (delegate_by) REFERENCES usr."user" (id);

ALTER TABLE
    usr.appl_task_delegation
ADD
    CONSTRAINT appl_task_delegation_delegate_for_fkey FOREIGN KEY (delegate_for) REFERENCES usr."user" (id);

ALTER TABLE
    usr.appl_task_delegation
ADD
    CONSTRAINT appl_task_delegation_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES usr."user" (id);

ALTER TABLE
    usr.appl_task
ADD
    CONSTRAINT appl_task_parent_id_fkey FOREIGN KEY (appl_task_parent_id) REFERENCES usr.appl_task (id) ON UPDATE No action ON DELETE No action;

ALTER TABLE
    usr.user_file
ADD
    CONSTRAINT fk_user_file FOREIGN KEY (user_id) REFERENCES usr."user" (id) ON UPDATE No action ON DELETE No action;

ALTER TABLE
    usr.role_appl_task
ADD
    CONSTRAINT role_appl_task_appl_taks_id_fkey FOREIGN KEY (appl_task_id) REFERENCES usr.appl_task (id) ON UPDATE No action ON DELETE No action;

ALTER TABLE
    usr.role_appl_task
ADD
    CONSTRAINT role_appl_task_role_id_fkey FOREIGN KEY (role_id) REFERENCES usr.role (id);

ALTER TABLE
    usr."user"
ADD
    CONSTRAINT user_created_by_fkey FOREIGN KEY (created_by) REFERENCES usr."user" (id);

ALTER TABLE
    usr.user_role
ADD
    CONSTRAINT user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES usr.role (id);

ALTER TABLE
    usr.user_role
ADD
    CONSTRAINT user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES usr."user" (id);

ALTER TABLE
    usr."user"
ADD
    CONSTRAINT user_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES usr."user" (id);