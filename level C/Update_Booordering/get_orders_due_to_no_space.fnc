CREATE OR REPLACE FUNCTION get_orders_due_to_no_space (
    p_classid IN NUMBER
) RETURN SYS_REFCURSOR IS
    ref_cursor SYS_REFCURSOR;
BEGIN
    OPEN ref_cursor FOR
    SELECT bo.readerOrderID, r.readerName, r.phone
    FROM bookOrdering bo
    JOIN book b ON bo.bookID = b.bookID
    JOIN bookClass bc ON b.classID = bc.classID
    JOIN reader r ON bo.readerNumber = r.readerNumber
    WHERE bo.orderID IS NULL
    AND bc.classid = p_classid;

    RETURN ref_cursor;
END get_orders_due_to_no_space;
/
