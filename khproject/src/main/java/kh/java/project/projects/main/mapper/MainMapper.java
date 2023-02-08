package kh.java.project.projects.main.mapper;

import kh.java.project.projects.dto.param.Project;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {
    List<Project> getProjectList(String id);
}
