<%@page import="kr.or.kosta.jsp.dao.User"%>
<%@page import="kr.or.kosta.jsp.dao.UserDao"%>
<%@page import="kr.or.kosta.jsp.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.jsp.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=utf-8" %>

<%
//request.setCharacterEncoding("utf-8");
String id = request.getParameter("userid");
String pw = request.getParameter("userpw");
if(id == null || pw == null){
  return; 
}

//UserDao를 이용한 회원 가입여부 체크
//DaoFactory factory = new JdbcDaoFactory();
DaoFactory factory = (DaoFactory)application.getAttribute("daoFactory");
UserDao dao = factory.getUserDao();
User user = dao.certify(id, pw);
if(user != null){
	Cookie cookie = new Cookie("loginId", user.getId());
	cookie.setPath("/");
	response.addCookie(cookie);
	response.sendRedirect(application.getContextPath()+"/index.jsp");
}else{
%>
<script>
alert("회원이 아닌가벼....");
history.back();
</script>

<%  
}
%>







