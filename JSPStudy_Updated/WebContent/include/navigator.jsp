<%@ page contentType="text/html; charset=utf-8" %>

<div class="topnav">
  <a href="#">Link</a>
  <a href="#">Link</a>
  <a href="#">Link</a>
  <a href="<%=application.getContextPath() %>/user/listByPage-v2.jsp" style="float:right">회원목록(페이징)-v2</a>
  <a href="<%=application.getContextPath() %>/user/listByPage.jsp" style="float:right">회원목록(페이징)</a>
  <a href="<%=application.getContextPath() %>/user/list.jsp" style="float:right">회원목록</a>
  <a href="<%=application.getContextPath() %>/user/regist_form.jsp" style="float:right">회원가입</a>
</div>