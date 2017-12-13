package controller;

import domain.Criteria;
import domain.PageMaker;
import domain.ReplyVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import service.ReplyService;

import javax.inject.Inject;
import javax.xml.ws.Response;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/replies")
public class ReplyController {

    @Inject
    private ReplyService service;

    //    새로운 댓글을 등록하는데 성공,실패
    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<String> register(@RequestBody ReplyVO vo) {

        ResponseEntity<String> entity = null;
        ;
        try {
            //생성
            service.insertReply(vo);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            //400를 결과로 전송한다.
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    //게시글 번호로 글 찾기
    @RequestMapping(value = "/all/{boardId}", method = RequestMethod.GET)
    public ResponseEntity<List<ReplyVO>> list(
            @PathVariable("boardId") Integer boardId) {

        ResponseEntity<List<ReplyVO>> entity = null;
        try {
            entity = new ResponseEntity<>(
                    service.listReply(boardId), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    //수정
    @RequestMapping(value = "/{replyId}",
            method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> update(
            @PathVariable("replyId") Integer replyId,
            @RequestBody ReplyVO vo) {

        ResponseEntity<String> entity = null;
        try {
            vo.setReplyId(replyId);
            service.updateReply(vo);

            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(
                    e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    //삭제

    //페이징 처리
    @RequestMapping(value = "/{boardId}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPage(
            @PathVariable("boarId") Integer boarId,
            @PathVariable("page") Integer page) {
    //화면으로 전달되는 Map데이터
        ResponseEntity<Map<String, Object>> entity = null;
        try {
            Criteria cri = new Criteria();
            cri.setPage(page);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);

            Map<String, Object> map = new HashMap<String, Object>();
            List<ReplyVO> list = service.listReplyPage(boarId, cri);

            map.put("list", list);

            int replyCount = service.count(boarId);
            pageMaker.setTotalCount(replyCount);

            map.put("pageMaker", pageMaker);

            entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.MULTI_STATUS.OK);

        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
}
