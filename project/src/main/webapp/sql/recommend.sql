/* 추천 게시판 */
CREATE TABLE recommend (
	rec_no NUMBER NOT NULL, /* 추천 게시판 번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	rec_readcount NUMBER NOT NULL, /* 조회수 */
	rec_name VARCHAR2(50) NOT NULL, /* 추천 카페 이름 */
	rec_image VARCHAR2(100), /* 추천 카페 사진 */
	rec_time1 VARCHAR2(100) NOT NULL, /* 추천 카페 영업시간1 */
	rec_time2 VARCHAR2(100) NOT NULL, /* 추천 카페 영업시간2 */
	rec_address VARCHAR2(150) NOT NULL, /* 추천 카페 주소 */
	rec_menu1 VARCHAR2(30) NOT NULL, /* 추천 카페 메뉴1 */
	rec_menu2 VARCHAR2(30) NOT NULL, /* 추천 카페 메뉴2 */
	rec_menu3 VARCHAR2(30) NOT NULL, /* 추천 카페 메뉴3 */
	rec_number VARCHAR2(30) NOT NULL, /* 추천 카페 전화 */
	rec_content VARCHAR2(200) NOT NULL, /* 추천 카페 설명 */
	rec_reg DATE NOT NULL /* 추천 카페 등록일 */
);

COMMENT ON TABLE recommand IS '추천 게시판';

COMMENT ON COLUMN recommand.rec_no IS '추천 게시판 번호';

COMMENT ON COLUMN recommand.member_id IS '회원아이디';

COMMENT ON COLUMN recommand.rec_readcount IS '조회수';

COMMENT ON COLUMN recommand.rec_name IS '추천 카페 이름';

COMMENT ON COLUMN recommand.rec_image IS '추천 카페 사진';

COMMENT ON COLUMN recommand.rec_time1 IS '추천 카페 영업시간1';

COMMENT ON COLUMN recommand.rec_time2 IS '추천 카페 영업시간2';

COMMENT ON COLUMN recommand.rec_address IS '추천 카페 주소';

COMMENT ON COLUMN recommand.rec_menu1 IS '추천 카페 메뉴1';

COMMENT ON COLUMN recommand.rec_menu2 IS '추천 카페 메뉴2';

COMMENT ON COLUMN recommand.rec_menu3 IS '추천 카페 메뉴3';

COMMENT ON COLUMN recommand.rec_number IS '추천 카페 전화';

COMMENT ON COLUMN recommand.rec_content IS '추천 카페 설명';

COMMENT ON COLUMN recommand.rec_reg IS '추천 카페 등록일';

CREATE UNIQUE INDEX PK_recommend ON recommend (rec_no ASC);

ALTER TABLE recommend ADD CONSTRAINT PK_recommend PRIMARY KEY (rec_no);

ALTER TABLE recommend
	ADD
		CONSTRAINT FK_member_TO_recommand
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

create sequence recommend_num_seq
increment by 1 start with 1 nocache;