package kh.java.project.projects.issue.controller;

import kh.java.project.config.security.CheckAuthService;
import kh.java.project.projects.dto.param.Comment;
import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Notify;
import kh.java.project.projects.issue.service.IssueService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/work/{projectNo}/{issueNo}/api")
public class IssueRestController {

    private final IssueService service;
    private final CheckAuthService authService;

    @GetMapping("/issue")
    public ResponseEntity<Issue> getIssue(@PathVariable String projectNo,
                                          @PathVariable int issueNo,
                                          Principal principal,
                                          int value) {
        Issue issue = service.getIssue(projectNo, issueNo, value);
        return ResponseEntity.ok(issue);
    }

    /**
     * @param issue = view 에서 받아온 issue 값
     * @return 200코드
     */
    @PatchMapping("/issue")
    public HttpStatus updateIssue(@PathVariable String projectNo,
                                  @PathVariable int issueNo,
                                  Principal principal,
                                  Issue issue) {
        service.updateIssue(issue, projectNo, issueNo);
        return HttpStatus.OK;
    }

    @DeleteMapping("/issue")
    public HttpStatus deleteIssue(@PathVariable String projectNo,
                                  @PathVariable int issueNo,
                                  Principal principal) {
        service.deleteIssue(projectNo, issueNo);
        return HttpStatus.OK;
    }

    @GetMapping("/comment")
    public ResponseEntity<Comment> getComment(@PathVariable String projectNo,
                              @PathVariable int issueNo,
                              Principal principal) {
        Comment comment = service.getComment(projectNo, issueNo, principal.getName());
        return ResponseEntity.ok(comment);
    }
}
