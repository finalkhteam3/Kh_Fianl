package kh.java.project.projects.main.service;

import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Log;
import kh.java.project.projects.dto.param.Notify;
import kh.java.project.projects.dto.param.Project;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService{

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
        return null;
    }

    @Override
    public List<Issue> getIssueList(String id, int page, int selectNum) {
        return null;
    }

    @Override
    public List<Issue> getSearchAllIssueList(String id, int page, String keyword) {
        return null;
    }
}
