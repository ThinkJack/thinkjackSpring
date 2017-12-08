package controller;


import domain.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.BoardService;
import sun.misc.Request;

import javax.inject.Inject;

@Controller
@RequestMapping("/test/*")
public class testController {

    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Inject
    private BoardService service;


    @RequestMapping(value = "/cummunity", method = RequestMethod.GET)
    public void introGET(BoardVO board, Model model) throws Exception {

        logger.info("register GET ...........");
    }

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public void joinGET(BoardVO board, Model model) throws Exception {

        logger.info("register GET ...........");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void loginGET(BoardVO board, Model model) throws Exception {

        logger.info("login GET ...........");
    }

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public void mainGET(BoardVO board, Model model) throws Exception {

        logger.info("main GET ...........");
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(BoardVO board, Model model) throws Exception {

        logger.info("modify GET ...........");
    }

    @RequestMapping(value = "/mypage", method = RequestMethod.GET)
    public void mypageGET(BoardVO board, Model model) throws Exception {

        logger.info("mypage GET ...........");
    }

    @RequestMapping(value = "/qna", method = RequestMethod.GET)
    public void qnaGET(BoardVO board, Model model) throws Exception {

        logger.info("qnaGET ...........");
    }

    @RequestMapping(value = "/qnanote", method = RequestMethod.GET)
    public void qnanoteGET(BoardVO board, Model model) throws Exception {

        logger.info("qnaGET ...........");
    }

    @RequestMapping(value = "/releasenote", method = RequestMethod.GET)
    public void releasenoteGET(BoardVO board, Model model) throws Exception {

        logger.info("releasenoteGET ...........");
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception{



        rttr.addFlashAttribute("msg","success");
        return "redirect:/freeBoard/list";
    }

    @RequestMapping(value = "/intro", method = RequestMethod.GET)
    public void intro(Model model) throws Exception {

        model.addAttribute("list", service.listAllBoard());
    }


}
