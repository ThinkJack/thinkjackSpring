package controller;

import domain.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.SrcReplyService;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.xml.transform.TransformerException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static service.SrcReplyService.*;

@RestController
//@Controller
@RequestMapping("/srcReply")


public class SrcReplyController {

    @Inject
    SrcReplyService srcReplyService;

    // 댓글 입력
    @RequestMapping("srcInsert.do")
    public void insert(@RequestBody SrcReplyVO vo, HttpSession session) throws Exception {


//        Integer a = (Integer) session.getAttribute("userId");
//        vo.setReplyWriter(a);
//        System.out.println(vo.getReplyWriter());
        srcReplyService.create(vo);

//        System.out.println("bbb");
    }

    // 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
//    @RequestMapping("srcList.do")
//    public ModelAndView list(@RequestParam String srcId, ModelAndView mav) throws Exception {
//        List<SrcReplyVO> list = srcReplyService.list(srcId);
//        // 뷰이름 지정
//        mav.setViewName("srcBoard/srcReplyList");
//        // 뷰에 전달할 데이터 지정
//        mav.addObject("list", list);
//        // srcReplyList.jsp로 포워딩
//        return mav;
//    }

    //     댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
    @RequestMapping("srcListJson.do")
    @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
    public List<SrcReplyVO> srcListJson(@RequestParam String srcId , Criteria cri) throws Exception {
//        System.out.println("aaa");
//        return srcReplyService.list(srcId);
//        System.out.println("bbb");
        return srcReplyService.list(srcId, cri);

    }

//    @RequestMapping(value = "srcListJson.do/{srcId}", method = RequestMethod.GET)
//    public ResponseEntity<List<SrcReplyVO>> list(@PathVariable("srcId") String srcId) {
//        ResponseEntity<List<SrcReplyVO>> entity = null;
//        try {
//            entity = new ResponseEntity<>(
//                    srcReplyService.list(srcId), HttpStatus.OK);
//        } catch (Exception e) {
//            e.printStackTrace();
//            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//        }
//        return entity;
//    }

//    @RequestMapping(value = "test/ajax", method = RequestMethod.GET)
//    public void ajaxTest(){
//
//
//    }


    // 무한스크롤
//    @RequestMapping(value="/infiniteScrollDown", method = RequestMethod.POST)
//    public @ResponseBody List<SrcReplyVO>
//        infiniteScrollDownPOST(@RequestBody SrcReplyVO srcReplyVO) throws Exception {
//
////        logger.info("infiniteScrollDownPost is called...");
//        Integer rePlyIdToStart = srcReplyVO.getReplyId()-1;
//        System.out.println(srcReplyService.infiniteScrollDown(rePlyIdToStart));
//        return  srcReplyService.infiniteScrollDown(rePlyIdToStart);
//    }


    //수정
    @RequestMapping(value = "srcUpdate.do/{replyId}", method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> update(
            @PathVariable("replyId") Integer replyId, @RequestBody SrcReplyVO vo) {


        ResponseEntity<String> entity = null;
        try {

//            vo.setReplyId(replyId);
            srcReplyService.update(vo);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(
                    e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    //삭제
    @RequestMapping(value = "srcDelete.do/{replyId}", method = RequestMethod.DELETE)
    public ResponseEntity<String> remove(

            @PathVariable("replyId") Integer replyId) {

        ResponseEntity<String> entity = null;
        try {
            srcReplyService.delete(replyId);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(
                    e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    //페이징 처리 전체목록
    @RequestMapping(value = "/{srcId}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPage(
            @PathVariable("srcId") String srcId,
            @PathVariable("page") Integer page) {

        //화면으로 전달되는 Map데이터
        ResponseEntity<Map<String, Object>> entity = null;
        try {
            Criteria cri = new Criteria();
            cri.setPage(page);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);

            Map<String, Object> map = new HashMap<String, Object>();
            List<SrcReplyVO> list = srcReplyService.list(srcId, cri);

            map.put("list", list);

            int replyCount = srcReplyService.count(srcId);
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




