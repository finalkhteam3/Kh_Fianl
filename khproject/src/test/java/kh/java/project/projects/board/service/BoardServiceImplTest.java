package kh.java.project.projects.board.service;

import kh.java.project.config.Configure;
import kh.java.project.projects.dto.param.Member;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

public class BoardServiceImplTest extends Configure {

    @Autowired BoardService boardService;

    @Test
    public void getAllMembers() {
        //given
        String projectNo = "KHF3";
        String keyword = "kk";
        //when
        List<Member> allMembers = boardService.getAllMembers(projectNo, keyword);
        //then
        System.out.println("allMembers = " + allMembers);
    }
}