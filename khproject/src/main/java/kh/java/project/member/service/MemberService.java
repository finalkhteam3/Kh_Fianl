package kh.java.project.member.service;

import kh.java.project.member.dto.param.Test;
import kh.java.project.member.dto.request.MemberRequest;

public interface MemberService {
    void createMember(MemberRequest request);
    void test(Test test, String path);
}
