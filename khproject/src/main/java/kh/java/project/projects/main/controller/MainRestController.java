package kh.java.project.projects.main.controller;

import kh.java.project.config.security.CheckAuthService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/work/api")
public class MainRestController {

    @GetMapping("/notify")
    public String getNotify(Principal principal) {
        return null;
    }


}
