CREATE TABLE member (
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	member_pw VARCHAR2(20) NOT NULL, /* 비밀번호 */
	member_name VARCHAR2(20) NOT NULL, /* 이름 */
	member_jumin1 NUMBER NOT NULL, /* 주민번호1 */
	member_jumin2 NUMBER NOT NULL, /* 주민번호2 */
	member_nickname VARCHAR2(20) NOT NULL, /* 닉네임 */
	member_phone1 NUMBER NOT NULL, /* 핸드폰번호1 */
	member_phone2 NUMBER NOT NULL, /* 핸드폰번호2 */
	member_phone3 NUMBER NOT NULL, /* 핸드폰번호3 */
	member_post VARCHAR2(20) NOT NULL, /* 우편번호 */
	member_address1 VARCHAR2(200) NOT NULL, /* 주소 */
	member_address2 VARCHAR2(200) NOT NULL, /* 상세 주소 */
	member_email VARCHAR2(20) NOT NULL, /* 이메일 */
	member_domain VARCHAR2(20) NOT NULL, /* 도메인 */
	member_state VARCHAR2(10) NOT NULL /* 회원 상태(탈퇴유무) */
);

COMMENT ON TABLE member IS '회원';

COMMENT ON COLUMN member.member_id IS '회원아이디';

COMMENT ON COLUMN member.member_pw IS '비밀번호';

COMMENT ON COLUMN member.member_name IS '이름';

COMMENT ON COLUMN member.member_jumin1 IS '주민번호1';

COMMENT ON COLUMN member.member_jumin2 IS '주민번호2';

COMMENT ON COLUMN member.member_nickname IS 'unique';

COMMENT ON COLUMN member.member_phone1 IS '핸드폰번호1';

COMMENT ON COLUMN member.member_phone2 IS '핸드폰번호2';

COMMENT ON COLUMN member.member_phone3 IS '핸드폰번호3';

COMMENT ON COLUMN member.member_post IS '우편번호';

COMMENT ON COLUMN member.member_address1 IS '주소';

COMMENT ON COLUMN member.member_address2 IS '상세 주소';

COMMENT ON COLUMN member.member_email IS '이메일';

COMMENT ON COLUMN member.member_domain IS '도메인';

COMMENT ON COLUMN member.member_state IS '회원 상태(탈퇴유무)';

CREATE UNIQUE INDEX PK_member ON member (member_id ASC);

ALTER TABLE member ADD CONSTRAINT PK_member PRIMARY KEY (member_id);