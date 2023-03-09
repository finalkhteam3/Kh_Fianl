package kh.java.project.projects.board.controller;

import kh.java.project.config.security.CheckAuthService;
import kh.java.project.projects.board.service.BoardService;
import kh.java.project.projects.dto.param.Member;
import kh.java.project.projects.dto.param.Progress;
import kh.java.project.projects.dto.request.AddMemberRequest;
import kh.java.project.projects.dto.request.CreateIssueRequest;
import kh.java.project.projects.dto.response.IssueListResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/work/{projectNo}")
public class BoardRestController {
	private final CheckAuthService authService;
	private final BoardService service;

	@GetMapping("/issue/api")
	public ResponseEntity<IssueListResponse> getIssue(@PathVariable String projectNo,
			@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(name = "id", required = false, defaultValue = "") String id, Principal principal) {
		IssueListResponse issueList = service.getIssue(projectNo, keyword, id);
		return ResponseEntity.ok(issueList);
	}

	@GetMapping("/member/all/api")
	public ResponseEntity<List<Member>> getAllMemberList(@PathVariable String projectNo, String keyword){
		List<Member> allMembers = service.getAllMembers(projectNo, keyword);
		return ResponseEntity.ok(allMembers);
	}

	@GetMapping("/member/api")
	public ResponseEntity<List<Member>> getMemberList(@PathVariable String projectNo) {
		List<Member> memberList = service.getMembers(projectNo);
		return ResponseEntity.ok(memberList);
	}

	@PostMapping("/member/api")
	public HttpStatus updateMember(@PathVariable String projectNo, @RequestBody AddMemberRequest request) {
		service.addMember(request, projectNo);
		return HttpStatus.OK;
	}

	@PostMapping("/issue/api")
	public HttpStatus createIssue(@PathVariable String projectNo, @RequestBody CreateIssueRequest request,
			Principal principal) {
		System.out.println(request);
		service.createIssue(request, projectNo, principal.getName());
		return HttpStatus.OK;
	}

	@PatchMapping("/progress/api")
	public HttpStatus updateProgress(@PathVariable String projectNo, Principal principal,
			@RequestBody Progress progress) {
		service.updateProgress(progress, projectNo);
		return HttpStatus.OK;
	}
}
