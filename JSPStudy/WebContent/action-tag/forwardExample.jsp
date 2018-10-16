<%@ page contentType="text/html; charset=utf-8" %>

<%
int age = 40;
%>
<jsp:forward page="/Hello.jsp">
  <jsp:param value="hyerim" name="name"/>
  <jsp:param value="<%=age %>" name="age"/>
</jsp:forward>

<%
 //request.setAttribute("name", "value");
 //application.getRequestDispatcher("/hello.jsp?id=bangry").forward(request, response);
%>