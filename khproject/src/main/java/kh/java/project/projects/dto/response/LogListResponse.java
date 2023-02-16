package kh.java.project.projects.dto.response;

import java.util.List;

import kh.java.project.projects.dto.param.Log;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class LogListResponse {
	private List<Log> logList;
}
