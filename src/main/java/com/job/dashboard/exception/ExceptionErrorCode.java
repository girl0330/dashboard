package com.job.dashboard.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
@AllArgsConstructor
public enum ExceptionErrorCode {
    /* 400 BAD_REQUEST : 잘못된 요청 */
    PASSWORD_MISMATCH_TOKEN(HttpStatus.BAD_REQUEST, "비밀번호가 일치하지 않습니다."),
    NEW_PASSWORD_MISMATCH_TOKEN(HttpStatus.BAD_REQUEST, "새 비밀번호가 서로 일치하지 않습니다."),
    PROFILE_NOT_COMPLETED_TOKEN(HttpStatus.BAD_REQUEST, "프로필 작성 후 이용해주세요."),
    USER_TYPE_CODE_MISMATCH_TOKEN(HttpStatus.BAD_REQUEST,"회원 타입코드가 일치하지 않습니다."),

    /* 401 UNAUTHORIZED : 인증되지 않은 사용자 */
    UNAUTHORIZED_USER_TOKEN(HttpStatus.UNAUTHORIZED, "로그인 후 이용해주세요"),
    PASSWORD_INCORRECT_TOKEN(HttpStatus.UNAUTHORIZED,"비밀번호가 일치하지 않습니다."),

    /* 403 FORBIDDEN : 서버가 요청을 이해했지만, 권한이 없어서 요청을 거부*/
    INVALID_MEMBER_TOKEN(HttpStatus.FORBIDDEN, "기업 회원만 이용가능한 서비스입니다."),

    /* 404 NOT_FOUND : Resource 를 찾을 수 없음 */
    MEMBER_NOT_FOUND_TOKEN(HttpStatus.NOT_FOUND, "해당 유저 정보를 찾을 수 없습니다"),
    PAGE_NOT_FOUND(HttpStatus.NOT_FOUND, "해당 페이지 정보를 찾을 수 없습니다"),

    /* 409 CONFLICT : Resource 의 현재 상태와 충돌. 보통 중복된 데이터 존재 */
    DUPLICATE_RESOURCE(HttpStatus.CONFLICT, "데이터가 이미 존재합니다"),
    EMAIL_ALREADY_IN_USE_TOKEN(HttpStatus.CONFLICT, "이미 사용중인 이메일입니다."),

    /* 500 INTERNAL_SERVER_ERROR : 서버 오류 */
    GENERIC_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "내부 서버 오류가 발생했습니다"),


    EXCEPTION_MESSAGE(HttpStatus.BAD_REQUEST,"");

    private final HttpStatus httpStatus;
    private final String detail;
}
