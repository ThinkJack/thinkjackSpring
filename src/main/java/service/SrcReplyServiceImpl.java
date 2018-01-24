package service;

import domain.Criteria;
import domain.SrcReplyVO;
import org.springframework.stereotype.Service;
import persistence.SrcReplyDAO;

import javax.inject.Inject;
import java.util.List;

@Service
public class SrcReplyServiceImpl implements SrcReplyService {

    @Inject
    private SrcReplyDAO srcReplyDao;

    // 댓글 목록
    @Override
    public List<SrcReplyVO> list(String srcId, Criteria cri) throws Exception{

        return srcReplyDao.list(srcId, cri);
    }

    //댓글 수
    @Override
    public int count(String srcId) throws Exception {
        return srcReplyDao.count(srcId);
    }

    //무한스크롤
//    @Override
//    public List<SrcReplyVO> infiniteScrollDown(int replyId) throws Exception {
//        return srcReplyDao.infiniteScrollDown(replyId);
//
//    }



    // 댓글 작성
    @Override
    public void create(SrcReplyVO vo) throws Exception{
        srcReplyDao.create(vo);
    }
    // 댓글 수정
    @Override
    public void update(SrcReplyVO vo) throws Exception{
        srcReplyDao.update(vo);

    }
    // 댓글 삭제
    @Override
    public void delete(Integer replyId) throws Exception{
        srcReplyDao.delete(replyId);

    }


}
