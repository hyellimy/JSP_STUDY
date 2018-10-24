package kr.or.kosta.jsp.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * 사용자 로그인 여부 체크 필터
 */
public class LoginCheckFilter implements Filter {
	
//	private String loginPage = "/user/login.jsp";
	private String loginPage;

    @Override
	public void init(FilterConfig filterConfig) throws ServletException {
    	loginPage = filterConfig.getInitParameter("loginPage");
	}
    //브라우저 실행 후 시작 
    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	System.out.println("[디버깅] : LoginCheckFiler 실행..");
		boolean isLogin = false;
		Cookie[] cookies = ((HttpServletRequest)request).getCookies();
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("loginId")) {
					isLogin = true;
					break;
				}
			}
		}
		//로그인 했을때, 
		if(isLogin) {
			chain.doFilter(request, response);
		//로그인 하지 않았을 때
		}else {
			if(loginPage == null) {
				throw new ServletException("LoginCheckFilter에 loginPage가 설정되어 있지 않습니다.");
			}
			//null이 아닐 경우, forward시켜준다. 
			request.setAttribute("uri", ((HttpServletRequest)request).getRequestURI());
			//화면을 켰을때, list_v2페이지는 로그인 후 이용가능합니다. 라는 페이지를 보여주기 위해 
			// ___ 페이지는 로그인해야 합니다. <- url를 request해서 포함시켜 준다. -> login.JSP확인하기
			request.getServletContext().getRequestDispatcher(loginPage).forward(request, response);
		}
	}
    
    @Override
	public void destroy() {}

}
