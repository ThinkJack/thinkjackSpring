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
@RequestMapping("/freeBoard/*")
public class BoardController {

    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Inject
    private BoardService service;


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(BoardVO board, Model model) throws Exception {

        logger.info("register GET ...........");
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception{

        System.out.println(board);

        service.insertBoard(board);

        rttr.addFlashAttribute("msg","success");
        return "redirect:/freeBoard/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void listAll(Model model) throws Exception {

        logger.info("show all list......................");
        model.addAttribute("list", service.listAllBoard());
    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("bno") int bno, Model model) throws Exception {

        model.addAttribute(service.readBoard(bno));
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modify(int bno,Model model) throws Exception{

        model.addAttribute(service.readBoard(bno));

    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {


        service.updateBoard(board);
        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/freeBoard/list";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
        service.deleteBoard(bno);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/freeBoard/list";
    }
}
