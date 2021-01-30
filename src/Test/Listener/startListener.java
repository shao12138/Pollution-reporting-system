package Test.Listener;

import Test.Dao.mapDao;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;


@WebServlet(loadOnStartup = 1,urlPatterns = "/first")   //项目启动时就把map装入内存
public class startListener extends HttpServlet {

    public void init(ServletConfig config) {
        try {
            //取得该ServletContext实例
            ServletContext application = config.getServletContext();
            //从配置中获取驱动
            String driver = application.getInitParameter("driver");
            //从配置参数中获取数据库url
            String url = application.getInitParameter("url");
            //从配置参数中获取用户名
            String user = application.getInitParameter("user");
            //从配置参数中获取密码
            String pass = application.getInitParameter("password");
            mapDao map = new mapDao(driver, url, user, pass);
            application.setAttribute("map", map);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
