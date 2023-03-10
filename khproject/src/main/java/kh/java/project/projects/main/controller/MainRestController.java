package kh.java.project.projects.main.controller;

import kh.java.project.config.security.AuthName;
import kh.java.project.config.security.CheckAuthService;
import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Log;
import kh.java.project.projects.dto.param.Notify;
import kh.java.project.projects.dto.param.Project;
import kh.java.project.projects.dto.response.ProjectListResponse;
import kh.java.project.projects.main.service.MainService;
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
@RequestMapping("/work")
public class MainRestController {

    private final MainService service;
    private final CheckAuthService authService;

    @GetMapping("/notify/api")
    public ResponseEntity<List<Notify>> getNotify(Principal principal) {
        List<Notify> notify = service.getNotify(principal.getName());
        return ResponseEntity.ok(notify);
    }

    @GetMapping("/log/api")
    public ResponseEntity<List<Log>> getLog(Principal principal) {
        List<Log> log = service.getLog(principal.getName());
        return ResponseEntity.ok(log);
    }

    @GetMapping("/project/api")
    public ResponseEntity<List<Project>> getProjectList(Principal principal) {
        List<Project> projectList = service.getProjectList(principal.getName());
        return ResponseEntity.ok(projectList);
    }

//    public ResponseEntity<List<Issue>> getIssueList(Principal principal) {
//    	List<Issue> issueList = service.getIssueList(principal.getName());
//    	return ResponseEntity.ok(issueList);
//    }
    @GetMapping("/issue/api")
    public ResponseEntity<List<Issue>> getIssueList(Principal principal,
                                                    @RequestParam(required = false) Integer selectPage,
                                                    @RequestParam(required = false) Integer selectNum,
                                                    @RequestParam(required = false) String keyword) {
        System.out.println("123123123123");
        System.out.println("1: "+selectPage+" 2: "+selectNum+" 3: "+keyword);
        List<Issue> issueList = service.getIssueList(principal.getName(), selectPage, selectNum, keyword);
        return ResponseEntity.ok(issueList);
    }

    @PostMapping("/project/api")
    public ResponseEntity<ProjectListResponse> createProject(@RequestBody Project project, Principal principal) {
        ProjectListResponse projectListResponse = service.createProject(project, project.getName());
        return ResponseEntity.ok(projectListResponse);
    }

    @ExceptionHandler(AssertionError.class)
    public ResponseEntity<?> assertExceptionHandler(AssertionError error) {
        return new ResponseEntity<>(error.getMessage(), HttpStatus.ACCEPTED);
    }
}
