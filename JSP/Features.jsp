<%@ page language="java" contentType="text/html" %>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*, MyNotes.utils.*" %>

<!doctype html>
<html>
  <head>
    <title>Features of MyNotes</title>
    <style>
    .featuresNav {
        display: none;
    }
    </style>
  </head>
  <body>
    <%@ include file="../header.jsp" %>

    <div id="mainContent" class="small-8 small-centered columns">
      <h2 class='text-center'>Features of MyNotes</h2>
      <hr>

      <div class="panel callout">
      This page details some of the extra features that we've implemented for the MyNotes program.
      </div>

      <div data-magellan-expedition="fixed">
        <ul class="sub-nav">
          <li class="active" data-magellan-arrival="style"><a href="#style">Style</a></li>
          <li data-magellan-arrival="validation"><a href="#validation">Validation</a></li>
          <li data-magellan-arrival="forms"><a href="#forms">Improved Forms</a></li>
          <li data-magellan-arrival="logout"><a href="#logout">Working Logout</a></li>
          <li data-magellan-arrival="addBoard"><a href="#addBoard">Add Board</a></li>
          <li data-magellan-arrival="subscribe"><a href="#subscribe">Add Subscription</a></li>
          <li data-magellan-arrival="title"><a href="#title">Show Username</a></li>
          <li data-magellan-arrival="header"><a href="#header">Persistent Header</a></li>
          <li data-magellan-arrival="autocomplete"><a href="#autocomplete">Board Name Autocomplete</a></li>
          <li data-magellan-arrival="features"><a href="#features">Features Page</a></li>
        </ul>
      </div>

      <h3 id="style" data-magellan-destination="style">Style</h3>
      <p>
      The whole site has been styled using the
      <a href="http://foundation.zurb.com">Foundation</a> framework.
      </p>

      <h3 id="validation" data-magellan-destination="validation">Client-side Validation</h3>
      <p>
      Basic validation is done client-side when possible (as well as
      server-side). An example of this is on the
      <a href="/MyNotes/AddProfileInformation">Add Profile Information</a> page
      where the email field helps ensure that a valid email address is entered.
      </p>

      <h3 id="forms" data-magellan-destination="forms">Improved Forms</h3>
      <p>
      All of the forms have been updated to use the most appropriate HTML input
      types. A good example of this is on the
      <a href="/MyNotes/AddCard">Add Card</a> page. The Description field is
      now a textarea to allow easier multi-line input. Date is a date input
      type which displays a gui datepicker on supporting browsers like Chrome.
      This validates the user's date input and makes it quicker and easier to enter.
      </p>

      <h3 id="logout" data-magellan-destination="logout">Working Logout</h3>
      <p>
      We've made it possible to
      <a href="/MyNotes/LoginServlet?logoutMyNotes=Logout">logout</a> of the
      system, removing the user's credentials from the session.  Trying to
      access any vital page while not logged in will redirect the user back to
      the login screen.
      </p>

      <h3 id="addBoard" data-magellan-destination="addBoard">Add Board</h3>
      <p>
      We've made it possible to
      <a href="/MyNotes/JSP/AddBoard.jsp">add a board</a> to the system. It
      handles various error situations such as not being logged in, trying to
      insert a board with an empty name, or trying to insert a board that
      already exists.
      </p>

      <h3 id="subscribe" data-magellan-destination="subscribe">Subscribe to a Board</h3>
      <p>
      We've made it possible to
      <a href="/MyNotes/JSP/Subscribe.jsp">subscribe to a board</a>. The page
      also lists all of the boards that the current user is subscribed to. It
      handles error situations like trying to subscribe to a board that doesn't
      exist or to one that is already subscribed to.
      </p>

      <h3 id="title" data-magellan-destination="title">Show user name in title</h3>
      <p>
      Take a look at the title of various pages (such as the
      <a href="/MyNotes/LoginServlet?MainMenu=Main+Menu">main menu</a>) to see
      the name of the current user. The login page is also smart enough to
      determine if a user is already logged in and will display a greeting if
      they are.
      </p>

      <h3 id="header" data-magellan-destination="header">Persistent header and navigation</h3>
      <p>
      There is a consistent header across all pages that includes navigation
      links and a logout button.  The code for the header was modularized and
      put into a <code>header.jsp</code> file that is included in every page.
      This allows for a consistent look between pages, extremely easy
      navigation, and makes changes easier to implement. The site title can be
      clicked to return to the login page. Irrelevant buttons are hidden on
      certain pages, such as the logout button on the login page when the user
      is not logged in.
      </p>

      <h3 id="autocomplete" data-magellan-destination="autocomplete">Board Name Autocomplete</h3>
      <p>
      The Board Name inputs on <a href='/MyNotes/AddCard'>Add Card</a> and
      <a href='/MyNotes/JSP/Subscribe.jsp'>Subscribe</a> feature
      auto-completing selection dropdowns. The one on
      <a href='/MyNotes/JSP/Subscribe.jsp'>Subscribe</a> only shows the boards
      that the user is not already subscribed to.
      </p>

      <h3 id="features" data-magellan-destination="features">Features Page</h3>
      <p>
      This very page is included to help graders find the extra features that
      we've implemented.
      </p>
    </div>
  </body>
</html>
