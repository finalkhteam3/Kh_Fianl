package kh.java.project.projects.dto.response;

import kh.java.project.projects.dto.param.Project;
import kh.java.project.projects.dto.param.ProjectIssueDo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
@AllArgsConstructor
public class ProjectListResponse {
    private List<Project> projectList;
    private ProjectIssueDo projectIssueDo;
}
