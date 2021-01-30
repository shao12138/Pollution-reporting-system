package Test.Controller;

import Test.Dao.mapDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "DeleteUser", urlPatterns = {"/DeleteUser"})
public class Back_DeleteUser extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String number = request.getParameter("number");
        mapDao dao = (mapDao) getServletContext().getAttribute("map");
        String sql = "delete from mapuser where number=?";
        try {
            dao.modify(sql,number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("back-user.jsp");
    }
}
