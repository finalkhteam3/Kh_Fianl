package kh.java.project.member.dto.request;

import kh.java.project.member.entity.Users;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class MemberRequest {
    private String id;
    private String name;
    private String password;
    private String email;

    public Users toEntity(String encodePwd) {
        return Users.builder()
                .id(id).name(name)
                .password(encodePwd).email(email)
                .build();
    }
}
