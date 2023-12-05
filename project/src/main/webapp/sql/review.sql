CREATE TABLE review (
	review_no NUMBER NOT NULL, /* 리뷰 번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	cafe_no NUMBER NOT NULL, /* 카페번호 */
	hash_no NUMBER NOT NULL, /* 해시태그 번호 */
	review_content VARCHAR2(500) NOT NULL, /* 리뷰 내용 */
	cafe_star NUMBER NOT NULL, /* 별점 */
	review_reg DATE NOT NULL /* 리뷰 작성일 */
);

COMMENT ON TABLE review IS '리뷰';

COMMENT ON COLUMN review.review_no IS '리뷰 번호';

COMMENT ON COLUMN review.member_id IS '회원아이디';

COMMENT ON COLUMN review.cafe_no IS '카페번호';

COMMENT ON COLUMN review.hash_no IS '해시태그 번호';

COMMENT ON COLUMN review.review_content IS '리뷰 내용';

COMMENT ON COLUMN review.cafe_star IS '별점';

COMMENT ON COLUMN review.review_reg IS '리뷰 작성일';

CREATE UNIQUE INDEX PK_review ON review (review_no ASC);

ALTER TABLE review ADD CONSTRAINT PK_review PRIMARY KEY (review_no);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_hashtag_TO_review
		FOREIGN KEY (
			hash_no
		)
		REFERENCES hashtag (
			hash_no
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_cafe_TO_review
		FOREIGN KEY (
			cafe_no
		)
		REFERENCES cafe (
			cafe_no
		);

create sequence review_num_seq
increment by 1 start with 1 nocache;