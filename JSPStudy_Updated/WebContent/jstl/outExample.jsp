<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String message = "JSTL <연습>입니다.";
request.setAttribute("message", message);
%>
<%--JSP표현식을 대체하여 변수의 값을 출력 시 사용 EL을 주로 사용 --%>
<%--
1. JSP표현식을 대체하여 변수 값을 출력
2. JSP 4개의 스코프 객체에 속성 설정 빈의 프로퍼티 설정시 사용
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

<c:out value="김기정"/><br>
${message }<br>
<c:out value="${message }" default="기본 메시지 입니다..."/><br>
<%--위의 두가지 태그의 차이점 

1. 꺽쇠가 있을 경우이 결과 창이 달라진다. 
2. EL은 있는 그대로 출력한다.
3. out 태그는 다 바꾸어 준다. 
4. out 태그 메시지 안에 오류 발생시, 디폴트 값을 지정해주어서 오류를 막아줄 수 있다. 

 --%>
</body>
</html>