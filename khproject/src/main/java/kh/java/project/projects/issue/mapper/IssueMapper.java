package kh.java.project.projects.issue.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kh.java.project.projects.dto.param.Comment;
import kh.java.project.projects.dto.param.File;
import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Progress;

@Mapper
public interface IssueMapper {
    Issue getIssue(@Param("projectNo")String projectNo,@Param("issueNo") int issueNo,@Param("value") int value) ;
    
	List<Issue> getIssues(@Param("projectNo")String projectNo, @Param("keyword") String keyword, @Param("id") String id);
	List<Progress> getProgresses(@Param("projectNo")String projectNo);
	List<Comment> getComments(@Param("projectNo")String projectNo,@Param("issueNo")int issueNo,@Param("id")String id);
	void createComment(@Param("projectNo")String projectNo, @Param("issueNo")int issueNo, @Param("id")String id, @Param("comment")Comment comment);
	void deleteComment(Comment comment);
	List<File> getFiles(@Param("projectNo")String projectNo, @Param("issueNo")int issueNo);
	void uploadedFiles(File file);
	
}
