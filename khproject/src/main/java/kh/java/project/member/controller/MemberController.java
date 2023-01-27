package kh.java.project.member.controller;

import kh.java.project.member.dto.request.MemberRequest;
import kh.java.project.member.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Slf4j
@Controller
@AllArgsConstructor
public class MemberController {
    private MemberService memberService;

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
        memberService.createMember(request);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginRoute(String page) {
        log.info("page {} ", page);
        return "/member/login";
    }

}
