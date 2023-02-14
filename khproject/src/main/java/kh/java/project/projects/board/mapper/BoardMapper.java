package kh.java.project.projects.board.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Member;
import kh.java.project.projects.dto.param.Progress;
import kh.java.project.projects.dto.request.CreateIssueRequest;

@Mapper
public interface BoardMapper {
	List<Issue> getIssues(@Param("projectNo")String projectNo, @Param("keyword") String keyword, @Param("id") String id);
	List<Progress> getProgresses(@Param("projectNo")String projectNo);
	List<Member> getMembers(@Param("projectNo")String projectNo);
	void createIssue(@Param("request")CreateIssueRequest request,@Param("projectNo")String projectNo,@Param("id") String id);
	
}
