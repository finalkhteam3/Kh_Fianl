package kh.java.project.member.service;

import kh.java.project.config.Configure;
import kh.java.project.member.dto.request.MemberRequest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

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
//    @Test
//    public void createMember() {
//        //given
//        MemberRequest memberRequest = new MemberRequest("tuu523", "hihi", "xodnjs", "tuu523");
//        //when
//        memberService.createMember(memberRequest);
//        //then
//    }
    @Test
    @Transactional
    public void duplicate_member() {
        //given
        MemberRequest memberRequest = new MemberRequest("tuu2523", "태원", "xodnjs", "tuu5234");
        //when
        try {
            memberService.createMember(memberRequest);
        } catch (RuntimeException e){
            fail();
        }
        //then
    }

    @Test
    @Transactional
    public void create_member() {
        //given
        MemberRequest memberRequest = new MemberRequest("tuu2523", "태원", "xodnjs", "tuu5234");
        //when
        memberService.createMember(memberRequest);
        //then

    }
}