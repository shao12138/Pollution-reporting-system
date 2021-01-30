package Test.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "login_back", urlPatterns = {"/back-gonggao.jsp","/back-user.jsp", "/back-taolun.jsp", "/back-insertNotice.jsp","/back-wuran.jsp",})
public class login_backFilter implements Filter {
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) servletRequest).getSession();
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        servletRequest.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = servletResponse.getWriter();
        if (session.getAttribute("back-number") == null) {
            out.print("你还没有登录！");
            response.setHeader("refresh", "2;back-login.jsp");
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

}
