CREATE TABLE inquiry (
	ask_no NUMBER NOT NULL, /* 문의 게시판 번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	inquiry_title VARCHAR2(50) NOT NULL, /* 문의 제목 */
	inquiry_content VARCHAR2(500) NOT NULL, /* 문의 내용 */
	inquiry_image VARCHAR2(100), /* 문의 사진 */
	inquiry_reg DATE NOT NULL /* 문의 날짜 */
);
COMMENT ON TABLE inquiry IS '문의';

COMMENT ON COLUMN inquiry.ask_no IS '문의 게시판 번호';

COMMENT ON COLUMN inquiry.member_id IS '회원아이디';

COMMENT ON COLUMN inquiry.inquiry_title IS '문의 제목';

COMMENT ON COLUMN inquiry.inquiry_content IS '문의 내용';

COMMENT ON COLUMN inquiry.inquiry_image IS '문의 사진';

COMMENT ON COLUMN inquiry.inquiry_reg IS '문의 날짜';

CREATE UNIQUE INDEX PK_inquiry ON inquiry (ask_no ASC);

ALTER TABLE inquiry ADD CONSTRAINT PK_inquiry PRIMARY KEY (ask_no);

ALTER TABLE inquiry
	ADD
		CONSTRAINT FK_member_TO_inquiry
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

create sequence inquiry_num_seq
increment by 1 start with 1 nocache;
