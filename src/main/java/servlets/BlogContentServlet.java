package servlets;

import jdk.nashorn.internal.runtime.regexp.joni.Regex;
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
import java.io.PrintWriter;

@WebServlet(name="blogContentServlet",value = "/blog-content")
public class BlogContentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        int bid = Integer.parseInt(req.getParameter("bid"));
        DBUtil dbUtil = new DBUtil();
        if(dbUtil.isValidBlog(bid)){
            BlogPost blogPost = dbUtil.singleBlogPost(bid);
            String title = blogPost.getTitle();
            String content = blogPost.getContent();
            req.setAttribute("blogPost", blogPost);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/blog_content.jsp");
            dispatcher.forward(req, resp);
        }else{
            resp.sendRedirect(Util.base_url);
        }
    }
}
