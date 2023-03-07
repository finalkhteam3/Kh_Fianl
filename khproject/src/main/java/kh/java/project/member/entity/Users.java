package kh.java.project.member.entity;

import lombok.*;

@Getter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Users {
    private String id;
    private String name;
    private String password;
    private String email;
}
