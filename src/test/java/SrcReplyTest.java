import domain.Criteria;
import domain.PageMaker;
import domain.SrcReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import persistence.SrcReplyDAO;
import service.SrcReplyService;

import javax.inject.Inject;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/**/applicationContext.xml"})
public class SrcReplyTest {

    @Inject
    private SrcReplyDAO dao;

    @Inject
    private SrcReplyService service;

    private SrcReplyVO vo = new SrcReplyVO();
//    private SrcReplyDAO srcReplyDao;

    // 댓글 목록
//    @Test
//    public void listTest() throws Exception {
//
//        System.out.println(service.list("STklji"));
//    }

//   @Test
//    public void infiniteScrollDownTest() throws Exception{
//       System.out.println(service.infiniteScrollDown(7));
//}

    // 댓글 작성
    @Test
    public void createTest() throws Exception{
//        vo.setSrcId("STklji");
////        vo.setReplyText("테스트~~");
////        vo.setReplyStatus(1);
////        vo.setReplyWriter(1);
////        System.out.println(vo);
////        service.create(vo);
//        var page = 1;
//        var srcId = 'STklji';

        Criteria cri = new Criteria();
//        cri.setPage();

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);

        Map<String, Object> map = new HashMap<String, Object>();
        List<SrcReplyVO> list = service.list("STklji", cri);

        map.put("list", list);
        System.out.println(list);
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