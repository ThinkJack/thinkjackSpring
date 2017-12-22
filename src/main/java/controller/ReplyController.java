package controller;

import domain.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.ReplyService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/replies")
public class ReplyController {

    @Inject
    private ReplyService service;
    private Integer replyId;
    private Integer userId;
    private Model mode;
    private HttpSession session;
    private UserVO userVO;

    //    새로운 댓글을 등록하는데 성공,실패
    @RequestMapping(value = "", method = RequestMethod.POST)
            public ResponseEntity<String>register(@RequestBody ReplyVO vo){
//    public @ResponseBody String  register(@RequestBody ReplyVO vo) {

        ResponseEntity<String> entity = null;
        try {
            //생성
            System.out.println(vo);
            service.insertReply(vo);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            //400를 결과로 전송한다.
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

//        int str = vo.getReplyParent();
//        String message = "{\"isParent\":\""+str+"\", \"data\":\""+"SUCCESS"+"\"}";
//        return message;
        return entity;

    }

    //   대댓글을 등록하는데 성공,실패
//    @RequestMapping(value = "/re", method = RequestMethod.POST)
//    public ResponseEntity<String> reRegister(@RequestBody ReplyVO vo) {
//        System.out.println("들어왔니");
//        ResponseEntity<String> entity = null;
//        try {
//            //생성
//            service.reInsertReply(vo);
//            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//            System.out.println("들어왔니??");
//        } catch (Exception e) {
//            e.printStackTrace();
//            //400를 결과로 전송한다.
//            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//
//            System.out.println("들어왔니ㅁㅁ");
//        }
//        return entity;
//    }


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

    //좋아요 부분
    @ResponseBody
    @RequestMapping(value = "/reHeart", method = RequestMethod.POST, produces = "application/json")
    public int reHeart(HttpServletRequest httpRequest) throws Exception {

        int reHeart = Integer.parseInt(httpRequest.getParameter("reHeart"));
        int replyId = Integer.parseInt(httpRequest.getParameter("replyId"));
        int userid = ((UserVO) httpRequest.getSession().getAttribute("login")).getUserId();

        ReplyLikeVO ReplyLikeVO = new ReplyLikeVO();

        ReplyLikeVO.setReplyId(replyId);
        ReplyLikeVO.setUserId(userid);

        System.out.println(reHeart+"reply");

        if (reHeart >= 1) {
            service.deleteReplyLike(ReplyLikeVO);
            reHeart = 0;
        } else {
            service.insertReplyLike(ReplyLikeVO);
            reHeart = 1;
        }

        return reHeart;
    }



    //수정
    @RequestMapping(value ="/{replyId}", method = {RequestMethod.PUT, RequestMethod.PATCH})
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
    @RequestMapping(value ="/{replyId}", method = RequestMethod.DELETE)
    public ResponseEntity<String> remove(

            @PathVariable("replyId") Integer replyId) {
System.out.println(replyId+"삭제값 넘어오나요?");

        ResponseEntity<String> entity = null;
        try {
            System.out.println(replyId+"삭제값 try 넘어오나요?");
            service.deleteReply(replyId);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(
                    e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    //페이징 처리
    @RequestMapping(value = "/{boardId}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPage(
            @PathVariable("boardId") Integer boarId,
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
