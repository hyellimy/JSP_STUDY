<%@ page contentType="text/plain; charset=utf-8" %>
<%@ page import="java.util.Random"%>

<%
// DB 처리는 편의상 생략
Random ramdom = new Random();
// 영화 인기순위 출력(응답데이터로 CSV 출력)
for(int i=0; i<10; i++){
	out.print((i+1)+"위 : 영화제목("+ramdom.nextInt(500)+")입니다");	
	out.print(",");	
}
%>