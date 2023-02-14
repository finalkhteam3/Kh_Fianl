package kh.java.project.projects.dto.request;

import kh.java.project.projects.dto.param.Progress;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.sql.Date;

@Getter
@ToString
@AllArgsConstructor
public class CreateIssueRequest {
    private String maker;
    private String pic;
    private int value;
    private String name;
    private String content;
    private int anceNo;
    private int category;
    private Date startDate;
    private Date finDate;
    private Progress progress;
}
