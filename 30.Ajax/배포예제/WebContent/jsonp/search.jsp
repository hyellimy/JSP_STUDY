<%@ page contentType="application/javascript; charset=utf-8" %>

<%
request.setCharacterEncoding("utf-8");

String callBack = request.getParameter("callback");
String name = request.getParameter("name");
System.out.println("수신이름: " + name);

// DB 처리 생략

// simple json 라이브러리 활용
String jsonList = "['사과', '자두', '딸기']";

out.println(callBack +"("+jsonList+")");
%>
