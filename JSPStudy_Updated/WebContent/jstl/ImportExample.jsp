<%@page import="kr.or.kosta.jsp.dao.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<%-- <c:import url="http://www.naver.com" ></c:import>--%>
<c:import url="https://www.naver.com" var="output"></c:import>

안녕안녕 여기에 임시저장해놓았어! 
<%-->${output } --%>
<c:out value="${output }"></c:out>

</body>
</html>