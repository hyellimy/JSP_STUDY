<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>예외 처리</h2>

<%
try{
  String name = null;
  name.length();
}catch(NullPointerException e){
 %>
 <%=e.toString() %> 예외 발생하였습니다.
 <% 
}
%>

</body>
</html>