<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="shortcut icon" href="${ctx}/favicon.ico" mce_href="${ctx}/favicon.ico" type="image/x-icon">
		<link rel="icon" href="${ctx}/favicon.ico" mce_href="${ctx}/favicon.ico" type="image/x-icon">
		<title>厦门方分后台登陆</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/bo/css/login.css"/>
		<!--[if IE 6]> <script type="text/javascript" src="${ctx}/static/bo/js/login.js" ></script> <script type="text/javascript"> DD_belatedPNG.fix('form'); </script> <![endif]-->
	</head>
	<body>
		<form id="login-form" action="${ctx}/j_spring_security_check" method="post" autocomplete="off"  >
		  <fieldset>
		  	  <div class='message' id="message">
					${msg?if_exists}
			  </div>
			  <ul>
				<li>
		            <input id="j_username" name="j_username" type="text">
				</li>
				<li>
					<input id="j_password" name="j_password" type="password">
				</li>
				<li class="last">
					<input id="_spring_security_remember_me" name="_spring_security_remember_me" type="checkbox" >
					<label for="remember_me">自动登录</label>
				</li>
			  </ul>
			  <br class="clear"/>
		      <input class="button" name="commit" value="登 录" type="submit">
		  </fieldset>
		</form>
	</body>
</html>