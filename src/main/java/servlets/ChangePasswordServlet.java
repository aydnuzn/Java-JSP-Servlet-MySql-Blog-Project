package servlets;

import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "changePassword", value = "/change-password")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");
        int aid = (int) req.getSession().getAttribute("aid");
        System.out.println("Şifre Değiştirme Kısmı --> aid = " + aid);

        String error = "";

        DBUtil dbUtil = new DBUtil();
        boolean status = dbUtil.passwordControl(aid, currentPassword);
        if(status){
            int status2 = dbUtil.changePassword(aid, newPassword);
            resp.sendRedirect(Util.base_url + "admin_allpost.jsp");
        }else{
            error = "Eski Şifre Yanlış";
            req.setAttribute("changePasswordError", error);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin_changepassword.jsp");
            dispatcher.forward(req,resp);
        }
    }
}
