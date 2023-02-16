package kh.java.project.test.ajax.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Log;
import kh.java.project.projects.dto.param.Progress;
import kh.java.project.projects.dto.response.IssueListResponse;
import kh.java.project.projects.dto.response.LogListResponse;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class LogTestController {
	@GetMapping("/log")
    public String getLogPage(Model model, Principal principal, HttpServletRequest req) {
        model.addAttribute("userId", principal.getName());
        return "/test/log";
    }
	@ResponseBody
    @GetMapping("/log/api1")
    public ResponseEntity<LogListResponse> getLogApi1() {
        List<Log> logList = new ArrayList<>();
        Log log1 = Log.builder().ProjectNo("KHF3").state("상태_업데이트1").issueName("이슈이름1").executor("실행자1").build();
        Log log2 = Log.builder().ProjectNo("TST2").state("상태_업데이트2").issueName("이슈이름2").executor("실행자2").build();
        Log log3 = Log.builder().ProjectNo("TST3").state("상태_업데이트3").issueName("이슈이름3").executor("실행자3").build();
        Log log4 = Log.builder().ProjectNo("TST4").state("상태_업데이트4").issueName("이슈이름4").executor("실행자4").build();
        Log log5 = Log.builder().ProjectNo("TST5").state("상태_업데이트5").issueName("이슈이름5").executor("실행자5").build();
        logList.add(log1);
        logList.add(log2);
        logList.add(log3);
        logList.add(log4);
        logList.add(log5);
        return ResponseEntity.ok(new LogListResponse(logList));
    }
}
