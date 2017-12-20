import domain.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import persistence.BoardDAO;
import service.BoardService;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/**/applicationContext.xml"})
public class BoardTest {

    @Inject
    private BoardDAO dao;

    @Inject
    private BoardService boardService;

    @Before
    public void BeforeTest() throws Exception{
        System.out.println("Before create Board");
        BoardVO vo = new BoardVO();

        vo.setBoardContent("첫번째 본문");
        vo.setBoardTitle("첫번째 제목");
        vo.setBoardWriter("user00");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");  boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");
        boardService.insertBoard(vo,"qna");  boardService.insertBoard(vo,"qna");  boardService.insertBoard(vo,"qna");  boardService.insertBoard(vo,"qna");

    }

    @Test
    public void Test1() throws Exception{
        SearchCriteria cri =null;

//        System.out.println(dao.search(cri,"qna"));

        PageMaker pageMaker = new PageMaker();

        pageMaker.setCri(cri);

//        System.out.println(dao.searchCount(cri,"qna"));

    }





}
