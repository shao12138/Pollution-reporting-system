package Test.Controller;

import Test.Dao.mapDao;
import Test.Pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

@WebServlet(name = "zhuce", urlPatterns = {"/zhuce"})
public class InsertUser extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String password = request.getParameter("password");
        String personnumber = request.getParameter("personnumber");
        String email = request.getParameter("email");
        String tellnumber = request.getParameter("tellnumber");
        String selectSQL = "select * from mapUser where number=?";
        String inserSQL = "insert into mapUser(number,name,password,personnumber,email,tellnumber) values(?,?,?,?,?,?)";
        mapDao dao = (mapDao) getServletContext().getAttribute("map");
        HttpSession session = request.getSession();
        try {
            ResultSet resultSet = dao.query(selectSQL,number);
            if (!resultSet.next()) {
                dao.insert(inserSQL,number,name,password,personnumber,email,tellnumber);
                dao.closeConn();
                out.println("恭喜，注册成功！三秒后将返回。");
                User user = new User(number, name, password, personnumber, email, tellnumber);
                session.setAttribute("User",user);
                response.setHeader("refresh", "3;index.jsp");
            } else {
                out.print("该账号已被注册！");
                response.setHeader("refresh", "2;zhuce.jsp");
            }
        } catch (Exception e) {
            out.print("出现意外情况，请联系管理员！");
            response.setHeader("refresh", "2;zhuce.jsp");
            e.printStackTrace();
        }
    }
}
