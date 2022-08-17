package ca.fangyux.adminapp.mvc.interceptor;

import ca.fangyux.adminapp.entity.Admin;
import ca.fangyux.adminapp.utils.Props;
import ca.fangyux.adminapp.utils.exception.AccessForbiddenException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1.通过request获取session
        HttpSession session=request.getSession();

        //2.尝试从session域中获取admin对象
        Admin admin= (Admin) session.getAttribute(Props.SESSION_ATTRIBUTE_ADMIN);

        //如果用户没有登陆，就抛出异常
        if(admin==null){
            throw new AccessForbiddenException(Props.MSG_ACCESS_FORBIDDEN);
        }

        //放行
        return true;
    }
}