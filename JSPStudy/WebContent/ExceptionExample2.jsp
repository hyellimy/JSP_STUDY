<%@ page contentType="text/html; charset=utf-8" %>
<%-- <%@ page errorPage="errorHandlingPage.jsp" %> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>예외 처리2 - 에러 처리 페이지가 필요하다. </h2>

<%
  String name = null;
  name.length();
  out.println(10/0);
 %>

</body>
</html>