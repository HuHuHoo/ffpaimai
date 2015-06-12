package com.auction.controller.home;

import com.auction.constants.ContentType;
import com.auction.dao.ContentDAO;
import com.auction.domain.Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by loovis on 8/31/14.
 */
@Controller
@RequestMapping("/home/about")
public class AboutController {
    @Autowired
    private ContentDAO contentDAO;

    @RequestMapping(value = "{type}")
    public String recommend(Model model, ContentType type) {
        List<Content> contents = contentDAO.findByType(type);
        Content content = contents.isEmpty() ? null : contents.get(0);
        model.addAttribute("content", content);
        model.addAttribute("type", type);
        return "home/aboutIndex";
    }

}
