package com.auction.controller.home;

import com.auction.constants.Constants;
import com.auction.constants.ContentType;
import com.auction.dao.AnnounceDAO;
import com.auction.dao.ContentDAO;
import com.auction.dao.GoodsDAO;
import com.auction.dao.ImageDAO;
import com.auction.domain.Goods;
import com.auction.domain.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletResponse;

@Controller
public class WelcomeController {
    @Autowired
    private ImageDAO imageDAO;
    @Autowired
    private GoodsDAO goodsDAO;
    @Autowired
    private ContentDAO contentDAO;
    @Autowired
    private AnnounceDAO announceDAO;

    @RequestMapping(value = "/home/index")
    public String index(Model model) {
        model.addAttribute("images", imageDAO.findByType(Image.HOME_IMAGE_TYPE));
        model.addAttribute("announces", announceDAO.listByStatus(Constants.ACTIVE_STATUS));
        model.addAttribute("contents", contentDAO.findByType(ContentType.news));
        model.addAttribute("goodsList", goodsDAO.listByStatus(Constants.ACTIVE_STATUS));
        return "home/index";
    }

    @RequestMapping(value = "")
    public String reloadPage(HttpServletResponse resp) {
        return "forward:/home/index";
    }

    @RequestMapping(value = "/home/aboutUs")
    public String aboutUs() {
        return "home/aboutUs";
    }

    @RequestMapping(value = "/home/contactUs")
    public String contactUs() {
        return "home/contactUs";
    }

    @RequestMapping(value = "/home/announce")
    public String announce(Model model) {
        return "home/announce";
    }

    @RequestMapping(value = "/home/product")
    public String product(Model model) {
        return "home/product";
    }

    @RequestMapping(value = "/home/news")
    public String news(Model model) {
        return "home/news";
    }
    @RequestMapping(value = "/home/rules")
    public String rules(Model model) {
        return "home/rules";
    }

}
