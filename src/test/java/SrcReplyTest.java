import domain.SrcReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import persistence.SrcReplyDAO;
import service.SrcReplyService;

import javax.inject.Inject;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/**/applicationContext.xml"})
public class SrcReplyTest {

//    @Inject
//    private SrcReplyDAO dao;

    @Inject
    private SrcReplyService service;

    private SrcReplyVO vo = new SrcReplyVO();

    // 댓글 목록
//    @Test
//    public List<SrcReplyVO> listTest(String srcId) throws Exception{
//
//    }


    // 댓글 작성
    @Test
    public void createTest() throws Exception{
        vo.setSrcId("vOJOTl");
        vo.setReplyText("우와! 훌륭합니다~~");
        vo.setReplyStatus(1);
        System.out.println(vo);
        service.create(vo);
    }
    // 댓글 수정
    @Test
    public void updateTest() throws Exception{
        vo.setReplyId(6);
        vo.setSrcId("VXNOvK");
        vo.setReplyText("다시 만들어 주세요2");
        vo.setReplyStatus(1);
        System.out.println(vo);
        service.update(vo);
    }
    // 댓글 삭제
    @Test
    public void deleteTest() throws Exception{
        service.delete(6);
    }
}