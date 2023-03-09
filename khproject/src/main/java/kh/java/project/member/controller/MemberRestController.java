package kh.java.project.member.controller;

import kh.java.project.member.dto.request.MemberRequest;
import kh.java.project.member.service.MemberService;
import kh.java.project.projects.dto.param.Member;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@AllArgsConstructor
public class MemberRestController {
    private final MemberService memberService;
    @GetMapping(value = "/checkId/api")
    public HttpStatus getMemberList(String id) {
        memberService.checkDuplicate(id);
        return HttpStatus.OK;
    }
    @PostMapping("/join/api")
    public HttpStatus join(MemberRequest request) {
        memberService.createMember(request);
        return HttpStatus.OK;
    }

    @ExceptionHandler(AssertionError.class)
    public HttpStatus assertExceptionHandler(AssertionError error) {
        return HttpStatus.ACCEPTED;
    }

    @ExceptionHandler(RuntimeException.class)
    public HttpStatus runTimeExceptionHandler(RuntimeException error) {
        return HttpStatus.BAD_GATEWAY;
    }
}
