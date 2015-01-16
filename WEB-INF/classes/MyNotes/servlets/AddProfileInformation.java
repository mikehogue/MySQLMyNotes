package MyNotes.servlets;
import java.util.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import MyNotes.servlets.*;


public class AddProfileInformation extends HttpServlet
{

    HttpSession session;
    MySQLConnect mysql_connect = new MySQLConnect();	
    public AddProfileInformation()
    {
        super();
    }


    public void drawUpdateMessage(HttpServletRequest req, PrintWriter out)
    {
        /*
         * Check if this email is already registered
         */

        String email = "";
        String user = "";
        String error = "";
        if(req.getParameter("email") != null && req.getParameter("email").length() > 0) {
            email = req.getParameter("email");
            if(req.getParameter("user") != null && req.getParameter("user").length() > 0) {
                user = req.getParameter("user");
                Connection m_conn = mysql_connect.getConnection();
                Statement s = mysql_connect.getStatement();

                try {
                    ResultSet rs = s.executeQuery("SELECT Email FROM MyNotesUser WHERE Email = '" + email + "'");
                    int count = 0;
                    while (rs.next()) {
                        count++;
                    }
                    if (count != 0) {
                        error = "Error: That email address is already registered!";
                    } else if (user.length() > 50) {
                        error = "Error: The username is over 50 characters.";
                    } else if (email.length() > 50) {
                        error = "Error: The email address is over 50 characters.";
                    } else {
                        //lets insert it
                        s.executeUpdate("INSERT INTO MyNotesUser VALUES('" + user + "', '" + email + "')");
                    }
                } catch(Exception e) {
                    error = "Error: Could not insert user.";
                }
            } else {
                error = "Error: User is a required field";
            }
        } else {
            error = "Error: Email is a required field";
        }

        if(error.equals("")) {
            out.println("<h4>New user added!</h4>");
            out.println("<dl>");
            out.println("<dt>Email</dt>");
            out.println("<dd>" + email + "</dd>");
            out.println("<dt>Username</dt>");
            out.println("<dd>" + user + "</dd>");
            out.println("</dl>");

            out.println("<form name='MainMenu' action='LoginServlet'>");
            out.println("<input class='small radius button' type='submit' name='MainMenu' value='Main Menu'>");
            out.println("<input type='hidden' name='email' value='" + email +"'>");
            out.println("<input type='hidden' name='username' value='" + user +"'>");
            out.println("</form>");
        } else {
            out.println("<div data-alert class='alert-box warning radius'>" + error);
            out.println("<a href='#' class='close'>&times;</a></div>");
            drawAddProfileInformationMenu(req, out);
        }
    }


    public void drawHeader(HttpServletRequest req, HttpServletResponse res, PrintWriter out) {
        session = req.getSession(true);
        String title = "User Addition";
        if(session.getAttribute("user") != null) {
            title+= " - logged in as " + session.getAttribute("user");
        }

        out.println("<html>");
        out.println("<head>");
        out.println("<title>" + title + "</title>");
        out.println("<style>");
        out.println(".mainMenuNav { display: none; }");
        out.println(".logoutNav { display: none; }");
        out.println("</style>");
        out.println("</head>");

        out.println("<body>");
        try {
            req.getRequestDispatcher("header.jsp").include(req, res);
        } catch (Exception e) {
            out.println("<font face='Arial, Helvetica, sans-serif' color='#006'>");
            out.println("<center>\n<font size=7><strong>MyNotes</strong></font></br>");
            out.println("<font size=4>MyNotes: a UA Project Management Program</font>");
            out.println("</center>\n<hr color='#000066'>");
            out.println("</font>");
        }

        out.println("<div id='mainContent' class='small-6 small-centered columns'>");
        out.println("<h2 class='text-center'>Add new user</h2>");
        out.println("<hr>");
    }


    public void drawFooter(HttpServletRequest req, PrintWriter out)
    {
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }


    public void drawAddProfileInformationMenu(HttpServletRequest req, PrintWriter out)
    {
        out.println("<form name='AddProfileInformation' action=AddProfileInformation method=get>");
        out.println("<label>Email");
        out.println("<input type='email' name='email' required>");
        out.println("</label>");

        out.println("<label>User Name");
        out.println("<input type='text' name='user' required>");
        out.println("</label>");

        out.println("<input class='small radius button' type='submit' name='Submit' value='Insert'>");
        out.println("</form>");

        out.println("<form action='/' method='post'>");
        out.println("<input class='tiny radius secondary button' type='submit' value='Cancel'>");
        out.println("</form>");
    }


    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        drawHeader(req, res, out);

        if(req.getParameter("Submit") == null)
        {
            drawAddProfileInformationMenu(req,out);
        }
        else
        {
            drawUpdateMessage(req,out);
        }

        drawFooter(req,out);
    }
}
