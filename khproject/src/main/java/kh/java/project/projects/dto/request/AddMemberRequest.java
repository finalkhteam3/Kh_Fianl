package kh.java.project.projects.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class AddMemberRequest {
    private String email;
    private String role;
}
