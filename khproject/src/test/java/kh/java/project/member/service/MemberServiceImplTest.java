package kh.java.project.member.service;

import kh.java.project.config.Configure;
import kh.java.project.member.dto.request.MemberRequest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


public class MemberServiceImplTest extends Configure {

    @Autowired
    MemberService memberService;
    @Test
    public void getBeans() {
        if (ctx != null) {
            String[] beans = ctx.getBeanDefinitionNames();
            System.out.println(beans.length);
            for (String bean : beans) {
                System.out.println("bean : " + bean);
            }
        }
    }
    @Test
    public void createMember() {
        //given
        MemberRequest memberRequest = new MemberRequest("hihi", "hihi", "hihi", "hihi");
        //when
        memberService.createMember(memberRequest);
        //then
    }
}