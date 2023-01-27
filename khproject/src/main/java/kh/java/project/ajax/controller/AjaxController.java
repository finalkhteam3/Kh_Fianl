package kh.java.project.ajax.controller;

import kh.java.project.ajax.dto.request.AjaxRequest;
import kh.java.project.ajax.dto.response.AjaxResponse;
import kh.java.project.ajax.service.AjaxService;
import kh.java.project.config.security.CheckAuthService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;

import static kh.java.project.config.security.AuthName.ROLE_MEMBER;

@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/ajax/api")
public class AjaxController {
    private final AjaxService ajaxService;
    private final CheckAuthService checkAuthService;
    @PostMapping
    public ResponseEntity<AjaxResponse> ajaxUse(@ModelAttribute AjaxRequest ajaxRequest, @RequestParam("file") MultipartFile file, HttpSession session) throws IOException {
        checkAuthService.checkAuth(session, "test", ROLE_MEMBER);
        System.out.println("ajaxRequest = " + ajaxRequest + "file  = " + file);
        AjaxResponse ajaxResponse = ajaxService.getAjaxResult(ajaxRequest, file);
        log.info("ajaxUse => {}", ajaxResponse);
        return ResponseEntity.ok(ajaxResponse);
    }

    @ExceptionHandler(RuntimeException.class)
    public String handleUserException(RuntimeException e, Model model) {
        log.info("handleUserException {}", e.getMessage());
        model.addAttribute("msg", e.getMessage());
        return "error/403";
    }
}
