package kh.java.project.test.ajax.controller;

import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Progress;
import kh.java.project.projects.dto.response.IssueListResponse;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@AllArgsConstructor
public class BoardTestController {
    @GetMapping("/board")
    public String getBoardPage(Model model, Principal principal, HttpServletRequest req) {
        model.addAttribute("userId", principal.getName());
        return "/test/board";
    }
    @GetMapping("/testHome")
    public String getHomePage()
    {
        return "/component/home";
    }

    @ResponseBody
    @GetMapping("/board/api1")
    public ResponseEntity<IssueListResponse> getBoardApi1() {
        List<Issue> issueList = new ArrayList<>();
        Issue issue1 = Issue.builder().value(1).progress(1).name("hi").projectNo("KHF3").no(1).build();
        Issue issue2 = Issue.builder().value(1).progress(2).name("hi2").projectNo("KHF3").no(2).build();
        Issue issue3 = Issue.builder().value(1).progress(3).name("hi3").projectNo("KHF3").no(3).build();
        Issue issue4 = Issue.builder().value(1).progress(2).name("hi4").projectNo("KHF3").no(4).build();
        Issue issue5 = Issue.builder().value(2).progress(1).name("hi5").projectNo("KHF3").no(5).build();
        issueList.add(issue1);
        issueList.add(issue2);
        issueList.add(issue3);
        issueList.add(issue4);
        issueList.add(issue5);
        List<Progress> progressList = new ArrayList<>();
        Progress progress2 = Progress.builder().progress(2).name("진행중").rank(3).build();
        Progress progress3 = Progress.builder().progress(3).name("완료").rank(2).build();
        Progress progress1 = Progress.builder().progress(1).name("할일").rank(1).build();
        progressList.add(progress3);
        progressList.add(progress1);
        progressList.add(progress2);
        return ResponseEntity.ok(new IssueListResponse(issueList, progressList));
    }
}
