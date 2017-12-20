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
    public ResponseEntity<String> register(@RequestBody ReplyVO vo) {

        ResponseEntity<String> entity = null;
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

    //   대댓글을 등록하는데 성공,실패
    @RequestMapping(value = "/re", method = RequestMethod.POST)
    public ResponseEntity<String> reRegister(@RequestBody ReplyVO vo) {

        ResponseEntity<String> entity = null;
        try {
            //생성
            service.reInsertReply(vo);
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


    //좋아요
    @ResponseBody
    @RequestMapping(value="/heart}",method=RequestMethod.POST,produces = "aplication/json")
    public String heart(@PathVariable("replyId") Integer replyId,@PathVariable("userId") Integer userId,Model mode, HttpSession session, UserVO userVO) throws Exception {
/*        this.replyId = replyId;//   대댓글 찾기
        this.userId = userId;
        this.mode = mode;
        this.session = session;
        this.userVO = userVO;*/
//            public  int heart (@RequestBody ReplyLikeVO vo)throws Exception{
        //  replyId,uerID의 값을 전달
//
//        int likeCheck = service.readLike(userNo, ReplyNo);
//
//        model.addAttribute("replyId",replyId);
//        model.addAttribute("UserId",userId);

        userVO = (UserVO) session.getAttribute("login");


//        if(likeCheck == 0) {
//0보다크면 delete,uodate return 0
            //0 insety, uodate return1
//        }

        return "/heart";
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

        ResponseEntity<String> entity = null;
        try {
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
            System.out.println(page+"페이징 처리?????");
            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);

            Map<String, Object> map = new HashMap<String, Object>();
            List<ReplyVO> list = service.listReplyPage(boarId, cri);

            map.put("list", list);

            int replyCount = service.count(boarId);
            pageMaker.setTotalCount(replyCount);
            System.out.println(replyCount+"페이징 처리2");
            map.put("pageMaker", pageMaker);

            entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.MULTI_STATUS.OK);
            System.out.println(entity+"페이징 처리3");
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
}
