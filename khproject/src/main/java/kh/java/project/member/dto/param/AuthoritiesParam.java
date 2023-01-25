package kh.java.project.member.dto.param;

import kh.java.project.member.entity.Authorities;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
@AllArgsConstructor
public class AuthoritiesParam {
    List<Authorities> authoritiesList;
}
