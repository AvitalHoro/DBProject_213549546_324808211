CREATE OR REPLACE PROCEDURE update_book_status_and_orders IS
  CURSOR c_book_copies IS
    SELECT copyCode, BookID, status FROM bookCopyInStock WHERE status = 'Available';
  
  v_book_copy_record c_book_copies%ROWTYPE;
  v_order_count INT := 0;

  TYPE t_reader_order IS RECORD (
    readerOrderId bookOrdering.readerOrderId%TYPE,
    readerNumber reader.readerNumber%TYPE
  );

  CURSOR c_reader_orders IS
    SELECT bo.readerOrderId, r.readerNumber
    FROM bookOrdering bo
    JOIN reader r ON bo.readerNumber = r.readerNumber
    JOIN ordering o ON bo.orderId = o.orderId
    WHERE o.status = 'Pending';

  v_reader_order_record t_reader_order;
  
BEGIN
  -- Update book copy status
  OPEN c_book_copies;
  LOOP
    FETCH c_book_copies INTO v_book_copy_record;
    EXIT WHEN c_book_copies%NOTFOUND;
    
    UPDATE bookCopyInStock
    SET status = 'Checked Out'
    WHERE copyCode = v_book_copy_record.copyCode AND BookID = v_book_copy_record.BookID;
  END LOOP;
  CLOSE c_book_copies;

  -- Handle reader orders
  OPEN c_reader_orders;
  LOOP
    FETCH c_reader_orders INTO v_reader_order_record;
    EXIT WHEN c_reader_orders%NOTFOUND;
    
    -- Process each order (example: updating order status in ordering table)
    UPDATE ordering
    SET status = 'Processed'
    WHERE orderId = v_reader_order_record.readerOrderId;
    
    -- Record ramifications
    v_order_count := v_order_count + 1;
  END LOOP;
  CLOSE c_reader_orders;

  -- Print total number of orders processed
  DBMS_OUTPUT.PUT_LINE('Total orders processed: ' || v_order_count);
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No available book copies or pending reader orders found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
