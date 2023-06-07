--ver.2

-- tb_brand
DROP TABLE tb_brand CASCADE CONSTRAINTS;

DROP SEQUENCE tb_brand_seq;

CREATE SEQUENCE tb_brand_seq START WITH 26 INCREMENT BY 1;

CREATE TABLE tb_brand (
    brand_seq     NUMBER DEFAULT tb_brand_seq.NEXTVAL,
    brand_name    VARCHAR2(255) NOT NULL,
    brand_imgurl  VARCHAR2(255) NOT NULL,
    brand_img1    VARCHAR2(1024),
    brand_img2    VARCHAR2(1024),
    brand_img3    VARCHAR2(1024),
    brand_img4    VARCHAR2(1024)
);

ALTER TABLE tb_brand ADD CONSTRAINT tb_brand_pk PRIMARY KEY ( brand_seq );

-- tb_user
DROP TABLE tb_user CASCADE CONSTRAINTS;

DROP SEQUENCE tb_user_seq;

CREATE SEQUENCE tb_user_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE tb_user (
    user_seq           NUMBER DEFAULT tb_user_seq.NEXTVAL,
    role_num           NUMBER DEFAULT 0,
    user_name          VARCHAR2(255) NOT NULL,
    user_mail          VARCHAR2(255) NOT NULL,
    user_pw            VARCHAR2(255) NOT NULL,
    user_registration  VARCHAR2(255) NOT NULL,
    user_mobile        NUMBER,
    remain_cnt         NUMBER DEFAULT 10,
    FOREIGN KEY ( role_num )
        REFERENCES tb_brand ( brand_seq )
);

ALTER TABLE tb_user ADD CONSTRAINT tb_user_pk PRIMARY KEY ( user_seq );

-- tb_reservation
DROP TABLE tb_reservation CASCADE CONSTRAINTS;

DROP SEQUENCE tb_reservation_seq;

CREATE SEQUENCE tb_reservation_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE tb_reservation (
    reservation_seq  NUMBER DEFAULT tb_reservation_seq.NEXTVAL,
    user_seq         NUMBER(10) NOT NULL,
    user_name        VARCHAR2(50) NOT NULL,
    brand_seq        NUMBER(10) NOT NULL,
    reserve_date     VARCHAR2(100) NOT NULL,
    reserve_time     VARCHAR2(100) NOT NULL,
    reserve_status   NUMBER DEFAULT 0,
    consult_room_id  VARCHAR2(255),
    FOREIGN KEY ( user_seq )
        REFERENCES tb_user ( user_seq ),
    FOREIGN KEY ( brand_seq )
        REFERENCES tb_brand ( brand_seq )
);

ALTER TABLE tb_reservation ADD CONSTRAINT tb_reservation_pk PRIMARY KEY ( reservation_seq );

-- tb_category
DROP TABLE tb_category CASCADE CONSTRAINTS;

CREATE TABLE tb_category (
    category VARCHAR2(255) NOT NULL
);

ALTER TABLE tb_category ADD CONSTRAINT tb_category PRIMARY KEY ( category );

-- tb_product
DROP TABLE tb_product CASCADE CONSTRAINTS;

DROP SEQUENCE tb_product_seq;

CREATE SEQUENCE tb_product_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE tb_product (
    product_seq       NUMBER DEFAULT tb_product_seq.NEXTVAL,
    brand_seq         NUMBER NOT NULL,
    product_name      VARCHAR2(255) NOT NULL,
    product_price     VARCHAR2(255),
    product_imgurl    VARCHAR2(255),
    product_category  VARCHAR2(255),
    FOREIGN KEY ( brand_seq )
        REFERENCES tb_brand ( brand_seq ),
    FOREIGN KEY ( product_category )
        REFERENCES tb_category ( category )
);

ALTER TABLE tb_product ADD CONSTRAINT tb_product_pk PRIMARY KEY ( product_seq );

-- tb_survey
DROP TABLE tb_survey CASCADE CONSTRAINTS;

DROP SEQUENCE tb_survey_seq;

CREATE SEQUENCE tb_survey_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE tb_survey (
    survey_seq             NUMBER DEFAULT tb_survey_seq.NEXTVAL,
    user_seq               NUMBER NOT NULL,
    survey_skintype        VARCHAR2(2000) NOT NULL,
    survey_personal_color  VARCHAR2(2000) NOT NULL,
    survey_jewelry_color   VARCHAR2(2000) NOT NULL,
    survey_skintone        VARCHAR2(2000) NOT NULL,
    FOREIGN KEY ( user_seq )
        REFERENCES tb_user ( user_seq )
);

ALTER TABLE tb_survey ADD CONSTRAINT tb_survey_pk PRIMARY KEY ( survey_seq );


-- tb_cart
DROP TABLE tb_cart CASCADE CONSTRAINTS;

CREATE TABLE tb_cart (
    user_seq       NUMBER NOT NULL,
    product_seq    NUMBER NOT NULL,
    product_count  NUMBER
);

-- tb_satisfaction
DROP TABLE tb_satisfaction CASCADE CONSTRAINTS;

CREATE TABLE tb_satisfaction (
    user_seq         NUMBER ,
    brand_seq        NUMBER ,
    reservation_seq  NUMBER NOT NULL,
    user_score       NUMBER NOT NULL,
    user_comment     VARCHAR2(255)
);