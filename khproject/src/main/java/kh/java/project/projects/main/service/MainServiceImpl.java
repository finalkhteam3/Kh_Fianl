package kh.java.project.projects.main.service;

import kh.java.project.projects.dto.param.*;
import kh.java.project.projects.dto.request.ProjectRequest;
import kh.java.project.projects.dto.response.ProjectListResponse;
import kh.java.project.projects.main.mapper.MainMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService{
    private final MainMapper mapper;
    @Override
    public List<Notify> getNotify(String id) {

        return null;
    }

    @Override
    public List<Log> getLog(String id) {
        return null;
    }

    @Override
    public List<Project> getProjectList(String id) {
        List<Project> projectList = mapper.getProjectList(id);
        return projectList;
    }

    @Override
    public List<Issue> getIssueList(String id) {
    	List<Issue> issueList = mapper.getIssueList(id);
    	return issueList;
    }
//    public List<Issue> getIssueList(String id, int page, int selectNum, String keyword) {
//        return null;
//    }

//    @Override
//    public List<Issue> getSearchAllIssueList(String id, int page, String keyword) {
//        return null;
//    }

    @Override
    public ProjectListResponse createProject(Project project, String id) {
        return null;
    }
}
