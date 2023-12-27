ALTER SESSION SET current_schema = app_admin;

SET SERVEROUTPUT ON;

BEGIN
    insert_appuser_pkg.insert_into_app_user('John', 'Doe', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 'john.doe@gmail.com');
    insert_appuser_pkg.insert_into_app_user('Jane', 'Smith', TO_DATE('1985-05-20', 'YYYY-MM-DD'), 'jane.smith@yahoo.com');
    insert_appuser_pkg.insert_into_app_user('Michael', 'Johnson', TO_DATE('1992-08-10', 'YYYY-MM-DD'), 'michael.j@example.com');
    insert_appuser_pkg.insert_into_app_user('Emily', 'Williams', TO_DATE('1988-03-25', 'YYYY-MM-DD'), 'emily.w@example.com');
    insert_appuser_pkg.insert_into_app_user('David', 'Brown', TO_DATE('1995-11-05', 'YYYY-MM-DD'), 'david.brown@hotmail.com');
    insert_appuser_pkg.insert_into_app_user('Jennifer', 'Taylor', TO_DATE('1982-07-12', 'YYYY-MM-DD'), 'jennifer.t@gmail.com');
    insert_appuser_pkg.insert_into_app_user('Christopher', 'Anderson', TO_DATE('1993-04-08', 'YYYY-MM-DD'), 'chris.a@example.com');
    insert_appuser_pkg.insert_into_app_user('Jessica', 'Thomas', TO_DATE('1991-09-18', 'YYYY-MM-DD'), 'jessica.t@gmail.com');
    insert_appuser_pkg.insert_into_app_user('Matthew', 'Moore', TO_DATE('1986-12-30', 'YYYY-MM-DD'), 'matt.m@hotmail.com');
    insert_appuser_pkg.insert_into_app_user('Ashley', 'Miller', TO_DATE('1984-02-14', 'YYYY-MM-DD'), 'ashley.m@example.com');
    insert_appuser_pkg.insert_into_app_user('Daniel', 'Clark', TO_DATE('1989-06-22', 'YYYY-MM-DD'), 'daniel.c@yahoo.com');
    insert_appuser_pkg.insert_into_app_user('Amanda', 'Walker', TO_DATE('1994-10-03', 'YYYY-MM-DD'), 'amanda.w@gmail.com');
    insert_appuser_pkg.insert_into_app_user('Brian', 'Perez', TO_DATE('1987-07-08', 'YYYY-MM-DD'), 'brian.p@hotmail.com');
    insert_appuser_pkg.insert_into_app_user('Olivia', 'Gonzalez', TO_DATE('1996-04-16', 'YYYY-MM-DD'), 'olivia.g@gmail.com');
    insert_appuser_pkg.insert_into_app_user('Ryan', 'Martinez', TO_DATE('1983-11-28', 'YYYY-MM-DD'), 'ryan.m@example.com');
    insert_appuser_pkg.insert_into_app_user('Megan', 'Hill', TO_DATE('1997-08-05', 'YYYY-MM-DD'), 'megan.h@gmail.com');
    insert_appuser_pkg.insert_into_app_user('Andrew', 'Wright', TO_DATE('1981-01-09', 'YYYY-MM-DD'), 'andrew.w@example.com');
    insert_appuser_pkg.insert_into_app_user('Lauren', 'Lopez', TO_DATE('1980-06-14', 'YYYY-MM-DD'), 'lauren.l@hotmail.com');
    insert_appuser_pkg.insert_into_app_user('Justin', 'Young', TO_DATE('1998-02-22', 'YYYY-MM-DD'), 'justin.y@gmail.com');
    insert_appuser_pkg.insert_into_app_user('Samantha', 'Harris', TO_DATE('1989-09-29', 'YYYY-MM-DD'), 'samantha.h@example.com');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into app_user: ' || sqlerrm);
END;
/

BEGIN
    insert_appuser_pkg.insert_into_user_preference(1, 1);
    insert_appuser_pkg.insert_into_user_preference(1, 2);
    insert_appuser_pkg.insert_into_user_preference(1, 3);

    insert_appuser_pkg.insert_into_user_preference(2, 4);
    insert_appuser_pkg.insert_into_user_preference(2, 5);
    insert_appuser_pkg.insert_into_user_preference(2, 6);

    insert_appuser_pkg.insert_into_user_preference(3, 7);
    insert_appuser_pkg.insert_into_user_preference(3, 8);
    insert_appuser_pkg.insert_into_user_preference(3, 9);

    insert_appuser_pkg.insert_into_user_preference(4, 10);
    insert_appuser_pkg.insert_into_user_preference(4, 11);
    insert_appuser_pkg.insert_into_user_preference(4, 12);

    insert_appuser_pkg.insert_into_user_preference(5, 13);
    insert_appuser_pkg.insert_into_user_preference(5, 14);
    insert_appuser_pkg.insert_into_user_preference(5, 15);

    insert_appuser_pkg.insert_into_user_preference(6, 16);
    insert_appuser_pkg.insert_into_user_preference(6, 17);
    insert_appuser_pkg.insert_into_user_preference(6, 18);

    insert_appuser_pkg.insert_into_user_preference(7, 19);
    insert_appuser_pkg.insert_into_user_preference(7, 20);
    insert_appuser_pkg.insert_into_user_preference(7, 1);

    insert_appuser_pkg.insert_into_user_preference(8, 2);
    insert_appuser_pkg.insert_into_user_preference(8, 3);
    insert_appuser_pkg.insert_into_user_preference(8, 4);

    insert_appuser_pkg.insert_into_user_preference(9, 5);
    insert_appuser_pkg.insert_into_user_preference(9, 6);
    insert_appuser_pkg.insert_into_user_preference(9, 7);

    insert_appuser_pkg.insert_into_user_preference(10, 8);
    insert_appuser_pkg.insert_into_user_preference(10, 9);
    insert_appuser_pkg.insert_into_user_preference(10, 10);

    insert_appuser_pkg.insert_into_user_preference(11, 11);
    insert_appuser_pkg.insert_into_user_preference(11, 12);
    insert_appuser_pkg.insert_into_user_preference(11, 13);

    insert_appuser_pkg.insert_into_user_preference(12, 14);
    insert_appuser_pkg.insert_into_user_preference(12, 15);
    insert_appuser_pkg.insert_into_user_preference(12, 16);

    insert_appuser_pkg.insert_into_user_preference(13, 17);
    insert_appuser_pkg.insert_into_user_preference(13, 18);
    insert_appuser_pkg.insert_into_user_preference(13, 19);

    insert_appuser_pkg.insert_into_user_preference(14, 20);
    insert_appuser_pkg.insert_into_user_preference(14, 1);
    insert_appuser_pkg.insert_into_user_preference(14, 2);

    insert_appuser_pkg.insert_into_user_preference(15, 3);
    insert_appuser_pkg.insert_into_user_preference(15, 4);
    insert_appuser_pkg.insert_into_user_preference(15, 5);

    insert_appuser_pkg.insert_into_user_preference(16, 6);
    insert_appuser_pkg.insert_into_user_preference(16, 7);
    insert_appuser_pkg.insert_into_user_preference(16, 8);

    insert_appuser_pkg.insert_into_user_preference(17, 9);
    insert_appuser_pkg.insert_into_user_preference(17, 10);
    insert_appuser_pkg.insert_into_user_preference(17, 11);

    insert_appuser_pkg.insert_into_user_preference(18, 12);
    insert_appuser_pkg.insert_into_user_preference(18, 13);
    insert_appuser_pkg.insert_into_user_preference(18, 14);

    insert_appuser_pkg.insert_into_user_preference(19, 15);
    insert_appuser_pkg.insert_into_user_preference(19, 16);
    insert_appuser_pkg.insert_into_user_preference(19, 17);

    insert_appuser_pkg.insert_into_user_preference(20, 18);
    insert_appuser_pkg.insert_into_user_preference(20, 19);
    insert_appuser_pkg.insert_into_user_preference(20, 20);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into user_preference: ' || sqlerrm);
END;
/

BEGIN
    insert_appuser_pkg.insert_into_favorite_content(1, 1, NULL); -- TV Show for user John Doe
    insert_appuser_pkg.insert_into_favorite_content(2, NULL, 1); -- Movie for user Jane Smith
    insert_appuser_pkg.insert_into_favorite_content(3, 2, NULL); -- TV Show for user Michael Johnson
    insert_appuser_pkg.insert_into_favorite_content(4, NULL, 2); -- Movie for user Emily Williams
    insert_appuser_pkg.insert_into_favorite_content(5, 3, NULL); -- TV Show for user David Brown
    insert_appuser_pkg.insert_into_favorite_content(6, NULL, 3); -- Movie for user Jennifer Taylor
    insert_appuser_pkg.insert_into_favorite_content(7, 4, NULL); -- TV Show for user Christopher Anderson
    insert_appuser_pkg.insert_into_favorite_content(8, NULL, 4); -- Movie for user Jessica Thomas
    insert_appuser_pkg.insert_into_favorite_content(9, 5, NULL); -- TV Show for user Matthew Moore
    insert_appuser_pkg.insert_into_favorite_content(10, NULL, 5); -- Movie for user Ashley Miller
    insert_appuser_pkg.insert_into_favorite_content(11, 6, NULL); -- TV Show for user Daniel Clark
    insert_appuser_pkg.insert_into_favorite_content(12, NULL, 6); -- Movie for user Amanda Walker
    insert_appuser_pkg.insert_into_favorite_content(13, 7, NULL); -- TV Show for user Brian Perez
    insert_appuser_pkg.insert_into_favorite_content(14, NULL, 7); -- Movie for user Olivia Gonzalez
    insert_appuser_pkg.insert_into_favorite_content(15, 8, NULL); -- TV Show for user Ryan Martinez
    insert_appuser_pkg.insert_into_favorite_content(16, NULL, 8); -- Movie for user Megan Hill
    insert_appuser_pkg.insert_into_favorite_content(17, 9, NULL); -- TV Show for user Andrew Wright
    insert_appuser_pkg.insert_into_favorite_content(18, NULL, 9); -- Movie for user Lauren Lopez
    insert_appuser_pkg.insert_into_favorite_content(19, 10, NULL); -- TV Show for user Justin Young
    insert_appuser_pkg.insert_into_favorite_content(20, NULL, 10); -- Movie for user Samantha Harris
    insert_appuser_pkg.insert_into_favorite_content(1, 2, NULL); -- Another TV Show
    insert_appuser_pkg.insert_into_favorite_content(1, NULL, 1); -- Movie
    insert_appuser_pkg.insert_into_favorite_content(2, NULL, 2); -- Another Movie
    insert_appuser_pkg.insert_into_favorite_content(2, 1, NULL); -- TV Show 
    insert_appuser_pkg.insert_into_favorite_content(3, NULL, 2); -- Movie
    insert_appuser_pkg.insert_into_favorite_content(3, NULL, 3); -- Another Movie
    
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into favorite_content: ' || sqlerrm);
END;
/