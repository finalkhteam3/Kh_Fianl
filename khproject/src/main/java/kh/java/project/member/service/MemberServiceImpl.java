package kh.java.project.member.service;

import kh.java.project.member.dto.param.Test;
import kh.java.project.member.dto.request.MemberRequest;
import kh.java.project.member.entity.Authorities;
import kh.java.project.member.entity.Users;
import kh.java.project.member.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
    private final MemberMapper mapper;
    private final PasswordEncoder encoder;


    @Transactional
    public void createMember(MemberRequest request) {
        try{
            String encodePwd = encoder.encode(request.getPassword());
            Users users = request.toEntity(encodePwd);
            System.out.println("users = " + users);
            mapper.createUser(users);
            mapper.createAuthorities(users.getId(), "ROLE_MEMBER");
        } catch (RuntimeException e){
            throw new RuntimeException("오류");
        }
    }

    @Override
    public void checkDuplicate(String id) {
        try{
            Users byId = mapper.findById(id);
            if(byId != null) {
                System.out.println("id = " + byId);
                throw new AssertionError("중복된 아이디가 있습니다");
            }
        } catch (RuntimeException e){
            throw new RuntimeException("오류");
        }
    }

    @Override
    public void test(Test test, String path) {
        mapper.test(test, path);
    }

    public MemberRequest memberTest(MemberRequest memberRequest) {
        return memberRequest;
    }


}
