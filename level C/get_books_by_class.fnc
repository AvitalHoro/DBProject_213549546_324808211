CREATE OR REPLACE FUNCTION get_books_by_class(p_class_name IN VARCHAR2)
RETURN SYS_REFCURSOR
IS
  v_book_cursor SYS_REFCURSOR;
BEGIN
  OPEN v_book_cursor FOR
    SELECT b.BookName, b.bookPublisher, b.authorName, b.publishYear
    FROM book b
    JOIN bookClass bc ON b.classID = bc.classID
    WHERE bc.className = p_class_name;

  RETURN v_book_cursor;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'No books found for the given class name.');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'An unexpected error occurred.');
END;
