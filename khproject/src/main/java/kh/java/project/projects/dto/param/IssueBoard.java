package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@Builder
@ToString
public class IssueBoard {
    private Issue issue;
    private List<Log> logList;
}
