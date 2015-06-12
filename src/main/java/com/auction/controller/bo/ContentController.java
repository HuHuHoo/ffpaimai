package com.auction.controller.bo;

import com.auction.constants.Constants;
import com.auction.constants.ContentType;
import com.auction.dao.ContentDAO;
import com.auction.domain.Content;
import com.auction.domain.Goods;
import com.auction.util.MessageUtil;
import org.apache.commons.io.FileUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by loovis on 8/31/14.
 */
@Controller
@RequestMapping("/bo/content")
public class ContentController {
    @Autowired
    private ContentDAO contentDAO;

    @RequestMapping(value = "{type}/list", method = RequestMethod.GET)
    public String list(Model model, @PathVariable ContentType type) {
        model.addAttribute("contents", contentDAO.findByType(type));
        model.addAttribute("type", type);
        return "bo/listContent";
    }

    @RequestMapping(value = "{type}/{id}", method = RequestMethod.GET)
    public String detail(Model model, @PathVariable ContentType type, @PathVariable Long id) {
        model.addAttribute("content", contentDAO.findById(id));
        model.addAttribute("type", type);
        return "bo/contentDetail";
    }

    @RequestMapping(value = "{type}/addOrModify", method = RequestMethod.GET)
    public String toAddOrModify(Model model, @PathVariable ContentType type, @RequestParam(required = false) Long contentId) {
        model.addAttribute("content", contentDAO.findById(contentId));
        model.addAttribute("contentId", contentId);
        model.addAttribute("type", type);
        return "bo/addOrModifyContent";
    }

    @Transactional
    @RequestMapping(value = "{type}/addOrModify", method = RequestMethod.POST)
    public String addOrModify(Model model, @PathVariable ContentType type, @RequestParam(required = false) Long contentId, Content content) throws IOException {
        Content db = contentDAO.findById(contentId);
        if (db != null) {
            db.setSummary(content.getSummary());
            db.setDetail(content.getDetail());
            db.setType(content.getType());
            db.setName(content.getName());
            contentDAO.update(db);
            return "redirect:/bo/content/" + type.name() + "/" + db.getId() + MessageUtil.createMsg("修改成功！");

        } else {
            content.setType(type);
            contentDAO.saveOrUpdate(content);
            return "redirect:/bo/content/" + type.name() + "/" + content.getId() + MessageUtil.createMsg("添加成功！");
        }

    }
}
