package kh.java.project.config.security;

import kh.java.project.member.entity.Authorities;
import kh.java.project.member.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;
import java.util.Objects;

@Service
@AllArgsConstructor
public class CheckAuthService {
    private MemberMapper mapper;
    public void checkAuth(Principal principal, String pName, AuthName authName) {
        try {
            assert principal != null;
            List<Authorities> auth = mapper.findAuthoritiesAll(principal.getName());
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
        } catch (AssertionError e){
            throw new AssertionError("로그인해주세요.");
        }
    }
    
}
