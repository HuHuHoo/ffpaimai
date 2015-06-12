package com.auction.controller.bo;

import com.auction.dao.ImageDAO;
import com.auction.domain.Image;
import com.auction.service.UploadService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by lb on 2014/8/24.
 */
@Controller
@RequestMapping(value = "/bo/homeImage")
public class HomeImageController {
    @Autowired
    private ImageDAO imageDAO;
    @Autowired
    private UploadService uploadService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("images", imageDAO.findByType(Image.HOME_IMAGE_TYPE));
        return "bo/listHomeImage";
    }

    @Transactional
    @RequestMapping(value = "upload/{id}", method = RequestMethod.POST)
    public String addOrModify(@PathVariable Long id, @RequestParam MultipartFile upload) {
        Image image = imageDAO.findById(id);
        String url = uploadService.upload(upload);
        if (StringUtils.isNotBlank(url)){
            image.setPath(url);
        }
        return "redirect:/bo/homeImage/list";
    }
}
