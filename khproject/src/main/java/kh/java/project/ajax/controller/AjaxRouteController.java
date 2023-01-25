package kh.java.project.ajax.controller;

import kh.java.project.ajax.dto.request.AjaxRequest;
import kh.java.project.ajax.dto.response.AjaxResponse;
import kh.java.project.ajax.service.AjaxService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/ajax")
public class AjaxRouteController {
    private final AjaxService ajaxService;

    @GetMapping
    public String AjaxHome(){
        return "ajax/ajaxHome";
    }

    @PostMapping("/ajaxRoute")
    public String AjaxRoute(@RequestParam("file") MultipartFile file, AjaxRequest ajaxRequest, Model model) throws IOException {
        System.out.println("ajaxRequest = " + ajaxRequest);
        AjaxResponse ajaxResponse = ajaxService.getAjaxResult(ajaxRequest, file);
        model.addAttribute(ajaxResponse);
        return "ajax/ajaxHome";
    }

    @ExceptionHandler(RuntimeException.class)
    public String handleUserException(RuntimeException e, Model model) {
        log.info("handleUserException");
        model.addAttribute("msg", e.getMessage());
        return "error/403";
    }

}
