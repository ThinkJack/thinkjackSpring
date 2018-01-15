package controller;

import domain.SrcLikeVO;
import domain.SrcVO;
import domain.SrcReplyVO;
import domain.UserVO;
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
import service.UserService;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/edit/*")
public class EditController {

    @Inject
    private SrcService service;

    @Inject
    private UserService userService;
    //----------------------------------------------------------------------src 부분
    @RequestMapping(value = "/editPage", method = RequestMethod.GET)
    public void newEditView(HttpSession session, Model model)throws Exception {
        SrcVO srcVO = new SrcVO();
        if(session.getAttribute("login") instanceof UserVO){
            UserVO userVO =(UserVO) session.getAttribute("login");
            if (userVO != null) {
                srcVO.setSrcWriterName(userVO.getUserName());
                srcVO.setSrcWriter(userVO.getUserId());
                srcVO.setSrcStatus(1);
            }
        }

        model.addAttribute("SrcVO", srcVO);
    }

    @RequestMapping(value = "/editPage/*", method = RequestMethod.GET)
    public String editView(HttpServletRequest request, Model model)throws Exception {
        Map map = service.readSrc(request);
        model.addAttribute("SrcVO", map.get("vo"));
        model.addAttribute("like", map.get("like"));
        return "/edit/editPage";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody String srcSave(HttpServletRequest request, HttpServletResponse response, @RequestBody SrcVO vo) throws Exception{
        return service.saveSrc(request, response, vo);
    }


    @RequestMapping(value = "/like", method = RequestMethod.POST)
    public @ResponseBody Map srcLike(HttpServletRequest request, @RequestBody SrcLikeVO vo) {
        return service.srcLike(request, vo);
    }
    //----------------------------------------------------------------------




    //----------------------------------------------------------------------

    //----------------------------------------------------------------------unitTest 부분
    @RequestMapping(value = "/unitTest", method = RequestMethod.GET)
    public void unitTestView(){

    }
    //----------------------------------------------------------------------
}