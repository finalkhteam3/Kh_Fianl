package kh.java.project.projects.issue.service;

import kh.java.project.projects.dto.param.Comment;
import kh.java.project.projects.dto.param.File;
import kh.java.project.projects.dto.param.Issue;
import kh.java.project.projects.dto.param.Log;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IssueService {
    /**
     * 이슈 상세보기 페이지에서 해당 이슈코드에 맞는 이슈 정보 가져오기
     * @param value 1은 에픽이고 2는 에픽 하위 3은 이슈의 하위이다.
     *              가령 roadMap 에서는 에픽이슈인 1번만 받아오고,
     *              board 페이지에서는 에픽 하위 이슈인 2번만 받아온다.
     */
    Issue getIssue(String projectNo, String issueNo, int value);

    /**
     * 이슈 상세보기 페이지에서 이슈 수정(pic, content 등등)
     */
    Issue updateIssue(Issue issue, String projectNo, String issueNo);

    /**
     * 이슈 상세보기 페이지에서 댓글 가져오기 기능
     */
    Comment getComment(String projectNo, String issueNo, String id);

    /**
     * 이슈 상세보기 페이지에서 댓글 작성 기능
     * 1. 댓글 작성 dao
     * 2. 원글 작성자 찾기 dao(projectNo와 issueNo를 사용해서 issue 의 Maker + PIC 찾기 -> Subscriber)
     * 3. 원글 작성자에게 알림 보내기 dao(content)
     */
    void createComment(String projectNo, String issueNo, String id, String content);

    /**
     * 이슈 상세보기 페이지에서 댓글 편집 기능
     */
    void updateComment(String projectNo, String issueNo, String id, Comment comment);

    /**
     * 이슈 상세보기 페이지에서 댓글 삭제 기능
     */
    void deleteComment(String projectNo, String issueNo, String id, int no);

    /**
     * 이슈 상세보기 페이지에서 댓글에 리액션 달기 기능
     * 1. 리액션 update dao
     *      ㄱ. 본인의 리액션 리스트를 mybatis 에 파라미터로 집어넣기
     *      ㄴ. mybatis 내부에서 파라미터 리스트 for 문을 통해 DB에 동일
     *      pn, in, id의 리액션이 있는지 체크함
     *      ㄷ. 만약 db에 있는 리액션이 파라미터 리스트 내부에 없다면,
     *      db에 있는 리액션을 삭제. 파라미터 내부에 있는 리액션이 db에 없다면
     *      db에 해당 리액션을 추가. 만약 파라미터에 있는 값과 리스트에 있는 값이
     *      동일하다면 아무일도 일어나지 않음.
     * 2. 댓글 작성자 찾기(comment.maker)
     * 3. 댓글 작성자에게 알림 보내기 dao(comment.userReaction)
     */
    void updateCommentReaction(String projectNo, String issueNo, String id, Comment comment);

    /**
     * 이슈 상세보기 페이지에서 로그 리스트 확인 기능
     */
    List<Log> getLog(String projectNo, String issueNo);

    /**
     * 이슈 상세보기 페이지에서 파일 리스트 확인 가능
     */
    List<File> getFiles(String projectNo, String issueNo);

    /**
     * 이슈 상세보기 페이지에서 파일 업로드 기능
     */
    void uploadedFiles(String projectNo, String issueNo, List<MultipartFile> files);


    /**
     * 이슈 상세보기 페이지에서 파일 삭제 기능(여러개 클릭해서 동시에)
     */
    void deleteFiles(String projectNo, String issueNo, List<File> fileList);
}
