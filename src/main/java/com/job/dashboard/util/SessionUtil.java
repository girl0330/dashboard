package com.job.dashboard.util;

import com.job.dashboard.domain.dto.UserDTO;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpSession;

@Component
public class SessionUtil {
    public static final String SESSION_ATTR_USER_NO = "userNo";
    public static final String SESSION_ATTR_USER_TYPE_CODE = "userTypeCode";
    public static final String SESSION_ATTR_NAME = "userName";

    private HttpSession getSession() {
        return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
    }

    public void setAttribute(String attributeName, Object attributeValue) {
        getSession().setAttribute(attributeName, attributeValue);
    }

    public Object getAttribute(String attributeName) {
        return getSession().getAttribute(attributeName);
    }

    public void removeAttribute(String attributeName) {
        getSession().removeAttribute(attributeName);
    }

    public void invalidateSession() {
        getSession().invalidate();
    }

    /**
     * 로그인된 사용자 정보를 세션에 저장합니다.
     * @param userDTO 사용자 정보 DTO
     */
    public void loginUser(UserDTO userDTO) {
        setAttribute(SESSION_ATTR_USER_NO, userDTO.getUserNo()); //pk
        setAttribute(SESSION_ATTR_USER_TYPE_CODE, userDTO.getUserTypeCode()); //user code 10:개인, 20:기업
    }
    /**
     * 사용자가 로그인되어 있는지 확인합니다.
     * @return 로그인 상태 여부
     */
    public boolean loginUserCheck() {
        return getAttribute(SESSION_ATTR_USER_NO) != null;
    }
    /**
     * 사용자를 로그아웃시킵니다.
     */
    public void logoutUser() {
        removeAttribute(SESSION_ATTR_USER_NO);
        invalidateSession();
    }

    /**
     * 세션의 유효 시간을 설정합니다.
     * @param seconds 유효 시간(초)
     */
    public void setSessionTimeout(int seconds) {
        getSession().setMaxInactiveInterval(seconds);
    }
}
