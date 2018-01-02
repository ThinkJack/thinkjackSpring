package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.SrcService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/srcBoard/*")
public class SrcBoardController {

    @Inject
    private SrcService service;

    //--------------------------------------------------------------------------------------------------src게시판 관련 코드들
    @RequestMapping(value = "/srcList", method = RequestMethod.GET)
    public void srcList(HttpServletRequest request, Model model) throws Exception {
        model.addAttribute("list", service.srcList());
    }
}
