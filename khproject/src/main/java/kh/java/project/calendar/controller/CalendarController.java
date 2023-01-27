package kh.java.project.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
    
 


	@RequestMapping //기본 페이지 표시
	public String viewCalendar(){
		return "/calendar/calendarPage";
	}

} 
