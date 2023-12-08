--1
CREATE TRIGGER check_age
ON films
AFTER INSERT
AS
BEGIN
  IF (SELECT film_age_restriction FROM inserted) < 18
  BEGIN
    RAISERROR ('User must be at least 18 years old', 16, 1);
    ROLLBACK TRANSACTION;
  END
END;

--2
CREATE TRIGGER check_status
ON rooms
AFTER UPDATE
AS
BEGIN
  IF (SELECT room_status FROM inserted) = 'True' AND (SELECT room_status FROM deleted) != 'False'
  BEGIN
    RAISERROR ('Order status cannot be changed to delivered unless it is shipped', 16, 1);
    ROLLBACK TRANSACTION;
  END
END;

--3
CREATE TRIGGER check_category_delete
ON tickets
AFTER DELETE
AS
BEGIN
  IF EXISTS (SELECT * FROM tickets d JOIN films p ON ticket_id = p.film_id)
  BEGIN
    RAISERROR ('Cannot delete category with associated products', 16, 1);
    ROLLBACK TRANSACTION;
  END
END;


--4
CREATE TRIGGER check_review_rating
ON tickets
AFTER INSERT
AS
BEGIN
  IF (SELECT ticket_cost FROM inserted) < 200 OR (SELECT ticket_cost FROM inserted) > 250
  BEGIN
    RAISERROR ('Ticket_cost must be between 200 and 250', 16, 1);
    ROLLBACK TRANSACTION;
  END
END;


--5
CREATE TRIGGER check_order_quantity
ON tickets
AFTER UPDATE
AS
BEGIN
  IF (SELECT count(*) FROM inserted) < 1
  BEGIN
    RAISERROR ('Quantity of item in order cannot be less than 1', 16, 1);
    ROLLBACK TRANSACTION;
  END
END;
