package com.auction.controller.home;

import com.auction.constants.Constants;
import com.auction.constants.ContentType;
import com.auction.dao.AnnounceDAO;
import com.auction.dao.ArticleDAO;
import com.auction.dao.GoodsDAO;
import com.auction.domain.Announce;
import com.auction.domain.Content;
import com.auction.domain.Goods;
import com.auction.domain.Image;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by loovis on 8/30/14.
 */
@Controller
@RequestMapping("/home/announce")
public class AnnouncementController {
    @Autowired
    private AnnounceDAO announceDAO;

    @RequestMapping(value = "index/{recommend}/{fresh}/{index}")
    public String index(Model model, @PathVariable int index,@PathVariable int recommend,@PathVariable int fresh) {
        List<Announce> announces = announceDAO.findByRecommendAndFreshAndStatus(recommend,fresh,Constants.ACTIVE_STATUS);
        Integer pre = (index  >= 4) ? index - 4 : null;
        Integer after = (index + 4 >=announces.size() )? null: index+4;
        List<Announce> result = announces.subList(index, (index + 4) < announces.size() ? index + 4 : announces.size());
        model.addAttribute("announces",result);
        model.addAttribute("pre",pre);
        model.addAttribute("after",after);
        model.addAttribute("recommend",recommend);
        model.addAttribute("fresh",fresh);
        return "home/announceIndex";
    }
    @RequestMapping(value = "detail/{id}/{recommend}/{fresh}", method = RequestMethod.GET)
    public String detail(Model model, @PathVariable Long id,@PathVariable int recommend,@PathVariable int fresh) {
        List<Announce> announces = announceDAO.findByRecommendAndFreshAndStatus(recommend, fresh, Constants.ACTIVE_STATUS);
        Long pre = null;
        Long after = null;
        int index = 0;
        Announce announce = null;
        for (; index < announces.size(); index++) {
            announce = announces.get(index);
            if (id.equals(announce.getId())) {
                break;
            }
        }
        if (index - 1 >= 0) {
            after = announces.get(index - 1).getId();
        }
        if (index + 1 < announces.size()) {
            pre = announces.get(index + 1).getId();
        }
        model.addAttribute("announce", announce);
        model.addAttribute("pre", pre);
        model.addAttribute("after", after);
        model.addAttribute("recommend", recommend);
        model.addAttribute("fresh", fresh);

        return "home/announceDetail";
    }
}
