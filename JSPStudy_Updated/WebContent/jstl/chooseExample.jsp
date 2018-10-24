<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="score" value="85" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<c:choose>
  <c:when test="${score >=90 }">수</c:when>
    <c:when test="${score >=80 }">우</c:when>
    <c:when test="${score >=70 }">미</c:when>
    <c:when test="${score >=60 }">양</c:when>
  <c:otherwise>가</c:otherwise>
</c:choose>
</body>
</html>