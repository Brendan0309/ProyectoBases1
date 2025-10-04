-------------TABLE CREATION-------------
--Fixed Tables
CREATE TABLE parameter(
    id_parameter NUMBER PRIMARY KEY,
    type VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationDate DATE,
    modificationName VARCHAR2(50) 
);

CREATE TABLE log(
    id_log NUMBER PRIMARY KEY,
    changetype VARCHAR2(50),
    changeDate DATE,
    oldValue NUMBER,
    newValue NUMBER,
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationDate DATE,
    modificationName VARCHAR2(50) 
);

CREATE TABLE country (
    id_country NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationDate DATE,
    modificationName VARCHAR2(50)
);

CREATE TABLE province(
    id_province NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationDate DATE,
    modificationName VARCHAR2(50),
    id_country NUMBER, 
    FOREIGN KEY (id_country) REFERENCES country(id_country)
);

CREATE TABLE canton (
    id_canton NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationDate DATE,
    modificationName VARCHAR2(50),
    id_province NUMBER,
    FOREIGN KEY (id_province) REFERENCES province(id_province)
);

CREATE TABLE district (
    id_district NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationDate DATE,
    modificationName VARCHAR2(50),
    id_canton NUMBER,
    FOREIGN KEY (id_canton) REFERENCES canton(id_canton)
);

--Entity Tables
CREATE TABLE state (
    id_state NUMBER PRIMARY KEY,
    description VARCHAR(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE
);

CREATE TABLE entity (
    id_entity NUMBER PRIMARY KEY,
    code NUMBER,
    phone NUMBER,
    description VARCHAR(50),
    name VARCHAR(50),
    email VARCHAR(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE,
    id_state NUMBER,
    id_district NUMBER, 
    FOREIGN KEY (id_state) REFERENCES state(id_state),
    FOREIGN KEY (id_district) REFERENCES district(id_district)
);

--User Tables
CREATE TABLE gender (
    id_gender NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE
);

CREATE TABLE usertype (
    id_usertype NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE
);

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
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationDate DATE,
    modificationName VARCHAR2(50),
    id_gender NUMBER, 
    id_usertype NUMBER, 
    id_entity NUMBER,
    FOREIGN KEY (id_gender) REFERENCES gender(id_gender),
    FOREIGN KEY (id_usertype) REFERENCES usertype(id_usertype),
    FOREIGN KEY (id_entity) REFERENCES entity(id_entity)
);

CREATE TABLE identification (
    id_identification NUMBER PRIMARY KEY,
    type VARCHAR2(50),
    value_identification NUMBER,
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE,
    id_user NUMBER,
    FOREIGN KEY (id_user) REFERENCES sysuser(id_user)
);

CREATE TABLE contact (
    id_contact NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE,
    id_user,
    FOREIGN KEY (id_user) REFERENCES sysuser(id_user)
);

--Collection Center Tables
CREATE TABLE bill (
    id_bill NUMBER PRIMARY KEY,
    description VARCHAR(100),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE,
    id_user NUMBER,
    FOREIGN KEY (id_user) REFERENCES sysuser(id_user)
);

CREATE TABLE collectioncenter (
    id_collectioncenter NUMBER PRIMARY KEY,
    currency NUMBER,
    catalogue VARCHAR(100),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE,
    id_bill NUMBER,
    id_entity NUMBER,
    FOREIGN KEY (id_bill) REFERENCES bill(id_bill),
    FOREIGN KEY (id_entity) REFERENCES entity(id_entity)
);

--Recycable Type Tables
CREATE TABLE recycabletype (
    id_recycabletype NUMBER PRIMARY KEY,
    type VARCHAR2(50),
    name VARCHAR2(50),
    points NUMBER,
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE
);

CREATE TABLE category (
    id_category NUMBER PRIMARY KEY,
    description VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE,
    id_recycabletype NUMBER,
    FOREIGN KEY (id_recycabletype) REFERENCES recycabletype(id_recycabletype)
);

--Unit Tables
CREATE TABLE money (
    id_money NUMBER PRIMARY KEY,
    value NUMBER,
    amount NUMBER,
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE
);

CREATE TABLE unit (
    id_unit NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE,
    id_money NUMBER,
    id_bill NUMBER, 
    id_entity NUMBER,
    FOREIGN KEY (id_money) REFERENCES money(id_money),
    FOREIGN KEY (id_bill) REFERENCES bill(id_bill),
    FOREIGN KEY (id_entity) REFERENCES entity(id_entity)
);

--Product Tables
CREATE TABLE product (
    id_product NUMBER PRIMARY KEY,
    stock NUMBER,
    photo VARCHAR2(50),
    description VARCHAR2(50),
    name VARCHAR2(50),
    creationName VARCHAR2(50),
    creationDate DATE,
    modificationName VARCHAR2(50),
    modificationDate DATE
);

CREATE TABLE point (
    id_point NUMBER PRIMARY KEY,
    amount NUMBER,
    id_product NUMBER,
    FOREIGN KEY (id_product) REFERENCES product(id_product)
);

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