package kh.java.project.test.ajax.service;

import kh.java.project.test.ajax.dto.request.AjaxRequest;
import kh.java.project.test.ajax.dto.response.AjaxResponse;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface AjaxService {
    AjaxResponse getAjaxResult(AjaxRequest ajaxRequest, MultipartFile file) throws IOException;
    String getCkEditorResult(MultipartFile file) throws IOException;
}
