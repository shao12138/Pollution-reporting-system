package Test.Controller;

import Test.Dao.mapDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "back_notice", urlPatterns = {"/back_notice"})
public class Back_InsertNotice extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String title = request.getParameter("title");
        Date date  = new Date();
        String pat = "yyyy年MM月dd日";//模板2
        SimpleDateFormat sdf2 = new SimpleDateFormat(pat);
        String nowDate = sdf2.format(date);
        String content = request.getParameter("content");
        String sql = "insert into mapnotice(title,date,content) values(?,?,?)";
        mapDao dao = (mapDao) getServletContext().getAttribute("map");
        try {
            dao.insert(sql, title, nowDate, content);
            response.sendRedirect("back-gonggao.jsp");
        } catch (Exception e) {
            out.print("出现意外情况，请联系管理员！");
            response.setHeader("refresh", "2;back-insertNotice.jsp");
            e.printStackTrace();
        }
    }
}
