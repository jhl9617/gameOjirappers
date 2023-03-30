DROP TABLE TB_USER cascade constraints;
-- �Ҽȷα��ν� ȸ�������� �̿��� ����� ȸ�� ���̺�
CREATE TABLE USERS(
USER_ID VARCHAR2(50) CONSTRAINT PK_MEMBER_UID PRIMARY KEY, 	--ȸ�����̵�
ADMIN_ID CHAR(1) DEFAULT 'N' NOT NULL,				--�����ھ��̵�
USER_PWD VARCHAR2(100),						--ȸ����й�ȣ
USER_NICKNAME VARCHAR2(20) NOT NULL,				--ȸ���г���
USER_NAME VARCHAR2(20) NOT NULL,					--ȸ���̸�
USER_PHONE VARCHAR2(13),						--ȸ����ȭ��ȣ
USER_EMAIL VARCHAR2(30) NOT NULL,  				--ȸ���̸���
USER_BIRTH	VARCHAR2(30) NOT NULL,  				--ȸ������
USER_LEVEL VARCHAR2(20) NOT NULL,					--ȸ�����
USER_STATUS VARCHAR2(30) NOT NULL,  				--ȸ�� Ȱ������
USER_POINT VARCHAR2(30) NOT NULL,  				--��������Ʈ
USER_ACCESS DATE DEFAULT SYSDATE, 				--���ӱ��
USER_ORIGINAL_PROFILE VARCHAR2(30),  				--�������̹���
BNAME VARCHAR2(30),   						--��� �̸�
COM_CONTENTS VARCHAR2(30), 					--���� �� �ڸ�Ʈ ����
BOARD_TITLE VARCHAR2(30), 					--���� �� �� ����
CONFIRM_ANSWER VARCHAR2(100)					--����Ȯ�ο� ����
);

comment on column user_id is 'ȸ�����̵�';
comment on column admin_id is '�����ھ��̵�';
comment on column user_pwd	is 'ȸ����й�ȣ';
comment on column user_nickname is 'ȸ���г���';
comment on column user_name is 'ȸ���̸�';
comment on column user_phone is 'ȸ����ȭ��ȣ';
comment on column user_email is 'ȸ���̸���';
comment on column user_birt is 'ȸ������';
comment on column user_level is 'ȸ�����';
comment on column user_status is 'ȸ�� Ȱ������';
comment on column user_point is '��������Ʈ';
comment on column user_access is '���ӱ��';
comment on column user_original_profile is '�������̹���';
comment on column bname is '��� �̸�';
comment on column com_contents is '���� �� �ڸ�Ʈ ����';
comment on column board_title is '���� �� �� ����';
comment on column confirm_answer is '����Ȯ�ο� ����';







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

DROP TABLE TB_BAND_MEMBER cascade constraints;

CREATE TABLE TB_BAND_MEMBER (
        user_id	VARCHAR2(20)		NOT NULL,
        band_id	NUMBER		NOT NULL,
        member_roll	char(1)		NOT NULL,
        member_date	Date		NOT NULL
);
        
comment on column TB_BAND_MEMBER.user_id IS '��� ��� ID';
comment on column TB_BAND_MEMBER.band_id IS '��� ID';
comment on column TB_BAND_MEMBER.member_roll IS '��� ����';
comment on column TB_BAND_MEMBER.member_date IS '��� ������';

DROP TABLE TB_BAND cascade constraints;

CREATE TABLE TB_BAND (
        BAND_ID	NUMBER		NOT NULL,
        BAND_NAME	VARCHAR2(100)		NOT NULL,
        BAND_DATE	DATE		NOT NULL,
        user_id	VARCHAR2(20)		NOT NULL,
        band_imgid	VARCHAR2(20)		NOT NULL
);
        
comment on column TB_BAND.BAND_ID IS '��� ID';
comment on column TB_BAND.BAND_NAME IS '��� �̸�';
comment on column TB_BAND.BAND_DATE IS '��� ������';
comment on column TB_BAND.user_id IS '��� ������ ID';
comment on column TB_BAND.band_imgid IS '��� �̹��� ID';


DROP TABLE TB_BAND_BOARD cascade constraints;

 CREATE TABLE TB_BAND_BOARD (
        bandboard_no	VARCHAR2(20)		NOT NULL,
        bandboard_title	VARCHAR2(50)		NOT NULL,
        bandboard_content	VARCHAR2(2000)		NULL,
        bandboard_date	Date		NOT NULL,
        bandboard_like	number		NOT NULL,
        bandboard_orifile	VARCHAR2(500)		NOT NULL,
        bandboard_refile	VARCHAR2(500)		NULL,
        bandboard_notice	Char(5)		NOT NULL,
        user_id	VARCHAR2(20)		NOT NULL,
        band_id	NUMBER		NOT NULL
);
        
comment on column TB_BAND_BOARD.bandboard_no is '���Խñ� ��ȣ';
comment on column TB_BAND_BOARD.bandboard_title is '���Խñ� ����';
comment on column TB_BAND_BOARD.bandboard_content is '���Խñ� ����';
comment on column TB_BAND_BOARD.bandboard_date is '���Խñ� �ۼ���';
comment on column TB_BAND_BOARD.bandboard_like is '���Խñ� ���ƿ� ��';
comment on column TB_BAND_BOARD.bandboard_orifile is '���Խñ� ���� ����';
comment on column TB_BAND_BOARD.bandboard_refile is '���Խñ� ������ ����';
comment on column TB_BAND_BOARD.bandboard_notice is '���Խñ� ���� ����';
comment on column TB_BAND_BOARD.user_id is '���Խñ� �ۼ��� ID';
comment on column TB_BAND_BOARD.band_id is '�Խñ��� ���� ��� ID';

DROP TABLE TB_BAND_COM cascade constraints;

CREATE TABLE TB_BAND_COM (
        bcom_no	NUMBER		NOT NULL,
        bcom_contents	VARCHAR2(500)		NULL,
        bcom_date	DATE		NOT NULL,
        bcom_lev	Number		NOT NULL,
        user_id	VARCHAR2(20)		NOT NULL,
        bandboard_no	VARCHAR2(20)		NOT NULL
);

comment on column TB_BAND_COM.bcom_no is '��� ��� ��ȣ';
comment on column TB_BAND_COM.bcom_contents is '��� ��� ����';
comment on column TB_BAND_COM.bcom_date is '��� ��� �ۼ���';
comment on column TB_BAND_COM.bcom_lev is '��� ��� ����';
comment on column TB_BAND_COM.user_id is '��� ��� �ۼ��� ID';
comment on column TB_BAND_COM.bandboard_no is '���Խñ� ��ȣ';

DROP TABLE TB_BAND_SCH cascade constraints;

CREATE TABLE TB_BAND_SCH (
        schedule_id	Number		NOT NULL,
        schedule_name	Varchar2(100)		NOT NULL,
        schedule_des	Varchar2(500)		NOT NULL,
        schedule_start	Date		NOT NULL,
        schedule_end	Date		NOT NULL
        );
comment on column TB_BAND_SCH.schedule_id is '��� ���� ID';
comment on column TB_BAND_SCH.schedule_name is '��� ���� �̸�';
comment on column TB_BAND_SCH.schedule_des is '��� ���� ����';
comment on column TB_BAND_SCH.schedule_start is '��� ���� ������';
comment on column TB_BAND_SCH.schedule_end is '��� ���� ������';

DROP TABLE TB_BAND_VOTE cascade constraints;

CREATE TABLE TB_BAND_VOTE (
        schedule_id	Number		NOT NULL,
        vote_part	VARCHAR2(50)		NOT NULL,
        vote_partdate	char(1)		NOT NULL,
        user_id	VARCHAR2(20)		NOT NULL
);
comment on column TB_BAND_VOTE.schedule_id is '��� ���� ID';
comment on column TB_BAND_VOTE.vote_part is '��� ���� ����';  
comment on column TB_BAND_VOTE.vote_partdate is '���� ��ǥ ��¥';  
comment on column TB_BAND_VOTE.user_id is '�����ǥ�� ID';  


DROP TABLE TB_BAND_REPORT cascade constraints;

CREATE TABLE TB_BAND_REPORT (
        user_id	VARCHAR2(20)		NOT NULL,
        bandboard_no	VARCHAR2(20)		NOT NULL,
        band_report_time	DATE		NOT NULL,
        band_report_res	NUMBER		NOT NULL
);
comment on column TB_BAND_REPORT.user_id is '����� ID';
comment on column TB_BAND_REPORT.bandboard_no is '���Խñ� ��ȣ';
comment on column TB_BAND_REPORT.band_report_time is '��� �Ű� �ð�';
comment on column TB_BAND_REPORT.band_report_res is '��� �Ű� ����';

DROP TABLE TB_BAND_LIKE cascade constraints;

CREATE TABLE TB_BAND_LIKE (
        user_id	VARCHAR2(20)		NOT NULL,
        bboard_click_day	DATE		NOT NULL,
        bandboard_no	VARCHAR2(20)		NOT NULL
);

comment on column TB_BAND_LIKE.user_id is '����� ID';
comment on column TB_BAND_LIKE.bboard_click_day is '��� ���ƿ� Ŭ�� ��¥';
comment on column TB_BAND_LIKE.bandboard_no is '���Խñ� ��ȣ';

DROP TABLE TB_BAND_REQ cascade constraints;

CREATE TABLE TB_BAND_REQ (
        user_id	VARCHAR2(20)		NOT NULL,
        band_id	NUMBER NOT NULL,
        request_des	Varchar2(1000)		NOT NULL,
        request_date	Date		NOT NULL
);

comment on column TB_BAND_REQ.user_id is '����� ID';
comment on column TB_BAND_REQ.band_id is '��� ID';
comment on column TB_BAND_REQ.request_des is '��� ���� ��û ����';
comment on column TB_BAND_REQ.request_date is '��� ���� ��û ��¥';

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
        user_id	VARCHAR2(20)		NOT NULL,
        board_notice VARCHAR2(50)		NOT NULL
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
comment on column TB_BOARD_GEN.board_notice is '������ ����';



DROP TABLE TB_HOTLIST cascade constraints;
--��ã ���� ���� ���̺�
CREATE TABLE TB_HOTLIST (
        USER_ID	VARCHAR2(20)		NOT NULL,
        APPID	NUMBER		NOT NULL
        BOARD_CLICK_DAY DATE DEFAULT SYSDATE
);

comment on column TB_HOTLIST.user_id is '��ã�� ȸ��';
comment on column TB_HOTLIST.appid is '��ã�� ���ӹ�ȣ';
comment on column TB_HOTLIST.board_click_day is '��ã�� ��¥';





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

DROP TABLE TB_BAND_IMG cascade constraints;

CREATE TABLE TB_BAND_IMG (
        band_imgid	VARCHAR2(20)		NOT NULL,
        band_img	Varchar2(100)		NOT NULL,
        user_id Varchar2(20) not null
);

comment on column TB_BAND_IMG.band_imgid is '��� �̹��� ��ȣ';
comment on column TB_BAND_IMG.band_img is '��� �̹���';
comment on column TB_BAND_IMG.user_id is '�̹����� ����� ����� ���̵�';

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
        user_id	VARCHAR2(20)		NOT NULL,
        board_notice VARCHAR2(50)		NOT NULL
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
comment on column TB_BOARD_TAR.board_notice is '������ ����';
        
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
        user_id	VARCHAR2(20)		NOT NULL,
        board_notice VARCHAR2(50)		NOT NULL
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
comment on column TB_BOARD_QNA.board_notice is '������ ����';

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

        ALTER TABLE TB_BAND_MEMBER 
        ADD CONSTRAINT PK_TB_BAND_MEMBER
        PRIMARY KEY (user_id,band_id);

        ALTER TABLE TB_CHALLENGE 
        ADD CONSTRAINT PK_TB_CHALLENGE 
        PRIMARY KEY (challenge);

        ALTER TABLE TB_BAND 
        ADD CONSTRAINT PK_TB_BAND 
        PRIMARY KEY (BAND_ID);


        ALTER TABLE TB_BAND_BOARD 
        ADD CONSTRAINT PK_TB_BAND_BOARD 
        PRIMARY KEY (bandboard_no);

        ALTER TABLE TB_BAND_COM 
        ADD CONSTRAINT PK_TB_BAND_COM
        PRIMARY KEY (bcom_no);

        ALTER TABLE TB_BAND_SCH 
        ADD CONSTRAINT PK_TB_BAND_SCH 
        PRIMARY KEY (schedule_id);

        ALTER TABLE TB_BAND_VOTE
        ADD CONSTRAINT PK_TB_BAND_VOTE 
        PRIMARY KEY (schedule_id);

        ALTER TABLE TB_BAND_REPORT 
        ADD CONSTRAINT PK_TB_BAND_REPORT 
        PRIMARY KEY (user_id,bandboard_no);

        ALTER TABLE TB_BAND_LIKE 
        ADD CONSTRAINT PK_TB_BAND_LIKE 
        PRIMARY KEY (user_id);

        ALTER TABLE TB_BAND_REQ 
        ADD CONSTRAINT PK_TB_BAND_REQ 
        PRIMARY KEY (user_id,band_id);

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

        ALTER TABLE TB_BAND_IMG 
        ADD CONSTRAINT PK_TB_BAND_IMG 
        PRIMARY KEY (band_imgid);

        ALTER TABLE TB_BOARD_TAR
        ADD CONSTRAINT PK_TB_BOARD_TAR 
        PRIMARY KEY (board_no);
        
        ALTER TABLE TB_BOARD_QNA
        ADD CONSTRAINT PK_TB_BOARD_QNA
        PRIMARY KEY (board_no);

        ALTER TABLE TB_RECORD 
        ADD CONSTRAINT PK_TB_RECORD 
        PRIMARY KEY (login_date,user_id);



        ALTER TABLE TB_BAND_MEMBER 
        ADD CONSTRAINT FK_TB_USER_TO_TB_BAND_MEMBER_1 
        FOREIGN KEY (user_id)
        REFERENCES TB_USER (user_id);

        ALTER TABLE TB_BAND_MEMBER 
        ADD CONSTRAINT FK_TB_BAND_TO_TB_BAND_MEMBER_1 
        FOREIGN KEY (band_id)
        REFERENCES TB_BAND (BAND_ID);


        ALTER TABLE TB_BAND_VOTE 
        ADD CONSTRAINT FK_TB_BAND_SCH_TO_TB_BAND_VOTE_1 
        FOREIGN KEY (schedule_id)
        REFERENCES TB_BAND_SCH (schedule_id);

        ALTER TABLE TB_BAND_REPORT 
        ADD CONSTRAINT FK_TB_USER_TO_TB_BAND_REPORT_1 
        FOREIGN KEY (user_id)
        REFERENCES TB_USER (user_id);

        ALTER TABLE TB_BAND_REPORT 
        ADD CONSTRAINT FK_TB_BAND_BOARD_TO_TB_BAND_REPORT_1 
        FOREIGN KEY (bandboard_no)
        REFERENCES TB_BAND_BOARD ( bandboard_no );

        ALTER TABLE TB_BAND_LIKE 
        ADD CONSTRAINT FK_TB_USER_TO_TB_BAND_LIKE_1 
        FOREIGN KEY (user_id)
        REFERENCES TB_USER (user_id);

        ALTER TABLE TB_BAND_REQ 
        ADD CONSTRAINT FK_TB_USER_TO_TB_BAND_REQ_1 
        FOREIGN KEY (user_id)
        REFERENCES TB_USER (user_id);

        ALTER TABLE TB_BAND_REQ 
        ADD CONSTRAINT FK_TB_BAND_TO_TB_BAND_REQ_1 
        FOREIGN KEY (band_id)
        REFERENCES TB_BAND (band_id);

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

        ALTER TABLE tb_band_board
        ADD CONSTRAINT FK_tb_user_TO_band_board
        FOREIGN KEY (user_id)
        REFERENCES tb_user (user_id);

        ALTER TABLE tb_band_com
        ADD CONSTRAINT FK_tb_user_TO_band_board_com2
        FOREIGN KEY (user_id)
        REFERENCES tb_user (user_id);

        ALTER TABLE tb_band_img
        ADD CONSTRAINT FK_tb_user_TO_band_img
        FOREIGN KEY (user_id)
        REFERENCES tb_user (user_id);

        ALTER TABLE tb_band
        ADD CONSTRAINT FK_tb_user_TO_band
        FOREIGN KEY (user_id)
        REFERENCES tb_user (user_id);

        ALTER TABLE tb_band_vote
        ADD CONSTRAINT FK_tb_user_TO_vote
        FOREIGN KEY (user_id)
        REFERENCES tb_user (user_id);
        
commit;