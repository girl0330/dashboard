-- ptj.code_group definition

CREATE TABLE code_group (
                            group_id int NOT NULL AUTO_INCREMENT COMMENT '그룹 ID',
                            group_code varchar(255) NOT NULL COMMENT '그룹 코드',
                            group_name varchar(255) NOT NULL COMMENT '그룹 이름',
                            description text COMMENT '설명',
                            system_register_id int NOT NULL COMMENT '시스템 등록자 ID',
                            system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시스템 등록 날짜',
                            system_updater_id int NOT NULL COMMENT '시스템 수정자 ID',
                            system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '시스템 수정 날짜',
                            PRIMARY KEY (group_id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='코드 그룹 테이블';

INSERT INTO ptj.code_group
(group_code, group_name, description, system_register_id, system_updater_id)
VALUES
    ('user_type', '사용자 유형 코드', '사용자 유형을 나타내는 코드', 1, 1),
    ('industry', '산업 코드', '산업 종류를 나타내는 코드', 1, 1),
    ('Business_type', '사업자 종류 코드', '사업자 종류를 나타내는 코드', 1, 1),
    ('job_type', '일자리 타입 코드', '일자리 종류를 나타내는 코드', 1, 1),
    ('salary_type', '급여 종류 코드', '급여 종류를 나타내는 코드', 1, 1),
    ('job_day_type', '근무 날짜 종류 코드', '근무 날짜 종류를 나타내는 코드', 1, 1),
    ('employment_type', '고용 유형 코드', '고용 유형을 나타내는 코드', 1, 1),
    ('status_type', '지원 상태 코드', '지원 상태를 나타내는 코드', 1, 1);


-- ptj.code_detail definition

CREATE TABLE code_detail (
                             code_id int NOT NULL AUTO_INCREMENT COMMENT '코드 ID',
                             group_code varchar(255) NOT NULL COMMENT '그룹 코드',
                             detail_code varchar(255) NOT NULL COMMENT '상세 코드',
                             detail_name varchar(255) NOT NULL COMMENT '상세 이름',
                             description text COMMENT '설명',
                             code_used tinyint(1) DEFAULT '1' COMMENT '코드 사용 여부',
                             user_defined_value varchar(255) DEFAULT NULL COMMENT '사용자 정의 값',
                             system_register_id int NOT NULL COMMENT '시스템 등록자 ID',
                             system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시스템 등록 날짜',
                             system_updater_id int NOT NULL COMMENT '시스템 수정자 ID',
                             system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '시스템 수정 날짜',
                             PRIMARY KEY (code_id)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='코드 상세 테이블';

-- 사용자 유형 코드
INSERT INTO ptj.code_detail
(group_code, detail_code, detail_name, description, code_used, user_defined_value, system_register_id, system_updater_id)
VALUES
    ('user_type', 'JBS', '구직자', '구직자를 나타내는 코드', 1, NULL, 1,  1),
    ('user_type', 'EMP', '고용주', '고용주를 나타내는 코드', 1, NULL, 1,  1);

-- 산업 코드
INSERT INTO ptj.code_detail
(group_code, detail_code, detail_name, description, code_used, user_defined_value, system_register_id, system_updater_id)
VALUES
    ('industry', 'IT', 'IT', 'IT 산업', 1, NULL, 1,  1),
    ('industry', 'SELF', '자영업', '자영업 산업', 1, NULL, 1,  1),
    ('industry', 'MAN', '제조업', '제조업 산업', 1, NULL, 1,  1),
    ('industry', 'SER', '서비스업', '서비스업 산업', 1, NULL, 1,  1),
    ('industry', 'FIN', '금융업', '금융업 산업', 1, NULL, 1,  1),
    ('industry', 'EDU', '교육업', '교육업 산업', 1, NULL, 1,  1),
    ('industry', 'CON', '건설업', '건설업 산업', 1, NULL, 1,  1),
    ('industry', 'MED', '의료업', '의료업 산업', 1, NULL, 1,  1),
    ('industry', 'AGR', '농업', '농업 산업', 1, NULL, 1,  1),
    ('industry', 'DIS', '유통업', '유통업 산업', 1, NULL, 1,  1),
    ('industry', 'PUB', '공공기관', '공공기관 산업', 1, NULL, 1,  1),
    ('industry', 'OTH', '기타', '기타 산업', 1, NULL, 1,  1);

-- 사업 유형 코드
INSERT INTO ptj.code_detail
(group_code, detail_code, detail_name, description, code_used, user_defined_value, system_register_id, system_updater_id)
VALUES
    ('Business_type', 'CORP', '법인사업자', '법인사업자를 나타내는 코드', 1, NULL, 1,  1),
    ('Business_type', 'GEN', '일반사업자', '일반사업자를 나타내는 코드', 1, NULL, 1,  1);

-- 직종 코드
INSERT INTO ptj.code_detail
(group_code, detail_code, detail_name, description, code_used, user_defined_value, system_register_id, system_updater_id)
VALUES
    ('job_type', 'SERV', '서빙', '서빙 일자리', 1, NULL, 1,  1),
    ('job_type', 'CONV', '편의점', '편의점 일자리', 1, NULL, 1,  1),
    ('job_type', 'KIT', '주방', '주방 일자리', 1, NULL, 1,  1),
    ('job_type', 'OFF', '사무', '사무 일자리', 1, NULL, 1,  1),
    ('job_type', 'EDU', '교육', '교육 일자리', 1, NULL, 1,  1),
    ('job_type', 'SAL', '판매', '판매 일자리', 1, NULL, 1,  1),
    ('job_type', 'PROD', '생산', '생산 일자리', 1, NULL, 1,  1),
    ('job_type', 'IT', 'IT', 'IT 일자리', 1, NULL, 1,  1),
    ('job_type', 'DES', '디자인', '디자인 일자리', 1, NULL, 1,  1),
    ('job_type', 'MED', '의료', '의료 일자리', 1, NULL, 1,  1),
    ('job_type', 'DRIV', '운전', '운전 일자리', 1, NULL, 1,  1),
    ('job_type', 'CON', '건설', '건설 일자리', 1, NULL, 1,  1),
    ('job_type', 'OTH', '기타', '기타 일자리', 1, NULL, 1,  1);

-- 급여 유형 코드
INSERT INTO ptj.code_detail
(group_code, detail_code, detail_name, description, code_used, user_defined_value, system_register_id, system_updater_id)
VALUES
    ('salary_type', 'DLY', '일급', '일급 급여', 1, NULL, 1,  1),
    ('salary_type', 'WKLY', '주급', '주급 급여', 1, NULL, 1,  1),
    ('salary_type', 'HRLY', '시급', '시급 급여', 1, NULL, 1,  1),
    ('salary_type', 'MTHLY', '월급', '월급 급여', 1, NULL, 1,  1);

-- 근무일 유형 코드
INSERT INTO ptj.code_detail
(group_code, detail_code, detail_name, description, code_used, user_defined_value, system_register_id, system_updater_id)
VALUES
    ('job_day_type', 'DAY', '하루', '하루 근무', 1, NULL, 1,  1),
    ('job_day_type', 'WK', '일주일', '일주일 근무', 1, NULL, 1,  1),
    ('job_day_type', 'MON', '월', '월요일 근무', 1, NULL, 1,  1),
    ('job_day_type', 'TUE', '화', '화요일 근무', 1, NULL, 1,  1),
    ('job_day_type', 'WED', '수', '수요일 근무', 1, NULL, 1,  1),
    ('job_day_type', 'THU', '목', '목요일 근무', 1, NULL, 1,  1),
    ('job_day_type', 'FRI', '금', '금요일 근무', 1, NULL, 1,  1),
    ('job_day_type', 'SAT', '토', '토요일 근무', 1, NULL, 1,  1),
    ('job_day_type', 'SUN', '일', '일요일 근무', 1, NULL, 1,  1),
    ('job_day_type', 'WEEKND', '주말', '주말 근무', 1, NULL, 1,  1),
    ('job_day_type', 'WDAY', '평일', '평일 근무', 1, NULL, 1,  1),
    ('job_day_type', 'OTH', '기타', '기타 근무', 1, NULL, 1,  1);

-- 고용 유형 코드
INSERT INTO ptj.code_detail
(group_code, detail_code, detail_name, description, code_used, user_defined_value, system_register_id, system_updater_id)
VALUES
    ('employment_type', 'SHORT', '단기', '단기 고용', 1, NULL, 1,  1),
    ('employment_type', 'LONG', '장기', '장기 고용', 1, NULL, 1,  1);

-- 상태 유형 코드
INSERT INTO ptj.code_detail
(group_code, detail_code, detail_name, description, code_used, user_defined_value, system_register_id, system_updater_id)
VALUES
    ('status_type', 'APPLIED', '지원중', '회원이 공고에 지원함', 1, NULL, 1,  1),
    ('status_type', 'CANCELLED', '취소', '회원이 지원을 취소함', 1, NULL, 1, 1),
    ('status_type', 'HIRED', '채용 확정', '회원이 채용됨', 1, NULL, 1,  1),
    ('status_type', 'OPEN', '구인 중', '채용이 진행 중임', 1, NULL, 1,  1),
    ('status_type', 'CLOSED', '채용 마감', '채용이 마감됨', 1, NULL, 1,  1);

-- ptj.user_info definition

CREATE TABLE user_info (
                           user_no int NOT NULL AUTO_INCREMENT COMMENT '사용자 번호',
                           email varchar(255) NOT NULL COMMENT '이메일',
                           password varchar(255) NOT NULL COMMENT '비밀번호',
                           user_type_code varchar(255) NOT NULL COMMENT '사용자 유형 코드',
                           system_register_id int NOT NULL COMMENT '시스템 등록자 ID',
                           system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시스템 등록 날짜',
                           system_updater_id int NOT NULL COMMENT '시스템 수정자 ID',
                           system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '시스템 수정 날짜',
                           PRIMARY KEY (user_no)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='사용자 정보 테이블';


-- ptj.company_info definition

CREATE TABLE company_info (
                              company_id int NOT NULL COMMENT '회사 ID',
                              user_no int NOT NULL COMMENT '사용자 번호',
                              company_name varchar(255) NOT NULL COMMENT '회사 이름',
                              company_description text COMMENT '회사 설명',
                              industry_code varchar(255) DEFAULT NULL COMMENT '산업 코드',
                              Business_type_code varchar(20) DEFAULT NULL COMMENT '사업 유형 코드',
                              Business_number int NOT NULL COMMENT '사업 번호',
                              system_register_id int NOT NULL COMMENT '시스템 등록자 ID',
                              system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시스템 등록 날짜',
                              system_updater_id int NOT NULL COMMENT '시스템 수정자 ID',
                              system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '시스템 수정 날짜',
                              ZIPCODE varchar(50) DEFAULT NULL COMMENT '우편번호',
                              ADDRESS varchar(50) DEFAULT NULL COMMENT '주소',
                              ADDRESS_DETAIL varchar(50) DEFAULT NULL COMMENT '상세 주소',
                              office_phone varchar(50) NOT NULL COMMENT '회사 전화번호',
                              latitude decimal(9,6) DEFAULT NULL COMMENT '위도',
                              longitude decimal(9,6) DEFAULT NULL COMMENT '경도',
                              PRIMARY KEY (company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='회사 정보 테이블';


-- ptj.file_info definition

CREATE TABLE file_info (
                           file_id int NOT NULL AUTO_INCREMENT COMMENT '파일 ID',
                           user_no int NOT NULL COMMENT '사용자 번호',
                           original_filename varchar(255) NOT NULL COMMENT '원본 파일명',
                           saved_filename varchar(255) NOT NULL COMMENT '저장된 파일명',
                           file_path varchar(255) DEFAULT NULL COMMENT '파일 경로',
                           file_type varchar(100) DEFAULT NULL COMMENT '파일 유형',
                           file_size bigint DEFAULT NULL COMMENT '파일 크기',
                           system_register_id int DEFAULT NULL COMMENT '시스템 등록자 ID',
                           system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시스템 등록 날짜',
                           PRIMARY KEY (file_id),
                           KEY fk_user (user_no),
                           CONSTRAINT fk_user FOREIGN KEY (user_no) REFERENCES user_info (user_no) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='파일 정보 테이블';


-- ptj.job_post_info definition

CREATE TABLE job_post_info (
                               job_id int NOT NULL AUTO_INCREMENT COMMENT '구인공고 ID',
                               user_no int DEFAULT NULL COMMENT '사용자 번호',
                               title varchar(255) NOT NULL COMMENT '제목',
                               description text NOT NULL COMMENT '설명',
                               job_type_code varchar(50) NOT NULL COMMENT '직종 코드',
                               salary_type_code varchar(50) NOT NULL COMMENT '급여 유형 코드',
                               salary decimal(10,2) NOT NULL COMMENT '급여',
                               job_time varchar(100) NOT NULL COMMENT '근무 시간',
                               job_day_type_code varchar(50) NOT NULL COMMENT '근무 일 유형 코드',
                               manager_number varchar(20) NOT NULL COMMENT '담당자 번호',
                               requirement text COMMENT '요구사항',
                               number_of_staff int NOT NULL COMMENT '모집 인원',
                               employment_type_code varchar(50) NOT NULL COMMENT '고용 유형 코드',
                               etc text COMMENT '기타',
                               system_register_id int NOT NULL COMMENT '시스템 등록자 ID',
                               system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시스템 등록 날짜',
                               system_updater_id int DEFAULT NULL COMMENT '시스템 수정자 ID',
                               system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '시스템 수정 날짜',
                               status_type_code varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '상태 유형 코드',
                               ZIPCODE varchar(50) DEFAULT NULL COMMENT '우편번호',
                               ADDRESS varchar(50) DEFAULT NULL COMMENT '주소',
                               ADDRESS_DETAIL varchar(50) DEFAULT NULL COMMENT '상세 주소',
                               latitude decimal(9,6) DEFAULT NULL COMMENT '위도',
                               longitude decimal(9,6) DEFAULT NULL COMMENT '경도',
                               PRIMARY KEY (job_id)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='구인공고 테이블';


-- ptj.job_application_info definition

CREATE TABLE job_application_info (
                                      application_id int NOT NULL AUTO_INCREMENT COMMENT '지원서 ID',
                                      job_id int NOT NULL COMMENT '구인공고 ID',
                                      user_no int NOT NULL COMMENT '사용자 번호',
                                      status_type_code varchar(255) NOT NULL COMMENT '상태 유형 코드',
                                      system_register_id int NOT NULL COMMENT '시스템 등록자 ID',
                                      system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시스템 등록 날짜',
                                      system_updater_id int NOT NULL COMMENT '시스템 수정자 ID',
                                      system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '시스템 수정 날짜',
                                      motivation_description text NOT NULL COMMENT '지원 동기',
                                      PRIMARY KEY (application_id)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='지원서 정보 테이블';


-- ptj.job_like_info definition

CREATE TABLE job_like_info (
                               like_id int NOT NULL AUTO_INCREMENT COMMENT '좋아요 ID',
                               user_no int NOT NULL COMMENT '사용자 번호',
                               job_id int NOT NULL COMMENT '구인공고 ID',
                               system_register_id int NOT NULL COMMENT '시스템 등록자 ID',
                               system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시스템 등록 날짜',
                               system_updater_id int NOT NULL COMMENT '시스템 수정자 ID',
                               system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '시스템 수정 날짜',
                               PRIMARY KEY (like_id),
                               KEY user_info (user_no),
                               KEY job_post_info (job_id),
                               CONSTRAINT job_post_info FOREIGN KEY (job_id) REFERENCES job_post_info (job_id),
                               CONSTRAINT user_info FOREIGN KEY (user_no) REFERENCES user_info (user_no)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='구인공고 좋아요 정보 테이블';


-- ptj.user_profile_info definition

CREATE TABLE user_profile_info (
                                   PROFILE_ID int NOT NULL COMMENT '프로필 ID',
                                   USER_NO int NOT NULL COMMENT '사용자 번호',
                                   NAME varchar(255) NOT NULL COMMENT '이름',
                                   PHONE varchar(20) DEFAULT NULL COMMENT '전화번호',
                                   BIRTH varchar(10) DEFAULT NULL COMMENT '생년월일',
                                   GENDER varchar(10) DEFAULT NULL COMMENT '성별',
                                   PART_TIME_EXPERIENCE tinyint(1) DEFAULT '1' COMMENT '파트타임 경험 여부',
                                   SYSTEM_REGISTER_ID int NOT NULL COMMENT '시스템 등록자 ID',
                                   SYSTEM_REGISTER_DATETIME timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시스템 등록 날짜',
                                   SYSTEM_UPDATER_ID int NOT NULL COMMENT '시스템 수정자 ID',
                                   SYSTEM_UPDATE_DATETIME timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '시스템 수정 날짜',
                                   ZIPCODE varchar(50) DEFAULT NULL COMMENT '우편번호',
                                   ADDRESS varchar(50) DEFAULT NULL COMMENT '주소',
                                   ADDRESS_DETAIL varchar(50) DEFAULT NULL COMMENT '상세 주소',
                                   latitude decimal(9,6) DEFAULT NULL COMMENT '위도',
                                   longitude decimal(9,6) DEFAULT NULL COMMENT '경도',
                                   PRIMARY KEY (PROFILE_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='사용자 프로필 테이블';




DELIMITER $$

CREATE FUNCTION func_format_time_ago(input_datetime DATETIME) RETURNS varchar(255) CHARSET utf8mb4
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE result VARCHAR(255);

    IF input_datetime > NOW() THEN
        SET result = '데이터오류';
    ELSEIF TIMESTAMPDIFF(SECOND, input_datetime, NOW()) < 60 THEN
        SET result = CONCAT(TIMESTAMPDIFF(SECOND, input_datetime, NOW()), ' 초 전');
    ELSEIF TIMESTAMPDIFF(MINUTE, input_datetime, NOW()) < 60 THEN
        SET result = CONCAT(TIMESTAMPDIFF(MINUTE, input_datetime, NOW()), ' 분 전');
    ELSEIF TIMESTAMPDIFF(HOUR, input_datetime, NOW()) < 24 THEN
        SET result = CONCAT(TIMESTAMPDIFF(HOUR, input_datetime, NOW()), ' 시간 전');
    ELSEIF TIMESTAMPDIFF(DAY, input_datetime, NOW()) < 365 THEN
        SET result = CONCAT(TIMESTAMPDIFF(DAY, input_datetime, NOW()), ' 일 전');
ELSE
        SET result = CONCAT(TIMESTAMPDIFF(YEAR, input_datetime, NOW()), ' 년 전');
END IF;

RETURN result;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION func_get_detail_name(p_group_code VARCHAR(255), p_detail_code VARCHAR(255)) RETURNS VARCHAR(255) CHARSET utf8mb4
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE result VARCHAR(255);

    -- 기본값을 NULL로 설정
    SET result = NULL;

    -- 조회 및 결과 할당
SELECT detail_name INTO result
FROM code_detail
WHERE group_code = p_group_code AND detail_code = p_detail_code
    LIMIT 1;

-- 결과가 NULL이면 'Unknown' 반환
RETURN IFNULL(result, 'Unknown');
END $$

DELIMITER ;