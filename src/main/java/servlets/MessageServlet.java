package servlets;

import email.MailSend;
import props.UserMessage;
import utils.DBUtil;
import utils.Util;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "messageServlet", value="/message-servlet")
public class MessageServlet extends HttpServlet {

    @EJB
    private MailSend mailSender = new MailSend();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String senderMail = req.getParameter("email");
        String subject = req.getParameter("subject");
        String content = req.getParameter("content");

        UserMessage ms = new UserMessage();
        ms.setName(name);
        ms.setEmail(senderMail);
        ms.setSubject(subject);
        ms.setContent(content);


        // Mail Send Start  ***************************
        String fromEmail = "musicwrldmail@gmail.com";
        String username = "musicwrldmail";
        String password = "xyz123zyx";

        String email = "uzun.aydinn@gmail.com";
        mailSender.sendEmail(fromEmail, username, password, email, subject, content, senderMail);
        // Mail Send Finish ****************************

        DBUtil dbUtil = new DBUtil();
        int status = dbUtil.sendMessage(ms);
        if ( status > 0 ) {
            System.out.println("Mesaj Gönderildi");
            resp.sendRedirect(Util.base_url + "contact.jsp");
        }else {
            System.out.println("HATA! Mesaj Gönderilemedi!");
            String errorMessage = "Mesaj Gönerilmedi";
            req.setAttribute("messageError", errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/contact.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
