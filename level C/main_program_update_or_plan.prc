CREATE OR REPLACE PROCEDURE main_program_update_or_plan(
    p_action_type IN VARCHAR2,
    your_order_number IN NUMBER,
    your_monthly_budget IN NUMBER
) IS
    v_total_price NUMBER;
BEGIN
    -- Input validation for action type
    IF LOWER(p_action_type) NOT IN ('update', 'plan', 'update plan', 'plan update') THEN
        RAISE_APPLICATION_ERROR(-20003, 'Invalid action type: ' || p_action_type || '. Use "update", "plan", or "update plan".');
    END IF;

  

    DBMS_OUTPUT.PUT_LINE('Action Type: ' || p_action_type || ', Parameter: ' || your_order_number || your_monthly_budget);

    -- Decision-making based on action type
    IF LOWER(p_action_type) LIKE '%update%' THEN
      IF your_order_number IS NULL OR your_order_number < 1 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Invalid parameter: ' || TO_CHAR(your_order_number) || '. order number must be a positive number.');
    END IF;

        DBMS_OUTPUT.PUT_LINE('Preparing to process order with Order ID: ' || your_order_number);
        process_order(your_order_number);
        DBMS_OUTPUT.PUT_LINE('Order processed successfully for Order ID: ' || your_order_number);
    END IF;
    
    IF LOWER(p_action_type) LIKE '%plan%' THEN
        -- Input validation for parameter
    IF your_monthly_budget IS NULL OR your_monthly_budget < 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Invalid parameter: ' || TO_CHAR(your_monthly_budget) || '. Parameter must be a positive number or zero.');
    END IF;
        DBMS_OUTPUT.PUT_LINE('Calculating budget for the book orders with Budget Size: ' || your_monthly_budget);
        v_total_price := calculate_budget_for_book_orders(your_monthly_budget);
        DBMS_OUTPUT.PUT_LINE('Budget Calculated. Total price of books within budget: ' || v_total_price);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END main_program_update_or_plan;
/
