package kh.java.project.projects.dto.param;

import lombok.*;

import java.sql.Date;

@Getter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Issue {
    private int no;
    private int value;
    private String projectNo;
    private String name;
    private int category;
    private String content;
    private int anceNo;
    private int progress;
    private Date startDate;
    private Date finDate;
}
