package kh.java.project.createissue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CreateIssue {

	@GetMapping("/create")
		public String getCreateIsuue() {
		return "/create/createissue";
	}
}
