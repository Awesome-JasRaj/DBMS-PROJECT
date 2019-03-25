CREATE TABLE ROUTE (
    ID INT NOT NULL AUTO_INCREMENT,
    ORIGIN VARCHAR(20) NOT NULL,
    DESTINATION VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID))
    AUTO_INCREMENT=10;



CREATE TABLE BUS (
    ID INT NOT NULL AUTO_INCREMENT,
    ROUTE_ID INT NOT NULL,
    AC boolean NOT NULL,
    FARE int NOT NULL,
    DEPARTURE_TIME VARCHAR(25)  NOT NULL,
    ARRIVAL_TIME VARCHAR(25) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ROUTE_ID) REFERENCES  ROUTE (ID))
    AUTO_INCREMENT=200;


CREATE TABLE  PASSENGER (
    ID INT NOT NULL AUTO_INCREMENT,
    USERNAME VARCHAR(20) NOT NULL UNIQUE,
    PASSWORD VARCHAR(20) NOT NULL,
    NAME VARCHAR(40) NOT NULL,
    EMAIL VARCHAR(32) NOT NULL,
    MOBILE bigint NOT NULL,
    PRIMARY KEY (ID))
    AUTO_INCREMENT = 500;


CREATE TABLE RESERVE (
    ID INT NOT NULL AUTO_INCREMENT,
    PASSENGER_ID int NOT NULL,
    BUS_ID int NOT NULL,
    DATE DATE NOT NULL,
    TIMESTAMP DATE NOT NULL,
    SEAT int NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (PASSENGER_ID) REFERENCES  PASSENGER (ID),
    FOREIGN KEY (BUS_ID) REFERENCES  BUS (ID))
    AUTO_INCREMENT = 1000;

CREATE TABLE ADMIN( ID INT PRIMARY KEY, USERNAME VARCHAR(25) , PASSWORD VARCHAR(25), FOREIGN KEY(ID) REFERENCES PASSENGER(ID)  );


CREATE VIEW BUS_RESERVATION AS
    SELECT 
        reserve.id AS id,
        reserve.passenger_id AS passenger_id,
        reserve.bus_id AS bus_id,
        reserve.seat AS seat,
        reserve.DATE AS DATE,
        reserve.TIMESTAMP AS TIMESTAMP,
        route.ORIGIN AS ORIGIN,
        route.DESTINATION AS destination,
        bus.departure_time AS departure_time,
        bus.ARRIVAL_TIME AS arrival_time
    FROM
        ((reserve
        JOIN bus)
        JOIN route)
    WHERE
        ((reserve.bus_id = bus.id)
            AND (route.id = bus.route_id))
    ORDER BY reserve.id;