<%@page import="kr.or.kosta.jsp.dao.JdbcDaoFactory2"%>
<%@page import="kr.or.kosta.jsp.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%--이 아래 메서드는 지워도 도 된다. : servletContext가 역할 대신 수행--%>
<%--
<%!
public void jspInit(){
  DaoFactory daoFactory = new JdbcDaoFactory2();
  getServletContext().setAttribute("daoFactory", daoFactory);
}
 %> --%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/css/basic.css">
</head>
<body>

<div class="header">
  <h1>My Website</h1>
  <p>Resize the browser window to see the effect.</p>
</div>

<%-- 탑메뉴 시작 --%>
<jsp:include page="/include/navigator.jsp"/>
<%-- 탑메뉴 종료 --%>

<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <h2>TITLE HEADING</h2>
      <h5>Title description, Dec 7, 2017</h5>
      <div class="fakeimg" style="height:200px;">Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
    <div class="card">
      <h2>TITLE HEADING</h2>
      <h5>Title description, Sep 2, 2017</h5>
      <div class="fakeimg" style="height:200px;">Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
  
  <%-- 사이드메뉴 시작 --%>
  <jsp:include page="/include/aside.jsp"/>
  <%-- 사이드메뉴 종료 --%>
  
</div>

<%-- footer 시작 --%>
<jsp:include page="/include/footer.jsp"/>
<%-- footer 종료 --%>


</body>
</html>
