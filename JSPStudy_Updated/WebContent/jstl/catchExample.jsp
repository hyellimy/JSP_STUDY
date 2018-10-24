<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<c:catch var="ex">
<%= 100/0 %>
</c:catch>
${ex }예외가 발생하였습니다.
</body>
</html>