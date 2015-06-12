package com.auction.controller.bo;

import com.auction.constants.Constants;
import com.auction.dao.DispositionDAO;
import com.auction.domain.Disposition;
import com.auction.domain.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by loovis on 9/25/14.
 */
@Controller
@RequestMapping(value = "/bo/disposition")
public class DispositionController {
    @Autowired
    private DispositionDAO dispositionDAO;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("dispositionList", dispositionDAO.listAll());
        return "bo/listDisposition";
    }

    @RequestMapping("{id}")
    public String detail(Model model, @PathVariable Long id) {
        model.addAttribute("disposition", dispositionDAO.findById(id));
        return "bo/dispositionDetail";
    }

    @Transactional
    @ResponseBody
    @RequestMapping(value = "ajax/switchStatus/{id}", method = RequestMethod.GET)
    public String switchStatus(Model model, @PathVariable Long id) {
        Disposition disposition = dispositionDAO.findById(id);
        disposition.setStatus((disposition.getStatus() + 1) % 2);
        return Constants.OK;
    }

}
