CREATE TABLE cafe (
	cafe_no NUMBER NOT NULL, /* 카페번호 */
	category_no NUMBER NOT NULL, /* 카테고리 번호 */
	cafe_readcount NUMBER NOT NULL, /* 조회수 */
	cafe_name VARCHAR2(50) NOT NULL, /* 카페 이름 */
	cafe_image VARCHAR2(100) NOT NULL, /* 카페 사진 */
	cafe_time1 VARCHAR2(30) NOT NULL, /* 영업시간1 */
	cafe_time2 VARCHAR2(30) NOT NULL, /* 영업시간2 */
	cafe_number VARCHAR2(30) NOT NULL, /* 카페전화 */
	cafe_address VARCHAR2(150) NOT NULL, /* 카페주소 */
	cafe_reg DATE NOT NULL, /* 카페등록일 */
	cafe_menu1 VARCHAR2(30) NOT NULL, /* 메뉴1 */
	cafe_menu2 VARCHAR2(30) NOT NULL, /* 메뉴2 */
	cafe_menu3 VARCHAR2(30) NOT NULL /* 메뉴3 */
);

COMMENT ON TABLE cafe IS '카페';

COMMENT ON COLUMN cafe.cafe_no IS '카페번호';

COMMENT ON COLUMN cafe.category_no IS '카테고리 번호';

COMMENT ON COLUMN cafe.cafe_readcount IS '조회수';

COMMENT ON COLUMN cafe.cafe_name IS '카페 이름';

COMMENT ON COLUMN cafe.cafe_image IS '카페 사진';

COMMENT ON COLUMN cafe.cafe_time1 IS '영업시간1';

COMMENT ON COLUMN cafe.cafe_time2 IS '영업시간2';

COMMENT ON COLUMN cafe.cafe_number IS '카페전화';

COMMENT ON COLUMN cafe.cafe_address IS '카페주소';

COMMENT ON COLUMN cafe.cafe_reg IS '카페등록일';

COMMENT ON COLUMN cafe.cafe_menu1 IS '메뉴1';

COMMENT ON COLUMN cafe.cafe_menu2 IS '메뉴2';

COMMENT ON COLUMN cafe.cafe_menu3 IS '메뉴3';

CREATE UNIQUE INDEX PK_cafe ON cafe (cafe_no ASC);

ALTER TABLE cafe ADD CONSTRAINT PK_cafe PRIMARY KEY (cafe_no);

ALTER TABLE cafe
	ADD
		CONSTRAINT FK_category_TO_cafe
		FOREIGN KEY (
			category_no
		)
		REFERENCES category (
			category_no
		);

create sequence cafe_num_seq
increment by 1 start with 1 nocache;