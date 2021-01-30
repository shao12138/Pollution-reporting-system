package Test.Filter;

import Test.Dao.mapDao;
import Test.Pojo.Notice;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebFilter(urlPatterns = {"/back-gonggao.jsp"})
public class gonggao_backFilter implements Filter {
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) servletRequest).getSession();
        if (session.getAttribute("noticeDate") == null) {
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            servletRequest.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            mapDao dao = (mapDao) servletRequest.getServletContext().getAttribute("map");
            PrintWriter out = servletResponse.getWriter();
            String sql = "select * from mapNotice";
            try {
                ResultSet resultSet = dao.query(sql);
                ArrayList arrayList = new ArrayList();
                while (resultSet.next()) {
                    Notice a = new Notice(Integer.parseInt(resultSet.getString("id")), resultSet.getString("title"), resultSet.getString("date"), resultSet.getString("content"));
                    arrayList.add(a);
                }
                session.setAttribute("noticeDate", arrayList);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }
}
