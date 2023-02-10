package kh.java.project.projects.dto.param;

import lombok.*;

import java.util.List;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class IssueBoard {
    private Issue issue;
    private List<Log> logList;
}
