<%@page contentType="text/html; charset=utf-8" %>
<%@page import="kr.or.kosta.jsp.dao.DaoFactory"%>
<%@page import="kr.or.kosta.jsp.common.web.PageBuilder"%>
<%@page import="kr.or.kosta.jsp.common.web.Params"%>
<%@page import="kr.or.kosta.jsp.dao.User"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.jsp.dao.UserDao"%>
<%@page import="kr.or.kosta.jsp.dao.JdbcDaoFactory"%>

<%
String loginId = null;
// 회원인증 여부 체크
Cookie[] cookies = request.getCookies();
if(cookies != null) {
  for (Cookie cookie : cookies) {
    if(cookie.getName().equals("loginId")) {
      loginId = cookie.getValue();
      break;
    }
  }
}

if(loginId == null){
%>
<script>
alert("로그인 사용자에게만 제공되는 서비스입니다.");
history.back();
</script>
<%
}
%>

<%
// 페이지당 보여지는 목록수 설정
int listSize = 10;
//페이지당 보여지는 페이지수 설정
int pageSize = 10;

// 선택페이지 수신
String requestPage = request.getParameter("page");
if(requestPage == null || requestPage.equals("")){
  requestPage = "1";
}

// 검색 요청일 경우 파라메터 수신
String searchType = request.getParameter("searchType");
String searchValue = request.getParameter("searchValue");
if(searchType == null || searchType.equals("")){
  searchType = null;
  searchValue = null;
}

// 요청파라메터 포장
Params params = new Params(Integer.parseInt(requestPage), listSize, pageSize, searchType, searchValue);

//DaoFactory factory = new JdbcDaoFactory();
DaoFactory factory = (DaoFactory)application.getAttribute("daoFactory"); //어플리케이션 등록을 통해 더 쉽게 활용 가능하다. 
UserDao dao = factory.getUserDao();
List<User> list = dao.listByPage(params);

// 페이징 처리에 필요한 검색 개수 DB조회
int rowCount = dao.countBySearch(params);

// PageBuilder를 이용하여 페이징 계산
PageBuilder pageBuilder = new PageBuilder(params, rowCount);
pageBuilder.build();
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
        <h3>회원 목록(총 <%=rowCount %>명)</h3>
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
                <%--<td><%=(i+1) %></td> --%>
                <td><%=(rowCount - listSize * (params.getPage()-1) ) - i %></td>
                <td><%=user.getId() %></td>
                <td><a href="read.jsp?id=<%=user.getId()%>&page=<%=params.getPage()%>"><%=user.getName() %></a></td>
                <td><a href="mailto:<%=user.getEmail()%>"><%=user.getEmail() %></a></td>
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
      <%
      if(pageBuilder.isShowFirst()){
      %>
        <a href="<%=pageBuilder.getQueryString(1)%>">처음으로</a>      
      <%        
      }
      %>
      
      <%
      if(pageBuilder.isShowPrevious()){
      %>
        <a href="<%=pageBuilder.getQueryString(pageBuilder.getPreviousStartPage())%>">&laquo;</a>      
      <%        
      }
      %>
      
      <%
      for(int i=pageBuilder.getStartPage(); i<=pageBuilder.getEndPage(); i++){
        if(i == params.getPage()){
      %>
          <a class="active"><%=i %></a>
      <%          
        }else{
      %>
           <a href="<%=pageBuilder.getQueryString(i)%>"><%=i %></a>
      <%          
        }
      }
      %>
      
      <%
      if(pageBuilder.isShowNext()){
      %>
        <a href="<%=pageBuilder.getQueryString(pageBuilder.getNextStartPage())%>">&raquo;</a>      
      <%        
      }
      %>
      <%
      if(pageBuilder.isShowLast()){
      %>
        <a href="<%=pageBuilder.getQueryString(pageBuilder.getPageCount())%>">끝으로</a>      
      <%        
      }
      %>
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
