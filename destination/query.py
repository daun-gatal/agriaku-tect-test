class DestinationQuery:

    def __init__(self):
        self.query = """
        WITH total_student_per_week AS (
             SELECT EXTRACT(week FROM ca.attend_dt) - EXTRACT(week FROM s.start_dt) + 1::numeric AS week_id,
                e.semester AS semester_id,
                count(ca.student_id) AS total_student
               FROM agriaku.course_attendance ca
                 LEFT JOIN agriaku.schedule s ON ca.schedule_id = s.id
                 LEFT JOIN agriaku.enrollment e ON ca.student_id = e.student_id AND ca.schedule_id = e.schedule_id
              GROUP BY (EXTRACT(week FROM ca.attend_dt) - EXTRACT(week FROM s.start_dt) + 1::numeric), e.semester
            ), total_student_per_course AS (
             SELECT e.semester AS semester_id,
                EXTRACT(week FROM ca.attend_dt) - EXTRACT(week FROM s.start_dt) + 1::numeric AS week_id,
                c.name AS course_name,
                count(ca.student_id) AS count_student
               FROM agriaku.course_attendance ca
                 LEFT JOIN agriaku.schedule s ON ca.schedule_id = s.id
                 LEFT JOIN agriaku.course c ON s.course_id = c.id
                 LEFT JOIN agriaku.enrollment e ON ca.student_id = e.student_id AND ca.schedule_id = e.schedule_id
              GROUP BY e.semester, (EXTRACT(week FROM ca.attend_dt) - EXTRACT(week FROM s.start_dt) + 1::numeric), c.name
            )
         SELECT tc.semester_id,
            tc.week_id,
            tc.course_name,
            tc.count_student,
            tw.total_student,
            round(tc.count_student::numeric / tw.total_student::numeric * 100::numeric, 2) AS attendance_pct
           FROM total_student_per_course tc
             LEFT JOIN total_student_per_week tw ON tc.semester_id = tw.semester_id AND tc.week_id = tw.week_id
          ORDER BY tc.semester_id, tc.week_id;
          """