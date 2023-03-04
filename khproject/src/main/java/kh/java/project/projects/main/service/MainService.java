package kh.java.project.projects.main.service;

import kh.java.project.projects.dto.param.*;
import kh.java.project.projects.dto.request.ProjectRequest;
import kh.java.project.projects.dto.response.ProjectListResponse;

import java.util.List;

public interface MainService {
    /**
     * 메인화면에서, 종모양 클릭시 표시되는 알림을 가져오는 기능.
     */
    List<Notify> getNotify(String id);

    /**
     * 메인화면에서, 종모양 클릭 후 화면을 옆으로 넘기거나, 메인화면 작업화면에서 혹인 가능한 로그값
     */
    List<Log> getLog(String id);

    /**
     * 메인화면에서 프로젝트 리스트를 가져오는 기능
     */
    List<Project> getProjectList(String id);

    /**
     * 메인화면에서 이슈 리스트를 가져오는 기능
     */
    List<Issue> getIssueList(String id, Integer page, Integer selectNum, String keyword);
    List<Issue> getIssueList(String id);

    /**
     * 메인화면에서 검색하는 기능으로, 키워드를 받아와서 검색
     * @param page = 10으로 고정값
     */
    List<Issue> getSearchAllIssueList(String id, int page, String keyword);

    /**
     * 메인화면에서 프로젝트를 생성하는 기능
     * 프로젝트 생성 단계
     * 1. 프로젝트 생성(Project 정보)
     * 2. 기본 Progress 구성(1. 할 일, 2. 진행 중, 3. 완료)
     * 3. 프로젝트 멤버에 프로젝트 생성자 추가
     */
    ProjectListResponse createProject(Project project, String id);
    
    public List<Project> selectList(String id);
    public Project selectOne(int no);
    public Integer insert(Project dto);
    public Integer update(Project dto);
    public Integer delete(int no);
}
