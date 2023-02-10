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
	private String maker;
	private String pic;
	private int anceNo;
	private int progress;
	private String name;
//    private String content;
//    private Date startDate;
//    private Date finDate;
}
