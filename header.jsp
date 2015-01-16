<link type="text/css" rel="stylesheet" href="//cdn.jsdelivr.net/foundation/5.0.2/css/foundation.min.css" />
<style>
html {
    background-color: #eee;
    height: 100%;
}

body {
    width: 80%;
    min-height: 100%;
    margin: auto;
    padding-bottom: 2em;
    background-color: #f9f9f9;
    word-wrap: break-word;
}

#mainContent {
    margin-top: 20px;
}
</style>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/foundation/5.0.2/js/foundation/foundation.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/foundation/5.0.2/js/foundation/foundation.topbar.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/foundation/5.0.2/js/foundation/foundation.alert.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/foundation/5.0.2/js/foundation/foundation.accordion.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/foundation/5.0.2/js/foundation/foundation.magellan.js"></script>
<link type="text/css" rel="stylesheet" href="//cdn.jsdelivr.net/select2/3.4.5/select2.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/select2/3.4.5/select2.min.js"></script>
<script>
  window.onload = function() {
    $(document).foundation();
  };
</script>

<div class="contain-to-grid">
  <nav class="top-bar" data-topbar>
    <ul class="title-area">
      <li class="name">
      <h1><a href="/">MyNotes <small>A UA Project Management Program</small></a></h1>
      </li>
    </ul>
    <section class="top-bar-section">
      <ul class="right">
        <li class="divider featuresNav"></li>
        <li class="featuresNav">
          <a href="/JSP/Features.jsp">Features</a>
        </li>
        <li class="divider mainMenuNav"></li>
        <li class="mainMenuNav has-dropdown">
          <a href="/LoginServlet?MainMenu=Main+Menu">Main Menu</a>
          <ul class="dropdown">
            <li><a href="/AddCard">Add a Card</a></li>
            <li><a href="/FindBoards">Find Boards</a></li>
            <li><a href="/JSP/SharedAssignment.jsp">Shared Cards</a></li>
            <li><a href="/JSP/AddBoard.jsp">Add Board</a></li>
            <li><a href="/JSP/Subscribe.jsp">Subscribe to a Board</a></li>
          </ul>
        </li>
        <li class="divider logoutNav"></li>
        <li class="logoutNav">
          <a href="/LoginServlet?logoutMyNotes=Logout">Logout</a>
        </li>
      </ul>
    </section>
  </nav>
</div>
