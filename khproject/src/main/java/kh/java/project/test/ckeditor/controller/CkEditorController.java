package kh.java.project.test.ckeditor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CkEditorController {
	
	@GetMapping("/ck")
    public String smarteditor2(){
        return "ckeditor/ck";
    }
	
}
