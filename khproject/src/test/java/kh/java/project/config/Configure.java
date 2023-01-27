package kh.java.project.config;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration
//        (locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
//        "file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@ContextConfiguration(locations = {"classpath:/root-context.xml", "classpath:/security-context.xml", "classpath:/appServlet/servlet-context.xml"})
@ComponentScan
public class Configure {
    @Autowired public ApplicationContext ctx;
//    @Autowired public AnnotationConfigApplicationContext ctx;
}
