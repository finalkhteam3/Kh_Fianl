package kh.java.project.projects.board.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Progress;

@Mapper
public interface BoardMapper {
	List<Issue> getIssues(@Param("projectNo")String projectNo, @Param("keyword") String keyword, @Param("id") String id);
	List<Progress> getProgresses(@Param("projectNo")String projectNo);
}
