--------------------  Reports -----------------------------

--  Get the list of top 5 movies preferred by user --
DECLARE
    top_movies_cursor SYS_REFCURSOR;
    v_report_title VARCHAR2(100);
BEGIN
 SELECT 'Report showing the top movies added by user' INTO v_report_title FROM dual;
   DBMS_OUTPUT.PUT_LINE('Report Title: ' || v_report_title);
    top_movies_cursor := get_top_preferred_movies;
    DBMS_SQL.RETURN_RESULT(top_movies_cursor);
END;
/

--  Get the list of top 5 TV shows preferred by user --
DECLARE
    top_tv_shows_cursor SYS_REFCURSOR;
    v_report_title VARCHAR2(100);
BEGIN
 SELECT 'Report showing the top tv shows added by user' INTO v_report_title FROM dual;
   DBMS_OUTPUT.PUT_LINE('Report Title: ' || v_report_title);
    top_tv_shows_cursor := get_top_preferred_tv_shows;
    DBMS_SQL.RETURN_RESULT(top_tv_shows_cursor);
END;
/

--  Get the list of most liked genres by the user --
DECLARE
    most_liked_genres_cursor SYS_REFCURSOR;
    v_report_title VARCHAR2(100);
BEGIN
 SELECT 'Report showing the most liked genres' INTO v_report_title FROM dual;
   DBMS_OUTPUT.PUT_LINE('Report Title: ' || v_report_title);
    most_liked_genres_cursor := get_most_liked_genres;
    DBMS_SQL.RETURN_RESULT(most_liked_genres_cursor);
END;
/

--  Report for the Latest Movie released --
DECLARE
    latest_movie_info movie%ROWTYPE;
    v_report_title VARCHAR2(100);
BEGIN
    SELECT 'Report for the Latest Movie' INTO v_report_title FROM dual;
    DBMS_OUTPUT.PUT_LINE('Report Title: ' || v_report_title);

    latest_movie_info := get_latest_movie;

    IF latest_movie_info.id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Latest Movie Title: ' || latest_movie_info.movie_title);
        DBMS_OUTPUT.PUT_LINE('Release Year: ' || latest_movie_info.movie_release_yr);
        -- Add more details as needed
    ELSE
        DBMS_OUTPUT.PUT_LINE('No latest movie found.');
    END IF;
END;
/

DECLARE
    v_production_co_id production_co.id%TYPE := 2;
    v_total_shows NUMBER;
BEGIN
    v_total_shows := get_total_shows_by_company(v_production_co_id);
    DBMS_OUTPUT.PUT_LINE('Total Shows by Company (ID ' || v_production_co_id || '): ' || v_total_shows);
END;
/

DECLARE
    tv_show_id_param tv_show.id%TYPE := 3;
    genres_list VARCHAR2(200);
    episodes_count NUMBER;
BEGIN
    -- Get TV show genres
    genres_list := get_tv_show_genres(tv_show_id_param);

    -- Get number of episodes
    episodes_count := count_episodes(tv_show_id_param);

    -- Display the report
    DBMS_OUTPUT.PUT_LINE('TV Show ID: ' || tv_show_id_param);
    DBMS_OUTPUT.PUT_LINE('Number of Episodes: ' || episodes_count);
END;
/

DECLARE
    tv_show_id_param tv_show.id%TYPE := 3;

    episodes_count NUMBER;
BEGIN
    episodes_count := count_episodes(tv_show_id_param);

    DBMS_OUTPUT.PUT_LINE('TV Show ID: ' || tv_show_id_param);
    DBMS_OUTPUT.PUT_LINE('Number of Episodes: ' || episodes_count);
END;
/


-- Report for Recommended Content (TV Shows)
DECLARE
    -- Variables
    v_cursor SYS_REFCURSOR;

    -- Variables for cursor columns
    v_show_title tv_show.show_title%TYPE;
    v_show_desc  tv_show.show_desc%TYPE;
    v_cnt        NUMBER;

BEGIN
    -- Call the function to get the top 3 TV shows for the user
    v_cursor := get_top_tv_shows_for_user(3);
    
        
    -- Check if the cursor is empty
    IF v_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No recommendations available.');
    END IF;

    -- Fetch and display the results
    LOOP
        FETCH v_cursor INTO v_show_title, v_show_desc, v_cnt;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Show Title: ' || v_show_title || ', Description: ' || v_show_desc);
    END LOOP;

    -- Close the cursor
    CLOSE v_cursor;
END;
/

-- Report for Recommended Content (Movies)
DECLARE
    -- Variables
    v_cursor SYS_REFCURSOR;

    -- Variables for cursor columns
    v_movie_title movie.movie_title%TYPE;
    v_movie_desc  movie.movie_desc%TYPE;
    v_cnt        NUMBER;

BEGIN
    -- Call the function to get the top 3 Movies for the user
    v_cursor := get_top_movies_for_user(3);
    
        
    -- Check if the cursor is empty
    IF v_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No recommendations available.');
    END IF;

    -- Fetch and display the results
    LOOP
        FETCH v_cursor INTO v_movie_title, v_movie_desc, v_cnt;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Movie Title: ' || v_movie_title || ', Description: ' || v_movie_desc);
    END LOOP;

    -- Close the cursor
    CLOSE v_cursor;
END;
/