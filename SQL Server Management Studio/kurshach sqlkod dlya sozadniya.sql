-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2023-10-21 09:38:53 MSK
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customers (
    customer_id    INTEGER NOT NULL,
    customer_name  VARCHAR
--  ERROR: VARCHAR2 size not specified 
    ,
    customer_age   VARCHAR
--  ERROR: VARCHAR2 size not specified 
                    
    );

ALTER TABLE customers ADD CONSTRAINT customers_pk PRIMARY KEY ( customer_id );

CREATE TABLE films (
    film_id               INTEGER NOT NULL,
    film_name             VARCHAR
--  ERROR: VARCHAR2 size not specified 
    ,
    film_age_restriction  VARCHAR
--  ERROR: VARCHAR2 size not specified 
                    
    );

ALTER TABLE films ADD CONSTRAINT films_pk PRIMARY KEY ( film_id );

CREATE TABLE relation_10 (
    tickets_ticket_id  INTEGER NOT NULL,
    rooms_room_id      INTEGER NOT NULL
);

ALTER TABLE relation_10 ADD CONSTRAINT relation_10_pk PRIMARY KEY ( tickets_ticket_id,
                                                                    rooms_room_id );

CREATE TABLE rooms (
    room_id      INTEGER NOT NULL,
    room_status  CHAR(1)
);

ALTER TABLE rooms ADD CONSTRAINT rooms_pk PRIMARY KEY ( room_id );

CREATE TABLE tickets (
    ticket_id              INTEGER NOT NULL,
    ticket_data            DATE,
    ticket_cost            VARCHAR
--  ERROR: VARCHAR2 size not specified 
    ,
    customers_customer_id  INTEGER NOT NULL,
    films_film_id          INTEGER NOT NULL,
    room_id                INTEGER NOT NULL,
--  ERROR: Datatype UNKNOWN is not allowed 
                    
    );

ALTER TABLE tickets ADD CONSTRAINT tickets_pk PRIMARY KEY ( ticket_id );

ALTER TABLE relation_10
    ADD CONSTRAINT relation_10_rooms_fk FOREIGN KEY ( rooms_room_id )
        REFERENCES rooms ( room_id );

ALTER TABLE relation_10
    ADD CONSTRAINT relation_10_tickets_fk FOREIGN KEY ( tickets_ticket_id )
        REFERENCES tickets ( ticket_id );

ALTER TABLE tickets
    ADD CONSTRAINT tickets_customers_fk FOREIGN KEY ( customers_customer_id )
        REFERENCES customers ( customer_id );

ALTER TABLE tickets
    ADD CONSTRAINT tickets_films_fk FOREIGN KEY ( films_film_id )
        REFERENCES films ( film_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   6
-- WARNINGS                                 0
