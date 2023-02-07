package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class File {
    private int no;
    private int issueNo;
    private String projectNo;
    private String fileName;
    private String filePath;
}
