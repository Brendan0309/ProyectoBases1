-------------TABLE CREATION-------------
--Global Tables Section
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
    id_state NUMBER,
    id_district NUMBER, 
    FOREIGN KEY (id_state) REFERENCES state(id_state),
    FOREIGN KEY (id_district) REFERENCES district(id_district),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
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
    firstName VARCHAR2(50) CONSTRAINT user_firstName_nn NOT NULL,
    secondName VARCHAR2(50) CONSTRAINT user_secondName_nn NOT NULL,
    firstLastName VARCHAR2(50) CONSTRAINT user_firstLastName_nn NOT NULL,
    secondLastName VARCHAR2(50) CONSTRAINT user_secondLastName_nn NOT NULL,
    phone NUMBER,
    photo VARCHAR2(50),
    dateBirth DATE,
    email VARCHAR2(50),
    id_gender NUMBER, 
    id_usertype NUMBER, 
    id_entity NUMBER,
    id_district NUMBER,
    FOREIGN KEY (id_gender) REFERENCES gender(id_gender),
    FOREIGN KEY (id_usertype) REFERENCES usertype(id_usertype),
    FOREIGN KEY (id_entity) REFERENCES entity(id_entity),
    FOREIGN KEY (id_district) REFERENCES district(id_district),
    termsAndConditions VARCHAR2(50)
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
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

--Idetificationtype Tables 
CREATE TABLE identificationtype (
    id_identificationtype NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertIdentificationtype
BEFORE INSERT
ON identificationtype
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertUsertype;
/

CREATE OR REPLACE TRIGGER beforeUpdateIdentificationtype
BEFORE UPDATE
ON identificationtype
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateIdentificationtype;
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

--Authorized Section
CREATE TABLE authorized (
    id_authorized NUMBER PRIMARY KEY,
    id_entity NUMBER,
    FOREIGN KEY (id_entity) REFERENCES entity(id_entity),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertAuthorized
BEFORE INSERT
ON authorized
FOR EACH ROW
BEGIN
    :new.creationName:= USER;
    :new.creationDate:= SYSDATE;
END beforeInsertAuthorized;
/

CREATE OR REPLACE TRIGGER beforeUpdateAuthorized
BEFORE UPDATE
ON authorized
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateAuthorized
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
END beforeInsertBill;
/

CREATE OR REPLACE TRIGGER beforeUpdateBill
BEFORE UPDATE
ON bill
FOR EACH ROW
BEGIN
    :new.modificationName:= USER;
    :new.modificationDate:= SYSDATE;
END beforeUpdateBill;
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
END beforeInsertCCenter;
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

--Category Tables
CREATE TABLE category (
    id_category NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10),
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
    id_category NUMBER,
    FOREIGN KEY (id_category) REFERENCES category(id_category)
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
--AuthorizedXProduct Tables 
CREATE TABLE authorizedXproduct (
    id_authorizedXproduct NUMBER PRIMARY KEY,
    id_authorized NUMBER, 
    id_product NUMBER,
    FOREIGN KEY (id_authorized) REFERENCES authorized(id_authorized),
    FOREIGN KEY (id_product) REFERENCES product(id_product),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertAuthorizedXProduct
BEFORE INSERT
ON authorizedXproduct
FOR EACH ROW
BEGIN
    :new.creationName := USER;
    :new.creationDate := SYSDATE;
END beforeInsertAuthorizedXProduct;
/

CREATE OR REPLACE TRIGGER beforeUpdateAuthorizedXProduct
BEFORE UPDATE
ON authorizedXproduct
FOR EACH ROW
BEGIN
    :new.modificationName := USER;
    :new.modificationDate := SYSDATE;
END beforeUpdateAuthorizedXProduct;
/

--CCenterXAuthorized Tables 
CREATE TABLE ccenterXauthorized (
    id_ccenterXauthorized NUMBER PRIMARY KEY,
    id_ccenter NUMBER, 
    id_authorized NUMBER,
    FOREIGN KEY (id_ccenter) REFERENCES collectioncenter(id_collectioncenter),
    FOREIGN KEY (id_authorized) REFERENCES authorized(id_authorized),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertCCenterXAuthorized
BEFORE INSERT
ON ccenterXauthorized
FOR EACH ROW
BEGIN
    :new.creationName := USER;
    :new.creationDate := SYSDATE;
END beforeInsertCCenterXAuthorized;
/

CREATE OR REPLACE TRIGGER beforeUpdateCCenterXAuthorized
BEFORE UPDATE
ON ccenterXauthorized
FOR EACH ROW
BEGIN
    :new.modificationName := USER;
    :new.modificationDate := SYSDATE;
END beforeUpdateCCenterXAuthorized;
/

--UserXCCenter Tables
CREATE TABLE userXcollectioncenter (
    id_userXcollectioncenter NUMBER PRIMARY KEY,
    id_user NUMBER,
    id_collectioncenter NUMBER,
    FOREIGN KEY (id_user) REFERENCES sysuser(id_user),
    FOREIGN KEY (id_collectioncenter) REFERENCES collectioncenter(id_collectioncenter),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertUserXCollectionCenter
BEFORE INSERT
ON userXcollectioncenter
FOR EACH ROW
BEGIN
    :new.creationName := USER;
    :new.creationDate := SYSDATE;
END beforeInsertUserXCollectionCenter;
/

CREATE OR REPLACE TRIGGER beforeUpdateUserXCollectionCenter
BEFORE UPDATE
ON userXcollectioncenter
FOR EACH ROW
BEGIN
    :new.modificationName := USER;
    :new.modificationDate := SYSDATE;
END beforeUpdateUserXCollectionCenter;
/
--CCenterXAuthorized Tables
CREATE TABLE ccenterXrecycabletype (
    id_ccenterXrecycabletype NUMBER PRIMARY KEY,
    id_ccenter NUMBER, 
    id_recycabletype NUMBER,
    FOREIGN KEY (id_ccenter) REFERENCES collectioncenter(id_collectioncenter),
    FOREIGN KEY (id_recycabletype) REFERENCES recycabletype(id_recycabletype)
);

CREATE OR REPLACE TRIGGER beforeInsertCCXU
BEFORE INSERT
ON collectioncenterXunit
FOR EACH ROW
BEGIN
    :new.creationName := USER;
    :new.creationDate := SYSDATE;
END beforeInsertCCXU;
/

CREATE OR REPLACE TRIGGER beforeUpdateCCXU
BEFORE UPDATE
ON collectioncenterXunit
FOR EACH ROW
BEGIN
    :new.modificationName := USER;
    :new.modificationDate := SYSDATE;
END beforeUpdateCCXU;
/

--CCenterXAuthorized Tables
CREATE TABLE collectioncenterXunit (
    id_collectioncenterXunit NUMBER PRIMARY KEY,
    id_collectioncenter NUMBER,
    id_unit NUMBER,
    FOREIGN KEY (id_collectioncenter) REFERENCES collectioncenter(id_collectioncenter),
    FOREIGN KEY (id_unit) REFERENCES unit(id_unit),
    creationDate DATE,
    creationName VARCHAR2(10),
    modificationDate DATE,
    modificationName VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER beforeInsertCollectionCenterXUnit
BEFORE INSERT
ON collectioncenterXunit
FOR EACH ROW
BEGIN
    :new.creationName := USER;
    :new.creationDate := SYSDATE;
END beforeInsertCollectionCenterXUnit;
/

CREATE OR REPLACE TRIGGER beforeUpdateCollectionCenterXUnit
BEFORE UPDATE
ON collectioncenterXunit
FOR EACH ROW
BEGIN
    :new.modificationName := USER;
    :new.modificationDate := SYSDATE;
END beforeUpdateCollectionCenterXUnit;
/

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

CREATE SEQUENCE seq_identificationtype
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

CREATE SEQUENCE seq_authorized
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
    
CREATE SEQUENCE seq_authorizedXproduct
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE seq_ccenterXauthorized
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

--Packages
--SysUser Package
CREATE OR REPLACE PACKAGE adminUser IS 
    PROCEDURE insertUser(
        p_firstName IN VARCHAR2,
        p_secondName IN VARCHAR2,
        p_firstLastName IN VARCHAR2,
        p_secondLastName IN VARCHAR2,
        p_phone IN NUMBER,
        p_photo IN VARCHAR2,
        p_dateBirth IN DATE,
        p_email IN VARCHAR2,
        p_id_gender IN NUMBER,
        p_id_usertype IN NUMBER,
        p_id_entity IN NUMBER,
        p_id_district IN NUMBER,
        p_termsAndConditions IN VARCHAR2
    );

    PROCEDURE updateUser(
        p_id_user IN NUMBER,
        p_firstName IN VARCHAR2,
        p_secondName IN VARCHAR2,
        p_firstLastName IN VARCHAR2,
        p_secondLastName IN VARCHAR2,
        p_phone IN NUMBER,
        p_photo IN VARCHAR2,
        p_dateBirth IN DATE,
        p_email IN VARCHAR2,
        p_id_gender IN NUMBER,
        p_id_usertype IN NUMBER,
        p_id_entity IN NUMBER,
        p_id_district IN NUMBER,
        p_termsAndConditions IN VARCHAR2
    );

    PROCEDURE deleteUser(
        p_id_user IN NUMBER
    );


    PROCEDURE getUser(
        p_id_user IN NUMBER
    );
END adminUser;

CREATE OR REPLACE PACKAGE BODY adminUser AS 

    PROCEDURE insertUser (
        p_firstName IN VARCHAR2,
        p_secondName IN VARCHAR2,
        p_firstLastName IN VARCHAR2,
        p_secondLastName IN VARCHAR2,
        p_phone IN NUMBER,
        p_photo IN VARCHAR2,
        p_dateBirth IN DATE,
        p_email IN VARCHAR2,
        p_id_gender IN NUMBER,
        p_id_usertype IN NUMBER,
        p_id_entity IN NUMBER,
        p_id_district IN NUMBER,
        p_termsAndConditions IN VARCHAR2
    )
    IS
    BEGIN
        INSERT INTO sysuser(id_user, firstName, secondName, firstLastName, secondLastName, phone, photo, dateBirth, email, id_gender, id_usertype, id_entity, termsAndConditions)
        VALUES (seq_sysuser.NEXTVAL, p_firstName, p_secondName, p_firstLastName, p_secondLastName, p_phone, 
                p_dateBirth, p_email, p_id_gender, p_id_usertype, p_id_entity, p_id_district, p_termsAndConditions)
        COMMIT;
    END insertUser;

    PROCEDURE updateUser (
        p_id_user IN NUMBER,
        p_firstName IN VARCHAR2,
        p_secondName IN VARCHAR2,
        p_firstLastName IN VARCHAR2,
        p_secondLastName IN VARCHAR2,
        p_phone IN NUMBER,
        p_photo IN VARCHAR2,
        p_dateBirth IN DATE,
        p_email IN VARCHAR2,
        p_id_gender IN NUMBER,
        p_id_usertype IN NUMBER,
        p_id_entity IN NUMBER,
        p_id_district IN NUMBER,
        p_termsAndConditions IN VARCHAR2
    )
    IS
    BEGIN
        UPDATE sysuser
        SET firstName = p_firstName
            secondName = p_secondName,
            firstLastName = p_secondLastName,
            secondLastName = p_secondLastName,
            phone = p_phone,
            photo = p_photo,
            dateBirth = p_dateBirth,
            email = p_email,
            id_gender = p_id_gender,
            id_usertype = p_id_usertype,
            id_entity = p_id_entity,
            id_district = p_id_district
        COMMIT;
    END updateUser;

    PROCEDURE deleteUser (p_id_user IN NUMBER)
    is
    BEGIN
        DELETE FROM sysuser
        WHERE id_user = p_id_user
        COMMIT;
    END deleteUser;

    PROCEDURE getUser (p_id_user IN NUMBER)
    IS 
    BEGIN
        SELECT (id_user, firstName, secondName, firstLastName, secondLastName, phone, photo, dateBirth, email, id_gender, id_usertype, id_entity, p_id_district, termsAndConditions)
        FROM sysuser
        WHERE id_user = p_id_user
    END getUser;
END adminUser;

--Entity Package
CREATE OR REPLACE PACKAGE adminEntity IS 
    -- Entity Procedures
    PROCEDURE insertEntity(
        p_code IN NUMBER,
        p_phone IN NUMBER,
        p_description IN VARCHAR2,
        p_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_id_state IN NUMBER,
        p_id_district IN NUMBER
    );

    PROCEDURE updateEntity(
        p_id_entity IN NUMBER,
        p_code IN NUMBER,
        p_phone IN NUMBER,
        p_description IN VARCHAR2,
        p_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_id_state IN NUMBER,
        p_id_district IN NUMBER
    );

    PROCEDURE deleteEntity(
        p_id_entity IN NUMBER
    );

    PROCEDURE getEntity(
        p_id_entity IN NUMBER
    );

    -- CollectionCenter Procedures
    PROCEDURE insertCollectionCenter(
        p_currency IN NUMBER,
        p_catalogue IN VARCHAR2,
        p_id_bill IN NUMBER,
        p_id_entity IN NUMBER
    );

    PROCEDURE updateCollectionCenter(
        p_id_collectioncenter IN NUMBER,
        p_currency IN NUMBER,
        p_catalogue IN VARCHAR2,
        p_id_bill IN NUMBER,
        p_id_entity IN NUMBER
    );

    PROCEDURE deleteCollectionCenter(
        p_id_collectioncenter IN NUMBER
    );

    PROCEDURE getCollectionCenter(
        p_id_collectioncenter IN NUMBER
    );

    -- Authorized Procedures
    PROCEDURE insertAuthorized(
        p_id_entity IN NUMBER
    );

    PROCEDURE updateAuthorized(
        p_id_authorized IN NUMBER,
        p_id_entity IN NUMBER
    );

    PROCEDURE deleteAuthorized(
        p_id_authorized IN NUMBER
    );

    PROCEDURE getAuthorized(
        p_id_authorized IN NUMBER
    );
END adminEntity;

CREATE OR REPLACE PACKAGE BODY adminEntity AS 
    -- Entity Procedures
    PROCEDURE insertEntity(
        p_code IN NUMBER,
        p_phone IN NUMBER,
        p_description IN VARCHAR2,
        p_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_id_state IN NUMBER,
        p_id_district IN NUMBER
    ) IS
    BEGIN
        INSERT INTO entity(id_entity, code, phone, description, name, email, id_state, id_district)
        VALUES (seq_entity.NEXTVAL, p_code, p_phone, p_description, p_name, p_email, p_id_state, p_id_district);
        COMMIT;
    END insertEntity;

    PROCEDURE updateEntity(
        p_id_entity IN NUMBER,
        p_code IN NUMBER,
        p_phone IN NUMBER,
        p_description IN VARCHAR2,
        p_name IN VARCHAR2,
        p_email IN VARCHAR2,
        p_id_state IN NUMBER,
        p_id_district IN NUMBER
    ) IS
    BEGIN
        UPDATE entity
        SET code = p_code,
            phone = p_phone,
            description = p_description,
            name = p_name,
            email = p_email,
            id_state = p_id_state,
            id_district = p_id_district
        WHERE id_entity = p_id_entity;
        COMMIT;
    END updateEntity;

    PROCEDURE deleteEntity(p_id_entity IN NUMBER) IS
    BEGIN
        DELETE FROM entity
        WHERE id_entity = p_id_entity;
        COMMIT;
    END deleteEntity;

    PROCEDURE getEntity(p_id_entity IN NUMBER) IS
    BEGIN
        SELECT id_entity, code, phone, description, name, email, id_state, id_district
        FROM entity
        WHERE id_entity = p_id_entity;
    END getEntity;

    -- CollectionCenter Procedures
    PROCEDURE insertCollectionCenter(
        p_currency IN NUMBER,
        p_catalogue IN VARCHAR2,
        p_id_bill IN NUMBER,
        p_id_entity IN NUMBER
    ) IS
    BEGIN
        INSERT INTO collectioncenter(id_collectioncenter, currency, catalogue, id_bill, id_entity)
        VALUES (seq_collectioncenter.NEXTVAL, p_currency, p_catalogue, p_id_bill, p_id_entity);
        COMMIT;
    END insertCollectionCenter;

    PROCEDURE updateCollectionCenter(
        p_id_collectioncenter IN NUMBER,
        p_currency IN NUMBER,
        p_catalogue IN VARCHAR2,
        p_id_bill IN NUMBER,
        p_id_entity IN NUMBER
    ) IS
    BEGIN
        UPDATE collectioncenter
        SET currency = p_currency,
            catalogue = p_catalogue,
            id_bill = p_id_bill,
            id_entity = p_id_entity
        WHERE id_collectioncenter = p_id_collectioncenter;
        COMMIT;
    END updateCollectionCenter;

    PROCEDURE deleteCollectionCenter(p_id_collectioncenter IN NUMBER) IS
    BEGIN
        DELETE FROM collectioncenter
        WHERE id_collectioncenter = p_id_collectioncenter;
        COMMIT;
    END deleteCollectionCenter;

    PROCEDURE getCollectionCenter(p_id_collectioncenter IN NUMBER) IS
    BEGIN
        SELECT cc.id_collectioncenter, cc.currency, cc.catalogue, cc.id_bill,
               e.id_entity, e.code, e.phone, e.description, e.name, e.email, e.id_state, e.id_district
        FROM collectioncenter cc
        INNER JOIN entity e ON cc.id_entity = e.id_entity
        WHERE cc.id_collectioncenter = p_id_collectioncenter;
    END getCollectionCenter;

    -- Authorized Procedures
    PROCEDURE insertAuthorized(
        p_id_entity IN NUMBER
    ) IS
    BEGIN
        INSERT INTO authorized(id_authorized, id_entity)
        VALUES (seq_authorized.NEXTVAL, p_id_entity);
        COMMIT;
    END insertAuthorized;

    PROCEDURE updateAuthorized(
        p_id_authorized IN NUMBER,
        p_id_entity IN NUMBER
    ) IS
    BEGIN
        UPDATE authorized
        SET id_entity = p_id_entity
        WHERE id_authorized = p_id_authorized;
        COMMIT;
    END updateAuthorized;

    PROCEDURE deleteAuthorized(p_id_authorized IN NUMBER) IS
    BEGIN
        DELETE FROM authorized
        WHERE id_authorized = p_id_authorized;
        COMMIT;
    END deleteAuthorized;

    PROCEDURE getAuthorized(p_id_authorized IN NUMBER) IS
    BEGIN
        SELECT a.id_authorized,
               e.id_entity, e.code, e.phone, e.description, e.name, e.email, e.id_state, e.id_district
        FROM authorized a
        INNER JOIN entity e ON a.id_entity = e.id_entity
        WHERE a.id_authorized = p_id_authorized;
    END getAuthorized;
END adminEntity;