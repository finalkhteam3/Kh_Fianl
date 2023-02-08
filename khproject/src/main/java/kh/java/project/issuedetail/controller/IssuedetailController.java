package kh.java.project.issuedetail.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/issuedetail")
public class IssuedetailController {
	




	@RequestMapping //기본 페이지 표시
	public String viewCalendar(){
		return "issue/issuedetail";
	}

	

	
}
