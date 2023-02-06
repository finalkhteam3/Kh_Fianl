package kh.java.project.config.security;

import kh.java.project.member.entity.Authorities;
import kh.java.project.member.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;
@NoArgsConstructor
@AllArgsConstructor
public class AuthUrlConfig implements Filter {
    private CheckAuthService authService;

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
//        Principal userPrincipal = request.getUserPrincipal();
        String name = request.getUserPrincipal().getName();
        String pName = request.getRequestURI();
        System.out.println("pName = " + pName);
        if (Objects.equals(request.getRequestURI(), "/admin")) {
            System.out.println("퍄퍄");
            authService.checkAuth(name, pName, AuthName.ROLE_MEMBER);
            System.out.println("크크");
        }

        chain.doFilter(request, response);
    }
}