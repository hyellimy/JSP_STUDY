<%@page contentType="text/html; charset=utf-8" %>
<%@page import="kr.or.kosta.jsp.dao.User"%>
<%@page import="kr.or.kosta.jsp.dao.UserDao"%>
<%@page import="kr.or.kosta.jsp.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.jsp.dao.DaoFactory"%>

<%
String id = request.getParameter("id");
String pageNum = request.getParameter("page");
if(pageNum == null) pageNum = "1";

//DaoFactory factory = new JdbcDaoFactory();
DaoFactory factory = (DaoFactory)application.getAttribute("daoFactory");
UserDao dao = factory.getUserDao();
User user = dao.read(id);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/css/basic.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
    <div class="w3-content">
    <div class="w3-container" id="contact">
      <h2>회원 상세 정보</h2>
        <%
        if(user != null){
        %>
          <p>
            <input class="w3-input w3-padding-16 w3-border" type="text" readonly name="id" value="<%=user.getId()%>">
          </p>
          <p>
            <input class="w3-input w3-padding-16 w3-border" type="text" readonly name="name" value="<%=user.getName()%>">
          </p>
          <p>
            <input class="w3-input w3-padding-16 w3-border" type="text" readonly name="email" value="<%=user.getEmail()%>">
          </p>
          <p>
            <input class="w3-input w3-padding-16 w3-border" type="text" readonly name="regdate" value="<%=user.getRegdate()%>">
          </p>
        <%          
        }else{
        %>
          <p>존재하지 않는 사용자입니다.</p>
        <% 
        }
        %>
        
        
        <p>
          <input type="button" class="w3-button w3-red w3-padding-large" value="목록으로" onclick="location.href='listByPage-v2.jsp?page=<%=pageNum%>'">
        </p>
        
    </div>
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
