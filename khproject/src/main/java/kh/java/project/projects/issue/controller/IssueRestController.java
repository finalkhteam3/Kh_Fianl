package kh.java.project.projects.issue.controller;

import kh.java.project.config.security.CheckAuthService;
import kh.java.project.projects.dto.param.*;
import kh.java.project.projects.issue.service.IssueService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.util.List;

@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/work/{projectNo}/{issueNo}")
public class IssueRestController {

    private final IssueService service;
    private final CheckAuthService authService;

    @GetMapping("/issue/api")
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
    @PatchMapping("/issue/api")
    public HttpStatus updateIssue(@PathVariable String projectNo,
                                  @PathVariable int issueNo,
                                  Principal principal,
                                  Issue issue) {
        service.updateIssue(issue, projectNo, issueNo);
        return HttpStatus.OK;
    }

    @DeleteMapping("/issue/api")
    public HttpStatus deleteIssue(@PathVariable String projectNo,
                                  @PathVariable int issueNo,
                                  Principal principal) {
        service.deleteIssue(projectNo, issueNo);
        return HttpStatus.OK;
    }

    @GetMapping("/comment/api")
    public ResponseEntity<Comment> getComment(@PathVariable String projectNo,
                                              @PathVariable int issueNo,
                                              Principal principal) {
        Comment comment = service.getComment(projectNo, issueNo, principal.getName());
        return ResponseEntity.ok(comment);
    }

    @PostMapping("/comment/api")
    public HttpStatus createComment(@PathVariable String projectNo,
                                    @PathVariable int issueNo,
                                    Principal principal,
                                    @RequestBody String content) {
        service.createComment(projectNo, issueNo, principal.getName(), content);
        return HttpStatus.OK;
    }

    @PatchMapping("/comment/api")
    public HttpStatus updateComment(@PathVariable String projectNo,
                                    @PathVariable int issueNo,
                                    Principal principal,
                                    @RequestBody Comment comment) {
        service.updateComment(projectNo, issueNo, principal.getName(), comment);
        return HttpStatus.OK;
    }

    @DeleteMapping("/comment/api")
    public HttpStatus deleteComment(@PathVariable String projectNo,
                                    @PathVariable int issueNo,
                                    Principal principal,
                                    int no) {
        service.deleteComment(projectNo, issueNo, principal.getName(), no);
        return HttpStatus.OK;
    }

    @PatchMapping("/comment/reaction/api")
    public HttpStatus updateCommentReaction(@PathVariable String projectNo,
                                            @PathVariable int issueNo,
                                            Principal principal,
                                            Comment comment) {
        service.updateCommentReaction(projectNo, issueNo, principal.getName(), comment);
        return HttpStatus.OK;
    }

    @GetMapping("/log/api")
    public ResponseEntity<List<Log>> getLog(@PathVariable String projectNo,
                                            @PathVariable int issueNo,
                                            Principal principal) {
        List<Log> log = service.getLog(projectNo, issueNo);
        return ResponseEntity.ok(log);
    }

    @GetMapping("/file/api")
    public ResponseEntity<List<File>> getFiles(@PathVariable String projectNo,
                                               @PathVariable int issueNo) {
        List<File> fileList = service.getFiles(projectNo, issueNo);
        return ResponseEntity.ok(fileList);
    }

    @PostMapping("/file/api")
    public HttpStatus uploadedFiles(@PathVariable String projectNo,
                                    @PathVariable int issueNo,
                                    List<MultipartFile> fileList) {
        service.uploadedFiles(projectNo, issueNo, fileList);
        return HttpStatus.OK;
    }

    @DeleteMapping("/file/api")
    public HttpStatus deleteFiles(@PathVariable String projectNo,
                                  @PathVariable int issueNo,
                                  @RequestBody List<File> fileList) {
        service.deleteFiles(projectNo, issueNo, fileList);
        return HttpStatus.OK;
    }
}
