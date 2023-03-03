package kh.java.project.test.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.java.project.HomeController;
import kh.java.project.projects.main.service.MainService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class SkydashController {
	@Autowired
	private MainService service;
	
	@GetMapping("/jira/your-work")
	public String getIndexPage() {
		return "skydash_temp/index_skydash";
	}
	@GetMapping("/jira/projects")
	public String main(Model model) {
		
		model.addAttribute("list", service.selectList());
		
		return "skydash_temp/all_projects";
	}
	@GetMapping("/jira/cptest")
	public String createProject() {
		return "skydash_temp/create_project";
	}
}
