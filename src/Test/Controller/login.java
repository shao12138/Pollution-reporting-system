package Test.Controller;
import Test.Dao.mapDao;
import Test.Pojo.User;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String number = request.getParameter("number");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        mapDao dao = (mapDao) getServletContext().getAttribute("map");
        try {
            String sql = "select name,password,personnumber,email,tellnumber from mapUser where number=?";
            ResultSet rs = dao.query(sql, number);
            if (rs.next()) {
                String checkpass = rs.getString("password");
                if (password.equals(checkpass)) {
                    String name = rs.getString("name");
                    String personnumber = rs.getString("personnumber");
                    String email = rs.getString("email");
                    String tellnumber = rs.getString("tellnumber");
                    User user = new User(number, name, password, personnumber, email, tellnumber);
                    session.setAttribute("user", user);
                    response.sendRedirect("index.jsp");
                } else {
                    out.print("账号或密码错误！三秒后将返回。");
                    response.setHeader("refresh", "3;index.jsp");
                }
            } else {
                out.print("账号或密码错误！三秒后将返回。");
                response.setHeader("refresh", "3;index.jsp");
            }
        } catch (Exception e) {
            out.print("出现意外情况，请联系管理员！");
            response.setHeader("refresh", "2;zhuce.jsp");
            e.printStackTrace();
        }
    }
}
