DROP TABLE "log";
DROP TABLE "Notify";
DROP TABLE "issue_roadmap";
DROP TABLE "issue_like";
DROP TABLE "issue_file";
DROP TABLE "issue_board";
DROP TABLE "issue_date";
DROP TABLE "read";
DROP TABLE "issue";
DROP TABLE "emoticon";
DROP TABLE "issue_comment";
DROP TABLE "authorities";
DROP TABLE "progress_name";
DROP TABLE "project_auth";
DROP TABLE "config";
DROP TABLE "Projects";
DROP TABLE "icons";
DROP TABLE "all_authorities";
DROP TABLE "Users";


CREATE TABLE "Users" (
	"ID"	varchar(20)		NOT NULL,
	"PWD"	varchar(50)		NOT NULL,
	"NAME"	varchar(30)		NOT NULL,
	"ENABLE"	char(1)	DEFAULT '1'	NULL,
	"EMAIL"	varchar(100)		NOT NULL,
	"icon_path"	varchar(100)		NOT NULL,
	"position"	varchar(20)		NULL
);

COMMENT ON COLUMN "Users"."ENABLE" IS '활성 1 비활성 null';

COMMENT ON COLUMN "Users"."icon_path" IS '아래 아이콘모음 중 랜덤값을 자바 코드상으로';

ALTER TABLE "Users" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
	"ID"
);

CREATE TABLE "all_authorities" (
	"ID"	varchar(20)		NOT NULL,
	"authority"	varchar(20)	DEFAULT 'ROLE_MEMBER'	NOT NULL
);

COMMENT ON COLUMN "all_authorities"."authority" IS '멤버 ROLE_MEMBER, 관리자 ROLE_ADMIN';

ALTER TABLE "all_authorities" ADD CONSTRAINT "PK_ALL_AUTHORITIES" PRIMARY KEY (
	"ID"
);

ALTER TABLE "all_authorities" ADD CONSTRAINT "FK_Users_TO_all_authorities_1" FOREIGN KEY (
	"ID"
)
REFERENCES "Users" (
	"ID"
);

CREATE TABLE "icons" (
	"no"	VARCHAR(255)		NOT NULL,
	"img_path"	varchar(100)		NOT NULL,
	"name"	varchar(10)		NOT NULL
);

COMMENT ON COLUMN "icons"."img_path" IS '이미지 파일 경로';

ALTER TABLE "icons" ADD CONSTRAINT "PK_ICONS" PRIMARY KEY (
	"no"
);

CREATE TABLE "Projects" (
	"no"	varchar(5)		NOT NULL,
	"name"	varchar(20)		NOT NULL,
	"info"	varchar(100)		NOT NULL,
	"icon"	varchar(100)		NOT NULL
);

COMMENT ON COLUMN "Projects"."no" IS '영문+숫자 4글자';

COMMENT ON COLUMN "Projects"."name" IS '프로젝트 display명';

COMMENT ON COLUMN "Projects"."info" IS '프로젝트 display정보';

COMMENT ON COLUMN "Projects"."icon" IS '프로젝트 icon정보';

ALTER TABLE "Projects" ADD CONSTRAINT "PK_PROJECTS" PRIMARY KEY (
	"no"
);

CREATE TABLE "config" (
	"no"	varchar(5)		NOT NULL
);

COMMENT ON COLUMN "config"."no" IS '영문+숫자 4글자';

ALTER TABLE "config" ADD CONSTRAINT "PK_CONFIG" PRIMARY KEY (
	"no"
);

ALTER TABLE "config" ADD CONSTRAINT "FK_Projects_TO_config_1" FOREIGN KEY (
	"no"
)
REFERENCES "Projects" (
	"no"
);

CREATE TABLE "project_auth" (
	"email"	varchar(100)		NOT NULL,
	"no"	varchar(5)		NOT NULL,
	"name"	varchar(20)		NOT NULL,
	"auth"	varchar(20)		NOT NULL,
	"Field"	VARCHAR(255)		NULL
);

COMMENT ON COLUMN "project_auth"."email" IS '초대하고자하는 사람의 이메일';

COMMENT ON COLUMN "project_auth"."no" IS '영문+숫자 4글자';

COMMENT ON COLUMN "project_auth"."name" IS '이메일에서 @이전 문자를 이름으로(자바코드상)';

COMMENT ON COLUMN "project_auth"."auth" IS '권한명';

ALTER TABLE "project_auth" ADD CONSTRAINT "PK_PROJECT_AUTH" PRIMARY KEY (
	"email",
	"no"
);

ALTER TABLE "project_auth" ADD CONSTRAINT "FK_Projects_TO_project_auth_1" FOREIGN KEY (
	"no"
)
REFERENCES "Projects" (
	"no"
);

CREATE TABLE "progress_name" (
	"progress"	number(2)		NOT NULL,
	"no"	varchar(5)		NOT NULL,
	"name"	varchar(20)		NOT NULL,
	"rank"	number(2)	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "progress_name"."progress" IS '프로젝트 코드 + 진행도가 기본키';

COMMENT ON COLUMN "progress_name"."no" IS '영문+숫자 4글자';

COMMENT ON COLUMN "progress_name"."name" IS '진행도 이름(ex. 진행 중)';

COMMENT ON COLUMN "progress_name"."rank" IS '진행도 순서';

ALTER TABLE "progress_name" ADD CONSTRAINT "PK_PROGRESS_NAME" PRIMARY KEY (
	"progress",
	"no"
);

ALTER TABLE "progress_name" ADD CONSTRAINT "FK_Projects_TO_progress_name_1" FOREIGN KEY (
	"no"
)
REFERENCES "Projects" (
	"no"
);

CREATE TABLE "authorities" (
	"ID"	varchar(20)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"authority"	varchar(20)	DEFAULT 'ROLE_MEMBER'	NOT NULL,
	"enable_date"	date		NULL
);

COMMENT ON COLUMN "authorities"."project_no" IS '영문+숫자 4글자';

COMMENT ON COLUMN "authorities"."authority" IS '멤버 ROLE_MEMBER, 관리자 ROLE_ADMIN';

ALTER TABLE "authorities" ADD CONSTRAINT "PK_AUTHORITIES" PRIMARY KEY (
	"ID",
	"project_no"
);

ALTER TABLE "authorities" ADD CONSTRAINT "FK_Users_TO_authorities_1" FOREIGN KEY (
	"ID"
)
REFERENCES "Users" (
	"ID"
);

ALTER TABLE "authorities" ADD CONSTRAINT "FK_Projects_TO_authorities_1" FOREIGN KEY (
	"project_no"
)
REFERENCES "Projects" (
	"no"
);

CREATE TABLE "issue_comment" (
	"seq"	number(3)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"issue_no"	number(5)		NOT NULL,
	"content"	varchar(300)		NOT NULL,
	"ID"	varchar(20)		NOT NULL
);

COMMENT ON COLUMN "issue_comment"."seq" IS 'auto_increment';

COMMENT ON COLUMN "issue_comment"."project_no" IS '영문+숫자 4글자';

COMMENT ON COLUMN "issue_comment"."issue_no" IS 'auto_increment';

ALTER TABLE "issue_comment" ADD CONSTRAINT "PK_ISSUE_COMMENT" PRIMARY KEY (
	"seq",
	"project_no",
	"issue_no"
);

ALTER TABLE "issue_comment" ADD CONSTRAINT "FK_Users_TO_issue_comment_1" FOREIGN KEY (
	"ID"
)
REFERENCES "Users" (
	"ID"
);

CREATE TABLE "emoticon" (
	"seq"	number(3)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"issue_no"	number(5)		NOT NULL,
	"ID"	varchar(20)		NOT NULL,
	"reaction"	varchar(20)		NOT NULL
);

COMMENT ON COLUMN "emoticon"."seq" IS 'auto_increment';

COMMENT ON COLUMN "emoticon"."project_no" IS '영문+숫자 4글자';

COMMENT ON COLUMN "emoticon"."issue_no" IS 'auto_increment';

COMMENT ON COLUMN "emoticon"."reaction" IS '엄지척, 박수, 활활 등';

ALTER TABLE "emoticon" ADD CONSTRAINT "PK_EMOTICON" PRIMARY KEY (
	"seq",
	"project_no",
	"issue_no",
	"ID"
);

ALTER TABLE "emoticon" ADD CONSTRAINT "FK_issue_comment_TO_emoticon_1" FOREIGN KEY (
	"seq"
)
REFERENCES "issue_comment" (
	"seq"
);

ALTER TABLE "emoticon" ADD CONSTRAINT "FK_issue_comment_TO_emoticon_2" FOREIGN KEY (
	"project_no"
)
REFERENCES "issue_comment" (
	"project_no"
);

ALTER TABLE "emoticon" ADD CONSTRAINT "FK_issue_comment_TO_emoticon_3" FOREIGN KEY (
	"issue_no"
)
REFERENCES "issue_comment" (
	"issue_no"
);

ALTER TABLE "emoticon" ADD CONSTRAINT "FK_Users_TO_emoticon_1" FOREIGN KEY (
	"ID"
)
REFERENCES "Users" (
	"ID"
);

CREATE TABLE "issue" (
	"no"	number(5)		NOT NULL,
	"value"	number(1)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"maker"	varchar(20)		NOT NULL,
	"pic"	varchar(20)		NULL,
	"ance_no"	number(5)		NULL,
	"progress"	number(2)		NOT NULL,
	"name"	varchar(20)		NOT NULL
);

COMMENT ON COLUMN "issue"."no" IS 'auto_increment';

COMMENT ON COLUMN "issue"."value" IS '에픽1, 일반이슈2 하위이슈3~>';

COMMENT ON COLUMN "issue"."project_no" IS '영문+숫자 4글자';

COMMENT ON COLUMN "issue"."maker" IS '이슈를 만든사람';

COMMENT ON COLUMN "issue"."pic" IS '이슈를 담당하는 사람';

COMMENT ON COLUMN "issue"."ance_no" IS '해당 이슈가 의존하는 상위 이슈';

COMMENT ON COLUMN "issue"."progress" IS '프로젝트 코드 + 진행도가 기본키';

ALTER TABLE "issue" ADD CONSTRAINT "PK_ISSUE" PRIMARY KEY (
	"no",
	"value",
	"project_no"
);

ALTER TABLE "issue" ADD CONSTRAINT "FK_Projects_TO_issue_1" FOREIGN KEY (
	"project_no"
)
REFERENCES "Projects" (
	"no"
);

ALTER TABLE "issue" ADD CONSTRAINT "FK_Users_TO_issue_1" FOREIGN KEY (
	"maker"
)
REFERENCES "Users" (
	"ID"
);

ALTER TABLE "issue" ADD CONSTRAINT "FK_Users_TO_issue_2" FOREIGN KEY (
	"pic"
)
REFERENCES "Users" (
	"ID"
);

ALTER TABLE "issue" ADD CONSTRAINT "FK_issue_TO_issue_1" FOREIGN KEY (
	"ance_no"
)
REFERENCES "issue" (
	"no"
);

ALTER TABLE "issue" ADD CONSTRAINT "FK_progress_name_TO_issue_1" FOREIGN KEY (
	"progress"
)
REFERENCES "progress_name" (
	"progress"
);

CREATE TABLE "read" (
	"no"	number(5)		NOT NULL,
	"value"	number(1)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"ID"	varchar(20)		NOT NULL
);

COMMENT ON COLUMN "read"."no" IS 'auto_increment';

COMMENT ON COLUMN "read"."value" IS '에픽1, 일반이슈2';

COMMENT ON COLUMN "read"."project_no" IS '영문+숫자 4글자';

ALTER TABLE "read" ADD CONSTRAINT "PK_READ" PRIMARY KEY (
	"no",
	"value",
	"project_no",
	"ID"
);

ALTER TABLE "read" ADD CONSTRAINT "FK_issue_TO_read_1" FOREIGN KEY (
	"no"
)
REFERENCES "issue" (
	"no"
);

ALTER TABLE "read" ADD CONSTRAINT "FK_issue_TO_read_2" FOREIGN KEY (
	"value"
)
REFERENCES "issue" (
	"value"
);

ALTER TABLE "read" ADD CONSTRAINT "FK_issue_TO_read_3" FOREIGN KEY (
	"project_no"
)
REFERENCES "issue" (
	"project_no"
);

ALTER TABLE "read" ADD CONSTRAINT "FK_Users_TO_read_1" FOREIGN KEY (
	"ID"
)
REFERENCES "Users" (
	"ID"
);

CREATE TABLE "issue_date" (
	"no"	number(5)		NOT NULL,
	"value"	number(1)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"start"	date		NULL,
	"fin"	date		NULL
);

COMMENT ON COLUMN "issue_date"."no" IS 'auto_increment';

COMMENT ON COLUMN "issue_date"."value" IS '에픽인경우만';

COMMENT ON COLUMN "issue_date"."project_no" IS '영문+숫자 4글자';

ALTER TABLE "issue_date" ADD CONSTRAINT "PK_ISSUE_DATE" PRIMARY KEY (
	"no",
	"value",
	"project_no"
);

ALTER TABLE "issue_date" ADD CONSTRAINT "FK_issue_TO_issue_date_1" FOREIGN KEY (
	"no"
)
REFERENCES "issue" (
	"no"
);

ALTER TABLE "issue_date" ADD CONSTRAINT "FK_issue_TO_issue_date_2" FOREIGN KEY (
	"value"
)
REFERENCES "issue" (
	"value"
);

ALTER TABLE "issue_date" ADD CONSTRAINT "FK_issue_TO_issue_date_3" FOREIGN KEY (
	"project_no"
)
REFERENCES "issue" (
	"project_no"
);

CREATE TABLE "issue_board" (
	"no"	number(5)		NOT NULL,
	"no2"	varchar(5)		NOT NULL,
	"value"	number(1)		NOT NULL,
	"content"	varchar(1000)		NULL
);

COMMENT ON COLUMN "issue_board"."no" IS 'auto_increment';

COMMENT ON COLUMN "issue_board"."no2" IS '영문+숫자 4글자';

COMMENT ON COLUMN "issue_board"."value" IS '에픽1, 일반이슈2';

COMMENT ON COLUMN "issue_board"."content" IS '글쓰기 내용';

ALTER TABLE "issue_board" ADD CONSTRAINT "PK_ISSUE_BOARD" PRIMARY KEY (
	"no",
	"no2",
	"value"
);

ALTER TABLE "issue_board" ADD CONSTRAINT "FK_issue_TO_issue_board_1" FOREIGN KEY (
	"no"
)
REFERENCES "issue" (
	"no"
);

ALTER TABLE "issue_board" ADD CONSTRAINT "FK_issue_TO_issue_board_2" FOREIGN KEY (
	"no2"
)
REFERENCES "issue" (
	"project_no"
);

ALTER TABLE "issue_board" ADD CONSTRAINT "FK_issue_TO_issue_board_3" FOREIGN KEY (
	"value"
)
REFERENCES "issue" (
	"value"
);

CREATE TABLE "issue_file" (
	"issue_no"	number(5)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"file_name"	varchar(20)		NOT NULL,
	"file_path"	varchar(100)		NOT NULL
);

COMMENT ON COLUMN "issue_file"."issue_no" IS 'auto_increment';

COMMENT ON COLUMN "issue_file"."project_no" IS '영문+숫자 4글자';

ALTER TABLE "issue_file" ADD CONSTRAINT "FK_issue_TO_issue_file_1" FOREIGN KEY (
	"issue_no"
)
REFERENCES "issue" (
	"no"
);

ALTER TABLE "issue_file" ADD CONSTRAINT "FK_issue_TO_issue_file_2" FOREIGN KEY (
	"project_no"
)
REFERENCES "issue" (
	"project_no"
);

CREATE TABLE "issue_like" (
	"ID"	varchar(20)		NOT NULL,
	"no"	number(5)		NOT NULL,
	"value"	number(1)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL
);

COMMENT ON COLUMN "issue_like"."no" IS 'auto_increment';

COMMENT ON COLUMN "issue_like"."value" IS '에픽1, 일반이슈2';

COMMENT ON COLUMN "issue_like"."project_no" IS '영문+숫자 4글자';

ALTER TABLE "issue_like" ADD CONSTRAINT "PK_ISSUE_LIKE" PRIMARY KEY (
	"ID",
	"no",
	"value",
	"project_no"
);

ALTER TABLE "issue_like" ADD CONSTRAINT "FK_Users_TO_issue_like_1" FOREIGN KEY (
	"ID"
)
REFERENCES "Users" (
	"ID"
);

ALTER TABLE "issue_like" ADD CONSTRAINT "FK_issue_TO_issue_like_1" FOREIGN KEY (
	"no"
)
REFERENCES "issue" (
	"no"
);

ALTER TABLE "issue_like" ADD CONSTRAINT "FK_issue_TO_issue_like_2" FOREIGN KEY (
	"value"
)
REFERENCES "issue" (
	"value"
);

ALTER TABLE "issue_like" ADD CONSTRAINT "FK_issue_TO_issue_like_3" FOREIGN KEY (
	"project_no"
)
REFERENCES "issue" (
	"project_no"
);

CREATE TABLE "issue_roadmap" (
	"no"	number(5)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"value"	number(1)		NOT NULL,
	"start"	date		NOT NULL,
	"end"	date		NOT NULL
);

COMMENT ON COLUMN "issue_roadmap"."no" IS 'auto_increment';

COMMENT ON COLUMN "issue_roadmap"."project_no" IS '영문+숫자 4글자';

COMMENT ON COLUMN "issue_roadmap"."value" IS '1(에픽)인 경우만 인정';

ALTER TABLE "issue_roadmap" ADD CONSTRAINT "PK_ISSUE_ROADMAP" PRIMARY KEY (
	"no",
	"project_no",
	"value"
);

ALTER TABLE "issue_roadmap" ADD CONSTRAINT "FK_issue_TO_issue_roadmap_1" FOREIGN KEY (
	"no"
)
REFERENCES "issue" (
	"no"
);

ALTER TABLE "issue_roadmap" ADD CONSTRAINT "FK_issue_TO_issue_roadmap_2" FOREIGN KEY (
	"project_no"
)
REFERENCES "issue" (
	"project_no"
);

ALTER TABLE "issue_roadmap" ADD CONSTRAINT "FK_issue_TO_issue_roadmap_3" FOREIGN KEY (
	"value"
)
REFERENCES "issue" (
	"value"
);

CREATE TABLE "Notify" (
	"category"	varchar(20)		NOT NULL,
	"state"	varchar(20)		NOT NULL,
	"content"	varchar(1000)		NOT NULL,
	"watcher"	varchar(20)		NOT NULL,
	"issue_no"	number(5)		NOT NULL,
	"value"	number(1)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"executor"	varchar(20)		NOT NULL,
	"read"	number(1)	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "Notify"."category" IS '설명, 댓글, 담당자, 진행도 등등';

COMMENT ON COLUMN "Notify"."state" IS '반응, 댓글 등';

COMMENT ON COLUMN "Notify"."issue_no" IS 'auto_increment';

COMMENT ON COLUMN "Notify"."value" IS '에픽1, 일반이슈2 하위이슈3~>';

COMMENT ON COLUMN "Notify"."project_no" IS '영문+숫자 4글자';

COMMENT ON COLUMN "Notify"."read" IS '1 읽음';

ALTER TABLE "Notify" ADD CONSTRAINT "FK_Users_TO_Notify_1" FOREIGN KEY (
	"watcher"
)
REFERENCES "Users" (
	"ID"
);

ALTER TABLE "Notify" ADD CONSTRAINT "FK_Users_TO_Notify_2" FOREIGN KEY (
	"executor"
)
REFERENCES "Users" (
	"ID"
);

ALTER TABLE "Notify" ADD CONSTRAINT "FK_issue_TO_Notify_1" FOREIGN KEY (
	"issue_no"
)
REFERENCES "issue" (
	"no"
);

ALTER TABLE "Notify" ADD CONSTRAINT "FK_issue_TO_Notify_2" FOREIGN KEY (
	"value"
)
REFERENCES "issue" (
	"value"
);

ALTER TABLE "Notify" ADD CONSTRAINT "FK_issue_TO_Notify_3" FOREIGN KEY (
	"project_no"
)
REFERENCES "issue" (
	"project_no"
);

CREATE TABLE "log" (
	"category"	varchar(20)		NOT NULL,
	"state"	varchar(20)		NOT NULL,
	"before"	VARCHAR(255)		NULL,
	"after"	VARCHAR(255)		NULL,
	"issue_no"	number(5)		NOT NULL,
	"value"	number(1)		NOT NULL,
	"project_no"	varchar(5)		NOT NULL,
	"executor"	varchar(20)		NOT NULL
);

COMMENT ON COLUMN "log"."category" IS '설명, 댓글, 담당자, 진행도 등등';

COMMENT ON COLUMN "log"."state" IS '생성, 업데이트, 변경 등';

COMMENT ON COLUMN "log"."issue_no" IS 'auto_increment';

COMMENT ON COLUMN "log"."value" IS '에픽1, 일반이슈2, 하위이슈3~>';

COMMENT ON COLUMN "log"."project_no" IS '영문+숫자 4글자';

ALTER TABLE "log" ADD CONSTRAINT "FK_issue_TO_log_1" FOREIGN KEY (
	"issue_no"
)
REFERENCES "issue" (
	"no"
);

ALTER TABLE "log" ADD CONSTRAINT "FK_issue_TO_log_2" FOREIGN KEY (
	"value"
)
REFERENCES "issue" (
	"value"
);

ALTER TABLE "log" ADD CONSTRAINT "FK_issue_TO_log_3" FOREIGN KEY (
	"project_no"
)
REFERENCES "issue" (
	"project_no"
);

ALTER TABLE "log" ADD CONSTRAINT "FK_Users_TO_log_1" FOREIGN KEY (
	"executor"
)
REFERENCES "Users" (
	"ID"
);
