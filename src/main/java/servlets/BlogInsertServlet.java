package servlets;

import props.BlogPost;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "blogInsert", value = "/blog-insert")
public class BlogInsertServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // BlogPost DELETE iŞLEMİNİN GERÇEKLEŞTİĞİ YER

        System.out.println("BlogInsert doGet Call");
        String ipAddress = req.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = req.getRemoteAddr();
        }

        String bid = req.getParameter("bid");
        System.out.println("bid = " + bid);
        try {
            int blogPostId = Integer.parseInt(bid);
            int aid = (int)req.getSession().getAttribute("aid");
            System.out.println("adminId = " + aid + " blogPostId = " + blogPostId);
            DBUtil util = new DBUtil();
            if ( util.isAuthorizedProcess(blogPostId, aid) ) {
                int status = util.blogPostDelete(blogPostId);
                if ( status > 0 ) {
                    System.out.println("Silme Başarılı");
                }
            }
        } catch (Exception e) {
            System.err.println("Delete item Error : " + ipAddress + " Error " + e);
        }
        resp.sendRedirect(Util.base_url + "admin_allpost.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // BlogPost INSERT iŞLEMİNİN GERÇEKLEŞTİĞİ YER

        System.out.println("blogInsert doPost Call");

        BlogPost blogPost = new BlogPost();
        blogPost.setTitle(req.getParameter("title"));
        blogPost.setTitle_detail(req.getParameter("title_detail"));
        blogPost.setContent(req.getParameter("content"));

        // Giriş yapan admin'in id si Sessionda kayıtlı olan kısımdan alındı
        int aid = (int) req.getSession().getAttribute("aid");
        System.out.println("admin id = " + aid);

        DBUtil util = new DBUtil();
        int status = util.blogInsert(blogPost, aid);
        if ( status > 0 ) {
            System.out.println("Blog Yazısı Eklendi");
            resp.sendRedirect(Util.base_url + "admin_allpost.jsp");
        }else {
            System.out.println("HATA! Blog Yazısı Eklenmedi!");
            String errorMessage = "";
            if (status == 0) {
                errorMessage = "Ekleme sırasında bir hata oluştu!";
            }
            req.setAttribute("insertError", errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/blogpost_insert.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
