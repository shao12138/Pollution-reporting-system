package Test.Filter;

import Test.Pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "login", urlPatterns = {"/jubao.jsp","/taolun.jsp"})
public class loginFilter implements Filter {
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        request.setCharacterEncoding("UTF-8");
        servletResponse.setContentType("text/html; charset=utf-8");
        servletResponse.setCharacterEncoding("UTF-8");
        User a = (User) request.getSession().getAttribute("user");
        PrintWriter out = servletResponse.getWriter();
        if(a==null){
            out.print("您还没有登录！");
            ((HttpServletResponse)servletResponse).setHeader("refresh", "2;index.jsp");
        }else{
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
