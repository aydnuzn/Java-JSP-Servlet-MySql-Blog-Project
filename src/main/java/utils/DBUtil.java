package utils;

import com.mysql.cj.protocol.Resultset;
import props.BlogPost;
import props.UserMessage;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DBUtil {

    public boolean login(String email, String password, String remember, HttpServletRequest req, HttpServletResponse resp) {
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "select * from admin where email = ? and password = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, Util.MD5(password) );
            ResultSet rs = pre.executeQuery();
            status = rs.next();

            // Session Create
            if(status){
                int aid = rs.getInt("aid");
                String name = rs.getString("name");

                req.getSession().setAttribute("aid", aid);
                req.getSession().setAttribute("name", name);

                // cookie create de bunun altına gelecek ve remember bu cookie de kullanılacak
                if ( remember != null && remember.equals("on")) {
                    name = name.replaceAll(" ", "_");
                    String val = aid+"_"+name;
                    Cookie cookie = new Cookie("admin", val);
                    cookie.setMaxAge( 60*60 );
                    resp.addCookie(cookie);
                }
            }

        } catch (Exception e) {
            System.err.println("login Error : " + e);
        }finally {
            db.close();
        }
        return status;
    }

    public int blogInsert(BlogPost blogPost, int aid){
        System.out.println("blogıNSET mETHODUNA GİRDİ.");
        int status = 0;
        DB db = new DB();
        try {
            String sql = "INSERT INTO blogpost (fk_aid, title, title_detail, content, date_time) VALUES (?, ?, ?, ?, now())";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,aid);
            pre.setString(2,blogPost.getTitle());
            pre.setString(3, blogPost.getTitle_detail());
            pre.setString(4, blogPost.getContent());
            status = pre.executeUpdate();
        } catch (Exception e) {
            System.err.println("blogInsert Error: " + e);
        } finally {
            db.close();
        }
        return status;
    }

    // adminAllBlogPost list
    public List<BlogPost> adminAllBlogPost(int aid){
        List<BlogPost> listBlogPost = new ArrayList<>();
        DB db = new DB();
        try {
            String sql = "Select * From blogpost Where fk_aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, aid);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                int bid = rs.getInt("bid");
                int fk_aid = rs.getInt("fk_aid");
                String title = rs.getString("title");
                String title_detail = rs.getString("title_detail");
                String content = rs.getString("content");
                Date date_time = rs.getDate("date_time");
                BlogPost blogPost = new BlogPost(bid,title,title_detail,content,fk_aid, date_time);
                listBlogPost.add(blogPost);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            db.close();
        }
        return listBlogPost;
    }

    // allBlogPost list
    public List<BlogPost> allBlogPost(){
        List<BlogPost> listBlogPost = new ArrayList<>();
        DB db = new DB();
        try {
            String sql = "Select * from blogpost as b INNER JOIN admin as a ON a.aid = b.fk_aid";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                int bid = rs.getInt("bid");
                int fk_aid = rs.getInt("fk_aid");
                String name = rs.getString("name");
                String title = rs.getString("title");
                String title_detail = rs.getString("title_detail");
                String content = rs.getString("content");
                Date date_time = rs.getDate("date_time");
                BlogPost blogPost = new BlogPost(bid,title,title_detail,content,fk_aid, date_time);
                blogPost.setName(name);
                listBlogPost.add(blogPost);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            db.close();
        }
        return listBlogPost;
    }

    // blogPost delete
    public int blogPostDelete(int bid){
        int status = 0;
        DB db = new DB();
        try {
            String sql = "Delete From blogpost Where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, bid);
            status = pre.executeUpdate();
        } catch (Exception e) {
            System.err.println("blogPostDelete Error : " + e);
        }finally {
            db.close();
        }
        return status;
    }

    public boolean isAuthorizedProcess(int bid, int aid){
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "Select * From blogpost Where bid = ? and fk_aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, bid);
            pre.setInt(2, aid);
            ResultSet rs = pre.executeQuery();
            status = rs.next();
        } catch (Exception e) {
            System.err.println("isAuthorizedDelete Error : " + e);
        }finally {
            db.close();
        }
        System.out.println("isAuthorizedDelete = " + status);
        return status;
    }

    // user isValidBlog
    public boolean isValidBlog(int bid){
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "Select * From blogpost Where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, bid);
            ResultSet rs = pre.executeQuery();
            status = rs.next();
        } catch (Exception e) {
            System.err.println("isValidBlog Error : " + e);
        }finally {
            db.close();
        }
        System.out.println("isValidBlog = " + status);
        return status;
    }

    // singleBlogpost
    public BlogPost singleBlogPost(int bid){
        DB db = new DB();
        try {
            String sql = "Select * From blogpost Where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, bid);
            ResultSet rs = pre.executeQuery();
            if(rs.next()){
                int blogId = rs.getInt("bid");
                int fk_aid = rs.getInt("fk_aid");
                String title = rs.getString("title");
                String title_detail = rs.getString("title_detail");
                String content = rs.getString("content");
                Date date_time = rs.getDate("date_time");
                BlogPost blogPost = new BlogPost(blogId, title, title_detail, content, fk_aid, date_time);
                return blogPost;
            }
        } catch (Exception e) {
            System.err.println("getSingleBlogPost Error : " + e);
        }finally {
            db.close();
        }
        return null;
    }

    // blogPostUpdate
    public int blogPostUpdate(int bid, String title, String title_detail, String content){
        int status = 0;
        DB db = new DB();
        try {
            String sql = "Update blogpost Set title = ?, title_detail = ?, content = ?, date_time = now() Where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1, title);
            pre.setString(2, title_detail);
            pre.setString(3, content);
            pre.setInt(4, bid);
            status = pre.executeUpdate();
        } catch (Exception e) {
            System.err.println("blogPostUpdate Error : " + e);
        } finally {
          db.close();
        }
        return status;
    }


    // Password Control
    public boolean passwordControl(int aid, String currentPassword){
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "Select password From admin Where aid = ? and password = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, aid);
            pre.setString(2, Util.MD5(currentPassword));
            ResultSet rs = pre.executeQuery();
            status = rs.next();
        } catch (Exception e) {
            System.err.println("passwordError : " + e);
        }finally{
            db.close();
        }
        return status;
    }

    // Password Change
    public int changePassword(int aid, String newPassword ){
        int status = 0;
        DB db = new DB();
        try {
            String sql = "Update admin set password = ? where aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1, Util.MD5(newPassword));
            pre.setInt(2, aid);
            status = pre.executeUpdate();
        } catch (Exception e) {
            System.err.println("changePasswordError : " + e);
        }finally {
            db.close();
        }

        return status;
    }

    public int sendMessage(UserMessage ms){
        System.out.println(ms.getName() + " " + ms.getEmail() + " " +  ms.getSubject() + " " + ms.getContent());
        int status = 0;
        DB db = new DB();
        try {
            String sql = "Insert into message (name, email, subject, content) values(?, ? , ?, ?)";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1, ms.getName());
            pre.setString(2, ms.getEmail());
            pre.setString(3, ms.getSubject());
            pre.setString(4, ms.getContent());
            status = pre.executeUpdate();
        } catch (SQLException e) {
            System.err.println("sendMessageError : " + e);
        }finally {
            db.close();
        }
        return status;
    }



}
