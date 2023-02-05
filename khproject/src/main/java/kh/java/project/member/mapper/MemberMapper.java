package kh.java.project.member.mapper;

import kh.java.project.member.dto.param.Test;
import kh.java.project.member.entity.Authorities;
import kh.java.project.member.entity.Users;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberMapper {
    void createUser(Users users);
    Users findById(String id);
    String findAuthorities(Authorities authorities);
    List<Authorities> findAuthoritiesAll(String id);
    void test(@Param("test1") Test test, @Param("path")String path);

}
