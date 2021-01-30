package Test.Filter;

import Test.Dao.mapDao;
import Test.Pojo.User;
import com.sun.deploy.net.HttpResponse;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.*;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebFilter(filterName = "user_back", urlPatterns = {"/back-user.jsp"})
public class user_backFilter implements Filter {
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) servletRequest).getSession();
        if (session.getAttribute("userData") == null) {
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            servletRequest.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = servletResponse.getWriter();
            mapDao dao = (mapDao) servletRequest.getServletContext().getAttribute("map");
            //User数据
            User user;
            ArrayList userArray = new ArrayList();
            try {
                ResultSet userSet = dao.query("select number,name,password,personnumber,email,tellnumber,kind from mapuser");
                while (userSet.next()) {
                    String name = userSet.getString("name");
                    String number2 = userSet.getString("number");
                    String password2 = userSet.getString("password");
                    String personnumber = userSet.getString("personnumber");
                    String email = userSet.getString("email");
                    String tellnumber = userSet.getString("tellnumber");
                    user = new User(number2, name, password2, personnumber, email, tellnumber);
                    userArray.add(user);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            session.setAttribute("userData", userArray);
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }
}
