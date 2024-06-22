-- ptj.code_group definition

CREATE TABLE code_group (
                              group_id int NOT NULL AUTO_INCREMENT,
                              group_code varchar(255) NOT NULL,
                              group_name varchar(255) NOT NULL,
                              description text,
                              system_register_id int NOT NULL,
                              system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                              system_updater_id int NOT NULL,
                              system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              PRIMARY KEY (group_id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- ptj.code_detail definition

CREATE TABLE code_detail (
                               code_id int NOT NULL AUTO_INCREMENT,
                               group_code varchar(255) NOT NULL,
                               detail_code varchar(255) NOT NULL,
                               detail_name varchar(255) NOT NULL,
                               description text,
                               code_used tinyint(1) DEFAULT '1',
                               user_defined_value varchar(255) DEFAULT NULL,
                               system_register_id int NOT NULL,
                               system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                               system_updater_id int NOT NULL,
                               system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                               PRIMARY KEY (code_id)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




-- ptj.user_info definition

CREATE TABLE user_info (
                             user_no int NOT NULL AUTO_INCREMENT,
                             email varchar(255) NOT NULL,
                             password varchar(255) NOT NULL,
                             user_type_code varchar(255) NOT NULL,
                             system_register_id int NOT NULL,
                             system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             system_updater_id int NOT NULL,
                             system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                             PRIMARY KEY (user_no)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- ptj.company_info definition

CREATE TABLE company_info (
                                company_id int NOT NULL,
                                user_no int NOT NULL,
                                company_name varchar(255) NOT NULL,
                                company_description text,
                                industry_code varchar(255) DEFAULT NULL,
                                Business_type_code varchar(20) DEFAULT NULL,
                                Business_number int NOT NULL,
                                system_register_id int NOT NULL,
                                system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                system_updater_id int NOT NULL,
                                system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                ZIPCODE varchar(50) DEFAULT NULL,
                                ADDRESS varchar(50) DEFAULT NULL,
                                ADDRESS_DETAIL varchar(50) DEFAULT NULL,
                                office_phone varchar(50) NOT NULL,
                                latitude decimal(9,6) DEFAULT NULL,
                                longitude decimal(9,6) DEFAULT NULL,
                                PRIMARY KEY (company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ptj.file_info definition

CREATE TABLE file_info (
                             file_id int NOT NULL AUTO_INCREMENT,
                             user_no int NOT NULL,
                             original_filename varchar(255) NOT NULL,
                             saved_filename varchar(255) NOT NULL,
                             file_path varchar(255) DEFAULT NULL,
                             file_type varchar(100) DEFAULT NULL,
                             file_size bigint DEFAULT NULL,
                             system_register_id int DEFAULT NULL,
                             system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (file_id),
                             KEY fk_user (user_no),
                             CONSTRAINT fk_user FOREIGN KEY (user_no) REFERENCES user_info (user_no) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- ptj.job_post_info definition

CREATE TABLE job_post_info (
                                 job_id int NOT NULL AUTO_INCREMENT,
                                 user_no int DEFAULT NULL,
                                 title varchar(255) NOT NULL,
                                 description text NOT NULL,
                                 job_type_code varchar(50) NOT NULL,
                                 salary_type_code varchar(50) NOT NULL,
                                 salary decimal(10,2) NOT NULL,
                                 job_time varchar(100) NOT NULL,
                                 job_day_type_code varchar(50) NOT NULL,
                                 manager_number varchar(20) NOT NULL,
                                 requirement text,
                                 number_of_staff int NOT NULL,
                                 employment_type_code varchar(50) NOT NULL,
                                 etc text,
                                 system_register_id int NOT NULL,
                                 system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 system_updater_id int DEFAULT NULL,
                                 system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 status_type_code varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                 ZIPCODE varchar(50) DEFAULT NULL,
                                 ADDRESS varchar(50) DEFAULT NULL,
                                 ADDRESS_DETAIL varchar(50) DEFAULT NULL,
                                 latitude decimal(9,6) DEFAULT NULL,
                                 longitude decimal(9,6) DEFAULT NULL,
                                 PRIMARY KEY (job_id)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ptj.job_application_info definition

CREATE TABLE job_application_info (
                                        application_id int NOT NULL AUTO_INCREMENT,
                                        job_id int NOT NULL,
                                        user_no int NOT NULL,
                                        status_type_code varchar(255) NOT NULL,
                                        system_register_id int NOT NULL,
                                        system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                        system_updater_id int NOT NULL,
                                        system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                        motivation_description text NOT NULL,
                                        PRIMARY KEY (application_id)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ptj.job_like_info definition

CREATE TABLE job_like_info (
                                 like_id int NOT NULL AUTO_INCREMENT,
                                 user_no int NOT NULL,
                                 job_id int NOT NULL,
                                 system_register_id int NOT NULL,
                                 system_register_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 system_updater_id int NOT NULL,
                                 system_update_datetime timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                 PRIMARY KEY (like_id),
                                 KEY user_info (user_no),
                                 KEY job_post_info (job_id),
                                 CONSTRAINT job_post_info FOREIGN KEY (job_id) REFERENCES job_post_info (job_id),
                                 CONSTRAINT user_info FOREIGN KEY (user_no) REFERENCES user_info (user_no)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ptj.user_profile_info definition

CREATE TABLE user_profile_info (
                                     PROFILE_ID int NOT NULL,
                                     USER_NO int NOT NULL,
                                     NAME varchar(255) NOT NULL,
                                     PHONE varchar(20) DEFAULT NULL,
                                     BIRTH varchar(10) DEFAULT NULL,
                                     GENDER varchar(10) DEFAULT NULL,
                                     PART_TIME_EXPERIENCE tinyint(1) DEFAULT '1',
                                     SYSTEM_REGISTER_ID int NOT NULL,
                                     SYSTEM_REGISTER_DATETIME timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                     SYSTEM_UPDATER_ID int NOT NULL,
                                     SYSTEM_UPDATE_DATETIME timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                     ZIPCODE varchar(50) DEFAULT NULL,
                                     ADDRESS varchar(50) DEFAULT NULL,
                                     ADDRESS_DETAIL varchar(50) DEFAULT NULL,
                                     latitude decimal(9,6) DEFAULT NULL,
                                     longitude decimal(9,6) DEFAULT NULL,
                                     PRIMARY KEY (PROFILE_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DELIMITER $$

CREATE FUNCTION func_format_time_ago(input_datetime DATETIME) RETURNS varchar(255) CHARSET utf8mb4
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