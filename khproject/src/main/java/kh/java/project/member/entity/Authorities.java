package kh.java.project.member.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class Authorities {
    private String id;
    private String authority;
    private String pName;
}
