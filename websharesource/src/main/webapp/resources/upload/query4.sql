-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- roleaccount Table Create SQL
CREATE TABLE roleaccount
(
    `roleaccount_id`    INT            NOT NULL    AUTO_INCREMENT, 
    `roleaccount_name`  VARCHAR(45)    NULL, 
    PRIMARY KEY (roleaccount_id)
);


-- roleaccount Table Create SQL
CREATE TABLE user
(
    `userid`          INT             NOT NULL    AUTO_INCREMENT, 
    `username`        VARCHAR(45)     NOT NULL, 
    `password`        VARCHAR(200)    NOT NULL, 
    `fullname`        VARCHAR(45)     NULL, 
    `phone`           VARCHAR(45)     NULL, 
    `email`           VARCHAR(45)     NULL, 
    `roleaccount_id`  INT             NOT NULL, 
    `status`          VARCHAR(45)     NULL, 
    `fbid`            VARCHAR(200)    NULL, 
    `birthday`        DATETIME        NULL, 
    `avatar`          VARCHAR(45)     NULL, 
    `token`           VARCHAR(200)    NULL, 
    `money`           DOUBLE          NULL, 
    PRIMARY KEY (userid)
);

ALTER TABLE user
    ADD CONSTRAINT FK_user_roleaccount_id_roleaccount_roleaccount_id FOREIGN KEY (roleaccount_id)
        REFERENCES roleaccount (roleaccount_id) ON DELETE RESTRICT ON UPDATE RESTRICT;




-- roleaccount Table Create SQL
CREATE TABLE stateProduct
(
    `stateid`    INT            NOT NULL    AUTO_INCREMENT, 
    `statename`  VARCHAR(45)    NULL, 
    PRIMARY KEY (stateid)
);


-- roleaccount Table Create SQL
CREATE TABLE product
(
    `proid`     INT             NOT NULL    AUTO_INCREMENT, 
    `title`     VARCHAR(200)    NULL, 
    `ctgid`     INT             NOT NULL, 
    `like`      INT             NULL, 
    `views`     INT             NULL, 
    `datepost`  TIMESTAMP       NULL, 
    `content`   TEXT            NULL, 
    `image`     VARCHAR(45)     NULL, 
    `userid`    INT             NOT NULL, 
    `stateid`   INT             NOT NULL, 
    `reason`    TEXT            NULL, 
    `dislikes`  INT             NULL, 
    PRIMARY KEY (proid)
);

ALTER TABLE product COMMENT '(cmtid)';

ALTER TABLE product
    ADD CONSTRAINT FK_product_ctgid_category_ctgid FOREIGN KEY (ctgid)
        REFERENCES category (ctgid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE product
    ADD CONSTRAINT FK_product_userid_user_userid FOREIGN KEY (userid)
        REFERENCES user (userid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE product
    ADD CONSTRAINT FK_product_stateid_stateProduct_stateid FOREIGN KEY (stateid)
        REFERENCES stateProduct (stateid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- roleaccount Table Create SQL
CREATE TABLE source
(
    `sourceid`        INT              NOT NULL    AUTO_INCREMENT, 
    `date`            TIMESTAMP        NULL, 
    `sourcename`      VARCHAR(45)      NULL, 
    `size`            VARCHAR(45)      NULL, 
    `contentdetails`  VARCHAR(1000)    NULL, 
    `title`           VARCHAR(45)      NULL, 
    `userid`          INT              NULL, 
    `ctgid`           INT              NULL, 
    `price`           INT              NULL, 
    `avatar`          VARCHAR(45)      NULL, 
    `stateid`         INT              NULL, 
    PRIMARY KEY (sourceid)
);


ALTER TABLE source
    ADD CONSTRAINT FK_source_stateid_stateProduct_stateid FOREIGN KEY (stateid)
        REFERENCES stateProduct (stateid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE source
    ADD CONSTRAINT FK_source_ctgid_category_ctgid FOREIGN KEY (ctgid)
        REFERENCES category (ctgid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE source
    ADD CONSTRAINT FK_source_userid_user_userid FOREIGN KEY (userid)
        REFERENCES user (userid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- roleaccount Table Create SQL
CREATE TABLE comment
(
    `cmtid`      INT            NOT NULL    AUTO_INCREMENT, 
    `cmtname`    VARCHAR(45)    NULL, 
    `datecmt`    TIMESTAMP      NULL, 
    `userid`     INT            NOT NULL, 
    `like`       INT            NULL, 
    `dislikes`   INT            NULL, 
    `parent`     INT            NULL, 
    `productid`  INT            NULL, 
    `sourceid`   INT            NULL, 
    PRIMARY KEY (cmtid)
);

ALTER TABLE comment COMMENT 'FK_comment_sourceid_source_sourceid';

ALTER TABLE comment
    ADD CONSTRAINT FK_comment_userid_user_userid FOREIGN KEY (userid)
        REFERENCES user (userid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE comment
    ADD CONSTRAINT FK_comment_productid_product_proid FOREIGN KEY (productid)
        REFERENCES product (proid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE comment
    ADD CONSTRAINT FK_comment_sourceid_source_sourceid FOREIGN KEY (sourceid)
        REFERENCES source (sourceid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- roleaccount Table Create SQL
CREATE TABLE tag
(
    `tagid`    INT             NOT NULL    AUTO_INCREMENT, 
    `tagname`  VARCHAR(200)    NULL, 
    PRIMARY KEY (tagid)
);


-- roleaccount Table Create SQL
CREATE TABLE cart
(
    `cartid`  INT    NOT NULL    AUTO_INCREMENT, 
    `proid`   INT    NOT NULL, 
    `userid`  INT    NOT NULL, 
    PRIMARY KEY (cartid)
);

ALTER TABLE cart
    ADD CONSTRAINT FK_cart_proid_product_proid FOREIGN KEY (proid)
        REFERENCES product (proid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE cart
    ADD CONSTRAINT FK_cart_userid_user_userid FOREIGN KEY (userid)
        REFERENCES user (userid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- roleaccount Table Create SQL
CREATE TABLE rating
(
    `rateid`     INT            NOT NULL    AUTO_INCREMENT, 
    `ratevalue`  INT            NULL, 
    `ratename`   VARCHAR(45)    NULL, 
    `sourceid`   INT            NULL, 
    PRIMARY KEY (rateid)
);

ALTER TABLE rating
    ADD CONSTRAINT FK_rating_sourceid_source_sourceid FOREIGN KEY (sourceid)
        REFERENCES source (sourceid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- roleaccount Table Create SQL
CREATE TABLE orderhistory
(
    `orid`       INT          NOT NULL    AUTO_INCREMENT, 
    `orderdate`  TIMESTAMP    NOT NULL, 
    `userid`     INT          NOT NULL, 
    `sourceid`   INT          NULL, 
    PRIMARY KEY (orid)
);

ALTER TABLE orderhistory
    ADD CONSTRAINT FK_orderhistory_userid_user_userid FOREIGN KEY (userid)
        REFERENCES user (userid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE orderhistory
    ADD CONSTRAINT FK_orderhistory_sourceid_source_sourceid FOREIGN KEY (sourceid)
        REFERENCES source (sourceid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- roleaccount Table Create SQL
CREATE TABLE historymoney
(
    `hismid`       INT             NOT NULL    AUTO_INCREMENT, 
    `money`        DOUBLE          NULL, 
    `date`         TIMESTAMP       NULL, 
    `discription`  VARCHAR(200)    NULL, 
    `userid`       INT             NOT NULL, 
    PRIMARY KEY (hismid)
);

ALTER TABLE historymoney
    ADD CONSTRAINT FK_historymoney_userid_user_userid FOREIGN KEY (userid)
        REFERENCES user (userid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- roleaccount Table Create SQL
CREATE TABLE tag_product
(
    `tag_productid`  INT    NOT NULL    AUTO_INCREMENT, 
    `tagid`          INT    NOT NULL, 
    `productid`      INT    NOT NULL, 
    PRIMARY KEY (tag_productid)
);

ALTER TABLE tag_product
    ADD CONSTRAINT FK_tag_product_productid_product_proid FOREIGN KEY (productid)
        REFERENCES product (proid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tag_product
    ADD CONSTRAINT FK_tag_product_tagid_tag_tagid FOREIGN KEY (tagid)
        REFERENCES tag (tagid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- roleaccount Table Create SQL
CREATE TABLE report
(
    `reportid`    INT          NOT NULL    AUTO_INCREMENT, 
    `reportname`  TEXT         NULL, 
    `userid`      INT          NOT NULL, 
    `productid`   INT          NOT NULL, 
    `reportdate`  TIMESTAMP    NULL, 
    `cmtid`       INT          NULL, 
    PRIMARY KEY (reportid)
);

ALTER TABLE report COMMENT '(cmtid)';

ALTER TABLE report
    ADD CONSTRAINT FK_report_userid_user_userid FOREIGN KEY (userid)
        REFERENCES user (userid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE report
    ADD CONSTRAINT FK_report_productid_product_proid FOREIGN KEY (productid)
        REFERENCES product (proid) ON DELETE RESTRICT ON UPDATE RESTRICT;

webALTER TABLE report
    ADD CONSTRAINT (cmtid) FOREIGN KEY (cmtid)
        REFERENCES comment (cmtid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- roleaccount Table Create SQL
CREATE TABLE message
(
    `messid`         INT          NOT NULL    AUTO_INCREMENT, 
    `senduserid`     INT          NULL, 
    `receiveuserid`  INT          NULL, 
    `content`        TEXT         NULL, 
    `datemsg`        TIMESTAMP    NULL, 
    PRIMARY KEY (messid)
);

ALTER TABLE message
    ADD CONSTRAINT FK_message_senduserid_user_userid FOREIGN KEY (senduserid)
        REFERENCES user (userid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE message
    ADD CONSTRAINT FK_message_receiveuserid_user_userid FOREIGN KEY (receiveuserid)
        REFERENCES user (userid) ON DELETE RESTRICT ON UPDATE RESTRICT;


