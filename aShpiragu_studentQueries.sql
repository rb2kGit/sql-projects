--select 
--    a.stud_lname || ', ' || a.stud_fname as stud_name,
--    a.stud_number,
--    a.stud_salutation
--from student a
--join student b on a.stud_lname = b.stud_lname
--where a.stud_fname <> b.stud_fname;

--select
--    s.stud_lname || ', ' || s.stud_fname student_name,
--    s.stud_number,
--    s.hall_number
--from student s
--join address a on s.stud_postal_code = a.postal_code
--where lower(a.place_name) like '%toronto%'
--and s.prog_number = 'BSC2';

--select
--    p.prog_name
--from program p
--join program_structure s on p.prog_number = s.ps_prog_number
--where s.ps_course_code <> 'EN101'
--group by p.prog_name;

--select
--    p.prog_name,
--    c.crs_name
--from program p
--join program_structure ps on ps.ps_prog_number = p.prog_number
--join course c on c.crs_code = ps.ps_course_code
--order by p.prog_name;

--create view bsc4_view as
--select 
--    s.*,
--    'Bachelor of Science in Mathematics' as program_name,
--    h.hall_name as hall_name
--from student s
--join hall h on s.hall_number = h.hall_number;

--select * from bsc4_view;
