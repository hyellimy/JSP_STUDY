<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>EL 디폴트 객체 (11개)</title>
</head>
<body>
<br>
${pageScope }
--------------------------------------페이지스코프<br>
${requestScope }
-------------------------------------리퀘스트 스코프<br>
${SessionScope }
-------------------------------------세션스코프<br>
<%--${applicationScope } --%>
-------------------------------------<br>
${param.name }, ${param["name"] }
-------------------------------------파람.네임<br>
${paramValues.hobby[0] }, ${paramValues.hobby[1] }
-------------------------------------파람벨류.하비<br>
${header["user-agent"]}
--------------------------------------헤더.유저에이전트<br>
${headerValues["user-agent"]}
--------------------------------------헤더벨류.유저에이전트<br>
${param["name"] }
--------------------------------------쿠키<br>
쿠키 : ${cookie.loginId.name }, ${cookie.loginId.value }
--------------------------------------<br>
${pageContext.request.method }
<%--
<%request.getMethod() %>
 --%>
</body>
</html>