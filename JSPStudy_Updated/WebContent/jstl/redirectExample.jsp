<%@page import="kr.or.kosta.jsp.dao.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- c:param 태그 --%>
<%-- import, url, redirect 태그에서 파라미터 설정할 때 사용하는 태그 --%>

<%--
<c:redirect url="https://www.daum.net">
 --%>

<%--
<c:redirect url="https://www.daum.net">
  <c:param name="name" value="bangry"/>
</c:redirect>
 --%>

<c:redirect url="/user/login.jsp" context="/JSPStudy_Updated"></c:redirect>
