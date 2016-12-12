package edu.hziee.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginFilter implements Filter {

    public LoginFilter() {
    	
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest req, ServletResponse res, 
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		HttpSession session = request.getSession();
		
		String loginUrl = request.getContextPath() + "/login";
		String registerUrl = request.getContextPath() + "/login/register";
		boolean loginRequest = request.getRequestURI().equals(loginUrl);
		boolean resourceRequest = request.getRequestURI().
				startsWith(request.getContextPath() + "/resources" + "/");
		boolean loggedIn = (session != null ) 
				&& (session.getAttribute("username") != null);
		boolean registerRequest = request.getRequestURI().equals(registerUrl);
		if(loggedIn || loginRequest || resourceRequest || registerRequest){
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setDateHeader("Expires", 0);
		}else{
			String returnUrl = request.getRequestURI();
			response.sendRedirect(loginUrl + "?returnUrl="+returnUrl);
			System.out.println(returnUrl);
		}
		chain.doFilter( request, response );
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
