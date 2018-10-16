<%@ page import="kr.or.kosta.jsp.Account" %>
<%@ page contentType="text/html; charset=utf-8" %>


<%
//Account account = new Account("1111-2222", "김기정", 1111, 5000); //정적생성
//Class.forName("kr.or.kosta.jsp.Account").newInstance(); //동적생성


%>

<jsp:useBean id="account" class="kr.or.kosta.jsp.Account" scope="session"/>
<jsp:setProperty name="account" property="accountNum" value="1111-2222"/>
<jsp:setProperty name="account" property="accountOwner" value="김기정"/>
<jsp:setProperty name="account" property="passwd" value="1111"/>
<jsp:setProperty name="account" property="restMoney" value="5000"/>

<%--<jsp:forward page="/action-tag/useBeanExample2.jsp"/> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
예금주명 : <%=account.getAccountOwner()%><br>
계좌번호 : <%=account.getAccountNum()%><br>
비밀번호 : <%=account.getPasswd()%><br>
잔액 : <%=account.getRestMoney()%><br>

계좌번호 : <jsp:getProperty property="accountNum" name="account"/><br>
예금주명 : <jsp:getProperty property="accountOwner" name="account"/><br>
비밀번호 : <jsp:getProperty property="passwd" name="account"/><br>
잔액 : <jsp:getProperty property="restMoney" name="account"/><br>
</body>
</html>