DROP TABLE TB_USER cascade constraints;

CREATE TABLE TB_USER (
        user_id	VARCHAR2(20)		NOT NULL,
        user_pwd	VARCHAR2(100)		NULL,
        user_nickname	VARCHAR2(30)		NULL,
        user_name	VARCHAR2(100)		NULL,
        user_phone	VARCHAR2(13)		NULL,
        user_email	VARCHAR2(100)		NULL,
        user_birth	NUMBER(3,0)		NOT NULL,
        user_run	VARCHAR2(30)		NULL,
        user_point	NUMBER		NULL,
        user_admin	VARCHAR2(20)		NULL,
        grade	number		NOT NULL
);
        
comment on column TB_USER.user_id IS '사용자 ID';
comment on column TB_USER.user_pwd IS '사용자 비밀번호';
comment on column TB_USER.user_nickname IS '사용자 닉네임';
comment on column TB_USER.user_name IS '사용자 이름';
comment on column TB_USER.user_phone IS '사용자 전화번호';
comment on column TB_USER.user_email IS '사용자 이메일';
comment on column TB_USER.user_birth IS '사용자 생년월일';
comment on column TB_USER.user_run IS '사용자 런 상태';
comment on column TB_USER.user_point IS '사용자 포인트';
comment on column TB_USER.user_admin IS '사용자 관리자 여부';
comment on column TB_USER.grade IS '사용자 등급';

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
        communityId	NUMBER		NOT NULL,
        communityName	VARCHAR2(100)		NOT NULL,
        communityDate	DATE		,
        user_id	VARCHAR2(20)		NOT NULL,
        communityImgOri	VARCHAR2(100),
        communityImgRename	VARCHAR2(100)
);
        
comment on column TB_Community.communityId IS '밴드 ID';
comment on column TB_Community.communityName IS '밴드 이름';
comment on column TB_Community.communityDate IS '밴드 생성일';
comment on column TB_Community.user_id IS '밴드 생성자 ID';
comment on column TB_Community.communityImgOri IS '밴드 이미지 원본이름';
comment on column TB_Community.communityImgOri IS '밴드 이미지 바뀐이름';


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

DROP TABLE TB_GAME cascade constraints;

CREATE TABLE TB_GAME (
        appid	Number		NOT NULL,
        name	VARCHAR2(30)		NOT NULL,
        metacritic	Number		NULL,
        releasedate	Date		NOT NULL,
        initialPrice	Number		NULL,
        finalPrice	Number		NULL,
        discountRate	Number		NULL,
        developer	VARCHAR2(40)		NULL,
        publisher	VARCHAR2(40)		NULL,
        platform	VARCHAR2(50)		NULL,
        screenshots	VARCHAR2(300)		NULL,
        movies	VARCHAR2(300)		NULL,
        challenge	Number		NOT NULL,
        genre 	Number		NULL,
        description 	VARCHAR2(2000)		NULL,
        game_updateinfo	VARCHAR2(1000)		NULL,
        game_rank	Number		NULL,
        game_like	Number		NULL
);
comment on column TB_GAME.appid is '게임 ID';
comment on column TB_GAME.name is '게임 이름';
comment on column TB_GAME.releasedate is '게임 출시일';
comment on column TB_GAME.metacritic is '메타크리틱 게임 평점';
comment on column TB_GAME.initialprice is '게임 초기가격';
comment on column TB_GAME.finalprice is '게임 최종가격';
comment on column TB_GAME.discountrate is '할인율';
comment on column TB_GAME.developer is '게임 개발자';
comment on column TB_GAME.publisher is '게임 배급사';
comment on column TB_GAME.platform is '게임 플랫폼';
comment on column TB_GAME.screenshots is '게임 이미지';
comment on column TB_GAME.movies is '게임 동영상';
comment on column TB_GAME.genre is '게임 장르';
comment on column TB_GAME.challenge is '카테고리 ID';
comment on column TB_GAME.description is '게임 설명';
comment on column TB_GAME.game_updateinfo is '게임 업데이트 정보';
comment on column TB_GAME.game_rank is '전일 게임접속사 수';
comment on column TB_GAME.game_like is '게임 좋아요수';


DROP TABLE TB_CHALLENGE cascade constraints;

        CREATE TABLE TB_CHALLENGE (
        appid	Number		NOT NULL,
        challenge	Number		NOT  NULL,
        achievement_name	Varchar2(100)		NOT NULL,
        achievement_path	Varchar2(100)		NULL
);
comment on column TB_CHALLENGE.appid IS '게임 ID';
comment on column TB_CHALLENGE.challenge IS '도전 과제 ID';
comment on column TB_CHALLENGE.achievement_name IS '도전 과제 이름';
comment on column TB_CHALLENGE.achievement_path IS '도전 과제 이미지';


DROP TABLE TB_BOARD_GEN cascade constraints;

CREATE TABLE TB_BOARD_GEN (
        board_no	NUMBER		NOT NULL,
        board_title	VARCHAR2(50)		NOT NULL,
        board_content	VARCHAR2(2000)		NULL,
        board_date	Date		NOT NULL,
        board_count	number		NOT NULL,
        board_like	number		NOT NULL,
        board_orifile	VARCHAR2(500)		NOT NULL,
        board_refile	VARCHAR2(500)		NULL,
        appid	Number		NOT NULL,
        user_id	VARCHAR2(20)		NOT NULL
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



DROP TABLE TB_HOTLIST cascade constraints;

CREATE TABLE TB_HOTLIST (
        user_id	VARCHAR2(20)		NOT NULL,
        appid	Number		NOT NULL
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
        board_count	NUMBER		NOT NULL,
        appid	NUMBER		NOT NULL,
        board_like	NUMBER		NOT NULL,
        board_orifile	VARCHAR2(500)		NOT NULL,
        board_refile	VARCHAR2(500)		NULL,
        user_id	VARCHAR2(20)		NOT NULL
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
        
DROP TABLE TB_BOARD_QNA cascade constraints;

CREATE TABLE TB_BOARD_QNA (
        board_no	NUMBER		NOT NULL,
        board_title	VARCHAR2(50)		NOT NULL,
        board_content	VARCHAR2(2000)		NULL,
        board_date	Date		NOT NULL,
        board_count	NUMBER		NOT NULL,
        appid	NUMBER		NOT NULL,
        board_like	NUMBER		NOT NULL,
        board_orifile	VARCHAR2(500)		NOT NULL,
        board_refile	VARCHAR2(500)		NULL,
        user_id	VARCHAR2(20)		NOT NULL
);

comment on column TB_BOARD_QNA.board_no is '게시글 번호';
comment on column TB_BOARD_QNA.board_title is '게시글 제목';
comment on column TB_BOARD_QNA.board_content is '게시글 내용';
comment on column TB_BOARD_QNA.board_date is '게시글 작성 날짜';
comment on column TB_BOARD_QNA.board_count is '조회수';
comment on column TB_BOARD_QNA.board_like is '좋아요 수';
comment on column TB_BOARD_QNA.board_orifile is '원본 파일명';
comment on column TB_BOARD_QNA.board_refile is '변환된 파일명';
comment on column TB_BOARD_QNA.user_id is '게시글 작성자 아이디';

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

        ALTER TABLE TB_CHALLENGE 
        ADD CONSTRAINT PK_TB_CHALLENGE 
        PRIMARY KEY (challenge);

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

        ALTER TABLE TB_GAME 
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

        ALTER TABLE TB_COMMUNITY_REPORT
        ADD CONSTRAINT FK_TB_USER_TO_TB_COMMUNITY_REPORT_1
        FOREIGN KEY (user_id)
        REFERENCES TB_COMMUNITY_REPORT (user_id);


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
        REFERENCES TB_GAME (appid);

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
        
commit;