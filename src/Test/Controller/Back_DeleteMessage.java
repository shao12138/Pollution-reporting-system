package Test.Controller;

import Test.Dao.mapDao;
import Test.Pojo.Message;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "DeleteMessage", urlPatterns = {"/DeleteMessage"})
public class Back_DeleteMessage extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        mapDao dao = (mapDao) getServletContext().getAttribute("map");
        String sql = "delete from mapmessage where id=?";
        try {
            dao.modify(sql, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("back-taolun.jsp");
    }
}
