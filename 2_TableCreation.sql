SET SERVEROUTPUT ON;

DECLARE
    v_table_name      user_constraints.table_name%TYPE;
    v_constraint_name user_constraints.constraint_name%TYPE;
BEGIN
  -- Loop over the constraints where the type is 'R' indicating a referential (foreign key) constraint
    FOR c IN (
        SELECT
            uc.table_name,
            uc.constraint_name
        FROM
            user_constraints uc
        WHERE
                uc.constraint_type = 'R'
            AND uc.table_name IN ( 'CONTENT_GENRE', 'EPISODE', 'FAVOURITE_CONTENT', 'MOVIE', 'TV_SHOW',
                                   'APP_USER', 'USER_PREFERENCE', 'PRODUCTION_CO', 'GENRE' )
    ) LOOP
        v_table_name := c.table_name;
        v_constraint_name := c.constraint_name;

    -- Construct the ALTER TABLE statement to drop the constraint
        EXECUTE IMMEDIATE 'ALTER TABLE '
                          || v_table_name
                          || ' DROP CONSTRAINT '
                          || v_constraint_name;

    -- Output the result
        dbms_output.put_line('Dropped constraint '
                             || v_constraint_name
                             || ' from table '
                             || v_table_name);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
    -- Output the error
        dbms_output.put_line('Error dropping constraints: ' || sqlerrm);
END;
/
-- Dropping User-Defined Sequences
DECLARE
    sql_statement VARCHAR2(4000);
BEGIN
    FOR s IN (
        SELECT
            sequence_name
        FROM
            user_sequences
        WHERE
            sequence_name NOT LIKE 'ISEQ$$%'
    ) LOOP
        sql_statement := 'DROP SEQUENCE ' || s.sequence_name;
        BEGIN
            EXECUTE IMMEDIATE sql_statement;
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('Failed to drop sequence: '
                                     || s.sequence_name
                                     || ' - Error: '
                                     || sqlerrm);
        END;

    END LOOP;
END;
/
-- Dropping Tables
BEGIN
    FOR i IN (
        WITH mytables AS (
            SELECT
                'PRODUCTION_CO' tname
            FROM
                dual
            UNION ALL
            SELECT
                'EPISODE'
            FROM
                dual
            UNION ALL
            SELECT
                'FAVORITE_CONTENT'
            FROM
                dual
            UNION ALL
            SELECT
                'CONTENT_GENRE'
            FROM
                dual
            UNION ALL
            SELECT
                'TV_SHOW'
            FROM
                dual
            UNION ALL
            SELECT
                'MOVIE'
            FROM
                dual
            UNION ALL
            SELECT
                'GENRE'
            FROM
                dual
            UNION ALL
            SELECT
                'APP_USER'
            FROM
                dual
            UNION ALL
            SELECT
                'USER_PREFERENCE'
            FROM
                dual
        )
        SELECT
            m.tname
        FROM
                 mytables m
            INNER JOIN user_tables o ON m.tname = o.table_name
    ) LOOP
        BEGIN
            dbms_output.put_line('Dropping table: ' || i.tname);
            EXECUTE IMMEDIATE 'DROP TABLE '
                              || i.tname
                              || ' CASCADE CONSTRAINTS';
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('Failed to drop table '
                                     || i.tname
                                     || ' - Error: '
                                     || sqlerrm);
        END;
    END LOOP;
END;
/

CREATE SEQUENCE content_genre_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE TABLE content_genre (
    id         NUMBER(9) DEFAULT content_genre_seq.NEXTVAL NOT NULL,
    genre_id   NUMBER(9) NOT NULL,
    tv_show_id NUMBER(9),
    movie_id   NUMBER(9),
    CONSTRAINT content_genre_pk PRIMARY KEY ( id ),
    CONSTRAINT content_genre_ck_1 CHECK ( ( tv_show_id IS NOT NULL
                                            AND movie_id IS NULL )
                                          OR ( tv_show_id IS NULL
                                               AND movie_id IS NOT NULL ) ),
    CONSTRAINT unique_genre_tvshow_movie_combination UNIQUE ( genre_id,
                                                              tv_show_id,
                                                              movie_id )
);

CREATE SEQUENCE episode_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE TABLE episode (
    id            NUMBER(9) DEFAULT episode_seq.NEXTVAL NOT NULL,
    episode_title VARCHAR2(50) NOT NULL,
    episode_desc  VARCHAR2(250),
    season_no     NUMBER(4),
    episode_count NUMBER(3),
    tv_show_id    NUMBER(9) NOT NULL,
    CONSTRAINT episode_pk PRIMARY KEY ( id ),
    CONSTRAINT episode__un UNIQUE ( episode_title )
);

CREATE SEQUENCE favorite_content_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE TABLE favorite_content (
    id         NUMBER(9) DEFAULT favorite_content_seq.NEXTVAL NOT NULL,
    user_id    NUMBER(9) NOT NULL,
    tv_show_id NUMBER(9),
    movie_id   NUMBER(9),
    CONSTRAINT favorite_content_pk PRIMARY KEY ( id ),
    CONSTRAINT favorite_content_ck_1 CHECK ( ( tv_show_id IS NOT NULL
                                               AND movie_id IS NULL )
                                             OR ( tv_show_id IS NULL
                                                  AND movie_id IS NOT NULL ) ),
    CONSTRAINT unique_user_tvshow_movie_combination UNIQUE ( user_id,
                                                             tv_show_id,
                                                             movie_id )
);

CREATE SEQUENCE genre_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE TABLE genre (
    id         NUMBER(9) DEFAULT genre_seq.NEXTVAL NOT NULL,
    genre_name VARCHAR2(30) NOT NULL,
    CONSTRAINT genre_pk PRIMARY KEY ( id ),
    CONSTRAINT genre__un UNIQUE ( genre_name )
);

CREATE SEQUENCE movie_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE TABLE movie (
    id                     NUMBER(9) DEFAULT movie_seq.NEXTVAL NOT NULL,
    movie_title            VARCHAR2(30) NOT NULL,
    movie_desc             VARCHAR2(250),
    movie_release_yr       NUMBER(4) NOT NULL,
    movie_explicit_content CHAR(1),
    production_co_id       NUMBER(9) NOT NULL,
    CONSTRAINT movie_pk PRIMARY KEY ( id ),
    CONSTRAINT movie__un UNIQUE ( movie_title )
);

CREATE SEQUENCE production_co_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE TABLE production_co (
    id           NUMBER(9) DEFAULT production_co_seq.NEXTVAL NOT NULL,
    company_name VARCHAR2(30) NOT NULL,
    headquarters VARCHAR2(50),
    CONSTRAINT production_co_pk PRIMARY KEY ( id ),
    CONSTRAINT production_co__un UNIQUE ( company_name,
                                          headquarters )
);

CREATE SEQUENCE tv_show_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE TABLE tv_show (
    id                    NUMBER(9) DEFAULT tv_show_seq.NEXTVAL NOT NULL,
    show_title            VARCHAR2(30) NOT NULL,
    show_desc             VARCHAR2(250),
    show_release_yr       NUMBER(4),
    show_explicit_content CHAR(1),
    season_count          NUMBER(4),
    production_co_id      NUMBER(9) NOT NULL,
    CONSTRAINT tv_show_pk PRIMARY KEY ( id ),
    CONSTRAINT tv_show__un UNIQUE ( show_title )
);

CREATE SEQUENCE app_user_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE TABLE app_user (
    id         NUMBER(9) DEFAULT app_user_seq.NEXTVAL NOT NULL,
    first_name VARCHAR2(30),
    last_name  VARCHAR2(30),
    username   VARCHAR2(50) NOT NULL,
    dob        DATE NOT NULL,
    email      VARCHAR2(50),
    CONSTRAINT app_user_pk PRIMARY KEY ( id ),
    CONSTRAINT app_user_un UNIQUE ( username,
                                    email )
);

CREATE SEQUENCE user_preference_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE TABLE user_preference (
    id       NUMBER(9) DEFAULT user_preference_seq.NEXTVAL NOT NULL,
    user_id  NUMBER(9) NOT NULL,
    genre_id NUMBER(9) NOT NULL,
    CONSTRAINT user_preference_pk PRIMARY KEY ( id ),
    CONSTRAINT unique_user_genre_combination UNIQUE ( user_id,
                                                      genre_id )
);

ALTER TABLE content_genre
    ADD CONSTRAINT content_genre_genre_fk FOREIGN KEY ( genre_id )
        REFERENCES genre ( id )
            ON DELETE CASCADE;

ALTER TABLE content_genre
    ADD CONSTRAINT content_genre_tv_fk FOREIGN KEY ( tv_show_id )
        REFERENCES tv_show ( id )
            ON DELETE CASCADE;

ALTER TABLE content_genre
    ADD CONSTRAINT content_genre_movie_fk FOREIGN KEY ( movie_id )
        REFERENCES movie ( id )
            ON DELETE CASCADE;

ALTER TABLE episode
    ADD CONSTRAINT episode_tv_show_fk FOREIGN KEY ( tv_show_id )
        REFERENCES tv_show ( id )
            ON DELETE CASCADE;

ALTER TABLE favorite_content
    ADD CONSTRAINT favorite_content_tv_fk FOREIGN KEY ( tv_show_id )
        REFERENCES tv_show ( id )
            ON DELETE CASCADE;

ALTER TABLE favorite_content
    ADD CONSTRAINT favorite_content_movie_fk FOREIGN KEY ( movie_id )
        REFERENCES movie ( id )
            ON DELETE CASCADE;

ALTER TABLE favorite_content
    ADD CONSTRAINT favorite_content_user_fk FOREIGN KEY ( user_id )
        REFERENCES app_user ( id )
            ON DELETE CASCADE;

ALTER TABLE tv_show
    ADD CONSTRAINT tv_show_production_co_fk FOREIGN KEY ( production_co_id )
        REFERENCES production_co ( id )
            ON DELETE SET NULL;

ALTER TABLE movie
    ADD CONSTRAINT movie_production_co_fk FOREIGN KEY ( production_co_id )
        REFERENCES production_co ( id )
            ON DELETE SET NULL;

ALTER TABLE user_preference
    ADD CONSTRAINT user_preference_genre_fk FOREIGN KEY ( genre_id )
        REFERENCES genre ( id );

COMMIT;