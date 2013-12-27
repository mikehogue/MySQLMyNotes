<%@ page language="java" contentType="text/html" %>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*, MyNotes.utils.*" %>

<%
  String email;
  String userName;
  String err = "";
  String output = "";
  String success = "";
  ArrayList<String> boardNames = new ArrayList<String>();
%>
<%
if(session.getAttribute("login") == null) {
    response.sendRedirect("/MyNotes?error=You must be logged in to Subscribe to a Board");
}
email = (String) session.getAttribute("email");
userName = (String) session.getAttribute("user");
err = "";
MySQLConnect mysql_connect = new MySQLConnect();
Connection m_conn = mysql_connect.getConnection();
Statement s = mysql_connect.getStatement();
try {
    ResultSet rs = s.executeQuery(
        "SELECT Board.BoardName " +
        "FROM Board " +
        "WHERE BoardName NOT IN (" +
            "SELECT BoardName FROM Subscribes WHERE Email = '" + email + "')");
    while (rs.next()) {
        boardNames.add(rs.getString(1));
    }
    Collections.sort(boardNames);
} catch (Exception e) {
    err = e + "\nError executing SQL query.";
}

if(request.getParameter("subscribeBoard") != null) {
    if(request.getParameter("board_name") != null) {

        String board_name = request.getParameter("board_name");

        try {
            ResultSet rs = s.executeQuery("SELECT BoardName FROM Board WHERE BoardName = '" + board_name + "'");
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if(count == 0) {
                err = "Error: Board " + board_name + " does not exist.";
            } else {

                //make sure not already subscribed
                count = 0;
                rs = s.executeQuery("SELECT BoardName FROM Subscribes WHERE BoardName = '" + board_name + "' AND Email = '" + email + "'");
                while(rs.next()) {
                    count++;
                }
                if(count > 0) {
                    err = "Error: You are already subscribed to " + board_name + "!";
                } else {
                    s.executeUpdate("INSERT INTO Subscribes VALUES('" + board_name + "', '" + email + "')"); //sql injection vulnerable lol
                    success = "Successfully subscribed to " + board_name + "!";
                }
            }

        } catch(Exception e) {
            err = e + "\nError executing SQL Query.";
        }

    } else {
         err = "Error: Board name is a required field!";
    }
}

//look up all boards that this user is is subscribed to

try {
    m_conn.setAutoCommit(true);  // optional, but it sets auto commit to true
    s = m_conn.createStatement();  // create a statement
    if (s == null) {
        throw new Exception("createStatement failed");
    }

    ResultSet rs = s.executeQuery("SELECT BoardName FROM Subscribes WHERE Email = '" + email + "'");
    int count = 0;
    output = "<table class='small-10 small-centered columns'><tbody>";
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

    output += "</dl>";
    if(count == 0) {
        String error = "You are not currently subscribed to any boards.";
        output += "<div data-alert class='alert-box warning radius'>" + error;
        output += "<a href='#' class='close'>&times;</a></div>";
    }
} catch(Exception e) {
    err = e + "\nError executing SQL Query.";
}
%>

<!doctype html>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html">
    <title>Subscribe to Board <%= "- logged in as " + userName%></title>
  </head>
  <body>
    <%@ include file="../header.jsp" %>

    <div id="mainContent" class="small-6 small-centered columns">
      <h2 class='text-center'>Subscribe to Board</h2>
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

      <form name="subscribeBoard" action="" method="get">
        <label>Board Name:
          <select id="boardName" class="small-12" name="board_name" required>
            <% for (String boardName : boardNames) { %>
              <option value="<%= boardName %>"><%= boardName %></option>
            <% } %>
          </select>
        </label>
        <input class="button small radius" type="submit" name="subscribeBoard" value="Subscribe">
      </form>
    </div>
    <div id="mainContent" class="small-6 small-centered columns">
      <h2 class='text-center'>Your Boards</h2>
      <hr>
      <% out.println(output); %>
    </div>

    <script>
      $(document).ready(function() { $("#boardName").select2(); });
    </script>
  </body>
</html>
