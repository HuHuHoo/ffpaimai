package com.auction.controller.bo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/bo")
public class BoWelcomeController {
    @RequestMapping(value = "index")
    public String index(Model model) {
        return "bo/index";
    }

    @RequestMapping(value = "")
    public String reloadPage(HttpServletResponse resp) {
        return "forward:/bo/index";
    }
}
