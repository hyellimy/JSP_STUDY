<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>jsp가 제공하는 4개의 스코프(컨텍스트) 객체들...</h2>

현재 페이지 정보 : <%=pageContext.getAttribute("message") %>
request 정보 : <%=request.getAttribute("message") %>
session 정보 : <%=session.getAttribute("message") %>
application 정보 : <%=application.getAttribute("message") %>

</body>
</html>




