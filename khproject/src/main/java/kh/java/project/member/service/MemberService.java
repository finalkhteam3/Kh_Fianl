package kh.java.project.member.service;

import kh.java.project.member.dto.request.MemberRequest;
import kh.java.project.member.entity.Users;
import kh.java.project.member.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@AllArgsConstructor
public class MemberService {
    private final MemberMapper mapper;
    private final PasswordEncoder encoder;

    @Transactional
    public void createMember(MemberRequest request) {
        try{
            String encodePwd = encoder.encode(request.getPassword());
            Users users = request.toEntity(encodePwd);
            mapper.createUser(users);
        } catch (RuntimeException e){
            e.printStackTrace();
        }
    }
}