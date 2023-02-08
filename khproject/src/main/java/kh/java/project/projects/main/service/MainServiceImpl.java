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
//        List<Project> projectList = new ArrayList<>();
//        Project project1 = Project.builder().name("hi").no("KHF3").info("JIRA 프로젝트").build();
//        Project project2 = Project.builder().name("hi2").no("KHF3").info("JIRA 프로젝트222").iconPath("kk").build();
//        projectList.add(project1);
//        projectList.add(project2);
        List<Project> projectList = mapper.getProjectList(id);
        return projectList;
    }

    @Override
    public List<Issue> getIssueList(String id, int page, int selectNum, String keyword) {
        return null;
    }

//    @Override
//    public List<Issue> getSearchAllIssueList(String id, int page, String keyword) {
//        return null;
//    }

    @Override
    public ProjectListResponse createProject(Project project, String id) {
        return null;
    }
}
