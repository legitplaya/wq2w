--1
CREATE PROCEDURE CreateRecord
    @param1 int,
    @param2 int
AS
BEGIN
    INSERT INTO tickets (customer_id, film_id)
    VALUES (@param1, @param2)
END

--2

CREATE PROCEDURE ReadRecord
    @id int
AS
BEGIN
    SELECT * FROM tickets
    WHERE ticket_id = @id
END

--3
CREATE PROCEDURE UpdateRecord
    @id int,
    @param1 varchar(50),
    @param2 varchar(50)
AS
BEGIN
    UPDATE tickets
    SET ticket_cost = @param1, customer_id = @param2
    WHERE customer_id = @id
END

--4
CREATE PROCEDURE DeleteRecord
    @id int
AS
BEGIN
    DELETE FROM tickets
    WHERE ticket_id = @id
END

--5
CREATE PROCEDURE ReadAllRecords
AS
BEGIN
    SELECT * FROM rooms
END

--6
CREATE PROCEDURE SearchRecords
    @searchTerm varchar(50)
AS
BEGIN
    SELECT * FROM tickets
    WHERE customer_id LIKE '%' + @searchTerm + '%' OR  ticket_id LIKE '%' + @searchTerm + '%'
END

--7
CREATE PROCEDURE UpdateRecordField
    @id int,
    @fieldName varchar(50),
    @fieldValue varchar(50)
AS
BEGIN
    UPDATE tickets
    SET @fieldName = @fieldValue
    WHERE ticket_id = @id
END