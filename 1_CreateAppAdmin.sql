set serveroutput on

DECLARE
    v_user_exists    NUMBER;
    v_user_connected NUMBER;
BEGIN
    -- Check if the user exists
    SELECT
        COUNT(*)
    INTO v_user_exists
    FROM
        all_users
    WHERE
        username = 'APP_ADMIN';
    
        -- Check if the user is already connected
    SELECT
        COUNT(*)
    INTO v_user_connected
    FROM
        v$session
    WHERE
        username = 'APP_ADMIN';

   -- Drop the user if it exists and not connected
    IF v_user_exists > 0 THEN
        IF v_user_connected = 0 THEN
            EXECUTE IMMEDIATE 'DROP USER APP_ADMIN CASCADE';
            dbms_output.put_line('User APP_ADMIN dropped.');
        ELSE
            dbms_output.put_line('User APP_ADMIN is already connected. Cannot drop user.');
            RETURN;
        END IF;
    ELSE
        dbms_output.put_line('User APP_ADMIN does not exist.');
    END IF;

    -- Create the user
    EXECUTE IMMEDIATE 'CREATE USER APP_ADMIN IDENTIFIED BY ApplicationAdmin2023#';

    -- Grant privileges to the user
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE, CREATE TABLE, CREATE VIEW, CREATE USER, DROP USER, CREATE SESSION, CREATE PROCEDURE, CREATE SEQUENCE, CREATE TRIGGER TO APP_ADMIN WITH ADMIN OPTION'
    ;
    
    -- Grant SELECT privilege on dba_users to APP_ADMIN
    EXECUTE IMMEDIATE 'GRANT SELECT ON dba_users TO APP_ADMIN';

    -- Set quota on the user's tablespace
    EXECUTE IMMEDIATE 'ALTER USER APP_ADMIN QUOTA 10M ON DATA';
    dbms_output.put_line('User APP_ADMIN created with privileges.');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || sqlerrm);
        COMMIT;
END;
/