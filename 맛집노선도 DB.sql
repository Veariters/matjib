--팝업
CREATE TABLE mainpopup(
POP_STNAME VARCHAR2(100) primary key,     -- 역이름
POP_STADD VARCHAR2(100),          -- 주소
POP_STTEL VARCHAR2(20),          -- 전화번호
POP_Y VARCHAR2(150),
POP_X VARCHAR2(150)
);

SELECT * FROM mainpopup;
commit;
drop table mainpopup;
select * from MAINPOPUP where POP_STNAME='시청';
insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('시청','서울특별시 중구 서소문로 지하 127','02-6110-2011','37.56573294360118','126.9768595402395');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('을지로입구','서울특별시 중구 을지로 지하 42 ','02-6110-2021','37.566068427072956','126.98268460344046');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('을지로3가','서울특별시 중구 을지로 지하 106','02-6110-2031','37.56628920211006', '126.99105220662572');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('을지로4가','서울특별시 중구 을지로 지하 178','02-6110-2041','37.566622713775686', '126.99773242082661');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('동대문역사문화공원','서울특별시 중구 을지로 지하 279','02-6110-2051','37.56568180007095', '127.00895379349681');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('신당','서울특별시 중구 퇴계로 지하 431-1','02-6110-2061','37.56566965261619', '127.01944821954534');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('상왕십리','서울특별시 성동구 왕십리로 지하 374','02-6110-2071','37.56449953076405', '127.02887962045966');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('왕십리','서울특별시 성동구 왕십리로 지하300','02-6110-2081','37.561957504690575', '127.03849693476211');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('한양대','서울특별시 성동구 왕십리로 206','02-6110-2091','37.555594549570344', '127.04368304337162');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('뚝섬','서울특별시 성동구 아차산로18','02-6110-2101','37.54720304606396', '127.0474050508058');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('성수','서울특별시 성동구 아차산로 100','02-6110-2111','37.544582801650826', '127.05596104323455');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('건대입구','서울특별시 광진구 아차산로 243','02-6110-2121','37.54037953068672', '127.06925979673527');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('구의','서울특별시 광진구 아차산로 384-1','02-6110-2131','37.537151535482806', '127.08615183501924');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('강변','서울특별시 광진구 강변역로 53','02-6110-2141','37.53509536225337', '127.09469905385045');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('잠실나루','서울특별시 송파구 오금로 20','02-6110-2151','37.52067428674268', '127.10382471059694');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('잠실','서울특별시 송파구 올림픽로 지하 265','02-6110-2161','37.513279760833534', '127.1001176129744');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('잠실새내','서울특별시 송파구 올림픽로 지하 140','02-6110-2171','37.511579172207156', '127.08617291162166');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('종합운동장','서울특별시 송파구 올림픽로 지하 23','02-6110-2181','37.51104170390573', '127.07366666208154');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('삼성','서울특별시 강남구 테헤란로 지하 538','02-6110-2191','37.508884190076515', '127.06314314900794');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('선릉','서울특별시 강남구 테헤란로 지하 340','6110-2201','37.50449919574819', '127.04896494179025');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('역삼','서울특별시 강남구 테헤란로 지하 156','02-6110-2211','37.50076716737683', '127.03682697874405');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('강남','서울특별시 강남구 강남대로 지하 396','02-6110-2221','37.4979635469133','127.0276216126809');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('교대','서울특별시 서초구 서초대로 지하 294','02-6110-2231','37.49386809326812', '127.01422933980618');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('서초','서울특별시 서초구 서초대로 지하 233 ','02-6110-2241','37.491896426059014', '127.00791284257247');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('방배','서울특별시 서초구 방배로 지하 80','02-6110-2251','37.48146501336375', '126.99766347808759');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('사당','서울특별시 동작구 남부순환로 지하 2089','02-6110-2261','37.47653966220997', '126.98163056706497');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('낙성대','서울특별시 관악구 남부순환로 지하 1928','02-6110-2271','37.47712080515075', '126.96338497076563');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('서울대입구','서울특별시 관악구 남부순환로 지하 1822','02-6110-2281','37.48122995693047', '126.95275780027288');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('봉천','서울특별시 관악구 남부순환로 지하 1721','6110-2291','37.48248025161823', '126.94159938100414');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('신림','서울특별시 관악구 남부순환로 지하 1614','02-6110-2301','37.48424486517179', '126.92966793407336');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('신대방','서울특별시 동작구 대림로 2','02-6110-2310','37.48733893406277', '126.912987830544');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('구로디지털단지','서울특별시 구로구 도림천로 477','02-6110-2321','37.48521497981324', '126.9015832684769');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('대림','서울특별시 구로구 도림천로 352','02-6110-2331','37.493419159971026', '126.89491790382145');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('신도림','서울특별시 구로구 새말로 117-21','02-6110-2341','37.50881283782087', '126.89119125107514');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('문래','서울특별시 영등포구 당산로 지하 28','6110-2351','37.517965774094925', '126.89480229219582');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('영등포구청','서울특별시 영등포구 당산로 121','02-6110-2361','37.526071313066396', '126.8966806511236');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('당산','서울특별시 영등포구 당산로 229','02-6110-2371','37.533913330960566', '126.90191306971276');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('합정','서울특별시 마포구 양화로 지하 55','6110-2381','37.549643328596915', '126.913980068479');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('홍대입구','서울특별시 마포구 양화로지하160','02-6110-2391','37.556955472108356', '126.92389931514917');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('신촌','서울특별시 마포구 신촌로 지하 90','02-6110-2401','37.555155003359644', '126.93689719599213');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('이대','서울특별시 마포구 신촌로 지하180','02-6110-2411','37.556792485079924', '126.94631364149171');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('아현','서울특별시 마포구 신촌로 지하 270','02-6110-2421','37.55739545375761', '126.9561696058233');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('충정로','서울특별시 서대문구 서소문로 지하 17','02-6110-2431','37.55953491036166', '126.96402618382092');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('용답','서울특별시 성동구 용답길 86','02-6110-1341','37.56216339290006', '127.05086477196839');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('신답','서울특별시 성동구 천호대로 232 ','02-6110-1351','37.56979847133718', '127.04710202915193');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('용두','서울특별시 동대문구 천호대로 지하 129','02-6110-1361','37.57399402185537', '127.0385096452648');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('신설동','서울특별시 동대문구 왕산로 지하 1','02-6110-1371','37.575769874488664', '127.02369123423352');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('도림천','서울특별시 구로구 신도림동 경인로 67길','02-6110-2441','37.51444028081474', '126.88262379514562');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('양천구청','서울특별시 양천구 목동로3길 지하 33','02-6110-2451','37.51238875244554', '126.86578299860258');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('신정네거리','서울특별시 양천구 중앙로 지하 261','02-6110-2461','37.52027253650188', '126.85286418381969');

insert into mainpopup(POP_STNAME,POP_STADD, POP_STTEL, POP_Y, POP_X)
values('까치산','서울특별시 강서구 강서로 지하54','02-6311-5181','37.53176917532383', '126.84670704759314');

commit;

--좌표값 수정용
UPDATE mainpopup set POP_Y='' , POP_X= '1' where POP_STNAME='';
--검색
select * from MAINPOPUP where POP_STNAME='강남';



--회원관리
create table MEMBER(
ID varchar2(40) not null,
PASS varchar2(40) not null,
NAME varchar2(100) not null,
ENGLISH varchar2(100) not null,
EMAIL varchar2(50) not null,
PHONE1 varchar2(50) not null,
PHONE2 varchar2(50) not null,
PHONE3 varchar2(50) not null,
ZIPCODE varchar2(50) not null,
ADDRESS1 varchar2(120) not null,
ADDRESS2 varchar2(50) not null,
LIKEFOOD varchar2(50),
ROLE varchar2(50) default 'USER' not null,
constraint MEMBER_PK primary key(ID)
);


INSERT INTO MEMBER (ID, PW, NAME, EMAIL, PHONE1, PHONE2, PHONE3, 
ZIPCODE, ADDRESS1, ADDRESS2, LIKEFOOD, ROLE)
VALUES ('test', '1234', 'apple', '111@naver.com', 010, 0000, 0000, '강남', '역삼동', '아파트', '한식', 'user');


select * from all_constraints;
commit;

select * from member; 

select id from member where name='유동환' and email='dongwhan931@naver.com';


drop table member;


-- I_BOARD 테이블(공지사항 게시판)
create table I_BOARD(
MI_NUM number(20),
MI_WRITER varchar2(50) not null,
MI_PASS varchar2(50) not null,
MI_SUBJECT varchar2(150) not null,
MI_READCOUNT number(5) default 0,
MI_CONTENT varchar2(4000) not null,
MI_IMAGE varchar2(200),
MI_POSTDATE timestamp default sysdate,
MI_RECOMMAND number(5), --추천테스트로 추가한코드. 나중에삭제
constraint I_BOARD_PK primary key(MI_NUM)
);



-- F_BOARD 테이블(자유게시판)
create table F_BOARD(
MF_NUM number(20),
MF_WRITER varchar2(50) not null,
MF_PASS varchar2(50) not null,
MF_SUBJECT varchar2(150) not null,
MF_READCOUNT number(5) default 0,
MF_CONTENT varchar2(4000) not null,
MF_IMAGE varchar2(200),
MF_UP number(5) default 0,
MF_POSTDATE timestamp default sysdate,
constraint F_BOARD_PK primary key(MF_NUM)
);
select * from f_board;

create table BOARDCHECK(
RV2CHECK number(4) default 10 not null ,
constraint BOARDCHECK_PK primary key(RV2CHECK)
);


create table R_BOARD(
MR_NUM number(20),
MR_WRITER varchar2(50) not null,
MR_PASS varchar2(50) not null,
MR_SUBJECT varchar2(150) not null,
MR_READCOUNT number(5) default 0,
MR_CONTENT varchar2(4000) not null,
MR_IMAGE varchar2(200),
MR_UP number(5) default 0,
MR_HEADER varchar2(50) not null,
MR_BCHECK number(4) default 0,
MR_POSTDATE timestamp default sysdate,
constraint R_BOARD_PK primary key(MR_NUM)
);
select * from R_BOARD;

-- 추천테이블
CREATE TABLE RECOMMEND(
NUM NUMBER(6),
id VARCHAR2(20) not null
);


--추천 중복 확인 테이블
CREATE TABLE RECOMMEND(
NUM NUMBER(6),
id VARCHAR2(20) not null
);


create table MAINPOPUP{
POP_IMG varchar2(30) not null,
POP_STNAME varchar2(30) not null,
POP_STADD varchar2(50) not null,
POP_STTEL varchar2(50) not null,
constraint MAINPOPUP_PK primary key(POP_STNAME)
);

create table MATZIP(
MAT_IMG varchar2(30) not null,
MAT_ZIPNAME varchar2(30) not null,
MAT_ZIPADD varchar2(50) not null,
MAT_ZIPTEL varchar2(50) not null,
constraint MATZIP_PK primary key(MAT_ZIPNAME)
);
select * from member;
select * from i_board;
select * from board;
insert into member values('tester','1234','나','theraofnox@gmail.com','010','1234','1234','02555','서울시','글로벌인','일식','관');
insert into i_board values(3, 'tester', '1234', 'test article', 10,'test','test c', sysdate);
commit;

select * from r_board;
select * from boardcheck;
insert into r_board values(1, 'tester', '1234','제목',0,'test article','image',0,'시청','10',sysdate);
commit;
desc r_board;




commit;

drop table r_board;
drop table boardcheck;
drop table i_board;
drop table f_board;
drop table member;