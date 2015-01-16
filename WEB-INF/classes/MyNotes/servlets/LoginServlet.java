package MyNotes.servlets;
import java.util.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import MyNotes.servlets.*;
import java.sql.*;

public class LoginServlet extends HttpServlet
{

    HttpSession session;
    MySQLConnect mysql_connect = new MySQLConnect();

    public LoginServlet() {
        super();
    }


    public void drawHeader(HttpServletRequest req, HttpServletResponse res, PrintWriter out)
    {
        session = req.getSession(true);
        String title = "MyNotes logged in";
        if(session.getAttribute("user") != null) {
            title+= " as " + session.getAttribute("user");
        }

        out.println("<html>");
        out.println("<head>");
        out.println("<title>" + title + "</title>");
        out.println("</head>");

        out.println("<body>");
        try {
            req.getRequestDispatcher("header.jsp").include(req, res);
        } catch (Exception e) {
            out.println("<font face=\"Arial, Helvetica, sans-serif\" color='#006'>");
            out.println("<center>\n<font size=7><strong>MyNotes</strong></font></br>");
            out.println("<font size=4>MyNotes: a UA Project Management Program</font>");
            out.println("</center>\n<hr color=\"#000066\">");
            out.println("</font>");
        }
        out.println("<div id='mainContent' class='small-6 small-centered columns text-center'>");
        out.println("<h2>Main Menu</h2>");
        out.println("<hr>");
    }

    public void drawFooter(HttpServletRequest req, PrintWriter out)
    {
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }


    private void drawActiveOptions(HttpServletRequest req, PrintWriter out)
    {

        out.println("<form name='AddCard' action='AddCard' method='get'>");
        out.println("<input class='small radius button' type='submit' name='AddCard' value='Add a Card'>");
        out.println("</form>");

        out.println("<form name='findBoards' action=FindBoards method=get>");
        out.println("<input class='small radius button' type='submit' name='findBoard' value='Find boards with at most a number of subscribers.'>");
        out.println("</form>");

        out.println("<form name='CardShare' action=./JSP/SharedAssignment.jsp>");
        out.println("<input class='small radius button' type='submit' name='SharedAssignment' value='Which users are assigned to the same card?'>");
        out.println("</form>");

        out.println("<form name='Board' action=./JSP/AddBoard.jsp>");
        out.println("<input class='small radius button' type='submit' name='AddBoard' value='Add a Board'>");
        out.println("</form>");
        
        
        out.println("<form name='Subscribe' action=./JSP/Subscribe.jsp>");
        out.println("<input class='small radius button' type='submit' name='SubscribeBoard' value='Subscribe to a Board'>");
        out.println("</form>");
    }

    public void drawLoginSuccess(HttpServletRequest req, HttpServletResponse res, PrintWriter out)
    {
        drawHeader(req, res, out);
        drawActiveOptions(req, out);
        drawFooter(req, out);
    }

    public void drawLoginFail(HttpServletRequest req, HttpServletResponse res, PrintWriter out, String error) throws ServletException, IOException
    {
        //instead of displaying the error here, we will go back to login page
        res.sendRedirect("/?error=" + error);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String error = "";
        session = req.getSession(true);

        if(req.getParameter("logoutMyNotes") != null) {
            //we are logging out!
            //empty the session
            session.removeAttribute("login");
            session.removeAttribute("user");
            session.removeAttribute("email");
            res.sendRedirect("/");
            
            //end the request here
            return;
        }

        //Look up the user
        if(req.getParameter("MainMenu") != null && session.getAttribute("login") != null) {
            //we are already logged in
            //drawLoginSuccess(req, res, out);
            //really bad design, too lazy to restructure
            error = "";
        } else if(req.getParameter("email") != null && req.getParameter("email").length() > 0) {
            //attempting to login: clear session
            
            session.removeAttribute("login");
            session.removeAttribute("user");
            session.removeAttribute("email");
            String email = req.getParameter("email");
            if(req.getParameter("username") != null && req.getParameter("username").length() > 0) {
                String user = req.getParameter("username");
                Connection m_conn = mysql_connect.getConnection();
                Statement s = mysql_connect.getStatement();

                try {
                    ResultSet rs;
                    rs = s.executeQuery("SELECT Email from MyNotesUser WHERE Email = '" + email + "'");
                    int count = 0;
                    while (rs.next()) {
                        count++;
                    }
                    if(count == 0) {
                        error = "Error: e-mail does not exist.";
                    } else {
                        //email exists, but does it match this user?
                        rs = s.executeQuery("SELECT Email from MyNotesUser WHERE Email = '" + email + "' AND UserName = '" + user + "'");
                        count = 0;
                        while (rs.next()) {
                            count++;
                        }
                        if(count == 0) {
                            error = "Error: Enter the correct username.";
                        } else {


                            session.setAttribute("login","true");
                            session.setAttribute("user", user);
                            session.setAttribute("email", email);


                        }
                    }

                } catch(Exception e) {
                    // error
                }
            } else {
                error = "Error: User is a required field";
            }
        } else {
            error = "Error: Email is a required field";
        }

        if(error.equals("")) {
            //if login success, call the following function
            drawLoginSuccess(req, res, out);
        } else { 
            //if fail, call the following function
            drawLoginFail(req, res, out, error);
        }
    }
}


