package Test.Controller;

import Test.Dao.mapDao;
import Test.Pojo.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "loginBack", urlPatterns = {"/loginBack"})
public class loginBack extends HttpServlet {
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
            String sql = "select name,password,kind from mapUser where number=?";
            ResultSet rs = dao.query(sql, number);
            if (rs.next()) {
                String checkpass = rs.getString("password");
                if (password.equals(checkpass)) {
                    String kind = rs.getString("kind");
                    if (kind.equals("1")) {
                        session.setAttribute("back-number", number);
                        response.sendRedirect("back-user.jsp");
                    } else {
                        out.print("权限不够！三秒后将返回。");
                        response.setHeader("refresh", "3;back-login.jsp");
                    }
                } else {
                    out.print("账号或密码错误！三秒后将返回。");
                    response.setHeader("refresh", "3;back-login.jsp");
                }
            } else {
                out.print("账号或密码错误！三秒后将返回。");
                response.setHeader("refresh", "3;back-login.jsp");
            }
        } catch (Exception e) {
            out.print("出现意外情况，请联系管理员！");
            response.setHeader("refresh", "2;back-login.jsp");
            e.printStackTrace();
        }
    }
}

