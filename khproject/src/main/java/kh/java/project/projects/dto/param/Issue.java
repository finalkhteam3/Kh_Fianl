package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Builder
@ToString
public class Issue {
    private int no;
    private int value;
//    private int category;
    private String name;
//    private String content;
//    private int anceNo;
    private String projectNo;
//    private int progress;
//    private Date startDate;
//    private Date finDate;
}
