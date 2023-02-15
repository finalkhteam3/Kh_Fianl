package kh.java.project.projects.issue.service;

import kh.java.project.projects.dto.param.Comment;
import kh.java.project.projects.dto.param.File;
import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Log;
import kh.java.project.projects.issue.mapper.IssueMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class IssueServiceImpl implements IssueService{
	private final IssueMapper mapper;
	
    @Override
    public Issue getIssue(String projectNo, int issueNo, int value) {
        return mapper.getIssue(projectNo, issueNo, value);
    }

    @Override
    public void updateIssue(Issue issue, String projectNo, int issueNo) {

    }

    @Override
    public void deleteIssue(String projectNo, int issueNo) {

    }

    @Override
    public Comment getComment(String projectNo, int issueNo, String id) {
        return null;
    }

    @Override
    public void createComment(String projectNo, int issueNo, String id, String content) {

    }

    @Override
    public void updateComment(String projectNo, int issueNo, String id, Comment comment) {

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
    public void deleteFiles(String projectNo, int issueNo, List<File> fileList) {

    }
}
