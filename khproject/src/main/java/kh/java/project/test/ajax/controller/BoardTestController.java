package kh.java.project.test.ajax.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@AllArgsConstructor
public class BoardTestController {
    @GetMapping("/board")
    public String getBoardPage() {
        return "/test/board";
    }
}
