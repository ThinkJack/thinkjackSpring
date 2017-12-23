package controller;

import domain.ReplyVO;
import domain.SrcReplyVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.SrcReplyService;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/edit/*")
public class EditController {

    //----------------------------------------------------------------------src 부분
    @RequestMapping(value = "/editPage", method = RequestMethod.GET)
    public void editView() {
    }

    @RequestMapping(value = "/srcSave", method = RequestMethod.POST)
    public void srcSave(){

    }

    //----------------------------------------------------------------------



    //----------------------------------------------------------------------reply 부분

    // REST : Representational State Transfer
    // 하나의 URI가 하나의 고유한 리소스를 대표하도록 설계된 개념

    // http://localhost/spring02/list?src_id=1 ==> url+파라미터
    // http://localhost/spring02/list/1 ==> url
    // RestController은 스프링 4.0부터 지원
    // @Controller, @RestController 차이점은 메서드가 종료되면 화면전환의 유무
    //@Controller
    @RestController
    @RequestMapping("/srcReply/*")
    public class ReplyController {

        @Inject
        SrcReplyService srcReplyService;

        // 댓글 입력
        @RequestMapping("srcInsert.do")
        public void insert(@ModelAttribute SrcReplyVO vo, HttpSession session){
            Integer userId = (Integer) session.getAttribute("userId");
            vo.setReplyWriter(userId);
            srcReplyService.create(vo);
        }

        // 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
        @RequestMapping("srcList.do")
        public ModelAndView list(@RequestParam String srcId, ModelAndView mav){
            List<SrcReplyVO> list = srcReplyService.list(srcId);
            // 뷰이름 지정
            mav.setViewName("board/srcReplyList");
            // 뷰에 전달할 데이터 지정
            mav.addObject("list", list);
            // srcReplyList.jsp로 포워딩
            return mav;
        }

        // 댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
        @RequestMapping("srcListJson.do")
        @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
        public List<SrcReplyVO> srcListJson(@RequestParam String srcId){
//            List<SrcReplyVO> list= srcReplyService.list(srcId);
//            return list;
              return srcReplyService.list(srcId);
        }
    }





    //----------------------------------------------------------------------
}