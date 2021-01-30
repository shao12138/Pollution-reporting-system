package Test.Filter;

import Test.Dao.mapDao;
import Test.Pojo.Message;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebFilter(filterName = "taolun_back", urlPatterns = {"/back-taolun.jsp"})
public class taolun_backFilter implements Filter {
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) servletRequest).getSession();
        if (session.getAttribute("taolunDatas") == null) {
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            servletRequest.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = servletResponse.getWriter();
            mapDao dao = (mapDao) servletRequest.getServletContext().getAttribute("map");
            //User数据
            Message messagePojo;
            ArrayList taolunArray = new ArrayList();
            try {
                ResultSet userSet = dao.query("select id,name,message from mapmessage");
                while (userSet.next()) {
                    String id = userSet.getString("id");
                    String name = userSet.getString("name");
                    String message = userSet.getString("message");
                    messagePojo = new Message(id, name, message);
                    taolunArray.add(messagePojo);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            session.setAttribute("taolunDatas", taolunArray);
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }
}
