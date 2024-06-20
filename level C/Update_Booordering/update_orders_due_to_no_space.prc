CREATE OR REPLACE PROCEDURE update_orders_due_to_no_space (
    p_ref_cursor IN SYS_REFCURSOR
) IS
    TYPE t_order_record IS RECORD (
        readerOrderID bookOrdering.readerOrderID%TYPE,
        readerName reader.readerName%TYPE,
        phone reader.phone%TYPE
    );
    v_order_record t_order_record;
    v_updated_count NUMBER := 0;
BEGIN
    LOOP
        FETCH p_ref_cursor INTO v_order_record;
        EXIT WHEN p_ref_cursor%NOTFOUND;

        -- Update the status to 'notvalid'
        UPDATE bookOrdering
        SET isValid = 'notvalid'
        WHERE readerOrderID = v_order_record.readerOrderID;

        IF SQL%ROWCOUNT > 0 THEN
            v_updated_count := v_updated_count + 1;
            DBMS_OUTPUT.PUT_LINE('Reader Name: ' || v_order_record.readerName || ', Phone: ' || v_order_record.phone || ' Order Number: ' || v_order_record.readerOrderID);
        END IF;
    END LOOP;

    IF v_updated_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No rows have been updated.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Number of updated orders: ' || v_updated_count);
    END IF;

    CLOSE p_ref_cursor;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END update_orders_due_to_no_space;
/
