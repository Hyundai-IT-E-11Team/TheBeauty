package com.kosa.theBeauty.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.kosa.theBeauty.user.domain.UserVO;

public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

    	UserVO user = (UserVO) WebUtils.getSessionAttribute(request, "currUser");
        // 만약 사용자가 로그인하지 않았다면, 로그인 페이지로 리다이렉트하고 현재 요청 중단
        if(user == null) {
            response.sendRedirect("/theBeauty/user/login");
            return false;
        }
        // 사용자가 로그인한 경우, 요청 처리
        return true;
    }
}
