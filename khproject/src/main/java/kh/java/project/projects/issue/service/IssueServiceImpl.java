package kh.java.project.projects.issue.service;

import kh.java.project.projects.dto.param.Comment;
import kh.java.project.projects.dto.param.File;
import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Log;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class IssueServiceImpl implements IssueService{
    @Override
    public Issue getIssue(String projectNo, String issueNo, int value) {
        return null;
    }

    @Override
    public Issue updateIssue(Issue issue, String projectNo, String issueNo) {
        return null;
    }

    @Override
    public Comment getComment(String projectNo, String issueNo, String id) {
        return null;
    }

    @Override
    public void createComment(String projectNo, String issueNo, String id, String content) {

    }

    @Override
    public void updateComment(String projectNo, String issueNo, String id, Comment comment) {

    }

    @Override
    public void deleteComment(String projectNo, String issueNo, String id, int no) {

    }

    @Override
    public void updateCommentReaction(String projectNo, String issueNo, String id, Comment comment) {

    }

    @Override
    public List<Log> getLog(String projectNo, String issueNo) {
        return null;
    }

    @Override
    public List<File> getFiles(String projectNo, String issueNo) {
        return null;
    }

    @Override
    public void uploadedFiles(String projectNo, String issueNo, List<MultipartFile> files) {

    }

    @Override
    public void deleteFiles(String projectNo, String issueNo, List<File> fileList) {

    }
}
