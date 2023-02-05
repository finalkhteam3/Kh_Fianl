package kh.java.project.test.calendar.controller;

import java.util.List;
import java.util.Map;

import kh.java.project.test.calendar.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
    
	 @Autowired
     CalendarService calendarService;




	@RequestMapping //기본 페이지 표시
	public String viewCalendar(){
		return "/calendar/calendarPage";
	}

	  @GetMapping("/event") //ajax 데이터 전송 URL
	    public @ResponseBody List<Map<String, Object>> getEvent(){
			  return calendarService.getEventList();
	    }

	
} 
