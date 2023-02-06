package kh.java.project.test.ajax.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Slf4j
@Controller
@AllArgsConstructor
public class TestController {

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


}
