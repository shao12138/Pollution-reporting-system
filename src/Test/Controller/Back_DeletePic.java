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

@WebServlet(name = "DeletePic", urlPatterns = {"/DeletePic"})
public class Back_DeletePic extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        mapDao dao = (mapDao) getServletContext().getAttribute("map");
        String sql = "delete from mappic where id=?";
        String selectSql = "select * from mappic where id=?";
        try {
            ResultSet rs = dao.query(selectSql,id);
            while (rs.next()){
                String url = rs.getString("url");
                String path = getServletContext().getRealPath("/");
                File file = new File(path+url);
                file.delete();
            }
            dao.modify(sql,id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("back-wuran.jsp");
    }
}
