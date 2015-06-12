package com.auction.controller.bo;

/**
 * Created by loovis on 8/28/14.
 */

import com.auction.dao.ArticleDAO;
import com.auction.domain.Article;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/bo/article")
public class ArticleController {
    @Autowired
    private ArticleDAO articleDAO;
    @Transactional
    @RequestMapping(value = "{entityClass}/{entityId}", method = RequestMethod.POST)
    public String addOrModify(Model model, @PathVariable Long entityId, @PathVariable String entityClass,Article article) {
        Article db = articleDAO.findByEntityId(entityId);
        if (db==null){
            articleDAO.saveOrUpdate(article);
        }else {
            db.setDetail(article.getDetail());
            articleDAO.update(db);
        }
        return "redirect:/bo/" + entityClass + "/detail/" + entityId;
    }

    @Transactional
    @RequestMapping(value = "{entityClass}/{entityId}", method = RequestMethod.GET)
    public String detail(Model model, @PathVariable Long entityId,@PathVariable String entityClass) {
        model.addAttribute("article",articleDAO.findByEntityId(entityId));
        model.addAttribute("entityClass",entityClass);
        model.addAttribute("entityId",entityId);
        return "bo/articleDetails";
    }
}
