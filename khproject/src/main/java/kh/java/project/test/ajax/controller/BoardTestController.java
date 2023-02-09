package kh.java.project.test.ajax.controller;

import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Progress;
import kh.java.project.projects.dto.response.IssueListResponse;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@AllArgsConstructor
public class BoardTestController {
    @GetMapping("/board")
    public String getBoardPage() {
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
        Issue issue2 = Issue.builder().value(1).progress(2).name("hi11").projectNo("KHF3").no(2).build();
        issueList.add(issue1);
        issueList.add(issue2);
        List<Progress> progressList = new ArrayList<>();
        Progress progress1 = Progress.builder().progress(1).name("할일").rank(1).build();
        Progress progress2 = Progress.builder().progress(2).name("진행중").rank(2).build();
        Progress progress3 = Progress.builder().progress(3).name("완료").rank(3).build();
        progressList.add(progress1);
        progressList.add(progress2);
        progressList.add(progress3);
        return ResponseEntity.ok(new IssueListResponse(issueList, progressList));
    }
}
