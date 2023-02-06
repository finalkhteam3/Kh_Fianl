package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class Like {
    private int no;
    private String name;
    private int value;
}
