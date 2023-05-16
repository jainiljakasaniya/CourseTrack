-- DROP DATABASE IF EXISTS courseApp;

-- CREATE DATABASE courseApp WITH OWNER = postgres ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252' TABLESPACE = pg_default CONNECTION
-- LIMIT = -1 IS_TEMPLATE = False;

-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	userid serial4 NOT NULL,
	username varchar(20) NOT NULL,
	useremail varchar(20) NOT NULL,
	userpassword varchar NOT NULL,
	userrole varchar(20) NOT NULL,
	CONSTRAINT chk_userrole CHECK (((userrole)::text = ANY ((ARRAY['Student'::character varying, 'Trainer'::character varying])::text[]))),
	CONSTRAINT pk_user PRIMARY KEY (userid),
	CONSTRAINT uc_user_useremail UNIQUE (useremail)
);

-- public.modules definition

-- Drop table

-- DROP TABLE public.modules;

CREATE TABLE public.modules (
	moduleid serial4 NOT NULL,
	modulename varchar(20) NOT NULL,
	courseid int4 NOT NULL,
	createdby int4 NOT NULL,
	createdat date NOT NULL DEFAULT CURRENT_DATE,
	updatedby int4 NULL,
	updatedat date NULL,
	CONSTRAINT pk_modules PRIMARY KEY (moduleid)
);

-- public.modules foreign keys

ALTER TABLE public.modules ADD CONSTRAINT fk_modules_courseid FOREIGN KEY (courseid) REFERENCES public.course(courseid);
ALTER TABLE public.modules ADD CONSTRAINT fk_modules_createdby FOREIGN KEY (createdby) REFERENCES public.users(userid);
ALTER TABLE public.modules ADD CONSTRAINT fk_modules_updatedby FOREIGN KEY (updatedby) REFERENCES public.users(userid);


-- public.lessons definition

-- Drop table

-- DROP TABLE public.lessons;

CREATE TABLE public.lessons (
	lessonid serial4 NOT NULL,
	lessonname varchar(20) NOT NULL,
	lessonlink varchar(50) NOT NULL,
	moduleid int4 NOT NULL,
	lessondiscription varchar(200) NOT NULL,
	createdby int4 NOT NULL,
	createdat date NOT NULL DEFAULT CURRENT_DATE,
	updatedby int4 NULL,
	updatedat date NULL,
	CONSTRAINT pk_lessons PRIMARY KEY (lessonid)
);

-- public.lessons foreign keys

ALTER TABLE public.lessons ADD CONSTRAINT fk_lessons_createdby FOREIGN KEY (createdby) REFERENCES public.users(userid);
ALTER TABLE public.lessons ADD CONSTRAINT fk_lessons_moduleid FOREIGN KEY (moduleid) REFERENCES public.modules(moduleid);
ALTER TABLE public.lessons ADD CONSTRAINT fk_lessons_updatedby FOREIGN KEY (updatedby) REFERENCES public.users(userid);


-- public.enrollment definition

-- Drop table

-- DROP TABLE public.enrollment;

CREATE TABLE public.enrollment (
	enrollid serial4 NOT NULL,
	enrollat date NOT NULL DEFAULT CURRENT_DATE,
	studentid int4 NOT NULL,
	courseid int4 NOT NULL,
	CONSTRAINT pk_enrollment PRIMARY KEY (enrollid)
);


-- public.enrollment foreign keys

ALTER TABLE public.enrollment ADD CONSTRAINT fk_enrollment_courseid FOREIGN KEY (courseid) REFERENCES public.course(courseid);
ALTER TABLE public.enrollment ADD CONSTRAINT fk_enrollment_studentid FOREIGN KEY (studentid) REFERENCES public.users(userid);


-- public.courserating definition

-- Drop table

-- DROP TABLE public.courserating;

CREATE TABLE public.courserating (
	ratingid serial4 NOT NULL,
	rating float8 NOT NULL DEFAULT 0,
	ratedat date NOT NULL DEFAULT CURRENT_DATE,
	courseid int4 NOT NULL,
	studentid int4 NOT NULL,
	CONSTRAINT chk_rating CHECK (((rating >= (0)::double precision) AND (rating <= (10)::double precision))),
	CONSTRAINT pk_courserating PRIMARY KEY (ratingid)
);


-- public.courserating foreign keys

ALTER TABLE public.courserating ADD CONSTRAINT fk_courserating_courseid FOREIGN KEY (courseid) REFERENCES public.course(courseid);
ALTER TABLE public.courserating ADD CONSTRAINT fk_courserating_studentid FOREIGN KEY (studentid) REFERENCES public.users(userid);


-- public.course definition

-- Drop table

-- DROP TABLE public.course;

CREATE TABLE public.course (
	courseid serial4 NOT NULL,
	coursename varchar(20) NOT NULL,
	coursediscription varchar(200) NOT NULL,
	courserating float8 NOT NULL DEFAULT 0,
	trainerid int4 NOT NULL,
	createdby int4 NOT NULL,
	createdat date NOT NULL DEFAULT CURRENT_DATE,
	updatedby int4 NULL,
	updatedat date NULL,
	CONSTRAINT chk_courserating CHECK (((courserating >= (0)::double precision) AND (courserating <= (10)::double precision))),
	CONSTRAINT pk_course PRIMARY KEY (courseid)
);


-- public.course foreign keys

ALTER TABLE public.course ADD CONSTRAINT fk_course_createdby FOREIGN KEY (createdby) REFERENCES public.users(userid);
ALTER TABLE public.course ADD CONSTRAINT fk_course_trainerid FOREIGN KEY (trainerid) REFERENCES public.users(userid);
ALTER TABLE public.course ADD CONSTRAINT fk_course_updatedby FOREIGN KEY (updatedby) REFERENCES public.users(userid);


-- public.blockstudent definition

-- Drop table

-- DROP TABLE public.blockstudent;

CREATE TABLE public.blockstudent (
	blockstudentid serial4 NOT NULL,
	blockedby int4 NOT NULL,
	studentid int4 NOT NULL,
	courseid int4 NOT NULL,
	blockedat date NOT NULL DEFAULT CURRENT_DATE,
	CONSTRAINT pk_blockstudent PRIMARY KEY (blockstudentid)
);


-- public.blockstudent foreign keys

ALTER TABLE public.blockstudent ADD CONSTRAINT fk_blockstudent_blockedby FOREIGN KEY (blockedby) REFERENCES public.users(userid);
ALTER TABLE public.blockstudent ADD CONSTRAINT fk_blockstudent_courseid FOREIGN KEY (courseid) REFERENCES public.course(courseid);
ALTER TABLE public.blockstudent ADD CONSTRAINT fk_blockstudent_studentid FOREIGN KEY (studentid) REFERENCES public.users(userid);
