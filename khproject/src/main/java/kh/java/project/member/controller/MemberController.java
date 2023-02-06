package kh.java.project.member.controller;

import kh.java.project.member.dto.param.Test;
import kh.java.project.member.dto.request.MemberRequest;
import kh.java.project.member.service.MemberService;
import kh.java.project.member.service.MemberServiceImpl;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Slf4j
@Controller
@AllArgsConstructor
public class MemberController {
    private MemberService memberService;

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
    public String loginRoute() {
        return "/member/login";
    }

    @GetMapping("/{path}/hi")
    public String AjaxHi(@PathVariable String path, @RequestParam String id){
        memberService.test(new Test(id, "name"), path);
        return "ajax/ajaxHome";
    }

//    @Scheduled(cron = "* * * * * *")
//    public void testScheduled() {
//        try {
//            System.out.println("aaa");
//        } catch (Exception e) {
//            log.warn(e.getMessage());
//        }
//    }
}
