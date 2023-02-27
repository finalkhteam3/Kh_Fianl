package kh.java.project.projects.board.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/work/{projectNo}")
public class BoardController {
    @GetMapping
    public String getBoardPage(Model model, @PathVariable String projectNo) {
        model.addAttribute(projectNo);
        return "home";
    }
}
