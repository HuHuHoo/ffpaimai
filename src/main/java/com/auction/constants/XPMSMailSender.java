package com.auction.constants;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public enum XPMSMailSender {
	SIGLETON;
	private JavaMailSenderImpl sender = new JavaMailSenderImpl();

	XPMSMailSender() {
		sender.setHost("mail.chinanetcenter.com");
		Properties javaMailProperties = new Properties();
		javaMailProperties.setProperty("mail.smtp.auth", "true");
		javaMailProperties.setProperty("mail.smtp.timeout", "60000");
		sender.setJavaMailProperties(javaMailProperties);
		sender.setUsername("xpms@chinanetcenter.com");
		sender.setPassword("center");
		sender.setDefaultEncoding(Constants.DEFAULT_ENCODING);
	}

	public JavaMailSenderImpl getMailSender() {
		return sender;
	}

	public void sendMail(String msg, String subject, List<File> attachments, String... tos) throws MessagingException, MailException, UnsupportedEncodingException {
		sender.send(createMailMsg(msg, subject, attachments, tos));
	}

	private MimeMessage createMailMsg(String msg, String subject, List<File> attachments, String... tos) throws MessagingException, UnsupportedEncodingException {
		MimeMessage mail = sender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(mail, true, Constants.DEFAULT_ENCODING);
		messageHelper.setSubject(subject);
		messageHelper.setFrom(sender.getUsername());
		messageHelper.setTo(tos);
		messageHelper.setText(msg, true);
		if (CollectionUtils.isNotEmpty(attachments)) {
			for (File file : attachments) {
				messageHelper.addAttachment(MimeUtility.encodeWord(file.getName()), file);
			}
		}
		return mail;
	}

}
