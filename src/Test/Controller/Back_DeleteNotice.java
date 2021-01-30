package Test.Controller;

import Test.Dao.mapDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "DeleteNotice", urlPatterns = {"/DeleteNotice"})
public class Back_DeleteNotice extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        mapDao dao = (mapDao) getServletContext().getAttribute("map");
        String sql = "delete from mapnotice where id=?";
        try {
            dao.modify(sql,id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("back-gonggao.jsp");
    }
}
