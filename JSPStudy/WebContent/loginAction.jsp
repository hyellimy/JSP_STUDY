<%@ page contentType="text/html; charset=utf-8" %>
<%
request.setCharacterEncoding("utf-8"); // post로 전달할때는 반드시 인코딩 처리 해주어야 한다. 
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String country = request.getParameter("country");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

<%=firstname %>
<%=lastname %>
<%=country %>


</body>
</html>