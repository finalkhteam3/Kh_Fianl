package kh.java.project.config.security;

import kh.java.project.member.entity.Authorities;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Service
public class CheckAuthService {

    public void checkAuth(HttpSession session, String pName, AuthName authName) {
        try {
            List<Authorities> auth = (List<Authorities>) session.getAttribute("Auth");
            System.out.println("auth = " + auth);
            if (auth == null)
                throw new RuntimeException("인증을 실패했습니다(로그인 바랍니다).");
            for (Authorities authorities : auth) {
                if(Objects.equals(authorities.getPName(), pName) &&
                        Objects.equals(authorities.getAuthority(), authName.toString()))
                    return;
            }
        } catch (RuntimeException e){
            throw new RuntimeException("인증을 실패했습니다(권한이 없습니다).");
        }
    }
    
}
