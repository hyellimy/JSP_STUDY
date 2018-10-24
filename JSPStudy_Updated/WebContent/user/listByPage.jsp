<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="kr.or.kosta.jsp.common.web.Params"%>
<%@page import="kr.or.kosta.jsp.dao.User"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.jsp.dao.UserDao"%>
<%@page import="kr.or.kosta.jsp.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.jsp.dao.DaoFactory"%>

<%
request.setCharacterEncoding("utf-8");

// 페이지당 보여지는 목록수 설정
int listSize = 2;

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

//DaoFactory factory = new JdbcDaoFactory();
DaoFactory factory = (DaoFactory)application.getAttribute("daoFactory");
UserDao dao = factory.getUserDao();
//List<User> list = dao.listAll();
//List<User> list = dao.listByPage(Integer.parseInt(requestPage));
//List<User> list = dao.listByPage(Integer.parseInt(requestPage), listSize);
List<User> list = dao.listByPage(Integer.parseInt(requestPage), listSize, searchType, searchValue);

// 페이징 처리에 필요한 검색 개수 DB조회
int rowCount = dao.countBySearch(searchType, searchValue);

// 페이지 개수
int pageCount = (int)Math.ceil((double)rowCount / listSize);


// 페이지 목록의 시작페이지번호와 마지막페이지번호 계산
// 목록별 번호
int pageSize = 5;
int listNo = (Integer.parseInt(requestPage) - 1) / pageSize; // 목록 식별번호
//(1~10): 0, (11~20): 1, (21~30): 2, .....

int startPage = (listNo * pageSize) + 1;
int endPage = (listNo * pageSize) + pageSize;

if (endPage > pageCount){
  endPage = pageCount;
}
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
        <form method="post">
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
      <!-- <a href="#">&laquo;</a> -->
      
      <%
      for(int i=startPage; i<=endPage; i++){
        if(i == Integer.parseInt(requestPage)){
      %>
          <a class="active"><%=i %></a>
      <%          
        }else{
      %>
           <a href="?page=<%=i%>&searchType=<%=searchType %>&searchValue=<%=searchValue%>"><%=i %></a>
      <%          
        }
      }
      %>
      <!-- <a href="#">&raquo;</a> -->
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
