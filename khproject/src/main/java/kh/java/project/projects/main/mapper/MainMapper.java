package kh.java.project.projects.main.mapper;

import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Project;
import kh.java.project.projects.dto.request.CreateIssueRequest;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MainMapper {
    List<Project> getProjectList(String id);
    List<Issue> getIssueList();
    List<Project> selectList(String id);
    Integer insert(Project dto);
	Project selectOne(String no);
	Integer update(Project dto);
	Integer delete(String no);
}
