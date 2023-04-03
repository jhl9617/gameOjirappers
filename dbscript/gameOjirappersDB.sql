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

DROP TABLE TB_GAME cascade constraints;
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

SET DEFINE OFF;
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('979080','Rebel Forces','FreezeNova.Games','FreezeNova.Games','0','0',0,'{linux=false, windows=true, mac=false}',0,'싱글 플레이어/멀티플레이어/PvP/온라인 PvP/Steam 도전 과제/통계/Steam 순위표/','액션/무료/인디/','https://cdn.akamai.steamstatic.com/steam/apps/979080/header.jpg?t=1639257020','http://cdn.akamai.steamstatic.com/steam/apps/256737424/movie480.mp4?t=1545156519','2018년 12월 20일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/979080/059bdac33dec1da181eee8fd9ef310abe2b036d8.jpg, name=First Blood}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/979080/059bdac33dec1da181eee8fd9ef310abe2b036d8.jpg, name=10 Kills}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/979080/059bdac33dec1da181eee8fd9ef310abe2b036d8.jpg, name=20 Kills}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/979080/059bdac33dec1da181eee8fd9ef310abe2b036d8.jpg, name=30 Kills}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/979080/059bdac33dec1da181eee8fd9ef310abe2b036d8.jpg, name=40 Kills}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/979080/059bdac33dec1da181eee8fd9ef310abe2b036d8.jpg, name=50 Kills}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/979080/059bdac33dec1da181eee8fd9ef310abe2b036d8.jpg, name=100 Kills}]',1288,3,'Are you ready to be the ultimate soldier and fight until you defeat all of your enemies?','영어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 7<br></li><li><strong>프로세서:</strong> Intel Core 2 Duo E6600/AMD Phenom X3 8750<br></li><li><strong>메모리:</strong> 2 GB RAM<br></li><li><strong>그래픽:</strong> GeForce GTX 260/Radeon HD 4870<br></li><li><strong>DirectX:</strong> 버전 9.0c<br></li><li><strong>네트워크:</strong> 초고속 인터넷 연결<br></li><li><strong>저장공간:</strong> 512 MB 사용 가능 공간</li></ul>',null);
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('512470','The Pirate: Caribbean Hunt','Home Net Games','Home Net Games','0','0',0,'{linux=true, windows=true, mac=true}',0,'싱글 플레이어/멀티플레이어/PvP/온라인 PvP/협동/온라인 협동/플랫폼간 멀티플레이어/앱 내 구매/Steam Cloud/','액션/어드벤처/무료/인디/시뮬레이션/전략/','https://cdn.akamai.steamstatic.com/steam/apps/512470/header.jpg?t=1607189984','http://cdn.akamai.steamstatic.com/steam/apps/256705411/movie480.mp4?t=1515529472','2016년 8월 24일',null,3317,70,'검은 깃발안에 하얀 해골이 있고, 푸른 파도와 야망이 있는 해적의 시대에 카리브해 중심으로 항해하십시오. 해적기를 들어올리고 배의 키를 잡으며 전투와 습격을 하고, 보물을 찾아내어 앤틸리스제도의 강력한 왕이 되어 보세요.','영어, 프랑스어, 이탈리아어, 독일어, 스페인어 - 스페인, 한국어, 폴란드어, 포르투갈어 - 포르투갈, 러시아어, 중국어 간체, 우크라이나어','<strong>최소:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다<br></li><li><strong>운영체제:</strong> Windows XP<br></li><li><strong>프로세서:</strong> Core 2 Duo or equivalent - 1.5 GHz or higher<br></li><li><strong>메모리:</strong> 512 MB RAM<br></li><li><strong>그래픽:</strong> 256 MB VRAM<br></li><li><strong>DirectX:</strong> 버전 9.0b<br></li><li><strong>저장공간:</strong> 200 MB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> DirectX compatible</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다<br></li><li><strong>운영체제:</strong> Windows 7<br></li><li><strong>프로세서:</strong> Core 2 Duo or equivalent - 2.0 GHz or higher<br></li><li><strong>메모리:</strong> 1 GB RAM<br></li><li><strong>그래픽:</strong> 1 GB VRAM<br></li><li><strong>DirectX:</strong> 버전 9.0b<br></li><li><strong>네트워크:</strong> 초고속 인터넷 연결<br></li><li><strong>저장공간:</strong> 200 MB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> DirectX compatible</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('1644960','NBA 2K22','Visual Concepts','2K','65,000','65,000',0,'{linux=false, windows=true, mac=false}',0,'싱글 플레이어/멀티플레이어/PvP/온라인 PvP/스크린 공유 및 분할 PvP/협동/온라인 협동/스크린 공유 및 분할 협동/공유/분할 화면/Steam 도전 과제/컨트롤러 완벽 지원/앱 내 구매/Steam Cloud/태블릿용 Remote Play/Remote Play Together/','시뮬레이션/스포츠/','https://cdn.akamai.steamstatic.com/steam/apps/1644960/header.jpg?t=1660885243','http://cdn.akamai.steamstatic.com/steam/apps/256843283/movie480.mp4?t=1626480438','2021년 9월 9일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/5e1871eb6db93aa089fc053ebcb0ee66c6a6e214.jpg, name=나쁘지 않은데}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/5912797f170cb16e753b9d277ca26d44ce510ff9.jpg, name=멋진데}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/d363be381f93bbe7a534d0fd20de28fc6b942cc1.jpg, name=Doc의 손길이 필요해}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/1a4f1707121cb525f1ce32de132e5fe1be7974d3.jpg, name=전술폭격기}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/68d382669e027765b7296ec494ce58432405fda4.jpg, name=오늘 저녁은?}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/19ecd37681677747ad3308be8ecb7fd24210a6f8.jpg, name=폴짝폴짝!}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/b966b8308524d6c542ac7de07b8be1096eb2ff58.jpg, name=나를 팔로우하라...}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/4654e81b6cfd23a9778cdeb57c35a2ef6576021c.jpg, name=사회적 거리두기}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/dd163e4172c0813328596cebb8b2b820675582c9.jpg, name=통통 튀네}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1644960/db374e246367c9a064d886ed377fe512afedede9.jpg, name=운수 좋은 날}]',21927,5893,'NBA 2K22가 완전한 농구 유니버스를 선사합니다. NBA 2K22에서는 누구든지 어디서든 농구를 즐길 수 있습니다.','영어<strong>*</strong>, 프랑스어, 이탈리아어, 스페인어 - 스페인, 일본어, 한국어, 중국어 간체, 중국어 번체, 독일어<br><strong>*</strong>음성이 지원되는 언어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 7 64-bit, Windows 8.1 64-bit or Windows 10 64-bit<br></li><li><strong>프로세서:</strong> Intel® Core™ i3-2100 @  3.10 GHz/ AMD FX-4100 @ 3.60 GHz or better<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> NVIDIA® GeForce® GT 450 1GB/ ATI® Radeon™ HD 7770 1 GB or better<br></li><li><strong>DirectX:</strong> 버전 11<br></li><li><strong>네트워크:</strong> 초고속 인터넷 연결<br></li><li><strong>저장공간:</strong> 110 GB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> Directx 9.0x<br></li><li><strong>추가 사항:</strong> Dual-analog Gamepad recommended. Initial installation requires one-time internet connection for Steam authentication; software installations required (included with the game) include DirectX and Visual C++ Redistributable 2012. In order to play NBA 2K22 on PC, you need a processor capable of supporting SSE 4.2 and AVX.</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 7 64-bit, Windows 8.1 64-bit or Windows 10 64-bit<br></li><li><strong>프로세서:</strong> Intel® Core™ i5-4430 @ 3 GHz/ AMD FX-8370 @ 3.4 GHz or better<br></li><li><strong>메모리:</strong> 8 GB RAM<br></li><li><strong>그래픽:</strong> NVIDIA® GeForce® GTX 770 2GB/ ATI® Radeon™ R9 270 2GB or better<br></li><li><strong>DirectX:</strong> 버전 11<br></li><li><strong>네트워크:</strong> 초고속 인터넷 연결<br></li><li><strong>저장공간:</strong> 110 GB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> Directx 9.0c<br></li><li><strong>추가 사항:</strong> Dual-analog Gamepad recommended. Initial installation requires one-time internet connection for Steam authentication; software installations required (included with the game) include DirectX and Visual C++ Redistributable 2012. In order to play NBA 2K22 on PC, you need a processor capable of supporting SSE 4.2 and AVX.</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('285310','RollerCoaster Tycoon®: Deluxe','Chris Sawyer Productions','Atari','6,500','6,500',0,'{linux=false, windows=true, mac=false}',0,'싱글 플레이어/','시뮬레이션/전략/','https://cdn.akamai.steamstatic.com/steam/apps/285310/header.jpg?t=1633714923','http://cdn.akamai.steamstatic.com/steam/apps/2032519/movie480.mp4?t=1447362014','2014년 5월 21일',null,6079,259,'RollerCoaster Tycoon Deluxe takes you for a ride in the original RollerCoaster Tycoon and its expansion packs, Corkscrew Follies and Loopy Landscapes. Create the ultimate theme park using a variety of coaster types with giant loops and barrel rolls and in-park attractions like suspended monorails and water-soaked plume rides.','영어, 프랑스어, 이탈리아어, 독일어, 스페인어 - 스페인','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows XP or Windows Vista<br></li><li><strong>프로세서:</strong> 1.8 GHz Processor<br></li><li><strong>메모리:</strong> 512 MB RAM<br></li><li><strong>그래픽:</strong> 3D graphics card compatible with DirectX 7<br></li><li><strong>DirectX:</strong> 버전 7.0<br></li><li><strong>저장공간:</strong> 2 GB 사용 가능 공간</li></ul>',null);
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('1262240','식물 vs. 좀비™: 네이버빌의 대난투','PopCap','Electronic Arts','44,000','44,000',0,'{linux=false, windows=true, mac=false}',77,'싱글 플레이어/멀티플레이어/PvP/온라인 PvP/Steam 도전 과제/컨트롤러 완벽 지원/','액션/캐주얼/전략/','https://cdn.akamai.steamstatic.com/steam/apps/1262240/header.jpg?t=1614957327','http://cdn.akamai.steamstatic.com/steam/apps/256786300/movie480.mp4?t=1591282672','2020년 6월 4일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/443bcc0a8d14eab4e814219d197d1c46127e3f77.jpg, name=완두콩 수호자}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/b2d777abfc01c996325a4ace14ba4270c0483afd.jpg, name=과성장}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/a3fb0bbf03833f4b3b656ac55fc2aee585b54824.jpg, name=선인장이 있기에 완벽해}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/67eb9aa04db6aac8b34c20415fa73e67645a31e7.jpg, name=간식 시간}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/1de77f3f6e78fdafbb19ffedd05a99df30e92a62.jpg, name=뻥이요!}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/8f187351b1b76bfad9188a1cd9f5241eaa9b56fe.jpg, name=최고 중 최고}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/f60626c88cba090e1f2ea8e4017fa9450776c20e.jpg, name=장미 나가신다!}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/fc1fe09bed160e271481d43627267881139ce674.jpg, name=캡 조심하세요}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/a1c331ac6495cbca571e88a23e07acc9a5e34a0a.jpg, name=바베큐 먹을 사람?}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1262240/18387fc0ae4677df0aa2eaa3b46bef569860a655.jpg, name=완전 미쳐버릴 시간}]',8127,363,'세상에서 가장 기묘한 슈팅 게임, 식물 vs. 좀비: 네이버빌의 대난투에서 벌어지는 치열한 전투에 대비하세요!','영어, 프랑스어, 이탈리아어, 독일어, 스페인어 - 스페인, 아랍어, 일본어, 한국어, 폴란드어, 포르투갈어 - 브라질, 러시아어, 중국어 간체, 스페인어-중남미, 중국어 번체','<strong>최소:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다<br></li><li><strong>운영체제:</strong> 64-bit Windows 10<br></li><li><strong>프로세서:</strong> AMD: FX-4350 or Equivalent/ Intel: i3-3220 or Equivalent<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> AMD: Radeon HD 7730 or Equivalent/ NVIDIA: GeForce GT 640 or Equivalent<br></li><li><strong>DirectX:</strong> 버전 11<br></li><li><strong>네트워크:</strong> 초고속 인터넷 연결<br></li><li><strong>저장공간:</strong> 15 GB 사용 가능 공간</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다<br></li><li><strong>운영체제:</strong> 64-bit Windows 10<br></li><li><strong>프로세서:</strong> AMD: FX-6100 or Equivalent/ Intel: i5-3570 or Equivalent<br></li><li><strong>메모리:</strong> 8 GB RAM<br></li><li><strong>그래픽:</strong> AMD: Radeon R9 285 or Equivalent/ NVIDIA: GeForce GTX 970 or Equivalent<br></li><li><strong>DirectX:</strong> 버전 11<br></li><li><strong>네트워크:</strong> 초고속 인터넷 연결<br></li><li><strong>저장공간:</strong> 15 GB 사용 가능 공간</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('317470','Cubic Castles','Cosmic Cow LLC','Cosmic Cow LLC','0','0',0,'{linux=false, windows=true, mac=false}',0,'멀티플레이어/MMO/','액션/어드벤처/캐주얼/무료/인디/대규모 멀티플레이어/','https://cdn.akamai.steamstatic.com/steam/apps/317470/header.jpg?t=1600732921','http://cdn.akamai.steamstatic.com/steam/apps/2033938/movie480.mp4?t=1539624490','2014년 8월 13일',null,3142,38,'Your blocks, your castle, your world! Build anything you can dream up and explore with other players! Cubic Castles is a mini-MMO that combines the best of block-building and 3D platform action! Create fantastic parkour challenges, explore worlds made by other players, or even make friend!','영어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 7<br></li><li><strong>프로세서:</strong> Core 2 Duo or higher.  Athlon 64 or higher<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> 1024x768, DirectX 10<br></li><li><strong>DirectX:</strong> 버전 10<br></li><li><strong>네트워크:</strong> 초고속 인터넷 연결<br></li><li><strong>저장공간:</strong> 50 MB 사용 가능 공간</li></ul>',null);
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('606880','GreedFall','Spiders','Focus Entertainment','34,800','10,440',70,'{linux=false, windows=true, mac=false}',72,'싱글 플레이어/Steam 도전 과제/컨트롤러 완벽 지원/Steam Cloud/','RPG/','https://cdn.akamai.steamstatic.com/steam/apps/606880/header.jpg?t=1663150674','http://cdn.akamai.steamstatic.com/steam/apps/256841035/movie480.mp4?t=1625049015','2019년 9월 9일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/468cf89a8f694c2ce920fba1bf2e54cc870e2099.jpg, name=All sails set!}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/c3b2dbd7029f7fb853901bb82c7d61f8038020d4.jpg, name=The Prince''s secrets}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/dd1b3780239f412fe05565d7b2271fc62d54ee9a.jpg, name=Missed coup}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/8985898e820f10e6f6b1c3c3412cd7b7293388f1.jpg, name=Betrayal in blood}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/32720d9b75c2bf9b9030642f4d0d4d9cbed387c7.jpg, name=In the name of the Enlightened}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/16796db703c227904bcb2050773bca05af1653ce.jpg, name=A preserved Alliance}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/24dec5a4f476660508c07a49aca1edc04eb1aaa1.jpg, name=Waterproof}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/2389a573d1eca49cf4a295d0cb85ec8873f1537a.jpg, name=Outside the stone prison}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/f6a5c9b70ebb10be95713d5681d31870ad02bcc9.jpg, name=Influence game}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/606880/908f62df9d34edb3e8ebfd86a5cb6abfb6aff2ca.jpg, name=En on m?l frichtimen}]',13253,279,'Engage in a core roleplaying experience, and forge the destiny of a new world seeping with magic, and filled with riches, lost secrets, and fantastic creatures. With diplomacy, deception and force, become part of a living, evolving world - influence its course and shape your story.','영어<strong>*</strong>, 프랑스어, 이탈리아어, 독일어, 스페인어 - 스페인, 폴란드어, 포르투갈어 - 브라질, 러시아어, 중국어 간체<br><strong>*</strong>음성이 지원되는 언어','<strong>최소:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다<br></li><li><strong>운영체제:</strong> Windows 7/8/10 (64 bits)<br></li><li><strong>프로세서:</strong> Intel Core i5-3450 (3.1 GHz) / AMD FX-6300 X6 (3.5 GHz)<br></li><li><strong>메모리:</strong> 8 GB RAM<br></li><li><strong>그래픽:</strong> 2 GB, GeForce GTX 660/Radeon HD 7870<br></li><li><strong>저장공간:</strong> 25 GB 사용 가능 공간<br></li><li><strong>추가 사항:</strong> INTERNET CONNECTION REQUIRED FOR GAME ACTIVATION</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다<br></li><li><strong>운영체제:</strong> Windows 7/8/10 (64 bits)<br></li><li><strong>프로세서:</strong> Intel Core i5-4690 (3.5 GHz)/AMD FX-8300 (3.3 GHz)<br></li><li><strong>메모리:</strong> 16 GB RAM<br></li><li><strong>그래픽:</strong> 4 GB, GeForce GTX 980 / Radeon RX 590<br></li><li><strong>저장공간:</strong> 25 GB 사용 가능 공간<br></li><li><strong>추가 사항:</strong> INTERNET CONNECTION REQUIRED FOR GAME ACTIVATION</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('365300','Transmissions: Element 120','Shokunin, Thomas M. Visser, Vincent Thiele','Self Published','0','0',0,'{linux=true, windows=true, mac=false}',0,'싱글 플레이어/Steam 도전 과제/자막 이용 가능/VR 지원/컨트롤러 일부 지원/Steam Cloud/','액션/무료/인디/','https://cdn.akamai.steamstatic.com/steam/apps/365300/header.jpg?t=1467019620','http://cdn.akamai.steamstatic.com/steam/apps/2038646/movie480.mp4?t=1466082040','2016년 6월 16일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/efa9940fb2156035b833b169df2e118e6716d3e0.jpg, name=Reunited}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/18b799bc95503d6b4b4473cd74343e123f65551a.jpg, name=Gravity Jump}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/83c9d2206a5af9160d143eb31e16ccdc638639ee.jpg, name=Catch em all}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/7cb763ea583b7a6b0d86442e15245b70e95ed397.jpg, name=Scholar}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/6df87a21cc0509f18e3ccda5e6df05574207eaa8.jpg, name=Metroidvania}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/be262bb7f2c2b2b9079804fedb4ed40b11651db6.jpg, name=Slicer}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/c1bfd0d4f35fcb85342c1c06cd0901c9cf746a02.jpg, name=Wake}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/eb747917317d17317290a231895e1fc20dac6ad3.jpg, name=Escape}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/565fecc7c41e635a7c1f860ecd3c9200af71e8df.jpg, name=Animus}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/365300/a8488160c093e7ef60a68ebfb6bf59974b67cfc3.jpg, name=Terminus}]',8849,3,'TE120 is a short single player experience set in the Half-Life Universe featuring a gravity defying weapon that allows you to jump buildings and sustain large falls. The story takes place at a mysterious date &amp; location. Where are you? Why have you been sent?','영어<strong>*</strong>, 프랑스어, 독일어, 스페인어 - 스페인, 러시아어<br><strong>*</strong>음성이 지원되는 언어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows® 10/8/7 32/64-bit / Vista 32/64 / XP<br></li><li><strong>프로세서:</strong> Pentium 4 3.0GHz<br></li><li><strong>메모리:</strong> 2 GB RAM<br></li><li><strong>그래픽:</strong> Video card with 128 MB, Shader model 2.0. ATI X800, NVidia 6600 or better<br></li><li><strong>DirectX:</strong> 버전 8.1<br></li><li><strong>저장공간:</strong> 4 GB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> DirectX 8.1 compatible sound card</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows® 10/8/7 32/64-bit / Vista 32/64 / XP<br></li><li><strong>프로세서:</strong> Intel core 2 duo 2.4GHz<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> Video Card Shader model 3.0. NVidia 7600, ATI X1600 or better<br></li><li><strong>DirectX:</strong> 버전 9.0c<br></li><li><strong>저장공간:</strong> 4 GB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> DirectX 8.1 compatible sound card</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('411300','ELEX','Piranha Bytes','THQ Nordic','31,000','31,000',0,'{linux=false, windows=true, mac=false}',67,'싱글 플레이어/Steam 도전 과제/컨트롤러 완벽 지원/Steam 트레이딩 카드/Steam Cloud/TV용 Remote Play/','액션/어드벤처/RPG/','https://cdn.akamai.steamstatic.com/steam/apps/411300/header.jpg?t=1665411336','http://cdn.akamai.steamstatic.com/steam/apps/256698163/movie480.mp4?t=1508162076','2017년 10월 17일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/fe83bf86554ecb450fab06d12a868076e751ad24.jpg, name=Survival}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/d49a09fe726c713faf720e909abb6fc921f70ef8.jpg, name=Butcher}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/cf89fd6b45ca793a67780d03acadd8fdbf41baf6.jpg, name=Safecracker}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/90d9e5713a41766eb9b6e30a87e5cf29d77bae80.jpg, name=Pilferer}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/7e63a606ddd3e5e71b2ab03800cd90559de20866.jpg, name=Atombouncer}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/5ace5a454f12b03985046f74d600cc8ff18fc1df.jpg, name=Fencing master}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/00a583e1abdbd233a8adb2f5addcf9117441ec72.jpg, name=Leader}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/5778c40119b82ab2669afa4a14b6607781c5f8f8.jpg, name=Earner}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/54a7d77aa56c386626a6baaf8251d88c280cb8ed.jpg, name=Detective}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/411300/803f7afa101132c93c2af28bf744bcb829c4412d.jpg, name=Flashback}]',13222,264,'ELEX is a handcrafted action role-playing experience from the award-winning creators of the Gothic series, set in a brand new post-apocalyptic Science Fantasy universe that puts players into a huge seamless game world full of original characters, mutated creatures, deep moral choices and powerful action.','영어<strong>*</strong>, 프랑스어, 이탈리아어, 독일어<strong>*</strong>, 스페인어 - 스페인, 폴란드어<strong>*</strong>, 러시아어, 체코어, 중국어 간체<br><strong>*</strong>음성이 지원되는 언어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> 64-bit Windows 7, Windows 8.1, Windows 10<br></li><li><strong>프로세서:</strong> Intel Core i5 3570, AMD FX-6350<br></li><li><strong>메모리:</strong> 8 GB RAM<br></li><li><strong>그래픽:</strong> NVIDIA GTX 660 2GB, AMD Radeon 7850 2GB<br></li><li><strong>DirectX:</strong> 버전 11<br></li><li><strong>저장공간:</strong> 35 GB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> DirectX compatible Sound card</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> 64-bit Windows 7, Windows 8.1, Windows 10<br></li><li><strong>프로세서:</strong> Intel Core i7-4790, AMD FX-8350<br></li><li><strong>메모리:</strong> 16 GB RAM<br></li><li><strong>그래픽:</strong> NVIDIA GTX 1060 3GB, AMD RX 480 4GB<br></li><li><strong>DirectX:</strong> 버전 11<br></li><li><strong>저장공간:</strong> 35 GB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> DirectX compatible Sound card</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('638230','Journey','thatgamecompany','Annapurna Interactive','?17,950','? 17,950',0,'{linux=false, windows=true, mac=false}',0,'싱글 플레이어/멀티플레이어/협동/온라인 협동/Steam 도전 과제/컨트롤러 완벽 지원/Steam Cloud/모바일용 Remote Play/태블릿용 Remote Play/TV용 Remote Play/','어드벤처/인디/','https://cdn.akamai.steamstatic.com/steam/apps/638230/header.jpg?t=1660850060','http://cdn.akamai.steamstatic.com/steam/apps/256876892/movie480.mp4?t=1646936227','2020년 6월 11일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/74ec7b382cdfc71da205fc2246ab2d93bf581ba0.jpg, name=임계값}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/5be055e5bbdd8316fc5db0883467753fe89c4ae8.jpg, name=신기루}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/1b720be7be8fbeb702981df9049fd7862e7d060c.jpg, name=탐색}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/d1c81db8f20de2140771d959cb00d4d4e41136dc.jpg, name=모험}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/37566b3133727709bbaed88ddfb2999cc14f7770.jpg, name=선조}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/b205f62c26563e1625ac52970aabe82561875cd3.jpg, name=시험}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/5f6dda072e890a973f73b73e1ee5710710186d4c.jpg, name=역사}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/ade3f1b81006c60c4c40e764ccc4b9b8ea370312.jpg, name=횡단}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/d98c93739f1dc41bb7fe85fadf88f6a42e1eab17.jpg, name=부활}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/638230/70e1eb7640e5f773e152df042feb497d6d390a86.jpg, name=동반자}]',23216,42,'고대의 신비한 Journey의 세계를 탐험하고 유적을 탐험하고 사막을 탐사하며 그 비밀을 발견하세요.','영어, 프랑스어, 이탈리아어, 독일어, 스페인어 - 스페인, 아랍어, 네덜란드어, 일본어, 한국어, 폴란드어, 포르투갈어 - 브라질, 러시아어, 중국어 간체, 스페인어-중남미, 스웨덴어, 태국어, 중국어 번체, 튀르키예어','<strong>최소:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다<br></li><li><strong>운영체제:</strong> Windows 7<br></li><li><strong>프로세서:</strong> Intel Core i3-2120 | AMD FX-4350<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> Nvidia GTS 450 | AMD Radeon HD 5750<br></li><li><strong>저장공간:</strong> 4 GB 사용 가능 공간</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('403900','Clergy Splode','PiGravity','Back To Basics Gaming','1,100','1,100',0,'{linux=false, windows=true, mac=false}',0,'싱글 플레이어/Steam 트레이딩 카드/','액션/인디/','https://cdn.akamai.steamstatic.com/steam/apps/403900/header.jpg?t=1447378111','http://cdn.akamai.steamstatic.com/steam/apps/256656504/movie480.mp4?t=1447378115','2015년 9월 17일',null,208,44,'In the life of every Clergy Priest, there comes a moment when it turns out that there is no other solution than.... to just drop bombs everywhere and blow everything up... Clergy Splode is a fast paced, casual-arcade game.','영어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows XP/Windows Vista/Windows 7/8<br></li><li><strong>프로세서:</strong> 1.6 GHz<br></li><li><strong>메모리:</strong> 128 MB RAM<br></li><li><strong>그래픽:</strong> DirectX 9.0 Compatible<br></li><li><strong>저장공간:</strong> 200 MB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> DirectX 9.0 Compatible Sound</li></ul>',null);
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('1435790','방 탈출 시뮬레이터','Pine Studio','Pine Studio','16,500','16,500',0,'{linux=true, windows=true, mac=true}',0,'싱글 플레이어/멀티플레이어/협동/온라인 협동/플랫폼간 멀티플레이어/Steam 도전 과제/컨트롤러 완벽 지원/Steam 트레이딩 카드/Steam 창작마당/Steam Cloud/통계/레벨 에디터 포함/','어드벤처/캐주얼/인디/시뮬레이션/','https://cdn.akamai.steamstatic.com/steam/apps/1435790/header.jpg?t=1679652384','http://cdn.akamai.steamstatic.com/steam/apps/256856769/movie480.mp4?t=1670487353','2021년 10월 19일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/852da2139b89e3d4d7d569b23e985ffe2145a41d.jpg, name=Great Tower}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/32d9a29b2c70b90efad35b49b01133befa6eb669.jpg, name=Cleaner}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/52f5b13ea3fc762ba6fd750954ac04df0efe970d.jpg, name=Break Out}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/ae3917f6b2a929dd8bb57113f44b9b0d3f7cc53d.jpg, name=Destroyer}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/0526ba37ac74f1f2cf5a4315ca6edee8d80d3e90.jpg, name=Escape Room}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/a2d789e374a941b5ecdb9b9f21e9fa5568138cf2.jpg, name=Escape Together}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/3b1d163f382dfbe915e1867a6d8a13440bc81999.jpg, name=First in Collection}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/758ad6517483129f21be2bd8ad4c6f0968bd590e.jpg, name=Egypt Escapist}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/8213cd9a01327479ba02e6aaa04811df814392fe.jpg, name=Egypt Collector}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/1435790/f736118ae6952139d611aa4add7d62fffbf2ffb4.jpg, name=Space Escapist}]',10035,910,'Escape Simulator는 단독 또는 온라인 협동 플레이가 가능한 1인칭 퍼즐 게임입니다. 점점 더 많아지는, 고도의 상호 작용이 가능한 방탈출 세트를 탐험하세요. 가구를 옮기고, 모든 것을 집어 들고 검사하고, 냄비를 부수고 자물쇠를 부수세요! 레벨 편집기를 통해 커뮤니티가 만든 방을 지원합니다.','영어<strong>*</strong>, 일본어<strong>*</strong>, 한국어<strong>*</strong>, 중국어 간체<strong>*</strong>, 중국어 번체<strong>*</strong>, 프랑스어<strong>*</strong>, 독일어<strong>*</strong>, 스페인어 - 스페인<strong>*</strong>, 포르투갈어 - 포르투갈<strong>*</strong>, 포르투갈어 - 브라질<strong>*</strong>, 스페인어-중남미<strong>*</strong>, 튀르키예어<strong>*</strong>, 이탈리아어<strong>*</strong><br><strong>*</strong>음성이 지원되는 언어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 7 (SP1+)<br></li><li><strong>프로세서:</strong> X64 architecture with SSE2 instruction set support<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> DX10-capable GPU<br></li><li><strong>저장공간:</strong> 18 GB 사용 가능 공간<br></li><li><strong>추가 사항:</strong> Some community-made rooms are quite big and performance heavy and need more RAM memory and better GPU.</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 10/11<br></li><li><strong>메모리:</strong> 16 GB RAM<br></li><li><strong>그래픽:</strong> GTX 1060 or better<br></li><li><strong>네트워크:</strong> 초고속 인터넷 연결<br></li><li><strong>저장공간:</strong> 19 GB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> Yes</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('12830','Operation Flashpoint: Dragon Rising','Codemasters','Codemasters, Electronic Arts','?10,500','? 10,500',0,'{linux=false, windows=true, mac=false}',76,'싱글 플레이어/컨트롤러 일부 지원/','액션/','https://cdn.akamai.steamstatic.com/steam/apps/12830/header.jpg?t=1627920748','http://cdn.akamai.steamstatic.com/steam/apps/5428/movie480.mp4?t=1447352571','2009년 10월 7일',null,1510,4,'Operation Flashpoint: Dragon Rising is a game about a fictitious conflict on one of the Sakhalin islands.','영어, 프랑스어, 독일어, 이탈리아어, 스페인어 - 스페인','<ul class="bb_ul"><li><strong>OS:</strong> Windows XP (SP2 or later), Windows 10 not supported.<br>								</li><li><strong>Processor:</strong> 2.4GHz Dual Core Processor<br>								</li><li><strong>Memory:</strong> 1 GB RAM<br>								</li><li><strong>Graphics:</strong> Nvidia 7600GT 256mb or ATI X1800XL 256mb<br>								</li><li><strong>DirectX®:</strong> DirectX 9.0c<br>								</li><li><strong>Hard Drive:</strong> 8 GB<br>								</li><li><strong>Sound:</strong> DirectX compatible sound output<br>								</li></ul>',null);
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('321960','Might & Magic® Heroes® VII','Limbic Entertainment','Ubisoft','?44,000','? 44,000',0,'{linux=false, windows=true, mac=false}',0,'싱글 플레이어/멀티플레이어/Steam 도전 과제/Steam 트레이딩 카드/','RPG/전략/','https://cdn.akamai.steamstatic.com/steam/apps/321960/header.jpg?t=1680008686','http://cdn.akamai.steamstatic.com/steam/apps/256656878/movie480.mp4?t=1447378305','2015년 9월 29일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/8c710eb7d7f0a83f51edf2c2c7fc13ee29b6b7eb.jpg, name=사랑이 우릴 갈라놓을지어니}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/b4315aae02af43d88230b321be471f7fb6be5659.jpg, name=마스파르 대 화산}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/e819d17bda73e4dc8352522134e8527fc58bf6a8.jpg, name=천일야}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/702cdbae441fb9f0b97b58ac17dad7be962a9dbd.jpg, name=마침내 하나가 되어}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/c6bebc5fbf7088abbc640ba8f94d55171f23314c.jpg, name=야레보르스의 검들}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/f9d888be2f3c6842599762cc3a9a9fea59800713.jpg, name=유력한 용의자들}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/6b9676a427f88f6abb4b44776cbaf801fabaa62f.jpg, name=언더다크의 군세}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/39cff0225386bc6f7491f43b57d5893b89dfe8fb.jpg, name=부러진 검}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/9af0f337e7711a01f12341eb4c31fd6e05aad0d0.jpg, name=크고 사나운 늑대}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/321960/4078e1d863c8367cf65611b57fa87dc3740ae9e1.jpg, name=악마를 향한 포효}]',3068,312,'Might &amp; Magic® Heroes® VII makes a triumphant return bringing you the essence of turn based strategy gaming. Set in a fantasy universe with RPG progression with a strong story narrative, you will embark on a journey that you will never forget!','영어<strong>*</strong>, 프랑스어<strong>*</strong>, 이탈리아어, 독일어<strong>*</strong>, 스페인어 - 스페인, 체코어, 헝가리어, 한국어, 폴란드어<strong>*</strong>, 러시아어<strong>*</strong>, 포르투갈어 - 브라질, 중국어 번체, 루마니아어<br><strong>*</strong>음성이 지원되는 언어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 8/8.1 (64bit only)<br></li><li><strong>프로세서:</strong> Intel Core i5 660  3.3 GHz  or AMD Phenom II X4 955 @ 3.2 GHz<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> nVidia GeForce GTX460 or AMD Radeon HD5850 (1024 MB VRAM)<br></li><li><strong>추가 사항:</strong> Game contains Denuvo <a href="https://steamcommunity.com/linkfilter/?url=http://(https://www.denuvo.com/)" target="_blank" rel=" noopener"  >(https://www.denuvo.com/)</a> anti-tamper technology. Originally released for Windows 7, the game can be played on Windows 10 and Windows 11 OS</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 8/8.1 (64bit only)<br></li><li><strong>프로세서:</strong> Intel Core i5 2400 @  3.1 GHz  or AMD FX-6100 @ 3.3 GHz<br></li><li><strong>메모리:</strong> 6 GB RAM<br></li><li><strong>그래픽:</strong> nVidia GeForce GTX670 or AMD Radeon HD7870 (2048 MB VRAM)<br></li><li><strong>추가 사항:</strong> Game contains Denuvo <a href="https://steamcommunity.com/linkfilter/?url=http://(https://www.denuvo.com/)" target="_blank" rel=" noopener"  >(https://www.denuvo.com/)</a> anti-tamper technology. Originally released for Windows 7, the game can be played on Windows 10 and Windows 11 OS</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('32440','LEGO® Star Wars™ - The Complete Saga','Traveller''s Tales','LucasArts, Lucasfilm, Disney','?20,500','? 20,500',0,'{linux=false, windows=true, mac=false}',77,'싱글 플레이어/멀티플레이어/공유/분할 화면/컨트롤러 완벽 지원/Steam Cloud/모바일용 Remote Play/태블릿용 Remote Play/TV용 Remote Play/Remote Play Together/','어드벤처/','https://cdn.akamai.steamstatic.com/steam/apps/32440/header.jpg?t=1604517910','http://cdn.akamai.steamstatic.com/steam/apps/256680921/movie480.mp4?t=1488932512','2009년 11월 12일',null,19577,227,'Kick Some Brick in I through VI! Play through all six Star Wars movies in one videogame! Adding new characters, new levels, new features and for the first time ever, the chance to build and battle your way through a fun Star Wars galaxy on your PC!','영어, 프랑스어, 이탈리아어, 독일어, 스페인어 - 스페인','<ul class="bb_ul"><li><strong>OS:</strong> Windows XP SP2/Vista<br>								</li><li><strong>Processor:</strong> Intel P3 1.0GHz or AMD Athlon XP or higher<br>								</li><li><strong>Memory:</strong> 156MB of RAM, 512MB required for Vista<br>								</li><li><strong>Graphics:</strong> 128MB Graphics card with Shader Model 2.0 Capability<br>								</li><li><strong>Hard Drive:</strong> 5GB of free space<br>							</li></ul>',null);
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('400630','Wuppo: Definitive Edition','Knuist & Perzik','SOEDESCO','?16,000','? 1,600',90,'{linux=false, windows=true, mac=true}',78,'싱글 플레이어/멀티플레이어/협동/스크린 공유 및 분할 협동/Steam 도전 과제/컨트롤러 완벽 지원/Steam 트레이딩 카드/Steam Cloud/TV용 Remote Play/Remote Play Together/','액션/어드벤처/인디/RPG/','https://cdn.akamai.steamstatic.com/steam/apps/400630/header.jpg?t=1672132324','http://cdn.akamai.steamstatic.com/steam/apps/256760257/movie480.mp4?t=1566909586','2016년 9월 29일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/50fbf528682a90dd9735ecfdcc39ca5c0c727369.jpg, name=Mud Wrestler}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/b84eb5387de333e15a56f32832a718e4c3c1cf53.jpg, name=Finally!}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/12874b048c6a783af5edb580efbc65ed590ac70b.jpg, name=A Friendly Future}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/83ad78031646bdad1801075bd315c09b9566e7ad.jpg, name=Gumgumgun Enthusiast}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/b9193b63f36272666c5ad7c001c385e0f48f0624.jpg, name=Maximum Firepower}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/1428546e97fd8210e8e4cfa65d69a76afacae85b.jpg, name=The Artist}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/f68310fca99ba9af33fc5d909f812438a20ad22a.jpg, name=What are you doing!?}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/6499f9b2a989eeb45e987417e48780cdf79c811d.jpg, name=Professional Exterminator}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/bb8d999f050fcc9af5b5cc8854ca9e2316ed7c4b.jpg, name=Fighter}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/400630/a6740a7d85a273904442e8f5457988d7cd22c60d.jpg, name=Historian}]',4715,29,'처음 보는 동물들과 퍼즐, 몬스터, 어지러운 정치 싸움으로 가득한 이상하면서도 매력적인 세계에서 새로운 집을 찾는 추방자 ‘움’이 되어 플레이합니다.','영어, 한국어, 중국어 간체, 포르투갈어 - 브라질, 폴란드어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows XP or higher<br></li><li><strong>프로세서:</strong> 1.2 GHz<br></li><li><strong>메모리:</strong> 2 GB RAM<br></li><li><strong>그래픽:</strong> 512mb video memory<br></li><li><strong>DirectX:</strong> 버전 9.0<br></li><li><strong>저장공간:</strong> 500 MB 사용 가능 공간</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 7 or higher<br></li><li><strong>프로세서:</strong> 2.0 GHz<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> 1 GB video memory<br></li><li><strong>DirectX:</strong> 버전 11<br></li><li><strong>저장공간:</strong> 1 GB 사용 가능 공간</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('234190','Receiver','Wolfire Games','Wolfire Games','5,600','5,600',0,'{linux=true, windows=true, mac=true}',0,'싱글 플레이어/','액션/인디/시뮬레이션/','https://cdn.akamai.steamstatic.com/steam/apps/234190/header.jpg?t=1667232597','http://cdn.akamai.steamstatic.com/steam/apps/2028610/movie480.mp4?t=1654551643','2013년 4월 29일',null,3252,8,'Receiver was created for the 7-day FPS challenge to explore gun handling mechanics, randomized levels, and unordered storytelling. Armed only with a handgun and an audio cassette player, you must uncover the secrets of the Mindkill in a building complex infested with automated turrets and hovering shock drones.','영어<strong>*</strong><br><strong>*</strong>음성이 지원되는 언어','<strong>Minimum:</strong><br><ul class="bb_ul"><li><strong>OS:</strong>Windows XP<br>	</li><li><strong>Processor:</strong>2.0 GHz<br>	</li><li><strong>Memory:</strong>1 GB RAM<br>	</li><li><strong>Graphics:</strong>Passmark G3D 250+<br>	</li><li><strong>Hard Drive:</strong>150 MB HD space</li></ul>','<strong>Recommended:</strong><br><ul class="bb_ul"><li><strong>OS:</strong>Windows 7<br>	</li><li><strong>Processor:</strong>2.0 GHz<br>	</li><li><strong>Memory:</strong>2 GB RAM<br>	</li><li><strong>Graphics:</strong>Passmark G3D 1000+<br>	</li><li><strong>Hard Drive:</strong>150 MB HD space</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('813630','Supraland','Supra Games','Supra Games','20,500','20,500',0,'{linux=false, windows=true, mac=false}',85,'싱글 플레이어/Steam 도전 과제/컨트롤러 완벽 지원/Steam 트레이딩 카드/Steam Cloud/','액션/어드벤처/인디/','https://cdn.akamai.steamstatic.com/steam/apps/813630/header.jpg?t=1659548168','http://cdn.akamai.steamstatic.com/steam/apps/256721007/movie480.mp4?t=1592782566','2019년 4월 5일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/8e67416dfb53accf7edf477d7b81356267214082.jpg, name=파이어 파이프를 지나서}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/5497c90cc1969d45ccbb7728a9781d3281e6a730.jpg, name=파란 마을 녀석들}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/ae465a158de95ce5424954b52ee7e8687f60ef29.jpg, name=신속함}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/4af984f5f8fa972d159a7d60c6dab1cd394820a2.jpg, name=재생}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/c1d92b3ddb39fbde9eabcefd9f2b686a5acfdf69.jpg, name=체력 바}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/7f078d8d0b6f8f8ec7f8c94f723705b9467f438d.jpg, name=포스 큐브}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/3fc4a46dfc76d1060d2ed9ec7b00892cd6f688e8.jpg, name=더블 점프}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/6c52e90089b6ada7b67589ae9030ca16e517dacf.jpg, name=트리플 점프}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/39cd416b5ea5c38b775a8fa5847c11bbc6b7fe24.jpg, name=언덕 오르기}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/813630/856169d99b9e78de2eb0e9d5a7f8a12532acf44c.jpg, name=텔레프래그}]',9944,51,'데모를 체험해보세요! 포탈, 젤다 및 메트로이드를 합쳐 놓았습니다. 탐험하고, 퍼즐을 풀고, 몬스터를 죽이고, 새로운 장소에 다다를 수 있도록 도와주는 비밀 업그레이드와 능력을 찾아내세요. 플레이 시간은 12-25 시간입니다.','영어, 프랑스어, 이탈리아어, 독일어, 포르투갈어 - 포르투갈, 포르투갈어 - 브라질, 핀란드어, 러시아어, 일본어, 중국어 번체, 중국어 간체, 스페인어 - 스페인, 튀르키예어, 헝가리어, 폴란드어, 한국어','<strong>최소:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다<br></li><li><strong>운영체제:</strong> Windows 7<br></li><li><strong>프로세서:</strong> Intel Core2Duo 2.66GHz<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> GTX 780<br></li><li><strong>저장공간:</strong> 4 GB 사용 가능 공간</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li>64비트 프로세서와 운영 체제가 필요합니다<br></li><li><strong>운영체제:</strong> Windows 10<br></li><li><strong>프로세서:</strong> Intel Core i5 6600 or AMD Ryzen 1600x<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> NVIDIA Geforce GTX 1060, 3 GB (Legacy: NVIDIA Geforce GTX 780, 4GB) or AMD RX 580, 4 GB (Legacy: AMD R9 290X, 4GB )<br></li><li><strong>저장공간:</strong> 4 GB 사용 가능 공간</li></ul>');
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('287980','Mini Metro','Dinosaur Polo Club','Dinosaur Polo Club','10,500','10,500',0,'{linux=true, windows=true, mac=true}',77,'싱글 플레이어/Steam 도전 과제/Steam 트레이딩 카드/Steam 창작마당/Steam Cloud/Steam 순위표/모바일용 Remote Play/태블릿용 Remote Play/','인디/시뮬레이션/전략/','https://cdn.akamai.steamstatic.com/steam/apps/287980/header_koreana.jpg?t=1670536585','http://cdn.akamai.steamstatic.com/steam/apps/256657129/movie480.mp4?t=1447378393','2015년 11월 6일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/5d96a0724d5ecdd3de3f5d283bf82b6c33d451f3.jpg, name=Oyster}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/286840cc1c8cfbf2a065d0e8d1cb20bb2109fa67.jpg, name=Navigo}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/286840cc1c8cfbf2a065d0e8d1cb20bb2109fa67.jpg, name=MetroCard}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/286840cc1c8cfbf2a065d0e8d1cb20bb2109fa67.jpg, name=Monatskarten}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/286840cc1c8cfbf2a065d0e8d1cb20bb2109fa67.jpg, name=Octopus}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/286840cc1c8cfbf2a065d0e8d1cb20bb2109fa67.jpg, name=イコカ}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/286840cc1c8cfbf2a065d0e8d1cb20bb2109fa67.jpg, name=Подорожник}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/286840cc1c8cfbf2a065d0e8d1cb20bb2109fa67.jpg, name=OPUS}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/5d96a0724d5ecdd3de3f5d283bf82b6c33d451f3.jpg, name=Bilhete ?nico}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/287980/5d96a0724d5ecdd3de3f5d283bf82b6c33d451f3.jpg, name=????}]',12913,142,'미니 메트로는 성장하는 도시를 위해 지하철 노선을 설계하는 게임입니다. 역과 역 사이에 노선을 그려서 열차 운행을 시작하세요. 새로운 역이 열리면 노선을 수정해서 노선도를 효율적으로 유지하세요. 한정된 자원을 어느 곳에 사용할 것인지 결정하세요. 도시를 얼마나 오래 유지할 수 있을까요?','영어, 프랑스어, 이탈리아어, 독일어, 스페인어 - 스페인, 체코어, 네덜란드어, 핀란드어, 그리스어, 일본어, 노르웨이어, 폴란드어, 포르투갈어 - 브라질, 러시아어, 중국어 간체, 중국어 번체, 헝가리어, 불가리아어, 덴마크어, 튀르키예어, 아랍어, 포르투갈어 - 포르투갈, 스웨덴어, 태국어, 우크라이나어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 7 SP1, 8, 10 or later<br></li><li><strong>프로세서:</strong> 2 GHz or faster processor<br></li><li><strong>메모리:</strong> 2 GB RAM<br></li><li><strong>그래픽:</strong> Shader Model 4.0<br></li><li><strong>DirectX:</strong> 버전 9.0c<br></li><li><strong>저장공간:</strong> 350 MB 사용 가능 공간</li></ul>',null);
Insert into game (APPID,NAME,DEVELOPER,PUBLISHER,INITIALPRICE,FINALPRICE,DISCOUNTRATE,PLATFORM,META,CATEGORY,GENRE,HEADERIMG,MOVIE,RELEASEDATE,ACHIEVEMENT,POSITIVE,CCU,SHORT_DESCRIPTION,SUPPORTED_LANGUAGES,PCMINIMUM,PCRECOMMENDED) values ('258180','Deus Ex: The Fall',null,'Eidos Interactive Corp.','10,500','10,500',0,'{linux=false, windows=true, mac=false}',45,'싱글 플레이어/Steam 도전 과제/컨트롤러 완벽 지원/Steam 트레이딩 카드/','액션/어드벤처/RPG/','https://cdn.akamai.steamstatic.com/steam/apps/258180/header.jpg?t=1675710071','http://cdn.akamai.steamstatic.com/steam/apps/2031472/movie480.mp4?t=1447360928','2014년 3월 17일','[{path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/2fa46d5055cc29498158e1e9d02f15e2e857a24f.jpg, name=Smashing Entrance}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/311586bec88107b50e5e06f52d9e3f1b8709d083.jpg, name=Double Trouble}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/2a0c22b5e416e0fd97cf34fca11e086ab04b7612.jpg, name=Unstoppable}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/00ea3734fd2334cb0e610e54522be16fbca47eb3.jpg, name=Scavenger}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/04efcb709209611a81ccc8e523f9c1a354a7156f.jpg, name=Smackdown}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/40286d6fc1cd20dd1f5b79d1294dc17427b0e6a0.jpg, name=Hack the Planet}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/93cc16397c18bd2c78a4a93ea09371883f5b77b1.jpg, name=One Shot, One Kill}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/996c5c98307ce433d8de431fe365ec33f09f12ab.jpg, name=Bomb Squad}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/461b16a4222ec61d71605d70a1bd78e1677a21ce.jpg, name=Not So Human After All}, {path=https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/258180/2fdea94de24e8bf176b64d345cae8199fbb24b66.jpg, name=Crunch Time}]',1461,5,'OVERVIEW:Deus Ex: The Fall is set in 2027? a golden era for science, technology and human augmentation, but also a time of great social divide and global conspiracy. Powerful corporations have seized control from governments and command the drug supply needed by augmented humans to survive.','영어<strong>*</strong>, 프랑스어, 이탈리아어, 독일어, 스페인어 - 스페인<br><strong>*</strong>음성이 지원되는 언어','<strong>최소:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows XP SP2<br></li><li><strong>프로세서:</strong> 2GHz dual core<br></li><li><strong>메모리:</strong> 2 GB RAM<br></li><li><strong>그래픽:</strong> DirectX 9.0c compatible graphics card<br></li><li><strong>DirectX:</strong> 버전 9.0c<br></li><li><strong>저장공간:</strong> 4 GB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> Integrated audio interface</li></ul>','<strong>권장:</strong><br><ul class="bb_ul"><li><strong>운영체제:</strong> Windows 7 SP 1<br></li><li><strong>프로세서:</strong> Quad Core 2.66GHz CPU Intel or AMD<br></li><li><strong>메모리:</strong> 4 GB RAM<br></li><li><strong>그래픽:</strong> GeForce 500 Series or Radeon 7000 Series, 1 GB Graphics memory<br></li><li><strong>DirectX:</strong> 버전 9.0c<br></li><li><strong>저장공간:</strong> 4 GB 사용 가능 공간<br></li><li><strong>사운드카드:</strong> Integrated audio interface</li></ul>');



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