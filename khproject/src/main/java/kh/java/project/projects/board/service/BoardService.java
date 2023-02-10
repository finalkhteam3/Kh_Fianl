package kh.java.project.projects.board.service;

import kh.java.project.member.dto.request.MemberRequest;
import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Member;
import kh.java.project.projects.dto.param.Progress;
import kh.java.project.projects.dto.request.AddMemberRequest;
import kh.java.project.projects.dto.request.CreateIssueRequest;
import kh.java.project.projects.dto.response.IssueListResponse;

import java.net.http.HttpRequest;
import java.util.List;

public interface BoardService {
    /**
     * 보드 페이지 오픈시 최초에 이슈들을 받아오는 기능
     * keyword 가 없다면 모든 이슈를 받아오는 것이고, keyword 가 있다면 해당 keyword 가 있는
     * 부분만 가져오는 것이다. id 또한 마찬가지
     */
	IssueListResponse getIssue(String projectNo, String keyword, String id);

    /**
     * 보드 페이지 오픈시 최초에 멤버들을 받아오는 기능
     */
    List<Member> getMembers(String projectNo);

    /**
     * 보드 페이지에서 멤버를 추가하는 기능. 이메일과 권한을 받아오며,
     * 이름은 이메일에서 @전부분을 받아와 넣는다.
     * 이메일과 권한은 대기 테이블에 집어넣고, 초대 이메일을 보낸다.
     */
    void addMember(AddMemberRequest req, String projectNo);

    /**
     * 보드 페이지에서 이슈를 추가하는 기능.
     */
    void createIssue(CreateIssueRequest request, String projectNo, String id);

    /**
     * 진행도 업데이트(페이지 내에서 이름을 변경하거나 순서를 변경)
     */
    void updateProgress(Progress progress, String projectNo);
}
