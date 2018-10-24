<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>jsp가 제공하는 9개의 디폴트 객체들...</h2>
<%
String id = request.getParameter("id");
//response.sendRedirect("hello.jsp");
out.println("출력이요..");
%>

아이디 : <%=id %><br>
WAS에 등록된 웹애플리케이션 이름 : <%=application.getContextPath() %><br>
WAS 정보 : <%=application.getServerInfo() %><br>
location : <%= config.getInitParameter("location")%>
현재 페이지 : <%=this %><br>
현재 페이지 : <%=page %>
<%-- 예외 : <%=exception %> --%>

</body>
</html>




