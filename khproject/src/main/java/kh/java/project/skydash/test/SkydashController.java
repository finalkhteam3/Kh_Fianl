package kh.java.project.skydash.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.java.project.HomeController;

@Controller
public class SkydashController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index_skydash", method = RequestMethod.GET)
	public String adminOne() {
		return "/skydash_temp/index_skydash";
	}
}
