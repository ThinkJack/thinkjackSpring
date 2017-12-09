package controller;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oracle.javafx.jmx.json.JSONException;
import domain.BoardVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import java.util.ArrayList;
import java.util.List;

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

    @RequestMapping(value = "/list", method = RequestMethod.GET, headers="Accept=application/json")
    public void listAll(Model model) throws Exception {

        logger.info("show all list......................");

        List<BoardVO> boardVOS = service.listAllBoard();


        JSONObject listObj = new JSONObject();
        JSONArray list = new JSONArray();
        for(int i = 0 ; i < boardVOS.size() ; i++) {

            JSONObject vo = new JSONObject();

            vo.put("boardId",boardVOS.get(i).getBoardId());
            vo.put("boardTitle",boardVOS.get(i).getBoardTitle());
            vo.put("boardWriter",boardVOS.get(i).getBoardWriter());
            vo.put("boardViewcnt",boardVOS.get(i).getBoardViewcnt());
            vo.put("boardLikecnt",boardVOS.get(i).getBoardLikecnt());

            list.add(i,vo);
        }
        listObj.put("BoardVO",list);


        model.addAttribute("list",listObj);
    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("boardId") int boardId, Model model) throws Exception {

        model.addAttribute(service.readBoard(boardId));
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modify(int boardId,Model model) throws Exception{
        System.out.println(boardId+"get");
        model.addAttribute(service.readBoard(boardId));

    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
        System.out.println(board+"Post");
        service.updateBoard(board);
        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/freeBoard/list";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("boardId") int boardId, RedirectAttributes rttr) throws Exception {
        service.deleteBoard(boardId);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/freeBoard/list";
    }
}
