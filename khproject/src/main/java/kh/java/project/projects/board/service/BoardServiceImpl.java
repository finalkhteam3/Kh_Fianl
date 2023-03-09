package kh.java.project.projects.board.service;

import kh.java.project.projects.board.mapper.BoardMapper;
import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Member;
import kh.java.project.projects.dto.param.Progress;
import kh.java.project.projects.dto.request.AddMemberRequest;
import kh.java.project.projects.dto.request.CreateIssueRequest;
import kh.java.project.projects.dto.response.IssueListResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	private final BoardMapper mapper;

	@Override
	public IssueListResponse getIssue(String projectNo, String keyword, String id) {
		List<Issue> issueList = mapper.getIssues(projectNo, keyword, id);
		List<Progress> progressList = mapper.getProgresses(projectNo);
		return new IssueListResponse(issueList, progressList);
	}

	@Override
	public List<Member> getAllMembers(String projectNo, String keyword) {
		return null;
	}

	@Override
	public List<Member> getMembers(String projectNo) {
		return mapper.getMembers(projectNo);
	}

	@Override
	public void addMember(AddMemberRequest req, String projectNo) {

	}

	@Override
	public void createIssue(CreateIssueRequest request, String projectNo, String id) {
		mapper.createIssue(request, projectNo, id);	
		return;
	}

	@Override
	public void updateProgress(Progress progress, String projectNo) {

	}
}
