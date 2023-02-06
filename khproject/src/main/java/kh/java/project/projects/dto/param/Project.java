package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class Project {
    private String no;
    private String name;
    private String info;
    private String iconPath;
    private int issueDo;
    private int issueFin;
}
