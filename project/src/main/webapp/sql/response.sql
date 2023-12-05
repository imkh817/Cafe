/* 문의답변 */
CREATE TABLE response (
	response_no NUMBER NOT NULL, /* 문의답변 번호 */
	ask_no NUMBER NOT NULL, /* 문의 게시판 번호 */
	inquiry_response VARCHAR2(500) NOT NULL, /* 문의 답변 내용 */
	inquiry_reg DATE NOT NULL /* 문의 답변 날짜 */
);

COMMENT ON TABLE response IS '문의답변';

COMMENT ON COLUMN response.response_no IS '문의답변 번호';

COMMENT ON COLUMN response.ask_no IS '문의 게시판 번호';

COMMENT ON COLUMN response.inquiry_response IS '문의 답변 내용';

COMMENT ON COLUMN response.inquiry_reg IS '문의 답변 날짜';

CREATE UNIQUE INDEX PK_response ON response (response_no ASC);

ALTER TABLE response ADD CONSTRAINT PK_response PRIMARY KEY (response_no);

ALTER TABLE response
	ADD
		CONSTRAINT FK_inquiry_TO_response
		FOREIGN KEY (
			ask_no
		)
		REFERENCES inquiry (
			ask_no
		);

create sequence response3_num_seq
increment by 1 start with 1 nocache;