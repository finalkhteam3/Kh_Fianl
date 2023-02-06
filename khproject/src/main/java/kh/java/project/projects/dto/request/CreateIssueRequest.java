package kh.java.project.projects.dto.request;

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
    private int anceNo;
    private int category;
    private int progress;
    private Date startDate;
    private Date finDate;
}
