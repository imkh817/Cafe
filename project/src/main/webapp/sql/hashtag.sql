/* 해시태그 */
CREATE TABLE hashtag (
	hash_no NUMBER NOT NULL, /* 해시태그 번호 */
	hash_name VARCHAR2(50) NOT NULL /* 해시태그명 */
);

COMMENT ON TABLE hashtag IS '해시태그';

COMMENT ON COLUMN hashtag.hash_no IS '해시태그 번호';

COMMENT ON COLUMN hashtag.hash_name IS '해시태그명';

CREATE UNIQUE INDEX PK_hashtag ON hashtag (hash_no ASC);

ALTER TABLE hashtag ADD CONSTRAINT PK_hashtag PRIMARY KEY (hash_no);

create sequence hashtag_num_seq
increment by 1 start with 1 nocache;