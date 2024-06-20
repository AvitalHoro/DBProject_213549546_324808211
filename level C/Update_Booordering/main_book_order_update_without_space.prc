CREATE OR REPLACE PROCEDURE main_book_order_update_without_space IS
    CURSOR c_departments IS
        SELECT classID
        FROM bookClass;
    
    v_classID bookClass.classID%TYPE;
    v_occupancy_percentage NUMBER;
    v_ref_cursor SYS_REFCURSOR;
    v_readerOrderID bookOrdering.readerOrderID%TYPE;
    v_readerName reader.readerName%TYPE;
    v_phone reader.phone%TYPE;
    v_order_updated_count NUMBER := 0;
BEGIN
    -- Iterate through each department
    FOR department IN c_departments LOOP
        v_classID := department.classID;
        
        v_occupancy_percentage := calculate_occupancy_percentage(v_classID);
        
        DBMS_OUTPUT.PUT_LINE('Department ' || v_classID || ' occupancy percentage: ' || v_occupancy_percentage);
        
        IF v_occupancy_percentage >= 98 THEN
            v_ref_cursor := get_orders_due_to_no_space(v_classID);
            
            -- Loop through the cursor and update orders
            LOOP
                FETCH v_ref_cursor INTO v_readerOrderID, v_readerName, v_phone;
                EXIT WHEN v_ref_cursor%NOTFOUND;
                
                UPDATE bookOrdering
                SET isValid = 'notvalid'
                WHERE readerOrderID = v_readerOrderID;
                
                v_order_updated_count := v_order_updated_count + 1;
                
                DBMS_OUTPUT.PUT_LINE('Reader Name: ' || v_readerName || ', Phone: ' || v_phone || ' Order Number: ' || v_readerOrderID);
            END LOOP;
            
            CLOSE v_ref_cursor;
        END IF;
    END LOOP;
    
    IF v_order_updated_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No orders were updated.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Number of updated orders: ' || v_order_updated_count);
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('I recommend that you perform this test once every 3 months.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK; 
END main_book_order_update_without_space;
/
