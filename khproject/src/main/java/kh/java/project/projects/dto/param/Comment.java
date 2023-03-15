package kh.java.project.projects.dto.param;

import lombok.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private int seq;
    private String maker;
    private String content;
    private HashMap<String, Integer> reactionMap;
    private List<String> userReactionList;
}
