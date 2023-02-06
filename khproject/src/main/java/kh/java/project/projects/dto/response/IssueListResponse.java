package kh.java.project.projects.dto.response;

import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Progress;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
@AllArgsConstructor
public class IssueListResponse {
    private List<Issue> issueList;
    private List<Progress> progressList;
}
