package kh.java.project.test.smarteditor2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SmartEditor2Controller {

    @GetMapping("/se2")
    public String smarteditor2(){
        return "smarteditor2/se2";
    }

}
