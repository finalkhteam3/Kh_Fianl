package kh.java.project.projects.dto.param;

import kh.java.project.member.entity.Authorities;
import lombok.*;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProjectAuthorities {
    //private Project project;
    private String no;
    private String name;
    private String info;
    private String iconPath;
    private String id;
    private int result;
    
	public void setResult(int result) {
		this.result = result;
	}
    
}
