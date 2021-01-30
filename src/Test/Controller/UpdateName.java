package Test.Controller;

import Test.Dao.mapDao;
import Test.Pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

@WebServlet(name = "UpdateName", urlPatterns = {"/UpdateName"})
public class UpdateName extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String number = request.getParameter("number");
        String name = request.getParameter("name");
        mapDao dao = (mapDao) getServletContext().getAttribute("map");
        try {
            String sql = "update mapUser set name=? where number=?";
            dao.modify(sql, name, number);
            out.print("修改成功！");
            User user = (User) session.getAttribute("user");
            user.setName(name);
            session.setAttribute("user",user);
            response.setHeader("refresh", "2;gerenxinxi.jsp");
        } catch (Exception e) {
            out.print("出现意外情况，请联系管理员！");
            response.setHeader("refresh", "2;index.jsp");
            e.printStackTrace();
        }
    }
}
