package com.auction.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.auction.dao.UserDAO;
import com.auction.domain.User;

@Controller
@RequestMapping("/cas")
public class CasController {
	@Autowired
	private UserDAO userDAO;

	@RequestMapping(value = "login")
	public String login() {
		return "login";
	}

	@RequestMapping(value = "loginFailed")
	public String loginFailed(Model model,HttpServletRequest request) {
		Object exception = request.getSession().getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		if (exception instanceof DisabledException) {
			model.addAttribute("msg", "您的帐号已经被禁用，请联系管理员.");
		}else{
			model.addAttribute("msg", "登陆失败,用户名或密码错误,请重新输入正确的账号密码.");
		}
		return "login";
	}

	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		SecurityContextHolder.clearContext();
		return "login";
	}

	@RequestMapping(value = "toFindPassWord")
	public String toFindPassWord() {
		return "findPassword";
	}

	@Transactional
	@RequestMapping(value = "findPassWord")
	public String findPassWord(Model model, @RequestParam String name, HttpServletRequest request) {
		if (StringUtils.isBlank(name)) {
			model.addAttribute("message", "名称或者密码不能为空！");
			return "findPassword";
		}
		User user = userDAO.findUserByNameOrEmail(name, name);
		if (user != null) {
		} else {
			model.addAttribute("message", "您的用户名或者邮箱错误！");
		}
		return "findPassword";
	}
}
