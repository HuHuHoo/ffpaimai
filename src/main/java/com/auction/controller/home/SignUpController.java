package com.auction.controller.home;

import com.auction.constants.Constants;
import com.auction.dao.DispositionDAO;
import com.auction.domain.Article;
import com.auction.domain.Disposition;
import com.auction.domain.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by loovis on 8/30/14.
 */
@Controller
@RequestMapping("/home")
public class SignUpController {
    @Autowired
    private DispositionDAO dispositionDAO;

    @RequestMapping(value = "signUp", method = RequestMethod.GET)
    public String signUp(Model model) {
        return "home/signUp";
    }

    @Transactional
    @RequestMapping(value = "signUp", method = RequestMethod.POST)
    public String addOrModify(Disposition disposition) {
        dispositionDAO.saveOrUpdate(disposition);
        return "home/signUpSuccess";
    }

}
