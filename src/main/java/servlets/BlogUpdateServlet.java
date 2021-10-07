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

@WebServlet(name = "blogUpdate", value = "/blog-update")
public class BlogUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Düzenle kısmına basıldıgında başka bir sayfa açılıp düzenleme kısımları karşımıza geliyor

        int bid = Integer.parseInt(req.getParameter("bid"));

        try {
            int aid = (int)req.getSession().getAttribute("aid");
            System.out.println("adminId = " + aid + " blogPostId = " + bid);
            DBUtil util = new DBUtil();
            if ( util.isAuthorizedProcess(bid, aid) ) {
                req.getSession().setAttribute("updateBlogPostId", bid);
                BlogPost getBlogPost = util.singleBlogPost(bid);
                req.setAttribute("blogPost", getBlogPost);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/blogpost_update.jsp");
                dispatcher.forward(req, resp);
            }
            else{
                resp.sendRedirect(Util.base_url + "admin_allpost.jsp");
            }
        } catch (Exception e) {
            System.err.println("UpdateBlog Error : " + e);
            resp.sendRedirect(Util.base_url + "admin_allpost.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Düzenlemeyi onayladıgımızda karşımıza çıkacak

        boolean bidStatus = req.getSession().getAttribute("updateBlogPostId") != null;
        if ( bidStatus ) {
            String title = req.getParameter("title");
            String title_detail = req.getParameter("title_detail");
            String content = req.getParameter("content");
            int bid = (int) req.getSession().getAttribute("updateBlogPostId");

            DBUtil util = new DBUtil();
            System.out.println("Update yollanan BlogId -- > bid = " + bid);
            int status = util.blogPostUpdate(bid, title, title_detail, content);
            req.getSession().removeAttribute("updateBlogPostId");
        }
        resp.sendRedirect(Util.base_url+"admin_allpost.jsp");

    }
}
