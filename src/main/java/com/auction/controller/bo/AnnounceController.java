package com.auction.controller.bo;

import com.auction.constants.Constants;
import com.auction.constants.ContentType;
import com.auction.constants.GoodsType;
import com.auction.dao.AnnounceDAO;
import com.auction.domain.Announce;
import com.auction.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by loovis on 9/9/14.
 */
@Controller
@RequestMapping("/bo/announce")
public class AnnounceController {
    @Autowired
    private AnnounceDAO announceDAO;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("announces", announceDAO.listAll());
        return "bo/listAnnounce";
    }


    @Transactional
    @ResponseBody
    @RequestMapping(value = "ajax/switchStatus/{id}", method = RequestMethod.GET)
    public String switchStatus(Model model, @PathVariable Long id) {
        Announce announce = announceDAO.findById(id);
        announce.setStatus((announce.getStatus() + 1) % 2);
        return Constants.OK;
    }
  @Transactional
    @ResponseBody
    @RequestMapping(value = "ajax/switchRecommend/{id}", method = RequestMethod.GET)
    public String switchRecommend(Model model, @PathVariable Long id) {
        Announce announce = announceDAO.findById(id);
        announce.setRecommend((announce.getRecommend() + 1) % 2);
        return Constants.OK;
    }
  @Transactional
    @ResponseBody
    @RequestMapping(value = "ajax/switchFresh/{id}", method = RequestMethod.GET)
    public String switchFresh(Model model, @PathVariable Long id) {
        Announce announce = announceDAO.findById(id);
        announce.setFresh((announce.getFresh() + 1) % 2);
        return Constants.OK;
    }

    @RequestMapping(value = "addOrModify", method = RequestMethod.GET)
    public String toAddOrModify(Model model, @RequestParam(required = false) Long announceId) {
        model.addAttribute("announce", announceDAO.findById(announceId));
        model.addAttribute("announceId", announceId);
        return "bo/addOrModifyAnnounce";
    }

    @Transactional
    @RequestMapping(value = "addOrModify", method = RequestMethod.POST)
    public String addOrModify(Model model, @RequestParam(required = false) Long announceId, Announce announce) throws IOException {
        model.addAttribute("types", GoodsType.values());
        if (announceId != null) {
            Announce db = announceDAO.findById(announceId);
            if (db == null) {
                model.addAttribute("warning", "要修改的拍品公告不存在！");
                model.addAttribute("announce", announce);
                return "bo/addOrModifyAnnounce";
            } else {
                db.setName(announce.getName());
                db.setStatus(announce.getStatus());
                db.setDetail(announce.getDetail());
                db.setTradeDate(announce.getTradeDate());
                db.setFresh(announce.getFresh());
                db.setLocation(announce.getLocation());
                db.setSummary(announce.getSummary());
                db.setRecommend(announce.getRecommend());
                announceDAO.update(db);
                return "redirect:/bo/announce/" + announceId + MessageUtil.createMsg("编辑成功！");

            }
        } else {
            announceDAO.saveOrUpdate(announce);
            return "redirect:/bo/announce/" + announce.getId() + MessageUtil.createMsg("添加成功！");
        }

    }

    @RequestMapping("{id}")
    public String detail(Model model, @PathVariable Long id) {
        model.addAttribute("announce", announceDAO.findById(id));
        return "bo/announceDetails";
    }
}
