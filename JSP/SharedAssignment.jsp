<%@ page language="java" contentType="text/html" %>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*, MyNotes.utils.*" %>

<%--Global variables--%>
<%!
  public static TreeMap<String, ArrayList<String>> taskToUsers;
%>
<%
  String userName;
%>

<%--Redirect to the login page if the user is not logged in--%>
<%
if(session.getAttribute("login") == null) {
    response.sendRedirect("/MyNotes");
}
userName = (String) session.getAttribute("user");
%>

<%--Define how to render the tasks and users--%>
<%!
public static String renderTasksAndUsers() {
    String output = "";
    if (taskToUsers.size() == 0) {
        String error = "There are no users who share the same card";
        output += "<div data-alert class='alert-box warning radius'>" + error;
        output += "<a href='#' class='close'>&times;</a></div>";
        return output;
    }
    output += "<dl class='accordion' data-accordion data-options='one_up: false'>";
    for (Map.Entry<String, ArrayList<String>> entry : taskToUsers.entrySet()) {
        output += "<dd>";
        output += "<a href='#" + entry.getKey() + "'>" + entry.getKey() + "</a>";
        // output += "<a>" + entry.getKey() + "</a>";  // disables the accordion effect
        output += "<div id='" + entry.getKey() + "' class='content active'>";
        output += "<ul class='no-bullet'>";
        for (String user: entry.getValue()) {
            output += "<li>" + user+ "</li>";
        }
        output += "</ul>";
        output += "</div>";
        output += "</dd>";
    }
    output += "</dl>";
    return output;
}
%>

<%--Populate the task to users mapping--%>
<%
MySQLConnect mysql_connect = new MySQLConnect();
Connection m_conn = mysql_connect.getConnection();
Statement s = mysql_connect.getStatement();
try {
  
  // get all of the cards that have more than one user assigned
  String subQuery =
      "SELECT CreationID " +
      "FROM AssignedTo " +
      "GROUP BY CreationID " +
      "HAVING COUNT(CreationID) > 1";

  // get the tasks and usernames for cards with more than one user assigned
  ResultSet rs = s.executeQuery(
      "SELECT Task, UserName " +
      "FROM " +
          "(AssignedTo NATURAL JOIN MyNotesUser) " +
          "NATURAL JOIN Card " +
      "WHERE CreationID IN (" + subQuery + ") " +
      "ORDER BY Task, UserName"
  );

  // put all the tasks and usernames in a map
  taskToUsers = new TreeMap<String, ArrayList<String>>();
  while(rs.next()) {
      String task = rs.getString(1);
      String user = rs.getString(2);
      if (!taskToUsers.containsKey(task)) {
          taskToUsers.put(task, new ArrayList<String>());
      }
      taskToUsers.get(task).add(user);
  }

} catch(Exception e) {
  // error
  out.println(e);
  out.println("Error executing SQL Query.");
}
%>

<!doctype html>
<html>
  <head>
      <title>Shared Cards <%= "- logged in as " + userName%></title>
  </head>
  <body link=#f0f0ff alink vlink=#f0f0ff>
    <%@ include file="../header.jsp" %>
    <div id='mainContent' class='small-6 small-centered columns text-center'>
      <h4>Shared Cards</h4>
      <hr>
      <%= renderTasksAndUsers() %>
    </div>
  </body>
</html>
