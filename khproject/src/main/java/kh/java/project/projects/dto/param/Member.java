package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class Member {
    private String id;
    private String name;
    private String email;
    private String iconPath;
    private String projectAuth;
}
