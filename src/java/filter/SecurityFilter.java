/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserAccount;
import servlets.AppUtils;

/**
 *
 * @author Asus
 */
@WebFilter("/*")
public class SecurityFilter implements Filter{

    public SecurityFilter() {
    }

    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
    
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        
        String servletPath = request.getServletPath();
        
        //Thong tin nguoi dung chua trong session
        //Sau khi da dang nhap thanh cong
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        
        if (servletPath.equals("/login")) {
            chain.doFilter(request, response);
            return;
        }
        
        HttpServletRequest wrapRequest = request;
        
        if (loginedUser != null) {
            // User Name
            String userName = loginedUser.getUserName();
 
            // Roles
            List<String> roles = loginedUser.getRoles();
 
            // Wrap old request by a new Request with userName and Roles information.
            wrapRequest = new UserRoleRequestWrapper(userName, roles, request);
        }
        
        // Pages must be signed in.
        if (SecurityUtils.isSecurityPage(request)) {
            // If the user is not logged in,
            // Redirect to the login page.
            if (loginedUser == null) {
 
                String requestUri = request.getRequestURI();
 
                // Store the current page to redirect to after successful login.
                int redirectId = AppUtils.storeRedirectAfterLoginUrl(request.getSession(), requestUri);
 
                response.sendRedirect(wrapRequest.getContextPath() + "/login?redirectId=" + redirectId);
                return;
            }
            
            // Check if the user has a valid role?
            boolean hasPermission = SecurityUtils.hasPermission(wrapRequest);
            if (!hasPermission) {
 
                RequestDispatcher dispatcher
                        = request.getServletContext().getRequestDispatcher("/WEB-INF/views/accessDenied.jsp");
 
                dispatcher.forward(request, response);
                return;
            }
        }
 
        chain.doFilter(wrapRequest, response);
    }
    
    
}
