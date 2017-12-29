package controller;

import domain.BoardVO;
import domain.SrcVO;
import domain.ReplyVO;
import domain.SrcReplyVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.SrcService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.SrcReplyService;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/edit/*")
public class EditController {

    @Inject
    private SrcService service;
    //----------------------------------------------------------------------src 부분
    @RequestMapping(value = "/editPage", method = RequestMethod.GET)
    public void newEditView()throws Exception {
//        service.readSrc(request, vo);
//        System.out.println(vo);
    }

    @RequestMapping(value = "/editPage/*", method = RequestMethod.GET)
    public String editView(HttpServletRequest request, Model model)throws Exception {
        SrcVO vo = new SrcVO();
        vo = service.readSrc(request, vo);
        System.out.println(vo);

        model.addAttribute("SrcVO", vo);
        return "forward:/edit/editPage";
    }

    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseEntity<String> srcSave(HttpServletRequest request, HttpServletResponse response, @RequestBody SrcVO vo) throws Exception{

        ResponseEntity<String> entity = new ResponseEntity<>(service.saveSrc(request, response, vo), HttpStatus.OK);

        return entity;
    }

    //----------------------------------------------------------------------



    //----------------------------------------------------------------------reply 부분

    // REST : Representational State Transfer
    // 하나의 URI가 하나의 고유한 리소스를 대표하도록 설계된 개념

    // http://localhost/list?src_id=1 ==> url+파라미터
    // http://localhost/list/1 ==> url
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
        public void insert(@ModelAttribute SrcReplyVO vo, HttpSession session) throws Exception {
            Integer userId = (Integer) session.getAttribute("userId");
            vo.setReplyWriter(userId);
            srcReplyService.create(vo);
        }

        // 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
        @RequestMapping("srcList.do")
        public ModelAndView list(@RequestParam String srcId, ModelAndView mav) throws Exception {
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
        public List<SrcReplyVO> srcListJson(@RequestParam String srcId) throws Exception {
//            List<SrcReplyVO> list= srcReplyService.list(srcId);
//            return list;
              return srcReplyService.list(srcId);
        }
    }





    //----------------------------------------------------------------------

    //----------------------------------------------------------------------unitTest 부분
    @RequestMapping(value = "/unitTest", method = RequestMethod.GET)
    public void unitTestView(){

    }
    //----------------------------------------------------------------------
}