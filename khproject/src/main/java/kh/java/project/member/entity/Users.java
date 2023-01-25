package kh.java.project.member.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class Users {
    private String id;
    private String name;
    private String password;
    private String email;
}
