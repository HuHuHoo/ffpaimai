package com.auction.controller.home;

import com.auction.constants.Constants;
import com.auction.dao.ArticleDAO;
import com.auction.dao.GoodsDAO;
import com.auction.domain.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/home/goods")
public class HomeGoodsController {
    @Autowired
    private ArticleDAO articleDAO;
    @Autowired
    private GoodsDAO goodsDAO;

    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public String detail(Model model, @PathVariable Long id) {

        List<Goods> goodsList = goodsDAO.listByStatus(Constants.ACTIVE_STATUS);
        Long pre = null;
        Long after = null;
        int index = 0;
        Goods goods = null;
        for (; index < goodsList.size(); index++) {
            goods = goodsList.get(index);
            if (id.equals(goods.getId())) {
                break;
            }
        }
        if (index - 1 >= 0) {
            after = goodsList.get(index-1).getId();
        }
        if (index + 1 < goodsList.size()) {
            pre = goodsList.get(index+1).getId();
        }
        model.addAttribute("goods", goods);
        model.addAttribute("pre", pre);
        model.addAttribute("after", after);

        return "home/goodsDetail";
    }


}
