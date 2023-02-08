package kh.java.project.projects.roadmap.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/work/{projectNo}/roadmap")
public class RoadMapController {
    @GetMapping
    public String getRoadMapPage(@PathVariable String projectNo) {
        System.out.println("kkk123k");
        return null;
    }
}
