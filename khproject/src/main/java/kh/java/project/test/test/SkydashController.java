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
import kh.java.project.member.entity.Authorities;
import kh.java.project.projects.dto.param.Project;
import kh.java.project.projects.dto.param.ProjectAuthorities;
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

	@GetMapping("/jira/insert.do")
	public String insert() {
		return "skydash_temp/create_project";
	}

	@RequestMapping("/jira/projects")
	public String insertProject(String name, String no, String info, String iconPath
			,Principal principal) {
		//Project pDto = new Project(no, name, info, iconPath);
		ProjectAuthorities dto = new ProjectAuthorities(no, name, info, iconPath, principal.getName(), 0);
		System.out.println("dto = " + dto);
		int result = service.insertProjectNAuth(dto);

		if (result > 0) {
			return "skydash_temp/all_projects";
		} else {
			return "skydash_temp/create_project";
		}
	}

	@RequestMapping("/jira/update.do")
	public String update(Model model, String no) {

		model.addAttribute("dto", service.selectOne(no));

		return "skydash_temp/update_project";
	}

	@RequestMapping("/jira/pjupdate.do")
	public String updateProject(String name, String no, String info, String iconPath, String adminName) {
		Project dto = new Project(no, name, info, iconPath, adminName);
		System.out.println("dto = " + dto);
		int result = service.update(dto);
		
		if (result > 0) {
			return "skydash_temp/all_projects";
		} else {
			return "skydash_temp/update_project";
		}

	}
	@RequestMapping("/jira/delete.do")
	public String deleteProject(String no) {
		int result = service.delete(no);
		
		if (result > 0) {
			return "skydash_temp/all_projects";
		} else {
			return "redirect:one.do?no="+no;
		}
		
	}

}
