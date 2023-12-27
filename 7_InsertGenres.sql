BEGIN
    insert_into_genre('Action');
    insert_into_genre('Adventure');
    insert_into_genre('Comedy');
    insert_into_genre('Drama');
    insert_into_genre('Fantasy');
    insert_into_genre('Horror');
    insert_into_genre('Mystery');
    insert_into_genre('Romance');
    insert_into_genre('Sci-Fi');
    insert_into_genre('Thriller');
    insert_into_genre('Western');
    insert_into_genre('Animation');
    insert_into_genre('Family');
    insert_into_genre('Musical');
    insert_into_genre('Crime');
    insert_into_genre('Documentary');
    insert_into_genre('History');
    insert_into_genre('Sport');
    insert_into_genre('War');
    insert_into_genre('Biography');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into genre: ' || sqlerrm);
END;
/

SELECT
    *
FROM
    genre;
/

BEGIN
    -- Sample Data for Content Genre
    insert_into_content_genre(1, 1, NULL); -- Genre 1 for TV Show 1
    insert_into_content_genre(2, 2, NULL); -- Genre 2 for TV Show 1
    insert_into_content_genre(3, 2, NULL); -- Genre 3 for TV Show 2
    insert_into_content_genre(1, NULL, 1); -- Genre 1 for Movie 1
    insert_into_content_genre(2, NULL, 2); -- Genre 2 for Movie 2
    insert_into_content_genre(3, 3, NULL); -- Genre 3 for TV Show 3
    insert_into_content_genre(1, NULL, 3); -- Genre 1 for Movie 3
    insert_into_content_genre(4, 4, NULL); -- Genre 4 for TV Show 4
    insert_into_content_genre(2, NULL, 4); -- Genre 2 for Movie 4
    insert_into_content_genre(5, 5, NULL); -- Genre 5 for TV Show 5
    insert_into_content_genre(1, NULL, 5); -- Genre 1 for Movie 5
    insert_into_content_genre(3, 6, NULL); -- Genre 3 for TV Show 6
    insert_into_content_genre(4, NULL, 6); -- Genre 4 for Movie 6
    insert_into_content_genre(5, 8, NULL); -- Genre 5 for TV Show 8
    insert_into_content_genre(3, NULL, 8); -- Genre 3 for Movie 8
    insert_into_content_genre(1, NULL, 9); -- Genre 1 for Movie 9
    insert_into_content_genre(4, 10, NULL); -- Genre 4 for TV Show 10
    insert_into_content_genre(2, NULL, 10); -- Genre 2 for Movie 10
    insert_into_content_genre(5, NULL, 11); -- Genre 5 for Movie 11
    insert_into_content_genre(3, 1, NULL); -- Genre 3 for TV Show 1
    insert_into_content_genre(4, NULL, 3); -- Genre 4 for Movie 3
    insert_into_content_genre(5, 2, NULL); -- Genre 5 for TV Show 2
    insert_into_content_genre(2, NULL, 7); -- Genre 2 for Movie 7
    insert_into_content_genre(3, NULL, 9); -- Genre 3 for Movie 9
    insert_into_content_genre(1, NULL, 2); -- Genre 1 for Movie 2
    insert_into_content_genre(2, NULL, 11); -- Genre 2 for Movie 11
    insert_into_content_genre(4, NULL, 12); -- Genre 4 for Movie 12
    insert_into_content_genre(1, 7, NULL); -- Genre 1 for TV Show 7
    insert_into_content_genre(3, NULL, 10); -- Genre 3 for Movie 10
    insert_into_content_genre(4, 9, NULL); -- Genre 4 for TV Show 9
    insert_into_content_genre(2, NULL, 5); -- Genre 2 for Movie 5
    insert_into_content_genre(5, 11, NULL); -- Genre 5 for TV Show 11
    insert_into_content_genre(1, NULL, 8); -- Genre 1 for Movie 8
    insert_into_content_genre(3, 10, NULL); -- Genre 3 for TV Show 10
    insert_into_content_genre(4, NULL, 13); -- Genre 4 for Movie 13
    insert_into_content_genre(2, NULL, 14); -- Genre 2 for Movie 14
    insert_into_content_genre(5, 12, NULL); -- Genre 5 for TV Show 12
    insert_into_content_genre(1, NULL, 15); -- Genre 1 for Movie 15
    insert_into_content_genre(3, 13, NULL); -- Genre 3 for TV Show 13
    insert_into_content_genre(4, NULL, 16); -- Genre 4 for Movie 16
    insert_into_content_genre(2, 14, NULL); -- Genre 2 for TV Show 14
    insert_into_content_genre(5, NULL, 17); -- Genre 5 for Movie 17
    insert_into_content_genre(1, 15, NULL); -- Genre 1 for TV Show 15
    insert_into_content_genre(3, NULL, 18); -- Genre 3 for Movie 18
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into content_genre: ' || sqlerrm);
END;
/

SELECT
    *
FROM
    content_genre;
/