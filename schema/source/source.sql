--CREATE SCHEMA public AUTHORIZATION postgres;

-- public.course definition
CREATE TABLE public.course (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT course_pk PRIMARY KEY (id)
);

INSERT INTO public.course ("name") VALUES
	 ('Introduction to Applied Machine Learning'),
	 ('Natural Language Processing'),
	 ('Data Mining'),
	 ('Applied Data Science'),
	 ('Statistic'),
	 ('Introduction to Object Oriented'),
	 ('Python Programming'),
	 ('Information Retrieval'),
	 ('Blockchain'),
	 ('Internet of Things');


-- public.schedule definition
CREATE TABLE public.schedule (
	id serial4 NOT NULL,
	course_id int4 NOT NULL,
	lecturer_id int4 NOT NULL,
	start_dt date NOT NULL,
	end_dt date NOT NULL,
	course_days varchar NOT NULL,
	CONSTRAINT schedule_pk PRIMARY KEY (id)
);

-- public.schedule foreign keys
ALTER TABLE public.schedule ADD CONSTRAINT schedule_fk FOREIGN KEY (course_id) REFERENCES public.course(id);

INSERT INTO public.schedule (course_id,lecturer_id,start_dt,end_dt,course_days) VALUES
	 (1,11,'2019-09-09','2019-12-08','2,4,6'),
	 (3,4,'2019-09-09','2019-12-08','3,4'),
	 (4,13,'2019-09-09','2019-12-08','2,5'),
	 (5,28,'2019-09-09','2019-12-08','3'),
	 (2,56,'2020-01-27','2020-04-26','2,4'),
	 (7,1,'2020-01-27','2020-04-26','4,5'),
	 (1,11,'2020-01-27','2020-04-26','2,4,6'),
	 (7,22,'2020-01-27','2020-04-26','2,3'),
	 (8,56,'2020-01-27','2020-04-26','5'),
	 (3,37,'2020-01-27','2020-04-26','5,6');

-- public.enrollment definition
CREATE TABLE public.enrollment (
	id serial4 NOT NULL,
	student_id int4 NOT NULL,
	schedule_id int4 NOT NULL,
	academic_year varchar NOT NULL,
	semester int4 NOT NULL,
	enroll_dt date NOT NULL,
	CONSTRAINT enrollment_pk PRIMARY KEY (id)
);


-- public.enrollment foreign keys
ALTER TABLE public.enrollment ADD CONSTRAINT enrollment_fk FOREIGN KEY (schedule_id) REFERENCES public.schedule(id);

INSERT INTO public.enrollment (student_id,schedule_id,academic_year,semester,enroll_dt) VALUES
	 (1,2,'2019/2020',1,'2019-08-17'),
	 (1,4,'2019/2020',1,'2019-08-17'),
	 (2,1,'2019/2020',1,'2019-08-17'),
	 (2,2,'2019/2020',1,'2019-08-17'),
	 (2,3,'2019/2020',1,'2019-08-17'),
	 (6,1,'2019/2020',1,'2019-08-17'),
	 (6,2,'2019/2020',1,'2019-08-17'),
	 (7,3,'2019/2020',1,'2019-08-17'),
	 (10,4,'2019/2020',1,'2019-08-17'),
	 (1,7,'2019/2020',2,'2019-08-17');
INSERT INTO public.enrollment (student_id,schedule_id,academic_year,semester,enroll_dt) VALUES
	 (10,5,'2019/2020',2,'2019-08-17'),
	 (10,10,'2019/2020',2,'2019-08-17'),
	 (13,7,'2019/2020',2,'2019-08-17'),
	 (13,8,'2019/2020',2,'2019-08-17'),
	 (13,10,'2019/2020',2,'2019-08-17');

-- public.course_attendance definition
CREATE TABLE public.course_attendance (
	id serial4 NOT NULL,
	student_id int4 NOT NULL,
	schedule_id int4 NOT NULL,
	attend_dt date NOT NULL,
	CONSTRAINT course_attendance_pk PRIMARY KEY (id)
);


-- public.course_attendance foreign keys
ALTER TABLE public.course_attendance ADD CONSTRAINT course_attendance_fk FOREIGN KEY (schedule_id) REFERENCES public.schedule(id);

INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (1,2,'2019-09-10'),
	 (1,2,'2019-09-11'),
	 (1,2,'2019-09-17'),
	 (1,2,'2019-09-18'),
	 (1,2,'2019-09-24'),
	 (1,2,'2019-09-25'),
	 (1,2,'2019-10-01'),
	 (1,2,'2019-10-02'),
	 (1,2,'2019-10-08'),
	 (1,2,'2019-10-09');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (1,2,'2019-10-15'),
	 (1,2,'2019-10-16'),
	 (1,2,'2019-10-22'),
	 (1,2,'2019-10-23'),
	 (1,2,'2019-10-29'),
	 (1,2,'2019-10-30'),
	 (1,2,'2019-11-05'),
	 (1,2,'2019-11-06'),
	 (1,2,'2019-11-12'),
	 (1,2,'2019-11-13');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (1,2,'2019-11-19'),
	 (1,2,'2019-11-20'),
	 (1,2,'2019-11-26'),
	 (1,2,'2019-11-27'),
	 (1,2,'2019-12-03'),
	 (1,2,'2019-12-04'),
	 (1,4,'2019-09-10'),
	 (1,4,'2019-09-17'),
	 (1,4,'2019-09-24'),
	 (1,4,'2019-10-08');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (1,4,'2019-10-15'),
	 (1,4,'2019-10-29'),
	 (1,4,'2019-11-05'),
	 (1,4,'2019-11-12'),
	 (1,4,'2019-11-26'),
	 (1,4,'2019-12-03'),
	 (2,1,'2019-09-09'),
	 (2,1,'2019-09-16'),
	 (2,1,'2019-09-23'),
	 (2,1,'2019-10-07');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (2,1,'2019-10-21'),
	 (2,1,'2019-10-28'),
	 (2,1,'2019-11-04'),
	 (2,1,'2019-11-11'),
	 (2,1,'2019-11-25'),
	 (2,1,'2019-12-02'),
	 (2,1,'2019-09-11'),
	 (2,1,'2019-09-18'),
	 (2,1,'2019-09-25'),
	 (2,1,'2019-10-09');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (2,1,'2019-10-16'),
	 (2,1,'2019-10-30'),
	 (2,1,'2019-11-06'),
	 (2,1,'2019-11-13'),
	 (2,1,'2019-09-20'),
	 (2,1,'2019-09-27'),
	 (2,1,'2019-10-11'),
	 (2,1,'2019-10-18'),
	 (2,1,'2019-11-01'),
	 (2,1,'2019-11-08');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (2,1,'2019-11-22'),
	 (2,1,'2019-11-29'),
	 (2,1,'2019-12-06'),
	 (2,2,'2019-09-10'),
	 (2,2,'2019-09-11'),
	 (2,2,'2019-09-17'),
	 (2,2,'2019-09-18'),
	 (2,2,'2019-09-24'),
	 (2,2,'2019-09-25'),
	 (2,2,'2019-10-01');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (2,2,'2019-10-02'),
	 (2,2,'2019-10-08'),
	 (2,2,'2019-10-09'),
	 (2,2,'2019-10-15'),
	 (2,2,'2019-10-16'),
	 (2,2,'2019-10-22'),
	 (2,2,'2019-10-23'),
	 (2,2,'2019-10-29'),
	 (2,2,'2019-10-30'),
	 (2,2,'2019-11-05');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (2,2,'2019-11-06'),
	 (2,2,'2019-11-12'),
	 (2,2,'2019-11-13'),
	 (2,2,'2019-11-19'),
	 (2,2,'2019-11-20'),
	 (2,2,'2019-11-26'),
	 (2,2,'2019-11-27'),
	 (2,2,'2019-12-03'),
	 (2,2,'2019-12-04'),
	 (2,3,'2019-09-09');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (2,3,'2019-09-16'),
	 (2,3,'2019-09-23'),
	 (2,3,'2019-10-14'),
	 (2,3,'2019-10-21'),
	 (2,3,'2019-10-28'),
	 (2,3,'2019-11-04'),
	 (2,3,'2019-11-18'),
	 (2,3,'2019-12-02'),
	 (2,3,'2019-09-12'),
	 (2,3,'2019-09-19');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (2,3,'2019-10-03'),
	 (2,3,'2019-10-10'),
	 (2,3,'2019-10-17'),
	 (2,3,'2019-10-24'),
	 (2,3,'2019-11-07'),
	 (2,3,'2019-11-14'),
	 (2,3,'2019-11-28'),
	 (2,3,'2019-12-05'),
	 (6,1,'2019-09-09'),
	 (6,1,'2019-09-16');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (6,1,'2019-09-23'),
	 (6,1,'2019-09-30'),
	 (6,1,'2019-10-07'),
	 (6,1,'2019-10-14'),
	 (6,1,'2019-10-21'),
	 (6,1,'2019-10-28'),
	 (6,1,'2019-11-04'),
	 (6,1,'2019-11-11'),
	 (6,1,'2019-11-18'),
	 (6,1,'2019-11-25');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (6,1,'2019-12-02'),
	 (6,1,'2019-09-11'),
	 (6,1,'2019-09-18'),
	 (6,1,'2019-09-25'),
	 (6,1,'2019-10-02'),
	 (6,1,'2019-10-09'),
	 (6,1,'2019-10-16'),
	 (6,1,'2019-10-23'),
	 (6,1,'2019-10-30'),
	 (6,1,'2019-11-06');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (6,1,'2019-11-13'),
	 (6,1,'2019-11-20'),
	 (6,1,'2019-11-27'),
	 (6,1,'2019-12-04'),
	 (6,1,'2019-09-13'),
	 (6,1,'2019-09-20'),
	 (6,1,'2019-09-27'),
	 (6,1,'2019-10-04'),
	 (6,1,'2019-10-11'),
	 (6,1,'2019-10-18');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (6,1,'2019-10-25'),
	 (6,1,'2019-11-01'),
	 (6,1,'2019-11-08'),
	 (6,1,'2019-11-15'),
	 (6,1,'2019-11-22'),
	 (6,1,'2019-11-29'),
	 (6,1,'2019-12-06'),
	 (6,2,'2019-09-10'),
	 (6,2,'2019-09-11'),
	 (6,2,'2019-09-17');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (6,2,'2019-09-18'),
	 (6,2,'2019-09-24'),
	 (6,2,'2019-09-25'),
	 (6,2,'2019-10-01'),
	 (6,2,'2019-10-02'),
	 (6,2,'2019-10-08'),
	 (6,2,'2019-10-09'),
	 (6,2,'2019-10-15'),
	 (6,2,'2019-10-16'),
	 (6,2,'2019-10-22');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (6,2,'2019-10-23'),
	 (6,2,'2019-10-29'),
	 (6,2,'2019-10-30'),
	 (6,2,'2019-11-05'),
	 (6,2,'2019-11-06'),
	 (6,2,'2019-11-12'),
	 (6,2,'2019-11-13'),
	 (6,2,'2019-11-19'),
	 (6,2,'2019-11-20'),
	 (6,2,'2019-11-26');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (6,2,'2019-11-27'),
	 (6,2,'2019-12-03'),
	 (6,2,'2019-12-04'),
	 (7,3,'2019-09-09'),
	 (7,3,'2019-09-16'),
	 (7,3,'2019-09-23'),
	 (7,3,'2019-09-30'),
	 (7,3,'2019-10-07'),
	 (7,3,'2019-10-14'),
	 (7,3,'2019-10-21');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (7,3,'2019-10-28'),
	 (7,3,'2019-11-04'),
	 (7,3,'2019-11-11'),
	 (7,3,'2019-11-18'),
	 (7,3,'2019-11-25'),
	 (7,3,'2019-12-02'),
	 (7,3,'2019-09-12'),
	 (7,3,'2019-09-19'),
	 (7,3,'2019-09-26'),
	 (7,3,'2019-10-03');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (7,3,'2019-10-10'),
	 (7,3,'2019-10-17'),
	 (7,3,'2019-10-24'),
	 (7,3,'2019-10-31'),
	 (7,3,'2019-11-14'),
	 (7,3,'2019-11-21'),
	 (7,3,'2019-11-28'),
	 (7,3,'2019-12-05'),
	 (10,4,'2019-09-10'),
	 (10,4,'2019-09-17');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (10,4,'2019-10-01'),
	 (10,4,'2019-10-15'),
	 (10,4,'2019-10-22'),
	 (10,4,'2019-10-29'),
	 (10,4,'2019-11-12'),
	 (10,4,'2019-11-19'),
	 (10,4,'2019-12-03'),
	 (1,7,'2020-01-27'),
	 (1,7,'2020-02-03'),
	 (1,7,'2020-02-10');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (1,7,'2020-02-17'),
	 (1,7,'2020-02-24'),
	 (1,7,'2020-03-02'),
	 (1,7,'2020-03-09'),
	 (1,7,'2020-03-16'),
	 (1,7,'2020-03-23'),
	 (1,7,'2020-03-30'),
	 (1,7,'2020-04-06'),
	 (1,7,'2020-04-13'),
	 (1,7,'2020-04-20');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (1,7,'2020-01-29'),
	 (1,7,'2020-02-05'),
	 (1,7,'2020-02-12'),
	 (1,7,'2020-02-19'),
	 (1,7,'2020-02-26'),
	 (1,7,'2020-03-04'),
	 (1,7,'2020-03-11'),
	 (1,7,'2020-03-18'),
	 (1,7,'2020-03-25'),
	 (1,7,'2020-04-01');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (1,7,'2020-04-08'),
	 (1,7,'2020-04-15'),
	 (1,7,'2020-04-22'),
	 (1,7,'2020-01-31'),
	 (1,7,'2020-02-07'),
	 (1,7,'2020-02-14'),
	 (1,7,'2020-02-21'),
	 (1,7,'2020-02-28'),
	 (1,7,'2020-03-06'),
	 (1,7,'2020-03-13');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (1,7,'2020-03-20'),
	 (1,7,'2020-03-27'),
	 (1,7,'2020-04-03'),
	 (1,7,'2020-04-10'),
	 (1,7,'2020-04-17'),
	 (1,7,'2020-04-24'),
	 (10,5,'2020-01-27'),
	 (10,5,'2020-02-03'),
	 (10,5,'2020-02-10'),
	 (10,5,'2020-02-17');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (10,5,'2020-02-24'),
	 (10,5,'2020-03-02'),
	 (10,5,'2020-03-09'),
	 (10,5,'2020-03-16'),
	 (10,5,'2020-03-23'),
	 (10,5,'2020-03-30'),
	 (10,5,'2020-04-06'),
	 (10,5,'2020-04-13'),
	 (10,5,'2020-04-20'),
	 (10,5,'2020-01-29');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (10,5,'2020-02-05'),
	 (10,5,'2020-02-12'),
	 (10,5,'2020-02-19'),
	 (10,5,'2020-02-26'),
	 (10,5,'2020-03-04'),
	 (10,5,'2020-03-11'),
	 (10,5,'2020-03-18'),
	 (10,5,'2020-03-25'),
	 (10,5,'2020-04-01'),
	 (10,5,'2020-04-08');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (10,5,'2020-04-15'),
	 (10,5,'2020-04-22'),
	 (10,10,'2020-01-30'),
	 (10,10,'2020-02-06'),
	 (10,10,'2020-02-13'),
	 (10,10,'2020-02-20'),
	 (10,10,'2020-02-27'),
	 (10,10,'2020-03-05'),
	 (10,10,'2020-03-12'),
	 (10,10,'2020-03-19');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (10,10,'2020-03-26'),
	 (10,10,'2020-04-02'),
	 (10,10,'2020-04-09'),
	 (10,10,'2020-04-16'),
	 (10,10,'2020-04-23'),
	 (10,10,'2020-01-31'),
	 (10,10,'2020-02-07'),
	 (10,10,'2020-02-14'),
	 (10,10,'2020-02-21'),
	 (10,10,'2020-02-28');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (10,10,'2020-03-06'),
	 (10,10,'2020-03-13'),
	 (10,10,'2020-03-20'),
	 (10,10,'2020-03-27'),
	 (10,10,'2020-04-03'),
	 (10,10,'2020-04-10'),
	 (10,10,'2020-04-17'),
	 (10,10,'2020-04-24'),
	 (13,7,'2020-01-27'),
	 (13,7,'2020-02-03');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (13,7,'2020-02-10'),
	 (13,7,'2020-02-17'),
	 (13,7,'2020-02-24'),
	 (13,7,'2020-03-02'),
	 (13,7,'2020-03-09'),
	 (13,7,'2020-03-16'),
	 (13,7,'2020-03-23'),
	 (13,7,'2020-03-30'),
	 (13,7,'2020-04-06'),
	 (13,7,'2020-04-13');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (13,7,'2020-04-20'),
	 (13,7,'2020-01-29'),
	 (13,7,'2020-02-05'),
	 (13,7,'2020-02-12'),
	 (13,7,'2020-02-19'),
	 (13,7,'2020-02-26'),
	 (13,7,'2020-03-04'),
	 (13,7,'2020-03-11'),
	 (13,7,'2020-03-18'),
	 (13,7,'2020-03-25');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (13,7,'2020-04-01'),
	 (13,7,'2020-04-08'),
	 (13,7,'2020-04-15'),
	 (13,7,'2020-04-22'),
	 (13,7,'2020-01-31'),
	 (13,7,'2020-02-07'),
	 (13,7,'2020-02-14'),
	 (13,7,'2020-02-21'),
	 (13,7,'2020-02-28'),
	 (13,7,'2020-03-06');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (13,7,'2020-03-13'),
	 (13,7,'2020-03-20'),
	 (13,7,'2020-03-27'),
	 (13,7,'2020-04-03'),
	 (13,7,'2020-04-10'),
	 (13,7,'2020-04-17'),
	 (13,7,'2020-04-24'),
	 (13,8,'2020-01-27'),
	 (13,8,'2020-02-03'),
	 (13,8,'2020-02-10');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (13,8,'2020-02-17'),
	 (13,8,'2020-03-02'),
	 (13,8,'2020-03-09'),
	 (13,8,'2020-03-23'),
	 (13,8,'2020-03-30'),
	 (13,8,'2020-04-06'),
	 (13,8,'2020-04-13'),
	 (13,8,'2020-01-28'),
	 (13,8,'2020-02-04'),
	 (13,8,'2020-02-18');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (13,8,'2020-02-25'),
	 (13,8,'2020-03-03'),
	 (13,8,'2020-03-17'),
	 (13,8,'2020-03-31'),
	 (13,8,'2020-04-07'),
	 (13,8,'2020-04-21'),
	 (13,10,'2020-01-30'),
	 (13,10,'2020-02-06'),
	 (13,10,'2020-02-13'),
	 (13,10,'2020-02-20');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (13,10,'2020-02-27'),
	 (13,10,'2020-03-05'),
	 (13,10,'2020-03-12'),
	 (13,10,'2020-03-19'),
	 (13,10,'2020-03-26'),
	 (13,10,'2020-04-02'),
	 (13,10,'2020-04-09'),
	 (13,10,'2020-04-16'),
	 (13,10,'2020-04-23'),
	 (13,10,'2020-02-07');
INSERT INTO public.course_attendance (student_id,schedule_id,attend_dt) VALUES
	 (13,10,'2020-02-14'),
	 (13,10,'2020-02-21'),
	 (13,10,'2020-02-28'),
	 (13,10,'2020-03-13'),
	 (13,10,'2020-03-20'),
	 (13,10,'2020-03-27'),
	 (13,10,'2020-04-03'),
	 (13,10,'2020-04-10'),
	 (13,10,'2020-04-17'),
	 (13,10,'2020-04-24');