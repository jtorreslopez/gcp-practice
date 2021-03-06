USE mydb;

CREATE TABLE PROCESADOR (
    MODELO VARCHAR(100) NOT NULL PRIMARY KEY,
    MARCA VARCHAR(100),
    SOCKET VARCHAR(100),
    FRECUENCIA_BASE DECIMAL(2,1),
    FRECUENCIA_TURBO DECIMAL(2,1),
    TDP INT,
    NUCLEOS_FISICOS INT,
    NUCLEOS_LOGICOS INT,
    PRECIO_DOLARES INT );
INSERT INTO PROCESADOR (MODELO, MARCA, SOCKET, FRECUENCIA_BASE, FRECUENCIA_TURBO, TDP, NUCLEOS_FISICOS, NUCLEOS_LOGICOS, PRECIO_DOLARES)
VALUES ("RYZEN 3 3100", "AMD", "AM4", 3.6, 3.9, 65, 4, 8, 99);
INSERT INTO PROCESADOR (MODELO, MARCA, SOCKET, FRECUENCIA_BASE, FRECUENCIA_TURBO, TDP, NUCLEOS_FISICOS, NUCLEOS_LOGICOS, PRECIO_DOLARES)
VALUES ("RYZEN 3 3300X", "AMD", "AM4", 3.8, 4.3, 65, 4, 8, 110);
INSERT INTO PROCESADOR (MODELO, MARCA, SOCKET, FRECUENCIA_BASE, FRECUENCIA_TURBO, TDP, NUCLEOS_FISICOS, NUCLEOS_LOGICOS, PRECIO_DOLARES)
VALUES ("RYZEN 5 3600", "AMD", "AM4", 3.6, 4.2, 65, 6, 12, 160);
INSERT INTO PROCESADOR (MODELO, MARCA, SOCKET, FRECUENCIA_BASE, FRECUENCIA_TURBO, TDP, NUCLEOS_FISICOS, NUCLEOS_LOGICOS, PRECIO_DOLARES)
VALUES ("RYZEN 7 3700X", "AMD", "AM4", 3.6, 4.4, 65, 8, 16, 199);
INSERT INTO PROCESADOR (MODELO, MARCA, SOCKET, FRECUENCIA_BASE, FRECUENCIA_TURBO, TDP, NUCLEOS_FISICOS, NUCLEOS_LOGICOS, PRECIO_DOLARES)
VALUES ("RYZEN 9 3900X", "AMD", "AM4", 3.8, 4.6, 105, 12, 24, 350);
INSERT INTO PROCESADOR (MODELO, MARCA, SOCKET, FRECUENCIA_BASE, FRECUENCIA_TURBO, TDP, NUCLEOS_FISICOS, NUCLEOS_LOGICOS, PRECIO_DOLARES)
VALUES ("CORE I3-10300", "INTEL", "LGA 1200", 3.7, 4.4, 65, 4, 8, 120);
INSERT INTO PROCESADOR (MODELO, MARCA, SOCKET, FRECUENCIA_BASE, FRECUENCIA_TURBO, TDP, NUCLEOS_FISICOS, NUCLEOS_LOGICOS, PRECIO_DOLARES)
VALUES ("CORE I5-10500", "INTEL", "LGA 1200", 3.1, 4.5, 65, 6, 12, 236);
INSERT INTO PROCESADOR (MODELO, MARCA, SOCKET, FRECUENCIA_BASE, FRECUENCIA_TURBO, TDP, NUCLEOS_FISICOS, NUCLEOS_LOGICOS, PRECIO_DOLARES)
VALUES ("CORE I7-10700", "INTEL", "LGA 1200", 2.9, 4.8, 65, 8, 16, 329);
