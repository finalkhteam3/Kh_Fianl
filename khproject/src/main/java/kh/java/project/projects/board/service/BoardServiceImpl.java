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
		return mapper.getAllMembers(projectNo, keyword);
	}

	@Override
	public List<Member> getMembers(String projectNo) {
		return mapper.getMembers(projectNo);
	}

	@Override
	public void addMember(String id, String projectNo) {
		try {
			System.out.println("id = " + id);
			int result = mapper.addMember(id, projectNo);
			System.out.println("result = " + result);
			if(result != 1)
				throw new RuntimeException("추가가 정상적으로 이뤄지지 않았습니다.");
			System.out.println("result = " + result);
		} catch (RuntimeException e){
			throw new RuntimeException("오류");
		}
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
