package kh.java.project.projects.issue.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/work/{projectNo}/{issueNo}")
public class IssueController {
    @GetMapping
    public String getIssuePage(@PathVariable String projectNo, @PathVariable int issueNo) {
        System.out.println("kkkk");
        return null;
    }

    @ExceptionHandler(NullPointerException.class)
    public String nullPointHandler() {
        return "home";
    }
}
