package kh.java.project.ajax.controller;

import kh.java.project.ajax.dto.request.AjaxRequest;
import kh.java.project.ajax.dto.response.AjaxResponse;
import kh.java.project.ajax.service.AjaxService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/ajax/api")
public class AjaxController {
    private final AjaxService ajaxService;

    @PostMapping
    public ResponseEntity<AjaxResponse> ajaxUse(@ModelAttribute AjaxRequest ajaxRequest, @RequestParam("file") MultipartFile file) throws IOException {
        System.out.println("ajaxRequest = " + ajaxRequest + "file  = " + file);
        AjaxResponse ajaxResponse = ajaxService.getAjaxResult(ajaxRequest, file);
        log.info("ajaxUse => {}", ajaxResponse);
        return ResponseEntity.ok(ajaxResponse);
    }

}
