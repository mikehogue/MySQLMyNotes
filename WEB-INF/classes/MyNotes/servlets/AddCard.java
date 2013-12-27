package MyNotes.servlets;
import java.util.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import MyNotes.servlets.*;
import MyNotes.utils.*;


public class AddCard extends HttpServlet {

    MySQLConnect mysql_connect = new MySQLConnect();
    HttpSession session;
    public AddCard() {
        super();
    }


    public void drawUpdateMessage(HttpServletRequest req, PrintWriter out) {
        /*
           Attempting to add a card. Make sure that the user is logged in 
           */

        String error = "";
        String board_name = "";
        String task_name = "";
        String str_creationID = "";
        String description = "";
        String str_date = "";
        String str_day = null;
        String str_month = null;
        String str_year = null;
        session = req.getSession(true);
        int creationID = 0, day = 0, month = 0, year = 0;
        if(session.getAttribute("login") == null) {
            error = "Please log in before attempting to add a card.";
        } else {
            String user = (String)session.getAttribute("user");
            String email = (String)session.getAttribute("email");

            /* Make sure that the user provided all of the necessary information */
            board_name  = req.getParameter("boardname");
            task_name = req.getParameter("taskname");
            str_date = req.getParameter("date");
            try {
                str_year = str_date.split("-")[0];
                str_month = str_date.split("-")[1];
                str_day = str_date.split("-")[2];
            } catch (Exception e) {
                error = "Date format incorrect.";
            }
            description = req.getParameter("description");

            if(board_name == null || board_name.length() == 0) {
                error = "Please enter a board name.";
            } else if(task_name == null || task_name.length() == 0) {
                error = "Please enter a task name.";
            } else if(str_day == null || str_day.length() == 0) {
                error = "Please enter a day.";
            } else if(str_month == null || str_month.length() == 0) {
                error = "Please enter a month.";
            } else if(str_year == null || str_year.length() == 0) {
                error = "Please enter a year.";
            } else if(description == null || description.length() == 0) {
                error = "Please enter a description.";
            } else {
                // None of them were null, so let's do something with the data

                try {
                    day = Integer.parseInt(str_day);
                } catch (Exception e) {
                    error = "Error: day is not of number type.";
                }
                try {
                    month = Integer.parseInt(str_month);
                } catch (Exception e) {
                    error = "Error: month is not of number type.";
                }
                try {
                    year = Integer.parseInt(str_year);
                } catch (Exception e) {
                    error = "Error: year is not of number type.";
                }

                //Check that the length of the strings are valid
                if(creationID > 99999) {
                    error = "Error: Maximum creation ID is 99999";
                } else if (board_name.length() > 50) {
                    error = "Error: Board name cannot be longer than 50 characters.";
                } else if (task_name.length() > 500) {
                    error = "Error: Task name cannot be longer than 500 characters.";
                } else if (description.length() > 500) {
                    error = "Error: Description cannot be longer than 500 characters.";
                } else {
                    //lets check if the date is valid
                    try {
                        Calendar cal = new GregorianCalendar();
                        cal.setLenient(false);
                        cal.set(year, month-1, day);
                        cal.getTime();
                    } catch (Exception e) {
                        error = "Erorr: Invalid date specified.";
                    }
                }

                if(error.equals("")) {
                    //We can enter this card.

                    MySQLConnect mysql_connect = new MySQLConnect();
                    Connection m_conn = mysql_connect.getConnection();
                    Statement s = mysql_connect.getStatement();

                    try {
                        String day_str = str_day;
                        String month_str = str_month;
                        if(day < 10) {
                            day_str = "0" + day;
                        }
                        if(month < 10) {
                            month_str = "0" + month;
                        }

                        //make sure the Board exists
                        ResultSet rs = s.executeQuery("SELECT BoardName FROM Board WHERE BoardName = '" + board_name + "'");
                        int count = 0;
                        while (rs.next()) {
                            count++;
                        }
                        if(count == 0) {
                            error = "Error: board " + board_name + " does not exist.";
                        } else {
                            s.executeUpdate("INSERT INTO Creation VALUES('" + email + "', NULL)");
                            s.executeUpdate("INSERT INTO Card VALUES('" + board_name + "', '" + task_name + "', '" + description + 
                                    "', STR_TO_DATE('" + year + "-" + month_str + "-" + day_str + "' , '%Y-%m-%d'), LAST_INSERT_ID())");

                            // get the CreationID of the new card
                            rs = s.executeQuery("SELECT LAST_INSERT_ID() FROM DUAL");
                            if (!rs.next()) {
                                throw new Exception("Creation Sequence failed");
                            }
                            creationID = rs.getInt(1);
                        }
                    } catch(Exception e) {
                        // error
                        error = "Error inserting into database: referential integrity constraint.";
                    }
                }
            }

        }

        if(error.equals("")) {
            out.println("<dl>");
            out.println("<dt>Board Name</dt>");
            out.println("<dd>" + board_name + "</dd>");
            out.println("<dt>Task Name</dt>");
            out.println("<dd>" + task_name + "</dd>");
            out.println("<dt>CreationID</dt>");
            out.println("<dd>" + creationID + "</dd>");
            out.println("<dt>Description</dt>");
            out.println("<dd>" + description + "</dd>");
            out.println("<dt>Day</dt>");
            out.println("<dd>" + day + "</dd>");
            out.println("<dt>Month</dt>");
            out.println("<dd>" + month + "</dd>");
            out.println("<dt>Year</dt>");
            out.println("<dd>" + year + "</dd>");
            out.println("</dl>");
        } else {
            out.println("<div data-alert class='alert-box warning radius'>" + error);
            out.println("<a href='#' class='close'>&times;</a></div>");
            drawAddCardInformationMenu(req, out);
        }
    }


    public void drawHeader(HttpServletRequest req, HttpServletResponse res, PrintWriter out) {
        session = req.getSession(true);
        String title = "Activity Addition";
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
        out.println("<h2 class='text-center'>Add new card</h2>");
        out.println("<hr>");
    }


    public void drawFooter(HttpServletRequest req, PrintWriter out)
    {
        out.println("</div>");
        out.println("<script>");
        out.println("$(document).ready(function() { $('#boardName').select2(); });");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
    }


    public void drawAddCardInformationMenu(HttpServletRequest req, PrintWriter out)
    {
        Connection m_conn = mysql_connect.getConnection();
        Statement s = mysql_connect.getStatement();

        ArrayList<String> boards = new ArrayList<String>();
        try {
            //make sure the Board exists
            ResultSet rs = s.executeQuery("SELECT BoardName FROM Board");
            while (rs.next()) {
                boards.add(rs.getString(1));
            }
            Collections.sort(boards);
        } catch (Exception e) {
            e.printStackTrace();
        }

        out.println("<form name='AddCard' action='AddCard' method='get'>");
        out.println("<label>Board Name");
        out.println("<select id='boardName' class='small-12' name='boardname' required>");
        for (String board : boards) {
            out.println("<option value = '" + board + "'>" + board + "</option>");
        }
        out.println("</select>");
        out.println("</label>");

        out.println("<label>Task Name");
        out.println("<input type='text' name='taskname' required>");
        out.println("</label>");

        out.println("<label>Description");
        out.println("<textarea name='description' required></textarea>");
        out.println("</label>");

        out.println("<label>Date");
        out.println("<input type='date' name='date' placeholder='yyyy-mm-dd' required>");
        out.println("</label>");

        out.println("<input class='small radius button' type='submit' name='Submit' value='Insert'>");

        out.println("</form>");
    }


    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        drawHeader(req, res, out);

        session = req.getSession(true);
        if(session.getAttribute("login") == null) {
            //we are not logged in
            res.sendRedirect("/MyNotes");
        }
        if(req.getParameter("Submit") == null)
        {
            drawAddCardInformationMenu(req,out);
        }
        else
        {
            drawUpdateMessage(req,out);
        }

        drawFooter(req,out);
    }
}
