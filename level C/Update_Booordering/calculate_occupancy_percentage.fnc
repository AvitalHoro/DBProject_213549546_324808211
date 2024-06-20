CREATE OR REPLACE FUNCTION calculate_occupancy_percentage(p_classID IN INT) RETURN NUMBER IS
    stock_counter NUMBER := 0;
    ordering_counter NUMBER := 0;
    amount_books NUMBER := 0;
    v_maxAmount NUMBER;
BEGIN
    -- Count books in stock
    SELECT COALESCE(COUNT(*), 0) INTO stock_counter
    FROM bookCopyInStock bcs
    JOIN book b ON bcs.bookID = b.bookID
    JOIN bookClass bc ON b.classID = bc.classID
    WHERE bc.classID = p_classID;

    -- Count books in "Shipped" state
    SELECT COALESCE(COUNT(*), 0) INTO ordering_counter
    FROM ordering o
    JOIN bookOrdering bo ON o.orderID = bo.orderID
    JOIN book b ON bo.bookID = b.bookID
    JOIN bookClass bc ON b.classID = bc.classID
    WHERE bc.classID = p_classID AND o.status = 'Shipped';

    -- Get maxAmount for the department
    SELECT maxAmount INTO v_maxAmount
    FROM bookClass
    WHERE classID = p_classID;

    -- Calculate occupancy percentage
    amount_books := stock_counter + ordering_counter;
    IF amount_books > 0 THEN
        RETURN (amount_books / v_maxAmount) * 100;
    ELSE
        RETURN 0; 
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error calculating occupancy percentage: ' || SQLERRM);
        RETURN -1;
END calculate_occupancy_percentage;
/
