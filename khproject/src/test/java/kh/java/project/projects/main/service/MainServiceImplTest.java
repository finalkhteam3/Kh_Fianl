package kh.java.project.projects.main.service;

import kh.java.project.config.Configure;
import kh.java.project.projects.dto.param.Project;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

public class MainServiceImplTest extends Configure {

    @Autowired MainService mainService;

    @Test
    public void getNotify() {
    }

    @Test
    public void getLog() {
    }

    @Test
    public void getProjectList() {
        String id = "tuu523";
        List<Project> projectList = mainService.getProjectList(id);
        System.out.println("projectList = " + projectList);
    }

    @Test
    public void getIssueList() {
    }

    @Test
    public void createProject() {
    }
}