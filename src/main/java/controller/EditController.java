package controller;

import domain.*;
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

    //----------------------------------------------------------------------src 부분
    @RequestMapping(value = "/editPage", method = RequestMethod.GET)
    public void newEditView(HttpSession session, Model model)throws Exception {

        SrcVO srcVO = new SrcVO();

        if(session.getAttribute("login") instanceof UserVO){
            UserVO userVO =(UserVO) session.getAttribute("login"); //로그인 했는지 비교 위해 session 가져옴

            if (userVO != null) { //로그인 되었을때 계정 이름 및 아이디 가져오기
                srcVO.setSrcWriterName(userVO.getUserName());
                srcVO.setSrcWriter(userVO.getUserId());
                srcVO.setSrcStatus(1); //로그인 되었을때 소스 공개를 기본값으로 넘김
            }
        }

        model.addAttribute("SrcVO", srcVO);
    }

    @RequestMapping(value = "/editPage/*", method = RequestMethod.GET)
    public String editView(HttpServletRequest request, Model model)throws Exception {
        Map map = service.readSrc(request); //요청값 넘겨서 해당 소스 파일들 가져오기
        //화면에서 값 뿌려주기 편하게 나눠서 보내기
        model.addAttribute("SrcVO", map.get("vo")); //소스코드
        model.addAttribute("like", map.get("like")); //유저가 좋아요 누른 값 가져오기
        return "/edit/editPage";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody String srcSave(HttpServletRequest request,
                                        @RequestBody SrcVO vo) throws Exception{
        return service.saveSrc(request, vo); //코드 저장

    }


    @RequestMapping(value = "/like", method = RequestMethod.POST)
    public @ResponseBody Map srcLike(HttpServletRequest request, @RequestBody SrcLikeVO vo) {
        return service.srcLike(request, vo); //좋아요 저장 및 삭제
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody String srcDelete(@RequestBody SrcVO vo) throws Exception{
        service.srcDelete(vo); //소스코드 삭제
        return "삭제 되었습니다.";
    }

    //----------------------------------------------------------------------JSAlgorithm 부분
    @RequestMapping(value = "/JSAlgorithm", method = RequestMethod.GET)
    public void JSAlgorithmView(){

    }
}