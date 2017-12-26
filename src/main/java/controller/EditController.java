package controller;

import domain.SrcVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.SrcService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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


    //----------------------------------------------------------------------



    //----------------------------------------------------------------------reply 부분
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------unitTest 부분
    @RequestMapping(value = "/unitTest", method = RequestMethod.GET)
    public void unitTestView(){

    }
    //----------------------------------------------------------------------
}