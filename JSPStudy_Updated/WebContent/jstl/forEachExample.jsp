<%@page import="kr.or.kosta.jsp.dao.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--가상의 데이터를 만들고 forEach 문을 돌려 데이터 인출하기 --%>
<%
List<String> teams = new ArrayList();
teams.add("한화 이글즈");
teams.add("두산 베어즈");
teams.add("SK 와이번즈");
request.setAttribute("teams", teams);

List<User> users = new ArrayList<User>();
users.add(new User("bangry1","이혜림","1111","nina3355@naver.com","2018"));
users.add(new User("bangry2","이혜림","1111","nina3355@naver.com","2018"));
users.add(new User("bangry3","이혜림","1111","nina3355@naver.com","2018"));
users.add(new User("bangry4","이혜림","1111","nina3355@naver.com","2018"));
users.add(new User("bangry5","이혜림","1111","nina3355@naver.com","2018"));
request.setAttribute("users", users);
%>

<%--김기정 입니다. 10번 출력하는 forEach 태그 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<c:forEach var="i" begin="1" end="10">
${i } : 김기정 입니다.<br>
</c:forEach>

<%--구구단 만들기 테이블 --%>
<table border="3">
<c:forEach var="i" begin="2" end="9">
<tr>
  <c:forEach var="j" begin="1" end="9">
  <td>${i } * ${j } = ${i*j }</td>
  </c:forEach>
  </tr>
</c:forEach>
</table>

<%-- SELECT 팀이름 작성하기 --%>
<select>
  <c:forEach var="team" items="${teams }">
    <option>${team }</option>
  </c:forEach>
</select>

<%--User의 입럭 데이터 인출하기 --%>

<table border="1">
 <tr>
 <td>아이디</td>
 <td>이름</td>
 <td>비밀번호</td>
 <td>이메일</td>
 <td>가입일자</td>
 </tr>
 
 <c:choose>
 <c:when test="${not empty users}">
 <c:forEach var="user" items="${users }" varStatus="status">
 <tr>
 <td>${status.index} ${user.id }</td>
 <td>${user.name }</td>
 <td>${user.passwd }</td>
 <td>${user.email }</td>
 <td>${user.regdate }</td>
 </tr>
</c:forEach>
 </c:when>
 <c:otherwise>
 <tr>
 <td colspan="5">회원이 존재하지 않습니다.</td>
 </tr>
 </c:otherwise>
 </c:choose>
</table>

<%
String ssn = "940308-1111111";
request.setAttribute("ssn", ssn);
%>

<c:forTokens var="token" items="${ssn }" delims="-">
${token },
</c:forTokens>
</body>
</html>