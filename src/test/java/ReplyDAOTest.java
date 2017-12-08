import domain.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import persistence.ReplyDAO;

import javax.inject.Inject;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        locations = {"file:src/main/webapp/WEB-INF/applicationContext.xml"})
public class ReplyDAOTest {

    @Inject
    private ReplyDAO dao;
    //댓글을 추가
    @Test
    public void testCreate() throws Exception {

        ReplyVO reply = new ReplyVO();

        reply.setBoardId(1);
        reply.setReplyText("test댓글 입니다");
        reply.setReplyWirter("user1");
        dao.createReply(reply);

    }

    @Test
    public void testRead() throws Exception {

        ReplyVO reply = new ReplyVO();
        List<ReplyVO> replyVOList = dao.readReply(1);

        reply=replyVOList.get(0);

        System.out.println(reply);
    }

    @Test
    public void testUpdate() throws Exception {

        ReplyVO reply = new ReplyVO();
        reply.setBoardId(1);
        reply.setReplyText("수정합니다");
        dao.updateReply(reply);
    }

    @Test
    public void testDelete() throws Exception{

        dao.deleteReply(2);
    }


    @Test
    public void test1() throws Exception{

        //대댓글에 필요한건 유저Id,댓글번호
        ReplyVO reply = new ReplyVO();
        reply.setBoardId(1);
        reply.setReplyParent(1);
        reply.setReplyText("대댓글");
        reply.setReplyWirter("user00");
        dao.createReply(reply);
    }

    @Test
    public void test2() throws Exception{

        //대댓글 목록 읽어오기

        ReplyVO reply = new ReplyVO();
        List<ReplyVO> replyVOList = dao.readReply(1);
        reply=replyVOList.get(0);

        System.out.println(rereply);
    }


}
