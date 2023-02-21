package kh.java.project.test.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.java.project.HomeController;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class SkydashController {
	@GetMapping("/jira/your-work")
	public String getIndexPage() {
		return "skydash_temp/index_skydash";
	}
	@GetMapping("/jira/projects")
	public String projects() {
		return "skydash_temp/all_projects";
	}
}
