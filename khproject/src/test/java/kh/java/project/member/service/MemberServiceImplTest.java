package kh.java.project.member.service;

import kh.java.project.config.Configure;
import kh.java.project.member.dto.request.MemberRequest;
import kh.java.project.member.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;


public class MemberServiceImplTest extends Configure {

    @Test
    public void createMember() {

        if (ctx != null) {
            String[] beans = ctx.getBeanDefinitionNames();

            for (String bean : beans) {
                System.out.println("bean : " + bean);
            }
        }
        //then

    }
}