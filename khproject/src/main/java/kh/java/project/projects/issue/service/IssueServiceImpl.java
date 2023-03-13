package kh.java.project.projects.issue.service;

import kh.java.project.config.firestore.FireBaseService;
import kh.java.project.projects.dto.param.Comment;
import kh.java.project.projects.dto.param.File;
import kh.java.project.projects.dto.param.FileCkEditor;
import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Log;
import kh.java.project.projects.issue.mapper.IssueMapper;
import kh.java.project.test.ajax.dto.response.AjaxResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class IssueServiceImpl implements IssueService{
	private final IssueMapper mapper;
	private FireBaseService fireBaseService;
	
    @Override
    public Issue getIssue(String projectNo, int issueNo, int value) {
        return mapper.getIssue(projectNo, issueNo, value);
    }

    @Override
    public void updateIssue(Issue issue, String projectNo, int issueNo) {
    	mapper.updateIssue(issue, projectNo, issueNo);
    }

    @Override
    public void deleteIssue(String projectNo, int issueNo) {

    }

    @Override
    public List<Comment> getComments(String projectNo, int issueNo, String id) {
        return mapper.getComments(projectNo, issueNo, id);
    }
    @Override
    public void createComment(String projectNo, int issueNo, String id,  Comment comment) {
    	mapper.createComment(projectNo, issueNo, id, comment);	
    	return;
    }

    @Override
    public void updateComment(String projectNo, int issueNo, String id, Comment comment) {
    	mapper.updateComment(projectNo, issueNo, id, comment);	
    	return;
    }

    @Override
    public void deleteComment(String projectNo, int issueNo, String id, int no) {

    }

    @Override
    public void updateCommentReaction(String projectNo, int issueNo, String id, Comment comment) {

    }

    @Override
    public List<Log> getLog(String projectNo, int issueNo) {
        return null;
    }

    @Override
    public List<File> getFiles(String projectNo, int issueNo) {
        return null;
    }

    @Override
    public void uploadedFiles(String projectNo, int issueNo, List<MultipartFile> files) {

    }

	@Override
	public FileCkEditor uploadedFile(String projectNo, int issueNo, MultipartFile file) {
		FileCkEditor fileCkEditor;
        try {
            String url = fireBaseService.uploadFiles(file);
            fileCkEditor = new FileCkEditor("1", file.getOriginalFilename(), url);
            return fileCkEditor;
        } catch (IOException e){
            throw new RuntimeException("오류오류");
        }
	}
	
    @Override
    public void deleteFiles(String projectNo, int issueNo, List<File> fileList) {

    }

}
