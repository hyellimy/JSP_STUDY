<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>jsp가 제공하는 4개의 스코프(컨텍스트) 객체들...</h2>
<%
pageContext.setAttribute("message", "pageContext 스코프 객체입니다.");

request.setAttribute("message", "request 스코프 객체입니다.");
//application.getRequestDispatcher("/scopeObject2.jsp").forward(request, response);

session.setAttribute("message", "session 스코프 객체입니다.");
application.setAttribute("message", "application 스코프 객체입니다.");
%>

현재 페이지 정보 : <%=pageContext.getAttribute("message") %>

<%=pageContext.findAttribute("이름") %>



</body>
</html>




