package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class Log {
    private boolean isRead; //이거 int로 해야하는지(mybatis상에는 int임)
    private String ProjectNo;
    private String category;
    private String state;
    private String issueName;
    private int value;
    private int issueNo;
    private String executor;
}
