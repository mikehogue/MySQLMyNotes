package MyNotes.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import MyNotes.servlets.*;
import java.sql.*;
import MyNotes.utils.*;

public class FindBoards extends HttpServlet {

    MySQLConnect mysql_connect = new MySQLConnect();
    HttpSession session;
    public FindBoards() {
        super();
    }

    public void drawHeader(HttpServletRequest req, HttpServletResponse res, PrintWriter out) {
        session = req.getSession(true);
        String title = "Find Boards";
        if(session.getAttribute("user") != null) {
            title+= " - logged in as " + session.getAttribute("user");
        }

        out.println("<html>");
        out.println("<head>");
        out.println("<title>" + title + "</title>");
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
        out.println("<h2 class='text-center'>Find Boards</h2>");
        out.println("<hr>");
    }

    public void drawFooter(HttpServletRequest req, PrintWriter out) {
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }


    public void drawGetUser(HttpServletRequest req, PrintWriter out) {
        out.println("<form name='userSearch' action='FindBoards' method='get'>");
        out.println("<label>Enter max number of subscribers");
        out.println("<input type='number' name='numUsers' min='0' value='0' required>");
        out.println("</label>");
        out.println("<input class='small radius button' type='submit' name='findBoards' value='Find' >");
        out.println("</form>");
    }


    public void drawShowInfo(HttpServletRequest req, PrintWriter out) {
        String numUsers = req.getParameter("numUsers");

        int n_users = 0;
        String error = "";
        String userStr = "users";
        try {
            n_users = Integer.parseInt(numUsers);

            if (n_users < 0) {
                throw new Exception("Number of users is negative.");
            }

            // account for pluralization
            if (n_users == 1) {
                userStr = "user"; //ternary!
            }

            Connection m_conn = mysql_connect.getConnection();
            Statement s = mysql_connect.getStatement();

            try {
                ResultSet rs = s.executeQuery(
                        "SELECT Board.BoardName " +
                        "FROM Board LEFT OUTER JOIN Subscribes " +
                        "ON Board.BoardName = Subscribes.BoardName " +
                        "GROUP BY Board.BoardName " +
                        "HAVING COUNT(*) <= " + n_users + " OR COUNT(*) = 1 " +
                        "ORDER BY Board.BoardName ASC");
                        
                
                int count = 0;
                String output = "";
                output += "<table class='small-10 small-centered columns'><tbody>";
                while(rs.next()) {
                    output += "<tr>";
                    output += "<td>" +rs.getString(1) + "</td>";
                    count++;
                    if (rs.next()) {
                        output += "<td>" +rs.getString(1) + "</td>";
                        count++;
                    }
                    output += "</tr>";
                }
                output += "</table></tbody>";

                //Want to re-display the form if no results?
                if(count == 0) {
                    error = "Sorry, no boards have at most " + n_users + " users subscribed to them.";
                } else {
                    out.println("<h4 class='text-center'>Boards that have at most " + numUsers + " " + userStr + "</h4>");
                    out.println(output);
                }

            } catch(Exception e) {
                // error
                error = "Error executing SQL Query." + "SELECT Board.BoardName " +
                        "FROM Board LEFT OUTER JOIN Subscribes " +
                        "ON Board.BoardName = Subscribes.BoardName " +
                        "GROUP BY Board.BoardName " +
                        "HAVING COUNT(*) <= " + n_users + " OR COUNT(*) = 1" +
                        "ORDER BY Board.BoardName ASC";
                e.printStackTrace();
            }


        } catch (Exception e) {
            error = "Error: n_users was either null or not a positive integer.";
        }


        if(!error.equals("")) {
            out.println("<div data-alert class='alert-box warning radius'>" + error);
            out.println("<a href='#' class='close'>&times;</a></div>");
            drawGetUser(req, out);
        }
    }


    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();


        session = req.getSession(true);

        if(session.getAttribute("login") == null) {
            //we are not logged in
            res.sendRedirect("/MyNotes");
        }
        drawHeader(req, res, out);

        if(req.getParameter("findBoards") == null) {
            drawGetUser(req,out);
        }
        else {
            drawShowInfo(req,out);
        }

        drawFooter(req,out);
    }
}



