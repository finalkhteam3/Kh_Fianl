package kh.java.project.projects.dto.param;

import lombok.*;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Progress {
    private int progress;
    private String name;
    private int rank;
}
