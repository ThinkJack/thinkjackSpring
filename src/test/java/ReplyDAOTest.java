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
        reply.setBoardId(2);
        reply.setReplyText("test댓글2 입니다");
        /*존재한 User_name 이어야 한다*/
        reply.setReplyWirter("user02");
        dao.createReply(reply);
    }

    @Test
    public void testRead() throws Exception {

        ReplyVO reply = new ReplyVO();
        List<ReplyVO> replyVOList = dao.readReply(2);
        reply=replyVOList.get(0);
        System.out.println(reply);
    }

    @Test
    public void testUpdate() throws Exception {

        ReplyVO reply = new ReplyVO();
        reply.setBoardId(2);
        reply.setReplyText("2번째 Test");
        dao.updateReply(reply);
    }

    @Test
    public void testDelete() throws Exception{
    /*replyId 확인*/
        dao.deleteReply(6);
    }


    @Test
    public void test1() throws Exception{

        //대댓글에 필요한건 유저Id,댓글번호
        ReplyVO reply = new ReplyVO();
        reply.setBoardId(1);
        reply.setReplyParent(1);
        reply.setReplyText("대댓글");
        reply.setReplyWirter("user02");
        dao.createReply(reply);
    }

    @Test
    public void test2() throws Exception{

        //대댓글 목록 읽어오기

        ReplyVO rereply = new ReplyVO();
        List<ReplyVO> rereplyVOList = dao.reReadReply(3);
        rereply=rereplyVOList.get(0);
        System.out.println(rereply);
    }

    @Test
    public void test3() throws Exception{
        ReplyVO reply = new ReplyVO();
        reply.setReplyParent(1);
        reply.setReplyText("대댓글 수정");
        dao.updateReply(reply);
    }

    @Test
    public void test4() throws Exception{
        dao.reDeleteReply(1);

    }
}
