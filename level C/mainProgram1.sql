DECLARE
  v_class_name VARCHAR2(20) := 'Science'; -- Example class name
  v_book_cursor SYS_REFCURSOR;
  v_book_name book.BookName%TYPE;
  v_book_publisher book.bookPublisher%TYPE;
  v_author_name book.authorName%TYPE;
  v_publish_year book.publishYear%TYPE;
BEGIN
  -- Call the function to get books by class
  v_book_cursor := get_books_by_class(v_class_name);
  
  DBMS_OUTPUT.PUT_LINE('Books in class: ' || v_class_name);
  LOOP
    FETCH v_book_cursor INTO v_book_name, v_book_publisher, v_author_name, v_publish_year;
    EXIT WHEN v_book_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Book Name: ' || v_book_name || ', Publisher: ' || v_book_publisher || ', Author: ' || v_author_name || ', Year: ' || v_publish_year);
  END LOOP;
  CLOSE v_book_cursor;

  -- Call the procedure to update book status and handle orders
  update_book_status_and_orders;

  -- Indicate completion
  DBMS_OUTPUT.PUT_LINE('Book status update and order handling completed.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
