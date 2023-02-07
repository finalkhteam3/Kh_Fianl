package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class ProjectIssueDo {
    private int issueDo;
    private int issueFin;
}
