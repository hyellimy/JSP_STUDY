<%@ page contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8"); // post로 전달할때는 반드시 인코딩 처리 해주어야 한다. 
	String id = request.getParameter("userid");
	String pw = request.getParameter("passwd");

	//로그아웃
	if (id == null) {
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("loginId")) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					response.sendRedirect("Website.jsp");
				}
			}
		}

	// 로그인 
	} else {
		Cookie cookie = new Cookie("loginId", id);
		response.addCookie(cookie);
		response.sendRedirect("Website.jsp");
	}
%>

