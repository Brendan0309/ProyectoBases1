-------------TABLE CREATION-------------
--Fixed Tables Section
--Parameter Tables
CREATE TABLE parameter(
    id_parameter NUMBER PRIMARY KEY,
    type VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10) 
);

CREATE OR REPLACE TRIGGER beforeInsertParameter
BEFORE INSERT
ON parameter
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertParameter;
/

CREATE OR REPLACE TRIGGER beforeUpdateParameter
BEFORE UPDATE
ON parameter
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateParameter;
/

--Log Tables
CREATE TABLE log(
    id_log NUMBER PRIMARY KEY,
    changetype VARCHAR2(50),
    changeDate DATE,
    oldValue NUMBER,
    newValue NUMBER,
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10) 
);

CREATE OR REPLACE TRIGGER beforeInsertLog
BEFORE INSERT
ON log
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertLog;
/

CREATE OR REPLACE TRIGGER beforeUpdateLog
BEFORE UPDATE
ON log
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateLog;
/

--Country tables
CREATE TABLE country (
    id_country NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertCountry
BEFORE INSERT
ON country
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertCountry;
/

CREATE OR REPLACE TRIGGER beforeUpdateCountry
BEFORE UPDATE
ON country
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateCountry;
/

--Province Tables
CREATE TABLE province(
    id_province NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_country NUMBER, 
    FOREIGN KEY (id_country) REFERENCES country(id_country)
);

CREATE OR REPLACE TRIGGER beforeInsertProvince
BEFORE INSERT
ON province
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertProvince;
/

CREATE OR REPLACE TRIGGER beforeUpdateProvince
BEFORE UPDATE
ON province
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateProvince;
/

--Canton tables
CREATE TABLE canton (
    id_canton NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_province NUMBER,
    FOREIGN KEY (id_province) REFERENCES province(id_province)
);

CREATE OR REPLACE TRIGGER beforeInsertCanton
BEFORE INSERT
ON canton
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertCanton;
/

CREATE OR REPLACE TRIGGER beforeUpdateCanton
BEFORE UPDATE
ON canton
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateCanton;
/

--District tables
CREATE TABLE district (
    id_district NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_canton NUMBER,
    FOREIGN KEY (id_canton) REFERENCES canton(id_canton)
);

CREATE OR REPLACE TRIGGER beforeInsertDistrict
BEFORE INSERT
ON district
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertDistrict;
/

CREATE OR REPLACE TRIGGER beforeUpdateDistrict
BEFORE UPDATE
ON district
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateDistrict;
/

--Entity Tables Section
--State Tables
CREATE TABLE state (
    id_state NUMBER PRIMARY KEY,
    description VARCHAR(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertState
BEFORE INSERT
ON state
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertState;
/

CREATE OR REPLACE TRIGGER beforeUpdateState
BEFORE UPDATE
ON state
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateState;
/

--Entity Tables
CREATE TABLE entity (
    id_entity NUMBER PRIMARY KEY,
    code NUMBER,
    phone NUMBER,
    description VARCHAR(50),
    name VARCHAR(50),
    email VARCHAR(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_state NUMBER,
    id_district NUMBER, 
    FOREIGN KEY (id_state) REFERENCES state(id_state),
    FOREIGN KEY (id_district) REFERENCES district(id_district)
);

CREATE OR REPLACE TRIGGER beforeInsertEntity
BEFORE INSERT
ON entity
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertEntity;
/

CREATE OR REPLACE TRIGGER beforeUpdateEntity
BEFORE UPDATE
ON entity
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateEntity;
/

--User Tables Section
--Gender Tables
CREATE TABLE gender (
    id_gender NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertGender
BEFORE INSERT
ON gender
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertGender;
/

CREATE OR REPLACE TRIGGER beforeUpdateGender
BEFORE UPDATE
ON gender
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateGender;
/

--Usertype Tables
CREATE TABLE usertype (
    id_usertype NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertUsertype
BEFORE INSERT
ON usertype
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertUsertype;
/

CREATE OR REPLACE TRIGGER beforeUpdateUsertype
BEFORE UPDATE
ON usertype
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateUsertype;
/

--SysUser Tables
CREATE TABLE sysuser (
    id_user NUMBER PRIMARY KEY,
    phone NUMBER,
    termsAndConditions VARCHAR2(50),
    photo VARCHAR2(50), --Ni idea de que tipo ponerle
    dateBirth DATE,
    firstName VARCHAR2(50) CONSTRAINT user_firstName_nn NOT NULL,
    secondName VARCHAR2(50) CONSTRAINT user_secondName_nn NOT NULL,
    firstLastName VARCHAR2(50) CONSTRAINT user_firstLastName_nn NOT NULL,
    secondLastName VARCHAR2(50) CONSTRAINT user_secondLastName_nn NOT NULL,
    email VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_gender NUMBER, 
    id_usertype NUMBER, 
    id_entity NUMBER,
    FOREIGN KEY (id_gender) REFERENCES gender(id_gender),
    FOREIGN KEY (id_usertype) REFERENCES usertype(id_usertype),
    FOREIGN KEY (id_entity) REFERENCES entity(id_entity)
);

CREATE OR REPLACE TRIGGER beforeInsertUser
BEFORE INSERT
ON sysuser
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertUser;
/

CREATE OR REPLACE TRIGGER beforeUpdateUser
BEFORE UPDATE
ON sysuser
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateUser;
/

--Identification Tables
CREATE TABLE identification (
    id_identification NUMBER PRIMARY KEY,
    type VARCHAR2(50),
    value_identification NUMBER,
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_user NUMBER,
    FOREIGN KEY (id_user) REFERENCES sysuser(id_user)
);

CREATE OR REPLACE TRIGGER beforeInsertIdentification
BEFORE INSERT
ON identification
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertIdentification;
/

CREATE OR REPLACE TRIGGER beforeUpdateIdentification
BEFORE UPDATE
ON identification
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateIdentification;
/

--Contact Tables
CREATE TABLE contact (
    id_contact NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_user,
    FOREIGN KEY (id_user) REFERENCES sysuser(id_user)
);

CREATE OR REPLACE TRIGGER beforeInsertContact
BEFORE INSERT
ON contact
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertContact;
/

CREATE OR REPLACE TRIGGER beforeUpdateContact
BEFORE UPDATE
ON contact
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateContact;
/

--Collection Center Section
--Bill Tables
CREATE TABLE bill (
    id_bill NUMBER PRIMARY KEY,
    description VARCHAR(100),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_user NUMBER,
    FOREIGN KEY (id_user) REFERENCES sysuser(id_user)
);

CREATE OR REPLACE TRIGGER beforeInsertBill
BEFORE INSERT
ON bill
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertContact;
/

CREATE OR REPLACE TRIGGER beforeUpdateBill
BEFORE UPDATE
ON bill
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateContact;
/

--Collection Center Tables
CREATE TABLE collectioncenter (
    id_collectioncenter NUMBER PRIMARY KEY,
    currency NUMBER,
    catalogue VARCHAR(100),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_bill NUMBER,
    id_entity NUMBER,
    FOREIGN KEY (id_bill) REFERENCES bill(id_bill),
    FOREIGN KEY (id_entity) REFERENCES entity(id_entity)
);

CREATE OR REPLACE TRIGGER beforeInsertCCenter
BEFORE INSERT
ON collectioncenter
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertContact;
/

CREATE OR REPLACE TRIGGER beforeUpdateCCenter
BEFORE UPDATE
ON collectioncenter
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateCCenter;
/

--Recycable Type Tables
CREATE TABLE recycabletype (
    id_recycabletype NUMBER PRIMARY KEY,
    type VARCHAR2(50),
    name VARCHAR2(50),
    points NUMBER,
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertRecycabletype
BEFORE INSERT
ON recycabletype
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertRecycabletype;
/

CREATE OR REPLACE TRIGGER beforeUpdateRecycabletype
BEFORE UPDATE
ON recycabletype
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateRecycabletype;
/

--Category Tables
CREATE TABLE category (
    id_category NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_recycabletype NUMBER,
    FOREIGN KEY (id_recycabletype) REFERENCES recycabletype(id_recycabletype)
);

CREATE OR REPLACE TRIGGER beforeInsertCategory
BEFORE INSERT
ON category
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertCategory;
/

CREATE OR REPLACE TRIGGER beforeUpdateCategory
BEFORE UPDATE
ON category
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateCategory;
/

--Unit Section
--Money tables
CREATE TABLE money (
    id_money NUMBER PRIMARY KEY,
    value NUMBER,
    amount NUMBER,
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertMoney
BEFORE INSERT
ON money
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertMoney;
/

CREATE OR REPLACE TRIGGER beforeUpdateMoney
BEFORE UPDATE
ON money
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateMoney;
/

--Unit Tables
CREATE TABLE unit (
    id_unit NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
    id_money NUMBER,
    id_bill NUMBER, 
    id_entity NUMBER,
    FOREIGN KEY (id_money) REFERENCES money(id_money),
    FOREIGN KEY (id_bill) REFERENCES bill(id_bill),
    FOREIGN KEY (id_entity) REFERENCES entity(id_entity)
);

CREATE OR REPLACE TRIGGER beforeInsertUnit
BEFORE INSERT
ON unit
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertUnit;
/

CREATE OR REPLACE TRIGGER beforeUpdateUnit
BEFORE UPDATE
ON unit
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateUnit;
/

--Product Tables
CREATE TABLE product (
    id_product NUMBER PRIMARY KEY,
    stock NUMBER,
    photo VARCHAR2(50),
    description VARCHAR2(50),
    name VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertProduct
BEFORE INSERT
ON product
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertProduct;
/

CREATE OR REPLACE TRIGGER beforeUpdateProduct
BEFORE UPDATE
ON product
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateProduct;
/

--Point Tables
CREATE TABLE point (
    id_point NUMBER PRIMARY KEY,
    amount NUMBER,
    id_product NUMBER,
    FOREIGN KEY (id_product) REFERENCES product(id_product)
);

CREATE OR REPLACE TRIGGER beforeInsertPoint
BEFORE INSERT
ON point
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertPoint;
/

CREATE OR REPLACE TRIGGER beforeUpdatePoint
BEFORE UPDATE
ON point
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdatePoint;
/

--NN Relation Tables
CREATE TABLE entityXproduct (
    id_entityXproduct NUMBER PRIMARY KEY,
    id_entity NUMBER, 
    id_product NUMBER,
    FOREIGN KEY (id_entity) REFERENCES entity(id_entity),
    FOREIGN KEY (id_product) REFERENCES product(id_product)
);

CREATE TABLE userXcollectioncenter (
    id_userXcollectioncenter NUMBER PRIMARY KEY,
    id_user NUMBER,
    id_collectioncenter NUMBER,
    FOREIGN KEY (id_user) REFERENCES sysuser(id_user),
    FOREIGN KEY (id_collectioncenter) REFERENCES collectioncenter(id_collectioncenter)
);

CREATE TABLE ccenterXrecycabletype (
    id_ccenterXrecycabletype NUMBER PRIMARY KEY,
    id_ccenter NUMBER, 
    id_recycabletype NUMBER,
    FOREIGN KEY (id_ccenter) REFERENCES collectioncenter(id_collectioncenter),
    FOREIGN KEY (id_recycabletype) REFERENCES recycabletype(id_recycabletype)
);

CREATE TABLE collectioncenterXunit (
    id_collectioncenterXunit NUMBER PRIMARY KEY,
    id_collectioncenter NUMBER,
    id_unit NUMBER,
    FOREIGN KEY (id_collectioncenter) REFERENCES collectioncenter(id_collectioncenter),
    FOREIGN KEY (id_unit) REFERENCES unit(id_unit)
);

-------------INSERTS-------------
--Sequences
CREATE SEQUENCE seq_parameter
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_log
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_country
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_province
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_canton
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_district
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_state
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_entity
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_gender
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_usertype
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_sysuser
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_identification
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_contact
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_bill
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_collectioncenter
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_recycabletype
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_category
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_money
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_unit
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_product
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_point
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;
    
CREATE SEQUENCE seq_entityXproduct
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_userXcollectioncenter
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_ccenterXrecycabletype
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_collectioncenterXunit
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

--Fixed Tables Inserts
--Parameter Inserts
--Log Inserts
--Country Inserts
INSERT INTO country (seq_country.NEXTVAL, name) VALUES (seq_country.NEXTVAL, 'Costa Rica');
--Province Inserts
INSERT INTO province (id_province, name, id_country) VALUES (seq_province.NEXTVAL, 'San Jose', 0);
INSERT INTO province (id_province, name, id_country) VALUES (seq_province.NEXTVAL, 'Alajuela', 0);
INSERT INTO province (id_province, name, id_country) VALUES (seq_province.NEXTVAL, 'Cartago', 0);
INSERT INTO province (id_province, name, id_country) VALUES (seq_province.NEXTVAL, 'Heredia', 0);
INSERT INTO province (id_province, name, id_country) VALUES (seq_province.NEXTVAL, 'Guanacaste', 0);
INSERT INTO province (id_province, name, id_country) VALUES (seq_province.NEXTVAL, 'Puntarenas', 0);
INSERT INTO province (id_province, name, id_country) VALUES (seq_province.NEXTVAL, 'Limon', 0);
-- Canton Inserts
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'San Jose', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Escazu', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Desamparados', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Puriscal', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Tarrazú', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Aserrí', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Mora', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Goicoechea', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Santa Ana', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Alajuelita', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Vásquez de Coronado', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Acosta', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Tibás', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Moravia', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Montes de Oca', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Turrumbares', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Dota', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Curridabat', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Perez Zeledon', 0);
INSERT INTO canton (id_canton, name, id_province) VALUES (seq_canton.NEXTVAL, 'Leon Cortez Castro', 0);

--District Inserts
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Carmen', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Merced', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Hospital', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Catedral', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Zapote', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Francisco de Dos Rios', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Uruca', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Mata Redonda', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Pavas', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Hatillo', 0);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Sebastian', 0);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Escazú', 1);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Antonio', 1);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Rafael', 1);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Desamparados', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Miguel', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Juan de Dios', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Rafael Arriba', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Antonio', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Frailes', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Patarrá', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Cristóbal', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Rosario', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Damas', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Rafel Abajo', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Gravilas', 2);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Los Guido', 2);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Santiago', 3);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Mercedes Sur', 3);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Barbacoas', 3);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Grifo Alto', 3);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Rafael', 3);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Candelarita', 3);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Desamparaditos', 3);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Antonio', 3);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Chires', 3);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Marcos', 4);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Lorenzo', 4);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Carlos', 4);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Aserrí', 5);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Tarbaca', 5);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Vuelta de Jorco', 5);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Gabriel', 5);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Legua', 5);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Monterrey', 5);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Salitrillos', 5);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Colón', 6);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Guayabo', 6);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Tabarcia', 6);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Piedras Negras', 6);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Picagres', 6);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Jaris', 6);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Quitirrisí', 6);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Guadalupe', 7);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Francisco', 7);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Calle Blancos', 7);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Mata de Plátano', 7);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Ipís', 7);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Rancho Redondo', 7);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Purral', 7);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Santa Ana', 8);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Salitral', 8);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Pozos', 8);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Uruca', 8);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Piedades', 8);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Brasil', 8);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Alajuelita', 9);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Josecito', 9);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Antonio', 9);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Alajuelita', 9);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Concepción', 9);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Falipe', 9);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Isidro', 10);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Rafael', 10);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Dulce de Nombre de Jesús', 10);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Patalillo', 10);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Cascajal', 10);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Ignacio', 11);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Guaitil Villa', 11);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Palmichal', 11);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Cangrejal', 11);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Sabanillas', 11);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Juan', 12);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Cinco Esquinas', 12);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Anselmo Llorente', 12);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'León XIII', 12);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Colima', 12);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Vicente', 13);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Jerónimo', 13);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'La Trinidad', 13);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Pedro', 14);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Sabanilla', 14);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Mercedes', 14);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Rafael', 14);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Pablo', 15);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Pedro', 15);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Juan de Mata', 15);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Luis', 15);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Carara', 15);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Santa María', 16);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Jardín', 16);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Copey', 16);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Curridabat', 17);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Granadilla', 17);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Sánchez', 17);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Tirrases', 17);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Isidro de el General', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'El General', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Daniel Flores', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Rivas', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Pedro', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Platanares', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Pejibaye', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Cajón', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Barú', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Río Nuevo', 18);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Páramo', 18);

INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Isidro', 19);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'Santa Cruz', 19);
INSERT INTO district (id_district, name, id_canton) VALUES (seq_district.NEXTVAL, 'San Antonio', 19);

--Entity
