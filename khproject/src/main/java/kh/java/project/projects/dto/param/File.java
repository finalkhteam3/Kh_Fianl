package kh.java.project.projects.dto.param;

import lombok.*;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class File {
    private int no;
    private int issueNo;
    private String projectNo;
    private String fileName;
    private String filePath;
}
