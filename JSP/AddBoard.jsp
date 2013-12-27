<%@ page language="java" contentType="text/html" %>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*, MyNotes.utils.*" %>

<%
  String email;
  String userName;
  String err = "";
  String success = "";
%>
<%
if(session.getAttribute("login") == null) {
    response.sendRedirect("/MyNotes?error=You must be logged in to add a Board");
}
email = (String) session.getAttribute("email");
userName = (String) session.getAttribute("user");

String board_name = request.getParameter("board_name");
MySQLConnect mysql_connect = new MySQLConnect();
Connection m_conn = mysql_connect.getConnection();
Statement s = mysql_connect.getStatement();

if(request.getParameter("addBoardSubmit") != null) {
    if(request.getParameter("board_name") != null) {

        try {
            
            ResultSet rs = s.executeQuery("SELECT BoardName FROM Board WHERE BoardName = '" + board_name + "'");
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if (count > 0) {
                err = "Error: Board " + board_name + " already exists.";
            } else if (board_name.equals("")) {
                err = "Error: Please enter a board name.";
            } else if (board_name.length() > 50) {
                err = "Error: Please enter a board name with less than 50 characters.";
            } else {
                s.executeUpdate("INSERT INTO Creation VALUES('" + email + "', NULL)");
                s.executeUpdate("INSERT INTO Board VALUES('" + board_name + "', LAST_INSERT_ID())"); //sql injection vulnerable lol
                success = "Successfully created Board " + board_name + "!";
            }
        } catch(Exception e) {
            err = e + "\nError executing SQL Query.";
        }
    } else {
         err = "Error: Board name is a required field!";
    }
}
%>

<!doctype html>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html">
    <title>Add Board <%= "- logged in as " + userName%></title>
  </head>
  <body>

    <%@ include file="../header.jsp" %>

    <div id="mainContent" class="small-6 small-centered columns">
      <h2 class='text-center'>Add Board</h2>
      <hr>

      <%
        if(!err.equals("")) {
            out.println("<div data-alert class='alert-box warning radius'>" + err);
            out.println("<a href='#' class='close'>&times;</a></div>");
        } else if(!success.equals("")) {
            out.println("<div data-alert class='alert-box sucess radius'>" + success);
            out.println("<a href='#' class='close'>&times;</a></div>");
        }
      %>

      <form name="addBoard" action="" method="get">
        <label>Board Name:
          <input id="boardName" type="text" name="board_name" required>
        </label>
        <input class="button small radius" type="submit" name="addBoardSubmit" value="Add Board">
      </form>
    </div>
  </body>
</html>
