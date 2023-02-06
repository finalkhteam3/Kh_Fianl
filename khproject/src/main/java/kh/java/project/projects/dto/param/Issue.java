package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class Issue {
    private int no;
    private int value;
    private int category;
    private String name;
    private String content;
    private int anceNo;
    private int projectNo;
    private int progress;
}
