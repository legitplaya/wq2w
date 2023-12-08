--1

CREATE TRIGGER LogTrigger
ON tickets
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO tickets(ticket_id, ticket_cost, ticket_data)
        VALUES ('YourTable', 'Insert/Update', GETDATE())
    END
    ELSE
    BEGIN
        INSERT INTO tickets(ticket_id, ticket_cost,ticket_data)
        VALUES ('YourTable', 'Delete', GETDATE())
    END
END

--2

CREATE TRIGGER UniqueValueTrigger
ON tickets
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT ticket_id, COUNT(*) FROM tickets GROUP BY ticket_id HAVING COUNT(*) > 1)
    BEGIN
        RAISERROR ('Duplicate values are not allowed', 16, 1)
        ROLLBACK TRANSACTION
    END
END

--3

CREATE TRIGGER UpdateTimestampTrigger
ON tickets
AFTER UPDATE
AS
BEGIN
    UPDATE tickets
    SET ticket_data = GETDATE()
    FROM tickets
    INNER JOIN rooms ON ticket_id = customer_id
END
