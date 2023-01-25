package kh.java.project.ajax.service;

import kh.java.project.ajax.dto.request.AjaxRequest;
import kh.java.project.ajax.dto.response.AjaxResponse;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface AjaxService {
    AjaxResponse getAjaxResult(AjaxRequest ajaxRequest, MultipartFile file) throws IOException;
}
