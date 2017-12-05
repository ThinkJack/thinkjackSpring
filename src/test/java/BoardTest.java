import domain.BoardVO;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import persistence.BoardDAO;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/**/applicationContext.xml"})
public class BoardTest {

    @Inject
    private BoardDAO dao;

    @Before
    public void BeforeTest() throws Exception{
        System.out.println("Before create Board");
        BoardVO vo = new BoardVO();

        vo.setBoardContent("첫번째 본문");
        vo.setBoardTitle("첫번째 제목");
        vo.setBoardWriter("user00");
        vo.setBoardCategoryName("free");
        dao.createBoard(vo);
    }

    @After
    public void AfterTest() throws Exception{
        System.out.println("After Truncate BoardTable");


        dao.trancate();
    }


    // 게시판에 글을 추가하고 그 글에 다시 받아온다.
    @Test
    public void Test1() throws Exception {

        BoardVO vo = new BoardVO();

        vo.setBoardContent("새로운 본문");
        vo.setBoardTitle("새로운 제목");
        vo.setBoardWriter("user00");
        vo.setBoardCategoryName("free");
        dao.createBoard(vo);

        List<BoardVO> boardList = dao.readAllBoard();

        vo = boardList.get(0);

        System.out.println(vo);
    }

    // 추가되어 있는 글을 가져온다
    @Test
    public void Test2() throws Exception{
        BoardVO vo = dao.readAllBoard().get(0);

        System.out.println(vo);
    }

    // 게시판에 그 글을 업데이트 한다.
    @Test
    public void Test3() throws Exception{
        BoardVO vo;

        List<BoardVO> boardList = dao.readAllBoard();

        System.out.println(Arrays.toString(boardList.toArray()));

        vo = boardList.get(0);

        vo.setBoardContent("업데이트 본문");
        vo.setBoardTitle("업데이트 제목");

        System.out.println(vo);

        dao.updateBoard(vo);

        System.out.println(dao.readAllBoard().get(0).equals(vo));



    }

    // 게시판에 글을 하나 추가하고 그 글을 삭제한다.
    @Test
    public void Test4() throws Exception{
        BoardVO vo = new BoardVO();

        vo.setBoardContent("새로운 본문");
        vo.setBoardTitle("새로운 제목");
        vo.setBoardWriter("user00");
        vo.setBoardCategoryName("free");
        dao.createBoard(vo);
        System.out.println(dao.readAllBoard().size());
        List<BoardVO> boardList = dao.readAllBoard();

        vo = boardList.get(0);

        System.out.println(vo);

        dao.deleteBoard(vo.getBoardId());

        System.out.println(dao.readAllBoard().size());
    }

    //게시판에 모든 글을 가져와서 보여준다.

    @Test
    public void Test5() throws Exception{
        BoardVO vo = new BoardVO();

        vo.setBoardContent("새로운 본문");
        vo.setBoardTitle("새로운 제목");
        vo.setBoardWriter("user00");
        vo.setBoardCategoryName("free");
        dao.createBoard(vo);  dao.createBoard(vo);  dao.createBoard(vo);
        dao.createBoard(vo);  dao.createBoard(vo);  dao.createBoard(vo);

        List<BoardVO> list = dao.readAllBoard();

        System.out.println(Arrays.toString(list.toArray()));
    }

    // 게시판에 free 카테고리를 가져와서 보여준다.

    @Test
    public void Test6() throws Exception{

        BoardVO vo = new BoardVO();

        vo.setBoardContent("새로운 본문");
        vo.setBoardTitle("새로운 제목");
        vo.setBoardWriter("user00");
        vo.setBoardCategoryName("free");

        dao.createBoard(vo);  dao.createBoard(vo);  dao.createBoard(vo);
        dao.createBoard(vo);  dao.createBoard(vo);  dao.createBoard(vo);

        List<BoardVO> list = dao.readCategoryBoard("free");
        List<BoardVO> list2 = dao.readCategoryBoard("QnA");

        System.out.println(Arrays.toString(list.toArray()));
        System.out.println(Arrays.toString(list2.toArray()));
    }


}
