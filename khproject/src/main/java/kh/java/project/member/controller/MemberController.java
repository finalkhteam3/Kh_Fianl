package kh.java.project.member.controller;

import kh.java.project.member.dto.request.MemberRequest;
import kh.java.project.member.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Slf4j
@Controller
@AllArgsConstructor
public class MemberController {
    private final MemberService service;

    @GetMapping("/all")
    public String all(Principal principal, Model model) {
        if(principal != null)
            model.addAttribute("userId", principal.getName());
        return "/member/all";
    }
    @GetMapping("/member")
    public String member() {
        return "/member/member";
    }
    @GetMapping("/admin")
    public String admin() {
        return "/member/admin";
    }

    @GetMapping("/accessError")
    public String accessError(Model model) {
        model.addAttribute("msg", "Access Denied");
        return "/error/403";
    }

    @GetMapping("/join")
    public String joinRoute(){
        return "/member/join";
    }

    @PostMapping("/join")
    public String join(MemberRequest request) {
        service.createMember(request);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginRoute(HttpServletRequest req) {
        String uri = req.getHeader("Referer");
        if(uri != null && !uri.contains("/login"))
            req.getSession().setAttribute("prevPage", uri);
        return "/member/login";
    }

}
