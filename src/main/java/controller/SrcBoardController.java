package controller;

import domain.Criteria;
import domain.PageMaker;
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
    public void srcList(Criteria cri, HttpServletRequest request, Model model) throws Exception {

        System.out.println(cri.getPage());
        if(cri.getPerPageNum() == 10){
            cri.setPerPageNum(6);
        }
        model.addAttribute("list", service.srcList(cri));
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.listCountCriteria(cri));

        model.addAttribute("pageMaker", pageMaker);
    }
}
