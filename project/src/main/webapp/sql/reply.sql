/* 추천 게시판 댓글 */
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* 댓글 번호 */
	rec_no NUMBER NOT NULL, /* 추천 게시판 번호 */
	reply_content VARCHAR(500) NOT NULL, /* 추천 리뷰 내용 */
	reply_reg DATE NOT NULL, /* 추천 작성일 */
	reply_ref NUMBER NOT NULL, /* ref */
	reply_step NUMBER NOT NULL, /* step */
	reply_level NUMBER NOT NULL /* level */
);

COMMENT ON TABLE reply IS '추천 게시판 댓글';

COMMENT ON COLUMN reply.reply_no IS '댓글 번호';

COMMENT ON COLUMN reply.rec_no IS '추천 게시판 번호';

COMMENT ON COLUMN reply.reply_content IS '추천 리뷰 내용';

COMMENT ON COLUMN reply.reply_reg IS '추천 작성일';

COMMENT ON COLUMN reply.reply_ref IS 'ref';

COMMENT ON COLUMN reply.reply_step IS 'step';

COMMENT ON COLUMN reply.reply_level IS 'level';

CREATE UNIQUE INDEX PK_reply ON reply (reply_no ASC);

ALTER TABLE reply ADD CONSTRAINT PK_reply PRIMARY KEY (reply_no);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_recommand_TO_reply
		FOREIGN KEY (
			rec_no
		)
		REFERENCES recommand (
			rec_no
		);

create sequence reply_num_seq
increment by 1 start with 1 nocache;