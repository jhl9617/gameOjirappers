DROP TABLE TB_USER cascade constraints;
-- 소셜로그인시 회원가입을 이용할 경우의 회원 테이블
CREATE TABLE TB_USER (
                         USER_ID 		 VARCHAR2(50) 				NOT NULL,
                         ADMIN_ID 		VARCHAR2(20) DEFAULT 'N' 		NOT NULL,
                         USER_PWD		VARCHAR2(100) 			NOT NULL,
                         USER_NICKNAME		VARCHAR2(30)			NOT NULL,
                         USER_NAME 		VARCHAR2(100)			NOT NULL,
                         USER_PHONE 		VARCHAR2(13) 			NOT NULL,
                         USER_EMAIL 		VARCHAR2(100) 			NOT NULL,
                         USER_BIRTH 		DATE 	NULL,
                         USER_LEVEL 		VARCHAR2(20)	DEFAULT '새싹'	NOT NULL,
                         USER_STATUS		VARCHAR2(30) 	DEFAULT 'run'	NOT NULL,
                         USER_POINT 		NUMBER		DEFAULT 0		NOT NULL,
                         USER_ACCESS 		DATE 		DEFAULT SYSDATE,
                         USER_ORIGINAL_PROFILE 	VARCHAR2(30) 	DEFAULT '기본'		NULL,
                         CONFIRM_ANSWER 	VARCHAR2(100) 			NULL
);


comment on column TB_USER.user_id is '회원아이디';
comment on column TB_USER.admin_id is '관리자아이디';
comment on column TB_USER.user_pwd is '회원비밀번호';
comment on column TB_USER.user_nickname is '회원닉네임';
comment on column TB_USER.user_name is '회원이름';
comment on column TB_USER.user_phone is '회원전화번호';
comment on column TB_USER.user_email is '회원이메일';
comment on column TB_USER.user_birth is '회원생일';
comment on column TB_USER.user_level is '회원등급';
comment on column TB_USER.user_status is '회원 활동상태';
comment on column TB_USER.user_point is '보유포인트';
comment on column TB_USER.user_access is '접속기록';
comment on column TB_USER.user_original_profile is '프로필이미지';
comment on column TB_USER.confirm_answer is '본인확인용 답변';


DROP TABLE TB_GRADE cascade constraints;

CREATE TABLE TB_GRADE (
                          grade	number		NOT NULL,
                          grade_mean	varchar2(100)		NOT NULL,
                          min_point	number		NOT NULL,
                          max_point	number		NOT NULL
);
comment on column TB_GRADE.grade IS '등급';
comment on column TB_GRADE.grade_mean IS '등급 평균';
comment on column TB_GRADE.min_point IS '최소 점수';
comment on column TB_GRADE.max_point IS '최대 점수';

DROP TABLE TB_COMMUNITY_MEMBER cascade constraints;

CREATE TABLE TB_COMMUNITY_MEMBER (
                                     user_id	VARCHAR2(20)		NOT NULL,
                                     communityID	NUMBER		NOT NULL,
                                     member_roll	char(1)		NOT NULL,
                                     member_date	Date		NOT NULL
);

comment on column TB_COMMUNITY_MEMBER.user_id IS '밴드 멤버 ID';
comment on column TB_COMMUNITY_MEMBER.communityID IS '밴드 ID';
comment on column TB_COMMUNITY_MEMBER.member_roll IS '멤버 역할';
comment on column TB_COMMUNITY_MEMBER.member_date IS '멤버 가입일';

DROP TABLE TB_Community cascade constraints;

CREATE TABLE TB_Community (
                              communityId	NUMBER	DEFAULT 0	NOT NULL,
                              communityName	VARCHAR2(100)		NOT NULL,
                              communityDate	DATE		,
                              user_id	VARCHAR2(20)		NOT NULL,
                              communityImgOri	VARCHAR2(100),
                              communityImgRename	VARCHAR2(100),
                                communityDesc	VARCHAR2(500)
);


comment on column TB_Community.communityId IS '밴드 ID';
comment on column TB_Community.communityName IS '밴드 이름';
comment on column TB_Community.communityDate IS '밴드 생성일';
comment on column TB_Community.user_id IS '밴드 생성자 ID';
comment on column TB_Community.communityImgOri IS '밴드 이미지 원본이름';
comment on column TB_Community.communityImgOri IS '밴드 이미지 바뀐이름';
comment on column TB_Community.communityDesc IS '밴드 설명';


DROP TABLE TB_Community_BOARD cascade constraints;

CREATE TABLE TB_Community_BOARD (
                                    cBoardNo	NUMBER		NOT NULL,
                                    cBoardTitle	VARCHAR2(50)		NOT NULL,
                                    cBoardContent	VARCHAR2(2000)		,
                                    cBoardDate	Date		NOT NULL,
                                    cBoardLike	number		NOT NULL,
                                    cBoardOrifile	VARCHAR2(500)		,
                                    cBoardRefile	VARCHAR2(500)		,
                                    cBoardNotice	Char(5)		NOT NULL,
                                    user_id	VARCHAR2(20)		NOT NULL,
                                    communityId	NUMBER		NOT NULL
);

comment on column TB_Community_BOARD.cBoardNo is '밴드게시글 번호';
comment on column TB_Community_BOARD.cBoardTitle is '밴드게시글 제목';
comment on column TB_Community_BOARD.cBoardContent is '밴드게시글 내용';
comment on column TB_Community_BOARD.cBoardDate is '밴드게시글 작성일';
comment on column TB_Community_BOARD.cBoardLike is '밴드게시글 좋아요 수';
comment on column TB_Community_BOARD.cBoardOrifile is '밴드게시글 원본 파일';
comment on column TB_Community_BOARD.cBoardRefile is '밴드게시글 수정된 파일';
comment on column TB_Community_BOARD.cBoardNotice is '밴드게시글 공지 여부';
comment on column TB_Community_BOARD.user_id is '밴드게시글 작성자 ID';
comment on column TB_Community_BOARD.communityId is '게시글이 속한 밴드 ID';

DROP TABLE TB_Community_Comment cascade constraints;

CREATE TABLE TB_Community_Comment (
                                      cComNo	NUMBER		NOT NULL,
                                      cComContent	VARCHAR2(500)		,
                                      cComDate	DATE		,
                                      cComLvl	Number		NOT NULL,
                                      user_id	VARCHAR2(20)		NOT NULL,
                                      cBoardNo	VARCHAR2(20)		NOT NULL
);

comment on column TB_Community_Comment.cComNo is '밴드 댓글 번호';
comment on column TB_Community_Comment.cComContent is '밴드 댓글 내용';
comment on column TB_Community_Comment.cComDate is '밴드 댓글 작성일';
comment on column TB_Community_Comment.cComLvl is '밴드 댓글 깊이';
comment on column TB_Community_Comment.user_id is '밴드 댓글 작성자 ID';
comment on column TB_Community_Comment.cBoardNo is '밴드게시글 번호';

DROP TABLE TB_Community_SCH cascade constraints;

CREATE TABLE TB_Community_SCH (
                                  schId	Number		NOT NULL,
                                  schName	Varchar2(100)		NOT NULL,
                                  schDes	Varchar2(500)		,
                                  communityId NUMBER NOT NULL,
                                  schStart	Date		,
                                  schEnd	Date
);
comment on column TB_Community_SCH.schId is '밴드 일정 ID';
comment on column TB_Community_SCH.schName is '밴드 일정 이름';
comment on column TB_Community_SCH.schDes is '밴드 일정 설명';
comment on column TB_Community_SCH.schStart is '밴드 일정 시작일';
comment on column TB_Community_SCH.schEnd is '밴드 일정 종료일';

DROP TABLE TB_Community_VOTE cascade constraints;

CREATE TABLE TB_Community_VOTE (
                                   schId	Number		NOT NULL,
                                   votePart	VARCHAR2(50)		NOT NULL,
                                   voteDate	Date		,
                                   user_id	VARCHAR2(20)		NOT NULL
);
comment on column TB_Community_VOTE.schId is '밴드 일정 ID';
comment on column TB_Community_VOTE.votePart is '밴드 일정 여부';
comment on column TB_Community_VOTE.voteDate is '일정 투표 날짜';
comment on column TB_Community_VOTE.user_id is '밴드투표자 ID';


DROP TABLE TB_Community_REPORT cascade constraints;

CREATE TABLE TB_Community_REPORT (
                                     user_id	VARCHAR2(20)		NOT NULL,
                                     communityId	NUMBER		NOT NULL,
                                     c_report_time	DATE		,
                                     c_report_desc	VARCHAR2(500)
);
comment on column TB_Community_REPORT.user_id is '사용자 ID';
comment on column TB_Community_REPORT.communityId is '밴드 번호';
comment on column TB_Community_REPORT.c_report_time is '밴드 신고 시간';
comment on column TB_Community_REPORT.c_report_desc is '밴드 신고 내용';

DROP TABLE TB_Community_LIKE cascade constraints;

CREATE TABLE TB_Community_LIKE (
                                   user_id	VARCHAR2(20)		NOT NULL,
                                   cLiked_day	DATE		,
                                   communityId	NUMBER		NOT NULL
);

comment on column TB_Community_LIKE.user_id is '사용자 ID';
comment on column TB_Community_LIKE.cLiked_day is '밴드 좋아요 클릭 날짜';
comment on column TB_Community_LIKE.communityId is '밴드 번호';

DROP TABLE TB_Community_REQ cascade constraints;

CREATE TABLE TB_Community_REQ (
                                  user_id	VARCHAR2(20)		NOT NULL,
                                  communityId	NUMBER NOT NULL,
                                  requestDes	Varchar2(1000)		,
                                  requestDate	Date
);

comment on column TB_Community_REQ.user_id is '사용자 ID';
comment on column TB_Community_REQ.communityId is '밴드 ID';
comment on column TB_Community_REQ.requestDes is '밴드 가입 신청 내용';
comment on column TB_Community_REQ.requestDate is '밴드 가입 신청 날짜';

DROP TABLE GAME cascade constraints;

CREATE TABLE GAME (
     "APPID" VARCHAR2(30 BYTE),
     "NAME" VARCHAR2(200 BYTE),
     "DEVELOPER" VARCHAR2(100 BYTE),
     "PUBLISHER" VARCHAR2(100 BYTE),
     "INITIALPRICE" VARCHAR2(30 BYTE),
     "FINALPRICE" VARCHAR2(30 BYTE),
     "DISCOUNTRATE" NUMBER,
     "DESCRIPTION" CLOB,
     "PLATFORM" VARCHAR2(100 BYTE),
     "META" NUMBER,
     "CATEGORY" VARCHAR2(1000 BYTE),
     "GENRE" VARCHAR2(1000 BYTE),
     "HEADERIMG" VARCHAR2(1000 BYTE),
     "MOVIE" VARCHAR2(1000 BYTE),
     "RELEASEDATE" VARCHAR2(50 BYTE),
     "ACHIEVEMENT" VARCHAR2(2000 BYTE),
     "POSITIVE" NUMBER,
     "CCU" NUMBER,
     "SHORT_DESCRIPTION" VARCHAR2(4000 BYTE),
     "SUPPORTED_LANGUAGES" VARCHAR2(4000 BYTE),
     "PCMINIMUM" VARCHAR2(2000 BYTE),
     "PCRECOMMENDED" VARCHAR2(2000 BYTE)
);
comment on column GAME.appid is '게임 ID';
comment on column GAME.name is '게임 이름';
comment on column GAME.releasedate is '게임 출시일';
comment on column GAME.meta is '메타크리틱 게임 평점';
comment on column GAME.initialprice is '게임 초기가격';
comment on column GAME.finalprice is '게임 최종가격';
comment on column GAME.discountrate is '할인율';
comment on column GAME.developer is '게임 개발자';
comment on column GAME.publisher is '게임 배급사';
comment on column GAME.platform is '게임 플랫폼';
comment on column GAME.HEADERIMG is '게임 이미지';
comment on column GAME.MOVIE is '게임 동영상';
comment on column GAME.genre is '게임 장르';
comment on column GAME.description is '게임 설명';
comment on column GAME.CCU is '전일 게임접속사 수';
comment on column GAME.POSITIVE is '게임 좋아요수';
comment on column GAME.CATEGORY is '게임 카테고리';
comment on column GAME.ACHIEVEMENT is '게임 도전과제';
comment on column GAME.SHORT_DESCRIPTION is '게임 간단한 설명';
comment on column GAME.SUPPORTED_LANGUAGES is '게임 지원언어';
comment on column GAME.PCMINIMUM is '게임 최소사양';
comment on column GAME.PCRECOMMENDED is '게임 권장사양';


DROP TABLE TB_BOARD_GEN cascade constraints;

CREATE TABLE TB_BOARD_GEN (
                              board_no	NUMBER		NOT NULL,
                              board_title	VARCHAR2(50)		NOT NULL,
                              board_content	VARCHAR2(2000)		NULL,
                              board_date	Date		NOT NULL,
                              board_count	number		,
                              board_like	number		,
                              board_orifile	VARCHAR2(500),
                              board_refile	VARCHAR2(500)		NULL,
                              appid	VARCHAR2(30 BYTE)		NOT NULL,
                              user_id	VARCHAR2(20)		NOT NULL,
					board_notice VARCHAR2(50)
);
comment on column TB_BOARD_GEN.board_no is '게시글 번호';
comment on column TB_BOARD_GEN.board_title is '게시글 제목';
comment on column TB_BOARD_GEN.board_content is '게시글 내용';
comment on column TB_BOARD_GEN.board_date is '게시글 작성 날짜';
comment on column TB_BOARD_GEN.board_count is '게시글 조회수';
comment on column TB_BOARD_GEN.board_like is '게시글 좋아요 수';
comment on column TB_BOARD_GEN.board_orifile is '게시글 원본 파일';
comment on column TB_BOARD_GEN.board_refile is '게시글 변환 파일';
comment on column TB_BOARD_GEN.appid is '게임 ID';
comment on column TB_BOARD_GEN.user_id is '사용자 ID';
comment on column TB_BOARD_GEN.board_notice is '공지글 제목';



DROP TABLE TB_HOTLIST cascade constraints;

CREATE TABLE TB_HOTLIST (
                            user_id	VARCHAR2(20)		NOT NULL,
                            appid VARCHAR2(30 BYTE)			NOT NULL
);

comment on column TB_HOTLIST.user_id is '사용자 ID';
comment on column TB_HOTLIST.appid is '게임 ID';

DROP TABLE TB_USER_LIKE cascade constraints;

CREATE TABLE TB_USER_LIKE (
                              user_id	VARCHAR2(20)		NOT NULL,
                              board_no	NUMBER		NOT NULL,
                              board_click_day	DATE		NOT NULL
);

comment on column TB_USER_LIKE.user_id is '사용자 아이디';
comment on column TB_USER_LIKE.board_no is '게시글 번호';
comment on column TB_USER_LIKE.board_click_day is '게시글 좋아요를 누른 날짜';

DROP TABLE TB_COMMENT cascade constraints;

CREATE TABLE TB_COMMENT (
                            com_no	NUMBER		NOT NULL,
                            com_contents	VARCHAR2(500)		NOT NULL,
                            com_date	DATE		NOT NULL,
                            com_lev	Number		NOT NULL,
                            com_no2	NUMBER		NOT NULL,
                            board_no	NUMBER		NOT NULL,
                            user_id	VARCHAR2(20)		NOT NULL
);

comment on column TB_COMMENT.com_no is '댓글 번호';
comment on column TB_COMMENT.com_contents is '댓글 내용';
comment on column TB_COMMENT.com_date is '댓글 작성 날짜';
comment on column TB_COMMENT.com_lev is '댓글 레벨';
comment on column TB_COMMENT.com_no2 is '대댓글 번호';
comment on column TB_COMMENT.board_no is '게시글 번호';
comment on column TB_COMMENT.user_id is '작성자 아이디';

DROP TABLE TB_REPORT cascade constraints;

CREATE TABLE TB_REPORT (
                           board_no	VARCHAR2(300)		NOT NULL,
                           user_id	VARCHAR2(20)		NOT NULL,
                           report_res	NUMBER		NOT NULL,
                           report_date	DATE		NOT NULL,
                           user_id2  VARCHAR2(20)		NOT NULL
);
comment on column TB_REPORT.board_no is '신고한 게시글 번호';
comment on column TB_REPORT.user_id is '신고한 사용자 아이디';
comment on column TB_REPORT.report_res is '신고 사유';
comment on column TB_REPORT.report_date is '신고 날짜';
comment on column TB_REPORT.user_id2 is '게시글 작성자 아이디';

DROP TABLE TB_COMMUNITY_IMG cascade constraints;

CREATE TABLE TB_COMMUNITY_IMG (
                                  communityId     NUMBER              NOT NULL ,
                                  c_imgOriginal	VARCHAR2(100)		NOT NULL,
                                  c_imgReplace	Varchar2(100)		NOT NULL,
                                  user_id Varchar2(20) not null
);

comment on column TB_COMMUNITY_IMG.c_imgOriginal is '밴드 이미지 원본';
comment on column TB_COMMUNITY_IMG.c_imgReplace is '밴드 이미지 바뀐이름';
comment on column TB_COMMUNITY_IMG.user_id is '이미지를 등록한 사용자 아이디';

DROP TABLE TB_BOARD_TAR cascade constraints;

CREATE TABLE TB_BOARD_TAR (
                              board_no	NUMBER		NOT NULL,
                              board_title	VARCHAR2(50)		NOT NULL,
                              board_content	VARCHAR2(2000)		NULL,
                              board_date	Date		NOT NULL,
                              board_count	NUMBER		,
                              appid	VARCHAR2(30 BYTE)		NOT NULL,
                              board_like	NUMBER		,
                              board_orifile	VARCHAR2(500)		,
                              board_refile	VARCHAR2(500)		NULL,
                              user_id	VARCHAR2(20)		NOT NULL,
					board_notice VARCHAR2(50)
);

comment on column TB_BOARD_TAR.board_no is '게시글 번호';
comment on column TB_BOARD_TAR.board_title is '게시글 제목';
comment on column TB_BOARD_TAR.board_content is '게시글 내용';
comment on column TB_BOARD_TAR.board_date is '게시글 작성 날짜';
comment on column TB_BOARD_TAR.board_count is '조회수';
comment on column TB_BOARD_TAR.board_like is '좋아요 수';
comment on column TB_BOARD_TAR.board_orifile is '원본 파일명';
comment on column TB_BOARD_TAR.board_refile is '변환된 파일명';
comment on column TB_BOARD_TAR.user_id is '게시글 작성자 아이디';
comment on column TB_BOARD_TAR.board_notice is '공지글 제목';

DROP TABLE TB_BOARD_QNA cascade constraints;

CREATE TABLE TB_BOARD_QNA (
                              board_no	NUMBER		NOT NULL,
                              board_title	VARCHAR2(50)		NOT NULL,
                              board_content	VARCHAR2(2000)		NULL,
                              board_date	Date		NOT NULL,
                              board_count	NUMBER		,
                              appid	VARCHAR2(30 BYTE)		,
                              board_like	NUMBER		,
                              board_orifile	VARCHAR2(500)		,
                              board_refile	VARCHAR2(500)		NULL,
                              user_id	VARCHAR2(20)		NOT NULL,
					board_notice VARCHAR2(50)
);

comment on column TB_BOARD_QNA.board_no is '게시글 번호';
comment on column TB_BOARD_QNA.board_title is '게시글 제목';
comment on column TB_BOARD_QNA.board_content is '게시글 내용';
comment on column TB_BOARD_QNA.board_date is '게시글 작성 날짜';
comment on column TB_BOARD_QNA.board_count is '조회수';
comment on column TB_BOARD_QNA.appid is '게임 ID';
comment on column TB_BOARD_QNA.board_like is '좋아요 수';
comment on column TB_BOARD_QNA.board_orifile is '원본 파일명';
comment on column TB_BOARD_QNA.board_refile is '변환된 파일명';
comment on column TB_BOARD_QNA.user_id is '게시글 작성자 아이디';
comment on column TB_BOARD_QNA.board_notice is '공지글 제목';

DROP TABLE TB_RECORD cascade constraints;

CREATE TABLE TB_RECORD (
                           login_date	date		NOT NULL,
                           user_id	VARCHAR2(20)		NOT NULL
);
comment on column TB_RECORD.user_id IS '사용자 식별자';
comment on column TB_RECORD.login_date IS '로그인 날짜';

ALTER TABLE TB_USER
    ADD CONSTRAINT PK_TB_USER
        PRIMARY KEY (user_id);

ALTER TABLE TB_GRADE
    ADD CONSTRAINT PK_TB_GRADE
        PRIMARY KEY (grade);

ALTER TABLE TB_Community_MEMBER
    ADD CONSTRAINT PK_TB_Community_MEMBER
        PRIMARY KEY (user_id,COMMUNITYID);

ALTER TABLE TB_Community
    ADD CONSTRAINT PK_TB_Community
        PRIMARY KEY (COMMUNITYID);


ALTER TABLE TB_Community_BOARD
    ADD CONSTRAINT PK_TB_Community_BOARD
        PRIMARY KEY (CBOARDNO);

ALTER TABLE TB_COMMUNITY_COMMENT
    ADD CONSTRAINT PK_TB_COMMUNITY_COMMENT
        PRIMARY KEY (CCOMNO);

ALTER TABLE TB_COMMUNITY_SCH
    ADD CONSTRAINT PK_TB_COMMUNITY_SCH
        PRIMARY KEY (SCHID);

ALTER TABLE TB_COMMUNITY_VOTE
    ADD CONSTRAINT PK_TB_COMMUNITY_VOTE
        PRIMARY KEY (SCHID);

ALTER TABLE TB_COMMUNITY_REPORT
    ADD CONSTRAINT PK_TB_COMMUNITY_REPORT
        PRIMARY KEY (user_id,COMMUNITYID);

ALTER TABLE TB_COMMUNITY_LIKE
    ADD CONSTRAINT PK_TB_COMMUNITY_LIKE
        PRIMARY KEY (user_id, COMMUNITYID);

ALTER TABLE TB_COMMUNITY_REQ
    ADD CONSTRAINT PK_TB_COMMUNITY_REQ
        PRIMARY KEY (user_id,COMMUNITYID);

ALTER TABLE GAME
    ADD CONSTRAINT PK_TB_GAME
        PRIMARY KEY (appid);

ALTER TABLE TB_BOARD_GEN
    ADD CONSTRAINT PK_TB_BOARD_GEN
        PRIMARY KEY (board_no);

ALTER TABLE TB_HOTLIST
    ADD CONSTRAINT PK_TB_HOTLIST
        PRIMARY KEY (user_id,appid);

ALTER TABLE TB_USER_LIKE
    ADD CONSTRAINT PK_TB_USER_LIKE
        PRIMARY KEY (user_id,board_no);

ALTER TABLE TB_COMMENT
    ADD CONSTRAINT PK_TB_COMMENT
        PRIMARY KEY (com_no);

ALTER TABLE TB_REPORT
    ADD CONSTRAINT PK_TB_REPORT
        PRIMARY KEY (board_no,user_id);

ALTER TABLE TB_COMMUNITY_IMG
    ADD CONSTRAINT PK_TB_COMMUNITY_IMG
        PRIMARY KEY (communityId);

ALTER TABLE TB_BOARD_TAR
    ADD CONSTRAINT PK_TB_BOARD_TAR
        PRIMARY KEY (board_no);

ALTER TABLE TB_BOARD_QNA
    ADD CONSTRAINT PK_TB_BOARD_QNA
        PRIMARY KEY (board_no);

ALTER TABLE TB_RECORD
    ADD CONSTRAINT PK_TB_RECORD
        PRIMARY KEY (login_date,user_id);



ALTER TABLE TB_community_MEMBER
    ADD CONSTRAINT FK_TB_USER_TO_TB_community_MEMBER_1
        FOREIGN KEY (user_id)
            REFERENCES TB_USER (user_id);

ALTER TABLE TB_COMMUNITY_MEMBER
    ADD CONSTRAINT FK_TB_COMMUNITY_TO_TB_COMMUNITY_MEMBER_1
        FOREIGN KEY (COMMUNITYID)
            REFERENCES TB_COMMUNITY (COMMUNITYID);


ALTER TABLE TB_COMMUNITY_VOTE
    ADD CONSTRAINT FK_TB_COMMUNITY_SCH_TO_TB_COMMUNITY_VOTE_1
        FOREIGN KEY (SCHID)
            REFERENCES TB_COMMUNITY_SCH (SCHID);




ALTER TABLE TB_COMMUNITY_LIKE
    ADD CONSTRAINT FK_TB_USER_TO_TB_COMMUNITY_LIKE_1
        FOREIGN KEY (user_id)
            REFERENCES TB_USER (user_id);

ALTER TABLE TB_COMMUNITY_REQ
    ADD CONSTRAINT FK_TB_USER_TO_TB_COMMUNITY_REQ_1
        FOREIGN KEY (user_id)
            REFERENCES TB_USER (user_id);

ALTER TABLE TB_COMMUNITY_REQ
    ADD CONSTRAINT FK_TB_COMMUNITY_TO_TB_COMMUNITY_REQ_1
        FOREIGN KEY (communityId)
            REFERENCES TB_COMMUNITY (communityId);

ALTER TABLE TB_HOTLIST
    ADD CONSTRAINT FK_TB_USER_TO_TB_HOTLIST_1
        FOREIGN KEY (user_id)
            REFERENCES TB_USER (user_id);

ALTER TABLE TB_HOTLIST
    ADD CONSTRAINT FK_TB_GAME_TO_TB_HOTLIST_1
        FOREIGN KEY ( appid )
            REFERENCES GAME (appid);

ALTER TABLE TB_USER_LIKE
    ADD CONSTRAINT FK_TB_USER_TO_TB_USER_LIKE_1
        FOREIGN KEY (user_id )
            REFERENCES TB_USER ( user_id);

ALTER TABLE TB_USER_LIKE
    ADD CONSTRAINT FK_TB_BOARD_TAR_TO_TB_USER_LIKE_1
        FOREIGN KEY ( board_no )
            REFERENCES TB_BOARD_TAR ( board_no );

ALTER TABLE TB_USER_LIKE
    ADD CONSTRAINT FK_TB_BOARD_GEN_TO_TB_USER_LIKE_1
        FOREIGN KEY ( board_no )
            REFERENCES TB_BOARD_GEN ( board_no );

ALTER TABLE TB_USER_LIKE
    ADD CONSTRAINT FK_TB_BOARD_QNA_TO_TB_USER_LIKE_1
        FOREIGN KEY ( board_no )
            REFERENCES TB_BOARD_QNA ( board_no );

ALTER TABLE TB_BOARD_GEN
    ADD CONSTRAINT FK_tb_user_TO_board1
        FOREIGN KEY (user_id)
            REFERENCES tb_user (user_id);

ALTER TABLE TB_BOARD_TAR
    ADD CONSTRAINT FK_tb_user_TO_board2
        FOREIGN KEY (user_id)
            REFERENCES tb_user (user_id);

ALTER TABLE TB_BOARD_QNA
    ADD CONSTRAINT FK_tb_user_TO_board3
        FOREIGN KEY (user_id)
            REFERENCES tb_user (user_id);

ALTER TABLE TB_REPORT
    ADD CONSTRAINT FK_TB_USER_TO_TB_REPORT_1
        FOREIGN KEY (user_id)
            REFERENCES TB_USER (user_id);

ALTER TABLE TB_RECORD
    ADD CONSTRAINT FK_TB_USER_TO_TB_RECORD_1
        FOREIGN KEY (user_id )
            REFERENCES TB_USER (user_id);



ALTER TABLE tb_comment
    ADD CONSTRAINT FK_tb_user_TO_board_com
        FOREIGN KEY (user_id)
            REFERENCES tb_user (user_id);

ALTER TABLE tb_report
    ADD CONSTRAINT FK_TB_USER_TO_TB_REPORT_2
        FOREIGN KEY (user_id2)
            REFERENCES tb_user (user_id);

ALTER TABLE tb_community_board
    ADD CONSTRAINT FK_tb_user_tb_community_board
        FOREIGN KEY (user_id)
            REFERENCES tb_user (user_id);

ALTER TABLE TB_COMMUNITY_COMMENT
    ADD CONSTRAINT FK_tb_user_TO_TB_COMMUNITY_COMMENT2
        FOREIGN KEY (user_id)
            REFERENCES tb_user (user_id);

ALTER TABLE TB_COMMUNITY_IMG
    ADD CONSTRAINT FK_tb_user_TO_TB_COMMUNITY_IMG
        FOREIGN KEY (user_id)
            REFERENCES tb_user (user_id);

ALTER TABLE TB_COMMUNITY
    ADD CONSTRAINT FK_tb_user_TO_TB_COMMUNITY
        FOREIGN KEY (user_id)
            REFERENCES tb_user (user_id);

ALTER TABLE TB_COMMUNITY_VOTE
    ADD CONSTRAINT FK_tb_user_TO_TB_COMMUNITY_VOTE
        FOREIGN KEY (user_id)
            REFERENCES tb_user (user_id);



INSERT INTO TB_USER (USER_ID, USER_PWD, USER_NICKNAME, USER_NAME, USER_PHONE, USER_EMAIL, USER_BIRTH, USER_LEVEL, USER_STATUS, USER_POINT, USER_ACCESS, USER_ORIGINAL_PROFILE, CONFIRM_ANSWER) VALUES
    ('john123', 'john123', 'JohnDoe', 'John Doe', '123-456-7890', 'john.doe@example.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'), '새싹', 'run', 0, SYSDATE, '기본', NULL);
INSERT INTO TB_USER (USER_ID, USER_PWD, USER_NICKNAME, USER_NAME, USER_PHONE, USER_EMAIL, USER_BIRTH, USER_LEVEL, USER_STATUS, USER_POINT, USER_ACCESS, USER_ORIGINAL_PROFILE, CONFIRM_ANSWER) VALUES
    ('jane456', 'jane456', 'JaneDoe', 'Jane Doe', '987-654-3210', 'jane.doe@example.com', TO_DATE('1992-05-21', 'YYYY-MM-DD'), '싹', 'run', 500, SYSDATE-1, '기본', NULL);
INSERT INTO TB_USER (USER_ID, USER_PWD, USER_NICKNAME, USER_NAME, USER_PHONE, USER_EMAIL, USER_BIRTH, USER_LEVEL, USER_STATUS, USER_POINT, USER_ACCESS, USER_ORIGINAL_PROFILE, CONFIRM_ANSWER) VALUES
    ('sam789', 'sam789', 'SamSmith', 'Sam Smith', '555-555-5555', 'sam.smith@example.com', TO_DATE('1985-12-15', 'YYYY-MM-DD'), '싹', 'stop', 1000, SYSDATE-2, '기본', NULL);
INSERT INTO TB_USER (USER_ID, USER_PWD, USER_NICKNAME, USER_NAME, USER_PHONE, USER_EMAIL, USER_BIRTH, USER_LEVEL, USER_STATUS, USER_POINT, USER_ACCESS, USER_ORIGINAL_PROFILE, CONFIRM_ANSWER) VALUES
    ('amy321', 'amy321', 'AmyBrown', 'Amy Brown', '111-111-1111', 'amy.brown@example.com', TO_DATE('1988-08-08', 'YYYY-MM-DD'), '줄기', 'run', 250, SYSDATE-3, '기본', NULL);
INSERT INTO TB_USER (USER_ID, USER_PWD, USER_NICKNAME, USER_NAME, USER_PHONE, USER_EMAIL, USER_BIRTH, USER_LEVEL, USER_STATUS, USER_POINT, USER_ACCESS, USER_ORIGINAL_PROFILE, CONFIRM_ANSWER) VALUES
    ('peter444', 'peter444', 'PeterGreen', 'Peter Green', '222-222-2222', 'peter.green@example.com', TO_DATE('1995-03-25', 'YYYY-MM-DD'), '줄기', 'pause', 750, SYSDATE-4, '기본', NULL);
INSERT INTO TB_USER (USER_ID, USER_PWD, USER_NICKNAME, USER_NAME, USER_PHONE, USER_EMAIL, USER_BIRTH, USER_LEVEL, USER_STATUS, USER_POINT, USER_ACCESS, USER_ORIGINAL_PROFILE, CONFIRM_ANSWER) VALUES
    ('lisa777', 'lisa777', 'LisaBlack', 'Lisa Black', '333-333-3333', 'lisa.black@example.com', TO_DATE('1999-11-11', 'YYYY-MM-DD'), '나무', 'run', 1500, SYSDATE-5, '기본', NULL);
INSERT INTO TB_USER (USER_ID, USER_PWD, USER_NICKNAME, USER_NAME, USER_PHONE, USER_EMAIL, USER_BIRTH, USER_LEVEL, USER_STATUS, USER_POINT, USER_ACCESS, USER_ORIGINAL_PROFILE, CONFIRM_ANSWER) VALUES
    ('bob555', 'bob555', 'BobWhite', 'Bob White', '444-444-4444', 'bob.white@example.com', TO_DATE('1993-02-28', 'YYYY-MM-DD'), '나무', 'run', 100, SYSDATE-6, '기본', NULL);
INSERT INTO TB_USER (USER_ID, USER_PWD, USER_NICKNAME, USER_NAME, USER_PHONE, USER_EMAIL, USER_BIRTH, USER_LEVEL, USER_STATUS, USER_POINT, USER_ACCESS, USER_ORIGINAL_PROFILE, CONFIRM_ANSWER) VALUES
    ('emily888', 'emily888', 'EmilyGray', 'Emily Gray', '666-666-6666', 'emily.gray@example.com', TO_DATE('1987-07-07', 'YYYY-MM-DD'), '나무', 'pause', 300, SYSDATE-7, '기본', NULL);
INSERT INTO TB_USER (USER_ID, USER_PWD, USER_NICKNAME, USER_NAME, USER_PHONE, USER_EMAIL, USER_BIRTH, USER_LEVEL, USER_STATUS, USER_POINT, USER_ACCESS, USER_ORIGINAL_PROFILE, CONFIRM_ANSWER, ADMIN_ID) VALUES
    ('admin', 'admin', 'JackBrown', 'Jack Brown', '777-777-7777', 'jack.brown@example.com', TO_DATE('1991-09-09', 'YYYY-MM-DD'), '마스터', 'run', 2000, SYSDATE-8, '기본', NULL, 'Y');

INSERT INTO TB_Community (communityId,communityName, communityDate,user_id,communityImgOri,communityImgRename,communityDesc
) VALUES (0,'Sample Band',TO_DATE('2023-04-01', 'YYYY-MM-DD'),'admin','sample_band_image_original.jpg','sample_band_image_renamed.jpg','A description of the Sample Band' );
commit;