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
        
comment on column TB_USER.user_id IS '����� ID';
comment on column TB_USER.user_pwd IS '����� ��й�ȣ';
comment on column TB_USER.user_nickname IS '����� �г���';
comment on column TB_USER.user_name IS '����� �̸�';
comment on column TB_USER.user_phone IS '����� ��ȭ��ȣ';
comment on column TB_USER.user_email IS '����� �̸���';
comment on column TB_USER.user_birth IS '����� �������';
comment on column TB_USER.user_run IS '����� �� ����';
comment on column TB_USER.user_point IS '����� ����Ʈ';
comment on column TB_USER.user_admin IS '����� ������ ����';
comment on column TB_USER.grade IS '����� ���';

DROP TABLE TB_GRADE cascade constraints;

CREATE TABLE TB_GRADE (
        grade	number		NOT NULL,
        grade_mean	varchar2(100)		NOT NULL,
        min_point	number		NOT NULL,
        max_point	number		NOT NULL
);
comment on column TB_GRADE.grade IS '���';
comment on column TB_GRADE.grade_mean IS '��� ���';
comment on column TB_GRADE.min_point IS '�ּ� ����';
comment on column TB_GRADE.max_point IS '�ִ� ����';

DROP TABLE TB_COMMUNITY_MEMBER cascade constraints;

CREATE TABLE TB_COMMUNITY_MEMBER (
        user_id	VARCHAR2(20)		NOT NULL,
        communityID	NUMBER		NOT NULL,
        member_roll	char(1)		NOT NULL,
        member_date	Date		NOT NULL
);
        
comment on column TB_COMMUNITY_MEMBER.user_id IS '��� ��� ID';
comment on column TB_COMMUNITY_MEMBER.communityID IS '��� ID';
comment on column TB_COMMUNITY_MEMBER.member_roll IS '��� ����';
comment on column TB_COMMUNITY_MEMBER.member_date IS '��� ������';

DROP TABLE TB_Community cascade constraints;

CREATE TABLE TB_Community (
        communityId	NUMBER		NOT NULL,
        communityName	VARCHAR2(100)		NOT NULL,
        communityDate	DATE		,
        user_id	VARCHAR2(20)		NOT NULL,
        communityImgOri	VARCHAR2(100),
        communityImgRename	VARCHAR2(100)
);
        
comment on column TB_Community.communityId IS '��� ID';
comment on column TB_Community.communityName IS '��� �̸�';
comment on column TB_Community.communityDate IS '��� ������';
comment on column TB_Community.user_id IS '��� ������ ID';
comment on column TB_Community.communityImgOri IS '��� �̹��� �����̸�';
comment on column TB_Community.communityImgOri IS '��� �̹��� �ٲ��̸�';


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
        
comment on column TB_Community_BOARD.cBoardNo is '���Խñ� ��ȣ';
comment on column TB_Community_BOARD.cBoardTitle is '���Խñ� ����';
comment on column TB_Community_BOARD.cBoardContent is '���Խñ� ����';
comment on column TB_Community_BOARD.cBoardDate is '���Խñ� �ۼ���';
comment on column TB_Community_BOARD.cBoardLike is '���Խñ� ���ƿ� ��';
comment on column TB_Community_BOARD.cBoardOrifile is '���Խñ� ���� ����';
comment on column TB_Community_BOARD.cBoardRefile is '���Խñ� ������ ����';
comment on column TB_Community_BOARD.cBoardNotice is '���Խñ� ���� ����';
comment on column TB_Community_BOARD.user_id is '���Խñ� �ۼ��� ID';
comment on column TB_Community_BOARD.communityId is '�Խñ��� ���� ��� ID';

DROP TABLE TB_Community_Comment cascade constraints;

CREATE TABLE TB_Community_Comment (
        cComNo	NUMBER		NOT NULL,
        cComContent	VARCHAR2(500)		,
        cComDate	DATE		,
        cComLvl	Number		NOT NULL,
        user_id	VARCHAR2(20)		NOT NULL,
        cBoardNo	VARCHAR2(20)		NOT NULL
);

comment on column TB_Community_Comment.cComNo is '��� ��� ��ȣ';
comment on column TB_Community_Comment.cComContent is '��� ��� ����';
comment on column TB_Community_Comment.cComDate is '��� ��� �ۼ���';
comment on column TB_Community_Comment.cComLvl is '��� ��� ����';
comment on column TB_Community_Comment.user_id is '��� ��� �ۼ��� ID';
comment on column TB_Community_Comment.cBoardNo is '���Խñ� ��ȣ';

DROP TABLE TB_Community_SCH cascade constraints;

CREATE TABLE TB_Community_SCH (
        schId	Number		NOT NULL,
        schName	Varchar2(100)		NOT NULL,
        schDes	Varchar2(500)		,
        communityId NUMBER NOT NULL,
        schStart	Date		,
        schEnd	Date
        );
comment on column TB_Community_SCH.schId is '��� ���� ID';
comment on column TB_Community_SCH.schName is '��� ���� �̸�';
comment on column TB_Community_SCH.schDes is '��� ���� ����';
comment on column TB_Community_SCH.schStart is '��� ���� ������';
comment on column TB_Community_SCH.schEnd is '��� ���� ������';

DROP TABLE TB_Community_VOTE cascade constraints;

CREATE TABLE TB_Community_VOTE (
        schId	Number		NOT NULL,
        votePart	VARCHAR2(50)		NOT NULL,
        voteDate	Date		,
        user_id	VARCHAR2(20)		NOT NULL
);
comment on column TB_Community_VOTE.schId is '��� ���� ID';
comment on column TB_Community_VOTE.votePart is '��� ���� ����';
comment on column TB_Community_VOTE.voteDate is '���� ��ǥ ��¥';
comment on column TB_Community_VOTE.user_id is '�����ǥ�� ID';


DROP TABLE TB_Community_REPORT cascade constraints;

CREATE TABLE TB_Community_REPORT (
        user_id	VARCHAR2(20)		NOT NULL,
        communityId	NUMBER		NOT NULL,
        c_report_time	DATE		,
        c_report_desc	VARCHAR2(500)
);
comment on column TB_Community_REPORT.user_id is '����� ID';
comment on column TB_Community_REPORT.communityId is '��� ��ȣ';
comment on column TB_Community_REPORT.c_report_time is '��� �Ű� �ð�';
comment on column TB_Community_REPORT.c_report_desc is '��� �Ű� ����';

DROP TABLE TB_Community_LIKE cascade constraints;

CREATE TABLE TB_Community_LIKE (
        user_id	VARCHAR2(20)		NOT NULL,
        cLiked_day	DATE		,
        communityId	NUMBER		NOT NULL
);

comment on column TB_Community_LIKE.user_id is '����� ID';
comment on column TB_Community_LIKE.cLiked_day is '��� ���ƿ� Ŭ�� ��¥';
comment on column TB_Community_LIKE.communityId is '��� ��ȣ';

DROP TABLE TB_Community_REQ cascade constraints;

CREATE TABLE TB_Community_REQ (
        user_id	VARCHAR2(20)		NOT NULL,
        communityId	NUMBER NOT NULL,
        requestDes	Varchar2(1000)		,
        requestDate	Date
);

comment on column TB_Community_REQ.user_id is '����� ID';
comment on column TB_Community_REQ.communityId is '��� ID';
comment on column TB_Community_REQ.requestDes is '��� ���� ��û ����';
comment on column TB_Community_REQ.requestDate is '��� ���� ��û ��¥';

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
comment on column TB_GAME.appid is '���� ID';
comment on column TB_GAME.name is '���� �̸�';
comment on column TB_GAME.releasedate is '���� �����';
comment on column TB_GAME.metacritic is '��Ÿũ��ƽ ���� ����';
comment on column TB_GAME.initialprice is '���� �ʱⰡ��';
comment on column TB_GAME.finalprice is '���� ��������';
comment on column TB_GAME.discountrate is '������';
comment on column TB_GAME.developer is '���� ������';
comment on column TB_GAME.publisher is '���� ��޻�';
comment on column TB_GAME.platform is '���� �÷���';
comment on column TB_GAME.screenshots is '���� �̹���';
comment on column TB_GAME.movies is '���� ������';
comment on column TB_GAME.genre is '���� �帣';
comment on column TB_GAME.challenge is 'ī�װ� ID';
comment on column TB_GAME.description is '���� ����';
comment on column TB_GAME.game_updateinfo is '���� ������Ʈ ����';
comment on column TB_GAME.game_rank is '���� �������ӻ� ��';
comment on column TB_GAME.game_like is '���� ���ƿ��';


DROP TABLE TB_CHALLENGE cascade constraints;

        CREATE TABLE TB_CHALLENGE (
        appid	Number		NOT NULL,
        challenge	Number		NOT  NULL,
        achievement_name	Varchar2(100)		NOT NULL,
        achievement_path	Varchar2(100)		NULL
);
comment on column TB_CHALLENGE.appid IS '���� ID';
comment on column TB_CHALLENGE.challenge IS '���� ���� ID';
comment on column TB_CHALLENGE.achievement_name IS '���� ���� �̸�';
comment on column TB_CHALLENGE.achievement_path IS '���� ���� �̹���';


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
comment on column TB_BOARD_GEN.board_no is '�Խñ� ��ȣ';
comment on column TB_BOARD_GEN.board_title is '�Խñ� ����';
comment on column TB_BOARD_GEN.board_content is '�Խñ� ����';
comment on column TB_BOARD_GEN.board_date is '�Խñ� �ۼ� ��¥';
comment on column TB_BOARD_GEN.board_count is '�Խñ� ��ȸ��';
comment on column TB_BOARD_GEN.board_like is '�Խñ� ���ƿ� ��';
comment on column TB_BOARD_GEN.board_orifile is '�Խñ� ���� ����';
comment on column TB_BOARD_GEN.board_refile is '�Խñ� ��ȯ ����';
comment on column TB_BOARD_GEN.appid is '���� ID';
comment on column TB_BOARD_GEN.user_id is '����� ID';



DROP TABLE TB_HOTLIST cascade constraints;

CREATE TABLE TB_HOTLIST (
        user_id	VARCHAR2(20)		NOT NULL,
        appid	Number		NOT NULL
);

comment on column TB_HOTLIST.user_id is '����� ID';
comment on column TB_HOTLIST.appid is '���� ID';

DROP TABLE TB_USER_LIKE cascade constraints;

CREATE TABLE TB_USER_LIKE (
        user_id	VARCHAR2(20)		NOT NULL,
        board_no	NUMBER		NOT NULL,
        board_click_day	DATE		NOT NULL
);
        
comment on column TB_USER_LIKE.user_id is '����� ���̵�';
comment on column TB_USER_LIKE.board_no is '�Խñ� ��ȣ';
comment on column TB_USER_LIKE.board_click_day is '�Խñ� ���ƿ並 ���� ��¥';

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

comment on column TB_COMMENT.com_no is '��� ��ȣ';
comment on column TB_COMMENT.com_contents is '��� ����';
comment on column TB_COMMENT.com_date is '��� �ۼ� ��¥';
comment on column TB_COMMENT.com_lev is '��� ����';
comment on column TB_COMMENT.com_no2 is '���� ��ȣ';
comment on column TB_COMMENT.board_no is '�Խñ� ��ȣ';
comment on column TB_COMMENT.user_id is '�ۼ��� ���̵�';

DROP TABLE TB_REPORT cascade constraints;

CREATE TABLE TB_REPORT (
        board_no	VARCHAR2(300)		NOT NULL,
        user_id	VARCHAR2(20)		NOT NULL,
        report_res	NUMBER		NOT NULL,
        report_date	DATE		NOT NULL,
        user_id2  VARCHAR2(20)		NOT NULL
);
comment on column TB_REPORT.board_no is '�Ű��� �Խñ� ��ȣ';
comment on column TB_REPORT.user_id is '�Ű��� ����� ���̵�';
comment on column TB_REPORT.report_res is '�Ű� ����';
comment on column TB_REPORT.report_date is '�Ű� ��¥';
comment on column TB_REPORT.user_id2 is '�Խñ� �ۼ��� ���̵�';

DROP TABLE TB_COMMUNITY_IMG cascade constraints;

CREATE TABLE TB_COMMUNITY_IMG (
        communityId     NUMBER              NOT NULL ,
        c_imgOriginal	VARCHAR2(100)		NOT NULL,
        c_imgReplace	Varchar2(100)		NOT NULL,
        user_id Varchar2(20) not null
);

comment on column TB_COMMUNITY_IMG.c_imgOriginal is '��� �̹��� ����';
comment on column TB_COMMUNITY_IMG.c_imgReplace is '��� �̹��� �ٲ��̸�';
comment on column TB_COMMUNITY_IMG.user_id is '�̹����� ����� ����� ���̵�';

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

comment on column TB_BOARD_TAR.board_no is '�Խñ� ��ȣ';
comment on column TB_BOARD_TAR.board_title is '�Խñ� ����';
comment on column TB_BOARD_TAR.board_content is '�Խñ� ����';
comment on column TB_BOARD_TAR.board_date is '�Խñ� �ۼ� ��¥';
comment on column TB_BOARD_TAR.board_count is '��ȸ��';
comment on column TB_BOARD_TAR.board_like is '���ƿ� ��';
comment on column TB_BOARD_TAR.board_orifile is '���� ���ϸ�';
comment on column TB_BOARD_TAR.board_refile is '��ȯ�� ���ϸ�';
comment on column TB_BOARD_TAR.user_id is '�Խñ� �ۼ��� ���̵�';
        
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

comment on column TB_BOARD_QNA.board_no is '�Խñ� ��ȣ';
comment on column TB_BOARD_QNA.board_title is '�Խñ� ����';
comment on column TB_BOARD_QNA.board_content is '�Խñ� ����';
comment on column TB_BOARD_QNA.board_date is '�Խñ� �ۼ� ��¥';
comment on column TB_BOARD_QNA.board_count is '��ȸ��';
comment on column TB_BOARD_QNA.board_like is '���ƿ� ��';
comment on column TB_BOARD_QNA.board_orifile is '���� ���ϸ�';
comment on column TB_BOARD_QNA.board_refile is '��ȯ�� ���ϸ�';
comment on column TB_BOARD_QNA.user_id is '�Խñ� �ۼ��� ���̵�';

DROP TABLE TB_RECORD cascade constraints;

CREATE TABLE TB_RECORD (
        login_date	date		NOT NULL,
        user_id	VARCHAR2(20)		NOT NULL
);
comment on column TB_RECORD.user_id IS '����� �ĺ���';
comment on column TB_RECORD.login_date IS '�α��� ��¥';

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