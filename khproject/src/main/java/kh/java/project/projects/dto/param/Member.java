package kh.java.project.projects.dto.param;

import lombok.*;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member {
    private String id;
    private String name;
    private String email;
    private String iconPath;
    private String projectAuth;
}
