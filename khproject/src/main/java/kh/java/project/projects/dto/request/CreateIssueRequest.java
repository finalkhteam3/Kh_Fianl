package kh.java.project.projects.dto.request;

import kh.java.project.projects.dto.param.Progress;
import lombok.*;

import java.sql.Date;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CreateIssueRequest {
    private String maker;
    private String pic;
    private Integer value;
    private String name;
    private String content;
    private Integer anceNo;
    private Integer category;
    private Date startDate;
    private Date finDate;
    private Integer progress;
}
