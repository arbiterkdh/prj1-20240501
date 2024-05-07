CREATE DATABASE prj1;

USE prj1;
DROP TABLE board;
CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(200)  NOT NULL,
    content  VARCHAR(3000) NOT NULL,
    writer   VARCHAR(100)  NOT NULL,
    inserted DATETIME      NOT NULL DEFAULT NOW()
);

SELECT *
FROM board;

USE prj1;

# 회원 테이블
DROP TABLE member;

CREATE TABLE member
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    email     VARCHAR(200) NOT NULL UNIQUE,
    password  VARCHAR(200) NOT NULL,
    nick_name VARCHAR(100) NOT NULL UNIQUE,
    inserted  DATETIME     NOT NULL DEFAULT NOW()
);

ALTER TABLE member
    ADD COLUMN inserted DATETIME NOT NULL DEFAULT NOW();

SELECT *
FROM board;
SELECT COUNT(*)
FROM board;

INSERT INTO board
    (title, content, writer)
SELECT title, content, writer
FROM board;

SELECT *
FROM member;
DESC member;

CREATE TABLE authority
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT         NOT NULL REFERENCES member (id),
    name      VARCHAR(20) NOT NULL
);

INSERT INTO authority
    (member_id, name)
VALUES (22, 'admin');
SELECT *
FROM authority;
SELECT m.id, email, password, nick_name, inserted, name
FROM member m
         LEFT JOIN authority a ON m.id = a.member_id
WHERE m.id = 22;