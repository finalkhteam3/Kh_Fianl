package kh.java.project.test.ajax.service;

import kh.java.project.test.ajax.dto.request.AjaxRequest;
import kh.java.project.test.ajax.dto.response.AjaxResponse;

import kh.java.project.config.firestore.FireBaseService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Slf4j
@Service
@AllArgsConstructor
public class AjaxServiceImpl implements AjaxService{
    FireBaseService fireBaseService;
    @Override
    @Transactional
    public AjaxResponse getAjaxResult(AjaxRequest ajaxRequest, MultipartFile file) {
        AjaxResponse ajaxResponse;
        try {
            int num = Integer.parseInt(ajaxRequest.getInter());
            if (file == null)
                ajaxResponse = new AjaxResponse(ajaxRequest.getNo(), ajaxRequest.getName(), num * 2);
            else {
                String makeName = fireBaseService.uploadFiles(file);
                ajaxResponse = new AjaxResponse(ajaxRequest.getNo(), ajaxRequest.getName(), num * 2, makeName);
            }
            return ajaxResponse;
        } catch (IOException e){
            throw new RuntimeException("오류오류");
        }
    }
    public String getCkEditorResult(MultipartFile file) {
        AjaxResponse ajaxResponse;
        try {
            String makeName = fireBaseService.uploadFiles(file);
            return makeName;
        } catch (IOException e){
            throw new RuntimeException("오류오류");
        }
    }
}
