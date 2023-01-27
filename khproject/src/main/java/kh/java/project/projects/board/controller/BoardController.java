package kh.java.project.projects.board.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/{pName}/board")
public class BoardController {
    @GetMapping
    public String getBoard(@PathVariable String pName) {
        System.out.println("pName = " + pName);
        return "/home";
    }
}
