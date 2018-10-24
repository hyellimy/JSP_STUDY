<%@page import="kr.or.kosta.jsp.dao.User"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.jsp.dao.UserDao"%>
<%@page import="kr.or.kosta.jsp.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.jsp.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=utf-8" %>

<%
//DaoFactory factory = new JdbcDaoFactory();
DaoFactory factory = (DaoFactory)application.getAttribute("daoFactory");
UserDao dao = factory.getUserDao();
List<User> list = dao.listAll();
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/css/basic.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/css/pagination.css">
</head>
<body>

<div class="header">
  <h1>My Website</h1>
  <p>Resize the browser window to see the effect.</p>
</div>

<%-- 탑메뉴 시작 --%>
<jsp:include page="/include/navigator.jsp"/>
<%-- 탑메뉴 종료 --%>

<div class="row">
  
  <div class="leftcolumn">
    
    <div class="w3-container">
      
      <div class="w3-center">
        <h3>회원 목록(총 <%=list.size() %>명)</h3>
      </div>
      
       <%-- 검색 폼 --%>
      <div class="search">
        <form>
          <select name="searchType">
            <option value="">전체</option>
            <option value="id">아이디</option>
            <option value="name">이름</option>
          </select>
          <input type="text" name="searchValue" placeholder="Search..">
          <input type="submit" value="검색">
        </form>
      </div>
    
      <div class="w3-responsive w3-card-4">
        <table class="w3-table w3-striped w3-bordered">
          <thead>
            <tr class="w3-theme">
              <th>번호</th>
              <th>아이디</th>
              <th>이름</th>
              <th>이메일</th>
              <th>가입일자</th>
            </tr>
          </thead>
          <tbody>
            <%
            for(int i=0; i<list.size(); i++){
              User user = list.get(i);
            %>
               <tr class="<%= (i%2)== 0 ? "w3-white" : "" %>">
                <td><%=(i+1) %></td>
                <td><%=user.getId() %></td>
                <td><%=user.getName() %></td>
                <td><%=user.getEmail() %></td>
                <td><%=user.getRegdate() %></td>
              </tr>
            <%
            }
            %>
          </tbody>
        </table>
      </div>
    </div>
    
    <%-- 페이징 처리 --%>
    <div class="pagination">
      <a href="#">&laquo;</a>
      <a href="#">1</a>
      <a class="active" href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a href="#">6</a>
      <a href="#">7</a>
      <a href="#">8</a>
      <a href="#">9</a>
      <a href="#">10</a>
      <a href="#">&raquo;</a>
    </div>
  </div>
  
  <%-- 사이드메뉴 시작 --%>
  <jsp:include page="/include/aside.jsp"/>
  <%-- 사이드메뉴 종료 --%>
  
</div>

<%-- footer 시작 --%>
<jsp:include page="/include/footer.jsp"/>
<%-- footer 종료 --%>


</body>
</html>
