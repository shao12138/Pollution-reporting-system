package Test.Controller;

import Test.Dao.mapDao;
import Test.Pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "InsertLiulian", urlPatterns = {"/InsertLiulian"})
public class InsertLiulian extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String str = request.getParameter("content");
        mapDao dao = (mapDao) getServletContext().getAttribute("map");
        String sql = "insert into mapmessage(number,name,message) values(?,?,?)";
        try {
            User user = (User) session.getAttribute("user");
            dao.insert(sql, user.getNumber(), user.getName(), str);
            response.setHeader("refresh", "0;taolun.jsp");
        } catch (Exception e) {
            out.print("账号或密码错误！三秒后将返回。");
            response.setHeader("refresh", "3;taolun.jsp");
            e.printStackTrace();
        }

    }
}
