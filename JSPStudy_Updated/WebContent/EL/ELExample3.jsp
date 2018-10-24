<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%--<%@page isELIgnored="true" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>EL 디폴트 객체 (11개)</title>
</head>
<body>
<%
// 테스트를 위한 Scope객체에 데이터 저장
String today = String.format("%1$tF %1$tT", Calendar.getInstance());
request.setAttribute("today", today);

session.setAttribute("id", "bangry");

String[] names = {"김기정", "박기정", "최기정"}; //얘는 단지 지역변수 일 뿐이다. Scope객체에 접근방법 
%>

<%--날짜 호출을 위한 두가지 방법 --%>
<%=request.getAttribute("today") %>
${requestScope.today}<br>
${today}<br>


<%--아이디 호출을 위한 두가지 방법 --%>
<%=pageContext.findAttribute("id") %>
${id}<br>

<%--배열 생성 후 접근 : 접근 불가능하다!!!!!.  --%>
${names[0]}, ${names[1]}, ${names[2]}<br>

<%--jsp usebean태그로 user/ dog java 접근 --%>
<jsp:useBean id="dog" class="kr.or.kosta.jsp.el.Dog" scope="page"/>
<jsp:setProperty property="name" name="dog" value="강아지루니루니"/>

<jsp:useBean id="student" class="kr.or.kosta.jsp.el.Student" scope="page"/>
<jsp:setProperty property="name" name="student" value="학생이름이혜림"/>
<jsp:setProperty property="dog" name="student" value="${dog}"/>


<%--
<jsp:getProperty property="id" name="student"/>
<jsp:getProperty property="name" name="student"/>
<jsp:getProperty property="dog" name="student"/>
--%>

<%--dog객체의 toString 으로출력된다. 결과 : Dog [name=강아지루니루니] --%>
<jsp:getProperty property="dog" name="student"/><br>
학생이름 : 
${student.name }<br>
강아지 이름 : 
${student.dog.name }<br>
<%--
${student.id},
${student.name}, 
${student.dog.name}<br>
 --%>

</body>


</body>
</html>