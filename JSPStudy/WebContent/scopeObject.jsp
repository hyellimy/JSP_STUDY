<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>JSP가 제공하는 4개의 스코프(Context) 객체</h2>
<%
pageContext.setAttribute("message", "pageContext스코프 객체 입니다.");
request.setAttribute("message", " request 스코프 객체 입니다.");
//application.getRequestDispatcher("/scopeObject2.jsp").forward(request, response);

session.setAttribute("message", "Session 스코프 객체 입니다. scopeObject2에서 읽을 수 있습니다.");
application.setAttribute("message", "application 스코프 객체 입니다. scopeObject2에서 읽을 수 있습니다.");


%>

현재 페이지 정보 : <%=pageContext.getAttribute("message")%>

<%--광범위하게 검색되는 메서드 --%>
<%=pageContext.findAttribute("이름") %>
</body>
</html>