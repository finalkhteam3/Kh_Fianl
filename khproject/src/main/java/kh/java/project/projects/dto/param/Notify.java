package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class Notify {
    private String executor;
    private String watcher;
    private int isRead;
    private String category;
    private String state;
    private String IssueName;
    private int value;
    private String projectNo;
    private int issueNo;
}
