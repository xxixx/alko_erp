-- 게시판 카테고리 테이블
CREATE TABLE BOARD_CATEGORY (
    CATEGORY_ID INT AUTO_INCREMENT PRIMARY KEY,
    CATEGORY_NAME VARCHAR(50) NOT NULL,
    CREATED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    MODIFIED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 게시글 테이블
CREATE TABLE BOARD_POST (
    POST_ID INT AUTO_INCREMENT PRIMARY KEY,
    CATEGORY_ID INT,
    TITLE VARCHAR(200) NOT NULL,
    CONTENT TEXT NOT NULL,
    AUTHOR_NO INT NOT NULL,
    VIEW_COUNT INT DEFAULT 0,
    IS_NOTICE BOOLEAN DEFAULT FALSE,
    IS_DELETE BOOLEAN DEFAULT FALSE,
    CREATED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    MODIFIED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CATEGORY_ID) REFERENCES BOARD_CATEGORY(CATEGORY_ID),
    FOREIGN KEY (AUTHOR_NO) REFERENCES ACCOUNT(NO)
);

-- 게시글 첨부파일 테이블
CREATE TABLE BOARD_ATTACHMENT (
    ATTACHMENT_ID INT AUTO_INCREMENT PRIMARY KEY,
    POST_ID INT NOT NULL,
    FILE_NAME VARCHAR(255) NOT NULL,
    FILE_PATH VARCHAR(500) NOT NULL,
    FILE_SIZE BIGINT NOT NULL,
    CREATED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (POST_ID) REFERENCES BOARD_POST(POST_ID)
);

-- 게시글 댓글 테이블
CREATE TABLE BOARD_COMMENT (
    COMMENT_ID INT AUTO_INCREMENT PRIMARY KEY,
    POST_ID INT NOT NULL,
    PARENT_COMMENT_ID INT,
    CONTENT TEXT NOT NULL,
    AUTHOR_NO INT NOT NULL,
    IS_DELETE BOOLEAN DEFAULT FALSE,
    CREATED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    MODIFIED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (POST_ID) REFERENCES BOARD_POST(POST_ID),
    FOREIGN KEY (PARENT_COMMENT_ID) REFERENCES BOARD_COMMENT(COMMENT_ID),
    FOREIGN KEY (AUTHOR_NO) REFERENCES ACCOUNT(NO)
);

-- 기본 카테고리 데이터 삽입
INSERT INTO BOARD_CATEGORY (CATEGORY_NAME) VALUES 
('공지사항'),
('자유게시판'),
('Q&A'),
('자료실');
