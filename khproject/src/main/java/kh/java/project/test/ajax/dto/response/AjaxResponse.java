package kh.java.project.test.ajax.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class AjaxResponse {
    private String no;
    private String name;
    private int inter;
    private String file;

    public AjaxResponse(String no, String name, int inter) {
        this.no = no;
        this.name = name;
        this.inter = inter;
    }
}
