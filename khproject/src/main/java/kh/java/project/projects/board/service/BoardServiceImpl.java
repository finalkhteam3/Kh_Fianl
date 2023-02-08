package kh.java.project.projects.board.service;

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
public class BoardServiceImpl implements BoardService{
    @Override
    public IssueListResponse getIssue(String projectNo, String keyword, String id) {
        return null;
    }

    @Override
    public List<Member> getMembers(String projectNo) {
        return null;
    }

    @Override
    public void addMember(AddMemberRequest req, String projectNo) {

    }

    @Override
    public void createIssue(CreateIssueRequest request, String projectNo, String id) {

    }

    @Override
    public void updateProgress(Progress progress, String projectNo) {

    }
}
