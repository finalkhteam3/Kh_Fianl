package kh.java.project.projects.main.controller;

import kh.java.project.projects.dto.param.Project;
import kh.java.project.projects.main.service.MainService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/work")
public class MainController {
    private final MainService service;

    @GetMapping
    public String getMyWorkPage() {
        return null;
    }

}
