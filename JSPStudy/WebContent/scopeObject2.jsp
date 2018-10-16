<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>JSP가 제공하는 4개의 스코프(Context) 객체</h2>

현재 페이지 정보 : <%=pageContext.getAttribute("message")%>

<%--scopeObject공유 : request로 저장 후 Foward --%>
request 정보 : <%=request.getAttribute("message") %>
session 정보 : <%=session.getAttribute("message") %>
application 정보 : <%=application.getAttribute("message") %>
</body>
</html>