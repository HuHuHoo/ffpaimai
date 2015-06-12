package com.auction.controller.home;

import com.auction.constants.Constants;
import com.auction.constants.GoodsType;
import com.auction.dao.AnnounceDAO;
import com.auction.dao.ArticleDAO;
import com.auction.dao.GoodsDAO;
import com.auction.domain.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by loovis on 8/30/14.
 */
@Controller
@RequestMapping("/home/product")
public class HomeProductController {
    @Autowired
    private GoodsDAO goodsDAO;

    @RequestMapping(value = "{type}/{index}")
    public String index(Model model, @PathVariable int index, @PathVariable GoodsType type) {
        List<Goods> goodsList = goodsDAO.findByStatusAndType(Constants.ACTIVE_STATUS, type);
        Integer pre = (index >= 4) ? index - 4 : null;
        Integer after = (index + 4 >= goodsList.size()) ? null : index + 4;
        List<Goods> result = goodsList.subList(index, (index + 4) < goodsList.size() ? index + 4 : goodsList.size());
        model.addAttribute("result", result);
        model.addAttribute("pre", pre);
        model.addAttribute("after", after);
        model.addAttribute("type", type);
        return "home/productIndex";
    }



}
