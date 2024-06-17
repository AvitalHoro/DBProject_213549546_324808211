CREATE OR REPLACE FUNCTION calculate_budget_for_book_orders (
  p_monthly_budget IN NUMBER
) RETURN NUMBER IS
  CURSOR c_unordered_books IS
    SELECT bo.readerOrderId, bo.BookID, b.BookName, b.bookPrice
    FROM bookOrdering bo
    JOIN book b ON bo.BookID = b.BookID
    WHERE bo.orderId IS NULL
    ORDER BY bo.readerOrderDate DESC;
  
  v_total_price NUMBER := 0;
  v_current_budget NUMBER := p_monthly_budget;
  v_book_count NUMBER := 0;
  v_total_books NUMBER := 0;
  v_book_percentage NUMBER;
  v_book_record c_unordered_books%ROWTYPE;
BEGIN
  FOR v_book_record IN c_unordered_books LOOP
    v_total_books := v_total_books + 1;
    
    IF v_book_record.bookPrice IS NULL THEN
      RAISE_APPLICATION_ERROR(-20001, 'Book price is not available for ' || v_book_record.BookName);
    END IF;
    
    IF v_current_budget >= v_book_record.bookPrice THEN
      v_current_budget := v_current_budget - v_book_record.bookPrice;
      v_total_price := v_total_price + v_book_record.bookPrice;
      v_book_count := v_book_count + 1;
      
      DBMS_OUTPUT.PUT_LINE('Book: ' || v_book_record.BookName || ' Price: ' || v_book_record.bookPrice);
    ELSE
      EXIT;
    END IF;
  END LOOP;

  v_book_percentage := (v_book_count / v_total_books) * 100;
  DBMS_OUTPUT.PUT_LINE('Total Price: ' || v_total_price);
  DBMS_OUTPUT.PUT_LINE('Percentage of books within budget: ' || v_book_percentage || '%');

  RETURN v_total_price;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No unordered books found.');
    RETURN 0;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
    RETURN 0;
END calculate_budget_for_book_orders;
/
