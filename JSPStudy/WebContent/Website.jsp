<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<meta charset="utf-8">
<title></title><%@ page contentType="text/html; charset=utf-8"%>
</head>
<body>
  <%
  	String loginId = null;
  	Cookie[] cookies = request.getCookies();
  	if (cookies != null) {
  		for (Cookie cookie : cookies) {
  			System.out.println("get쿠키 확인을 위한 디버깅 : " + cookie.getName() + ":" + cookie.getValue());
  			if (cookie.getName().equals("loginId")) {
  				loginId = cookie.getValue();
  				break;

  			}
  		}
  	}
  %>
  <div class="header">
    <h1>My Website</h1>
    <p>Resize the browser window to see the effect.</p>
  </div>

  <div class="topnav">
    <a href="#">Link</a> <a href="#">Link</a> <a href="#">Link</a> <a
      href="#" style="float: right">Link</a>
  </div>

  <div class="row">
    <div class="leftcolumn">
      <div class="card">
        <h2>TITLE HEADING</h2>
        <h5>Title description, Dec 7, 2017</h5>
        <div class="fakeimg" style="height: 200px;">Image</div>
        <p>Some text..</p>
        <p>Sunt in culpa qui officia deserunt mollit anim id est
          laborum consectetur adipiscing elit, sed do eiusmod tempor
          incididunt ut labore et dolore magna aliqua. Ut enim ad minim
          veniam, quis nostrud exercitation ullamco.</p>
      </div>
      <div class="card">
        <h2>TITLE HEADING</h2>
        <h5>Title description, Sep 2, 2017</h5>
        <div class="fakeimg" style="height: 200px;">Image</div>
        <p>Some text..</p>
        <p>Sunt in culpa qui officia deserunt mollit anim id est
          laborum consectetur adipiscing elit, sed do eiusmod tempor
          incididunt ut labore et dolore magna aliqua. Ut enim ad minim
          veniam, quis nostrud exercitation ullamco.</p>
      </div>
    </div>

    <div class="rightcolumn">
      <div class="card">
        <div>

          <%
          	if (loginId == null || loginId.length() == 0) {
          %>
          <form action="WebsiteAction.jsp" method="post"
            enctype="application/x-www-form-urlencoded">
            <input type="text" id="userid" name="userid"
              placeholder="Identifier..."> <input
              type="password" id="userpw" name="userpw"
              placeholder="Password..."> <input type="submit"
              value="Login">
          </form>

          <%
          	} else {
          %>
          <p>
            <%=loginId%>
            님 환영합니다.
          </p>
          <form action="WebsiteAction.jsp" method="post"
            enctype="application/x-www-form-urlencoded">
            <button onclick="location.href='WebsiteAction.jsp'">Logout</button>
            <%
            	}
            %>
          </form>
        </div>

      </div>

      <div class="card">
        <h3>Popular Post</h3>
        <div class="fakeimg">
          <p>Image</p>
        </div>
        <div class="fakeimg">
          <p>Image</p>
        </div>
        <div class="fakeimg">
          <p>Image</p>
        </div>
      </div>
      <div class="card">
        <h3>Follow Me</h3>
        <p>Some text..</p>
      </div>
    </div>
  </div>

  <div class="footer">
    <h2>Footer</h2>
  </div>

</body>
</html>

</head>
<body>

</body>
</html>