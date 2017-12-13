import domain.ReplyLikeVO;
import domain.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import persistence.ReplyDAO;
import service.ReplyService;

import javax.inject.Inject;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        locations = {"file:src/main/webapp/WEB-INF/applicationContext.xml"})
public class ReplyDAOTest {

    @Inject
    private ReplyDAO dao;

    @Inject
    private ReplyService service;
    //    댓글을 추가
    @Test
    public void testCreate() throws Exception {

        ReplyVO reply = new ReplyVO();
        reply.setBoardId(1);
        reply.setReplyText("test");
        /*존재한 User_name 이어야 한다*/
        reply.setReplyWirter("user00");
        dao.createReply(reply);
    }

    //댓글 수정
    @Test
    public void testUpdate() throws Exception {

        ReplyVO reply = new ReplyVO();
        reply.setReplyId(1);
        reply.setReplyText("댓글 수정test1");
        dao.updateReply(reply);
    }

    //댓글 찾기
    @Test
    public void testRead() throws Exception {

        ReplyVO reply = new ReplyVO();
        List<ReplyVO> replyVOList = dao.readReply(1);
//        모든리스트를 가져온다
//        System.out.println(replyVOList);
//        0번째 댓글 가져온다
        reply=replyVOList.get(0);
        System.out.println(reply);
    }
    //삭제(댓글)
    @Test
    public void testDelete() throws Exception{
        dao.deleteReply(1);
    }


    @Test
    public void test1() throws Exception{

        //대댓글에 필요한건 유저Id,댓글번호
        ReplyVO reply = new ReplyVO();
        reply.setBoardId(1);
        reply.setReplyParent(1);
        reply.setReplyText("대댓글 test");
        reply.setReplyWirter("user02");
        System.out.println(reply);
        dao.reCreateReply(reply);

    }


    @Test
    public void test3() throws Exception{
        ReplyVO reply = new ReplyVO();
        reply.setReplyId(2);
        reply.setReplyText("대댓글 test2수정");
        dao.updateReply(reply);
    }

    @Test
    public void test2() throws Exception{
        //대댓글 목록 읽어오기
        ReplyVO rereply = new ReplyVO();
        List<ReplyVO> rereplyVOList = dao.reReadReply(2);
        rereply=rereplyVOList.get(0);
        System.out.println(rereply);
    }

    @Test
    public void test4() throws Exception{

        dao.deleteReply(3);

    }

//좋아요
    @Test
    public void testCreate2() throws Exception {

        ReplyLikeVO replyLike = new ReplyLikeVO();
        replyLike.setReplyId(1);
        replyLike.setUserId(1);
        dao.createReplyLikeCnt(replyLike);
    }

    @Test
    public void testDelete2() throws Exception{

        ReplyLikeVO replyLike = new ReplyLikeVO();
        replyLike.setReplyId(1);
        replyLike.setUserId(1);
        dao.deleteReplyLikeCnt(replyLike);

    }
    //좋아요 생성 test
    @Test
    public void testLikeCreate() throws  Exception{

        ReplyLikeVO replyLike = new ReplyLikeVO();
        replyLike.setReplyId(2);
        replyLike.setUserId(4);
        service.insertReplyLike(replyLike);
    }

    @Test
    public void testLikeDelete()throws  Exception{

        ReplyLikeVO replyLike = new ReplyLikeVO();
        replyLike.setReplyId(2);
        replyLike.setUserId(4);
        service.deleteReplyLike(replyLike);
    }

}
