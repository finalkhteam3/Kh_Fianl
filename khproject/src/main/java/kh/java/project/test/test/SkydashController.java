package kh.java.project.test.test;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.java.project.HomeController;
import kh.java.project.projects.dto.param.Project;
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
	public String main(Model model, Principal principal) {

		model.addAttribute("list", service.selectList(principal.getName()));

		return "skydash_temp/all_projects";
	}

	@GetMapping("/jira/cptest")
	public String insert() {
		return "skydash_temp/create_project";
	}

	@RequestMapping(value="/jira/projects", method=RequestMethod.POST)
	public String insertProject(Project dto) {

		int result = service.insert(dto);

		if (result > 0) {
			return "skydash_temp/all_projects";
		} else {
			return "skydash_temp/create_project";
		}
	}
	
	@RequestMapping("/update.do")
	public String update(Model model, int no) {
		
		model.addAttribute("dto", service.selectOne(no));
		
		return "skydash_temp/update_project";
	}
	@RequestMapping("/pjupdate.do")
	public String updateProject(Project dto) {
		
		int result = service.update(dto);
		if(result>0) {
			return "redirect:one.do?no="+dto.getNo();
		}else {
			return "redirect:update.do?no="+dto.getNo();
		}
		
	}
	
}
