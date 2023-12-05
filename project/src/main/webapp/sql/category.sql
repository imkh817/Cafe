/* 카테고리 */
CREATE TABLE category (
	category_no NUMBER NOT NULL, /* 카테고리 번호 */
	category_name VARCHAR2(50) NOT NULL /* 카테고리 명 */
);

COMMENT ON TABLE category IS '카테고리';

COMMENT ON COLUMN category.category_no IS '카테고리 번호';

COMMENT ON COLUMN category.category_name IS '카테고리 명';

CREATE UNIQUE INDEX PK_category ON category (category_no ASC);

ALTER TABLE category ADD CONSTRAINT PK_category PRIMARY KEY (category_no);

create sequence category_num_seq
increment by 1 start with 1 nocache;