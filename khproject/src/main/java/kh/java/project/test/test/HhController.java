package kh.java.project.test.test;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/test/home")
public class HhController {
    @GetMapping
    public String getHome2() {
        return "main/mainPage";
    }
}
