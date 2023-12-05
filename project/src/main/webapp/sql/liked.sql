CREATE TABLE liked (
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	cafe_no NUMBER NOT NULL /* 카페번호 */
);

COMMENT ON TABLE like IS '찜';

COMMENT ON COLUMN like.member_id IS '회원아이디';

COMMENT ON COLUMN like.cafe_no IS '카페번호';

CREATE UNIQUE INDEX PK_like ON like (member_id ASC);

ALTER TABLE like ADD CONSTRAINT PK_like PRIMARY KEY (member_id);

ALTER TABLE liked
	ADD
		CONSTRAINT FK_cafe_TO_like
		FOREIGN KEY (
			cafe_no
		)
		REFERENCES cafe (
			cafe_no
		);

ALTER TABLE liked
	ADD
		CONSTRAINT FK_member_TO_like
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

create sequence liked_num_seq
increment by 1 start with 1 nocache;