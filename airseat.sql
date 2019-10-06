CREATE TABLE "PASSENGER" (
  "ID" INT NOT NULL,
  "ID_USER" VARCHAR(45) NOT NULL,
  "PW" VARCHAR(45) NOT NULL,
  "EMAIL" VARCHAR(45) NOT NULL,
  "NAME" VARCHAR(45) NOT NULL,
  "AGE" INT NOT NULL,
  PRIMARY KEY ("ID"))
  
CREATE TABLE "ORDER" (
  "ID" INT NOT NULL,
  "ID_PASSENGER" INT NOT NULL,
  "ID_AIRCRAFT" INT NOT NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT "ID_PASSENGER"
    FOREIGN KEY ("ID_PASSENGER")
    REFERENCES "PASSENGER" ("ID")
    ON DELETE CASCADE,
  CONSTRAINT "ID_AIRCRAFT"
    FOREIGN KEY ("ID_AIRCRAFT")
    REFERENCES "AIRCRAFT" ("ID")
    ON DELETE CASCADE)

CREATE TABLE "AIRCRAFT" (
  "ID" INT NOT NULL,
  "DEPART_AIRPORT" VARCHAR(45) NOT NULL,
  "ARRIVE_AIRPORT" VARCHAR(45) NOT NULL,
  "DEPART_TIME" DATE NOT NULL,
  "ARRIVE_TIME" DATE NOT NULL,
  PRIMARY KEY ("ID"))

CREATE TABLE "SEAT" (
  "ID" INT NOT NULL,
  "ID_AIRCRAFT" INT NOT NULL,
  "SEAT_COL" VARCHAR(10) NOT NULL,
  "SEAT_NUM" INT NOT NULL,
  "SEAT_GRADE" INT NOT NULL,
  "RESERVATIED" CHAR(1) NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT "ID_AIRCRAFT_FK"
    FOREIGN KEY ("ID_AIRCRAFT")
    REFERENCES "AIRCRAFT" ("ID")
    ON DELETE CASCADE)