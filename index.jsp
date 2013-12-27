<%@ page language="java" contentType="text/html" %>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*, MyNotes.utils.*" %>


<!doctype html>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html">
    <title>My Notes</title>
    <% if(session.getAttribute("login") == null) { %>
    <style>
    .mainMenuNav, .logoutNav {
        display: none;
    }
    </style>
    <% } %>
  </head>
  <body>
    <%@ include file="header.jsp" %>

    <div id="mainContent" class="small-6 small-centered columns">
      <h2 class='text-center'>Login</h2>
      <hr>

      <%
        if(request.getParameter("error") != null) {
            out.println("<div data-alert class='alert-box warning radius'>" + request.getParameter("error"));
            out.println("<a href='#' class='close'>&times;</a></div>");
        }
      %>

      <% if(session.getAttribute("login") == null) { %>
      <form name="login" action="LoginServlet" method="get">
        <label>Email
          <input tabindex="1" type="email" name="email" required>
        </label>
        <label>User Name
          <input tabindex="2" type="text" name="username" required>
        </label>
        <input tabindex="3" class="button small radius" type="submit" name="login" value="Login">
      </form>

      <% } else { %>
        <div data-alert class='alert-box radius'>Welcome back, <% out.println((String) session.getAttribute("user")); %>
        <a href='#' class='close'>&times;</a></div>
      <% } %>
      <form name="addUser" action="AddProfileInformation" method="get">
        <input tabindex="4" class="button tiny radius secondary" type="submit" name="addProfileInformation" value="Add Profile Information to MyNotes">
      </form>

    </div>
  </body>
</html>
