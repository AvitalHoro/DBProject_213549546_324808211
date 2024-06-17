CREATE OR REPLACE PROCEDURE process_order(p_order_id IN INT) IS
  -- Variables for storing data
  v_status VARCHAR2(20);
  v_book_id INT;
  v_reader_name VARCHAR2(20);
  v_highest_copy_code INT;
  v_inserted_count INT := 0; -- Counter for inserted book copies
  
  -- Cursor to get books in the order
  CURSOR c_books_in_order IS
    SELECT BookID
    FROM bookOrdering
    WHERE orderId = p_order_id;
  
   -- Cursor to get distinct readers who ordered books in the order
  CURSOR c_readers_for_order IS
    SELECT DISTINCT r.readerName
    FROM bookOrdering bo
    JOIN reader r ON bo.readerNumber = r.readerNumber
    WHERE bo.orderId = p_order_id;
    
  -- Exception handling
  e_order_not_found EXCEPTION;
  e_invalid_status EXCEPTION;
  e_no_books_ordered EXCEPTION;

BEGIN
  -- Step 1: Update the status of the order from 'Shipped' to 'received'
  SELECT status INTO v_status
  FROM ordering
  WHERE orderId = p_order_id;
  
  IF v_status <> 'Shipped' THEN
    DBMS_OUTPUT.PUT_LINE(v_status);
    RAISE e_invalid_status;
  END IF;
  
  UPDATE ordering
  SET status = 'Delivered'
  WHERE orderId = p_order_id;
  
  DBMS_OUTPUT.PUT_LINE('Step 1: Order status updated to Delivered.');
  
  -- Step 2: Add a copy of each ordered book to the library with status 'Available'
  
  -- Get the highest copy code
  SELECT NVL(MAX(copyCode), 0) INTO v_highest_copy_code FROM bookCopyInStock;
  
 
  OPEN c_books_in_order;
  LOOP
    FETCH c_books_in_order INTO v_book_id;
    EXIT WHEN c_books_in_order%NOTFOUND;
    
    v_highest_copy_code := v_highest_copy_code + 1;
    
    INSERT INTO bookCopyInStock (copyCode, status, purchaseDate, BookID)
    VALUES (v_highest_copy_code, 'Available', SYSDATE, v_book_id);
    
    v_inserted_count := v_inserted_count + 1; -- Increment counter
    
  END LOOP;
  CLOSE c_books_in_order;
  
  DBMS_OUTPUT.PUT_LINE('Step 2: Added ' || v_inserted_count || ' copies of ordered books to the library.');
  
  -- Step 3: Print names of readers whose book orders were in the order
  OPEN c_readers_for_order;
  LOOP
      FETCH c_readers_for_order INTO v_reader_name;
      EXIT WHEN c_readers_for_order%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Reader Name: ' || v_reader_name);
    END LOOP;
    CLOSE c_readers_for_order;
  
  DBMS_OUTPUT.PUT_LINE('Step 3: Printed names of readers whose book orders were in the order.');
  
EXCEPTION
  WHEN e_order_not_found THEN
    DBMS_OUTPUT.PUT_LINE('Error: Order not found.');
  WHEN e_invalid_status THEN
    DBMS_OUTPUT.PUT_LINE('Error: Order status is not "Shipped".');
  WHEN e_no_books_ordered THEN
    DBMS_OUTPUT.PUT_LINE('Error: No books were ordered in this order.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END process_order;
/
