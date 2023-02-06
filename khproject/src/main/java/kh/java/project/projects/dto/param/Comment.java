package kh.java.project.projects.dto.param;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Builder
@ToString
public class Comment {
    private String content;
    private HashMap<String, Integer> reactionMap;
    private List<String> userReactionMap;
}
