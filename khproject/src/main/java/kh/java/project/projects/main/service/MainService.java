package kh.java.project.projects.main.service;

import kh.java.project.projects.dto.param.*;

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
    List<Issue> getIssueList(String id, int page, int selectNum);

    /**
     * 메인화면에서 검색하는 기능으로, 키워드를 받아와서 검색
     * @param page = 10으로 고정값
     */
    List<Issue> getSearchAllIssueList(String id, int page, String keyword);
}
