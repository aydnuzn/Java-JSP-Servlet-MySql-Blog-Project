package utils;

import props.Admin;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

public class Util {
    public final static String base_url = "http://localhost:8080/BlogProject_war_exploded/";

    public static String MD5(String md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }

    public Admin isLogin(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("giriş kontroller");
        if (request.getCookies() != null ) {
            Cookie[] cookies = request.getCookies();
            for ( Cookie cookie : cookies ) {
                if ( cookie.getName().equals("admin") ) {
                    String vales = cookie.getValue();
                    try {
                        String[] arr = vales.split("_");
                        request.getSession().setAttribute("aid", Integer.parseInt(arr[0]) );
                        request.getSession().setAttribute("name",arr[1] + " " + arr[2] );
                    } catch (NumberFormatException e) {
                        Cookie cookie1 = new Cookie("admin", "");
                        cookie1.setMaxAge(0);
                        response.addCookie(cookie1);
                    }
                    break;
                }
            }
        }

        Object sessionObj = request.getSession().getAttribute("aid");
        Admin adm = new Admin();
        if ( sessionObj == null ) {
            try {
                response.sendRedirect(base_url);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            int aid = (int) request.getSession().getAttribute("aid");
            String name = (String) request.getSession().getAttribute("name");
            adm.setAid(aid);
            adm.setName(name);
        }
        return adm;
    }

    public String blogPostShort(String blogPost, int maxLength){
        String temp = blogPost;
        //String temp = blogPost.getContent();
        if(temp.length()>maxLength){
                String newTemp = temp.indexOf(" ", maxLength) > (maxLength + 6)
                        ? temp.substring(0, maxLength + 10)
                        : temp.substring(0,maxLength);
                temp = newTemp + "...";
        }
        return temp;
    }


}
