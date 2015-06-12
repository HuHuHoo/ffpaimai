package com.auction.controller.bo;

import com.auction.constants.Constants;
import com.auction.constants.GoodsType;
import com.auction.dao.GoodsDAO;
import com.auction.domain.Goods;
import com.auction.service.UploadService;
import com.auction.util.MessageUtil;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by loovis on 8/27/14.
 */
@Controller
@RequestMapping(value = "/bo/goods")
public class GoodsController {
    @Autowired
    private GoodsDAO goodsDAO;
    @Autowired
    private UploadService uploadService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("goodsList", goodsDAO.listAll());
        return "bo/listGoods";
    }

    @Transactional
    @ResponseBody
    @RequestMapping(value = "ajax/switchStatus/{id}", method = RequestMethod.GET)
    public String switchStatus(Model model, @PathVariable Long id) {
        Goods goods = goodsDAO.findById(id);
        goods.switchStatus();
        return Constants.OK;
    }

    @RequestMapping(value = "addOrModify", method = RequestMethod.GET)
    public String toAddOrModify(Model model, @RequestParam(required = false) Long goodsId) {
        model.addAttribute("types", GoodsType.values());
        model.addAttribute("goods", goodsDAO.findById(goodsId));
        model.addAttribute("goodsId", goodsId);
        return "bo/addOrModifyGoods";
    }

    @Transactional
    @RequestMapping(value = "addOrModify", method = RequestMethod.POST)
    public String addOrModify(Model model, @RequestParam(required = false) Long goodsId, Goods goods, @RequestParam MultipartFile upload) throws IOException {
        model.addAttribute("types", GoodsType.values());
        if (goodsId != null) {
            Goods db = goodsDAO.findById(goodsId);
            if (db == null) {
                model.addAttribute("warning", "要修改的拍品不存在！");
                model.addAttribute("goods", goods);
                return "bo/addOrModifyGoods";
            } else {
                db.setName(goods.getName());
                db.setPrice(goods.getPrice());
                db.setState(goods.getState());
                db.setType(goods.getType());
                db.setTradeDate(goods.getTradeDate());
                db.setDetail(goods.getDetail());
                db.setStatus(goods.getStatus());
                String url = uploadService.upload(upload);
                if (StringUtils.isNotBlank(url)){
                    db.setImage(url);
                }
                goodsDAO.update(db);
                return "redirect:/bo/goods/detail/" + goodsId + MessageUtil.createMsg("编辑成功！");

            }
        } else {
            String imgUrl = uploadService.upload(upload);
            if (StringUtils.isNotBlank(imgUrl)) {
                goods.setImage(imgUrl);
            } else {
                model.addAttribute("warning", "图片不能为空！");
                model.addAttribute("goods", goods);
                return "bo/addOrModifyGoods";
            }
            goodsDAO.saveOrUpdate(goods);
            return "redirect:/bo/goods/detail/" + goods.getId() + MessageUtil.createMsg("添加成功！");
        }

    }

    @RequestMapping("detail/{id}")
    public String detail(Model model, @PathVariable Long id) {
        model.addAttribute("goods", goodsDAO.findById(id));
        return "bo/goodsDetails";
    }
}