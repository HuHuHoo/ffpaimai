package com.auction.controller.home;

import com.auction.constants.ContentType;
import com.auction.dao.ContentDAO;
import com.auction.domain.Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by loovis on 8/30/14.
 */
@Controller
@RequestMapping("/home/content")
public class HomeContentController {
    @Autowired
    private ContentDAO contentDAO;

    @RequestMapping(value = "index/{type}/{index}")
    public String index(Model model, @PathVariable int index, @PathVariable ContentType type) {
        List<Content> contents = contentDAO.findByType(type);
        Integer pre = (index >= 4) ? index - 4 : null;
        Integer after = (index + 4 >= contents.size()) ? null : index + 4;
        List<Content> result = contents.subList(index, (index + 4) < contents.size() ? index + 4 : contents.size());
        model.addAttribute("contents", result);
        model.addAttribute("pre", pre);
        model.addAttribute("after", after);
        model.addAttribute("type", type);
        return "home/contentIndex";
    }
    @RequestMapping(value = "detail/{id}/{type}", method = RequestMethod.GET)
    public String detail(Model model, @PathVariable Long id,@PathVariable ContentType type) {
        List<Content> contents = contentDAO.findByType(type);
        Long pre = null;
        Long after = null;
        int index = 0;
        Content content = null;
        for (; index < contents.size(); index++) {
            content = contents.get(index);
            if (id.equals(content.getId())) {
                break;
            }
        }
        if (index - 1 >= 0) {
            after = contents.get(index - 1).getId();
        }
        if (index + 1 < contents.size()) {
            pre = contents.get(index + 1).getId();
        }
        model.addAttribute("content", content);
        model.addAttribute("pre", pre);
        model.addAttribute("after", after);
        model.addAttribute("type", type);

        return "home/contentDetail";
    }


}
