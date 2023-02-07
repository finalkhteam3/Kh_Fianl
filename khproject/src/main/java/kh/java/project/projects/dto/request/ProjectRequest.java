package kh.java.project.projects.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class ProjectRequest {
    private String no;
    private String name;
    private String info;
    private String iconPath;
}
