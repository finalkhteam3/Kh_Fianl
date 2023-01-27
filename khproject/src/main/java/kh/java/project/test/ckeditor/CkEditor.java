package kh.java.project.test.ckeditor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CkEditor {
	
	@GetMapping("/ck")
    public String smarteditor2(){
        return "ckeditor/ck";
    }
	
}
