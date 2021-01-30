package Test.Filter;

import Test.Dao.mapDao;
import Test.Pojo.Pic;
import Test.Pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebFilter(filterName = "wuran_back", urlPatterns = {"/back-wuran.jsp"})
public class wuran_backFilter implements Filter {
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) servletRequest).getSession();
        if (session.getAttribute("picsData") == null) {
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            servletRequest.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = servletResponse.getWriter();
            mapDao dao = (mapDao) servletRequest.getServletContext().getAttribute("map");
            //Map数据
            Pic pic;
            ArrayList picArray = new ArrayList();
            try {
                ResultSet userSet = dao.query("select id,lat,log,url from mappic");
                while (userSet.next()) {
                    String id = userSet.getString("id");
                    String lat = userSet.getString("lat");
                    String log = userSet.getString("log");
                    String url = userSet.getString("url");
                    pic = new Pic(Integer.parseInt(id), lat, log, url);
                    picArray.add(pic);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            session.setAttribute("picDate", picArray);
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }
}
