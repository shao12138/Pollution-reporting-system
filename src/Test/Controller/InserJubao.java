package Test.Controller;

import Test.Dao.mapDao;
import Test.Pojo.User;
import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "InsertJubao", urlPatterns = {"/InsertJubao"})
@MultipartConfig
public class InserJubao extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        double lat = 0.0;
        double log = 0.0;
        Date date = new Date();
        String pat2 = "yyyy-MM-dd-HH-mm-ss-SSS";//模板2
        SimpleDateFormat sdf2 = new SimpleDateFormat(pat2);
        String nowDate = sdf2.format(date);
        PrintWriter out = res.getWriter();
        //获取上传文件
        Part part = req.getPart("image");
        //获取包含文件名的字符串
        String fileNameInfo = part.getHeader("content-disposition");
        //提取上传文件的原始文件名
        String fileName = fileNameInfo.substring(fileNameInfo.indexOf("filename=\"") + 10, fileNameInfo.length() - 1);
        String path = getServletContext().getRealPath("/upload/");
        part.write( path + nowDate + "-" + fileName);
        File file = new File( path + nowDate + "-" + fileName);
        try {
            Metadata metadata = JpegMetadataReader.readMetadata(file);
            for (Directory directory : metadata.getDirectories()) {
                for (Tag tag : directory.getTags()) {
                    if (tag.getTagName().equals("GPS Latitude")) {
                        lat = change(tag.getDescription());
                    } else if (tag.getTagName().equals("GPS Longitude")) {
                        log = change(tag.getDescription());
                    }
                }
            }
            String url = "/upload/" + nowDate + "-" + fileName;
            mapDao dao = (mapDao) getServletContext().getAttribute("map");
            String sql = "insert into mappic(number,lat,log,url)values(?,?,?,?)";
            try {
                dao.insert(sql, ((User) req.getSession().getAttribute("user")).getNumber(), lat, log, url);
            } catch (Exception e) {
                e.printStackTrace();
            }
            out.print("上传成功！");
            res.setHeader("refresh", "2;wuran.jsp");
        } catch (JpegProcessingException e) {
            out.print("皮？没有经纬度！");
            res.setHeader("refresh", "2;jubao.jsp");
            e.printStackTrace();
        }
    }

    public double change(String temp) {
        String du = "0";
        if (temp.indexOf("°") != -1) {
            du = temp.substring(0, temp.indexOf("°"));
        }
        String fen = "0";
        if (temp.indexOf("°") != -1) {
            fen = temp.substring(temp.indexOf("°") + 1, temp.indexOf("'"));
        }
        String miao = "0";
        if (temp.indexOf("'") != -1) {
            miao = temp.substring(temp.indexOf("'") + 1).replace("\"", "");
        }
        double a, b, c = 0.0;
        a = Double.parseDouble(du);
        b = Double.parseDouble(fen) / 60;
        c = Double.parseDouble(miao) / 60 / 60;
        return a + b + c;
    }
}
