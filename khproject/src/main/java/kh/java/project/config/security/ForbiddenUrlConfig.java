package kh.java.project.config.security;

import org.springframework.security.core.Authentication;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;

public class ForbiddenUrlConfig implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
//        Principal userPrincipal = request.getUserPrincipal();
        if(request.getHeader("referer") == null) {
            response.sendRedirect("/?error=300");
            return;
        }
        chain.doFilter(request, response);
    }
}