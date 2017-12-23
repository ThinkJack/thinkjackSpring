package service;

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
    public List<SrcReplyVO> list(String srcId) {
        return srcReplyDao.list(srcId);
    }
    // 댓글 작성
    @Override
    public void create(SrcReplyVO vo) {
        srcReplyDao.create(vo);
    }
    // 댓글 수정
    @Override
    public void update(SrcReplyVO vo) {
        // TODO Auto-generated method stub

    }
    // 댓글 삭제
    @Override
    public void delete(Integer replyId) {
        // TODO Auto-generated method stub

    }

}
