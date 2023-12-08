--1

CREATE FUNCTION dbo.cost2tickets
(
    @cost1ticket INT,
    @cost2ticket INT
)
RETURNS INT
AS
BEGIN
    DECLARE @cost varchar(50);
    SET @cost = @cost1ticket+ @cost2ticket;
    RETURN @cost;
END;


--2
CREATE FUNCTION dbo.film_id
(
    @film_id INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM tickets WHERE film_id= @film_id
);


--3
CREATE FUNCTION dbo.avgcost
(
    @cost VARCHAR(MAX)
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @avg FLOAT;
    DECLARE @count INT;
    SELECT @count = COUNT(ticket_cost) FROM tickets;
    SELECT @avg = SUM(ticket_cost) / @count FROM tickets;
    RETURN @avg;
END;

exec dbo.avgcost 55