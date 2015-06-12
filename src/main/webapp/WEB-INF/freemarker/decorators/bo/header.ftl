<#assign sec=JspTaglibs["/WEB-INF/security.tld"]>
<header>
	<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="${ctx}/bo/index">厦门市方分拍卖有限公司</a>
          <div class="nav-collapse collapse">
	        <ul class="nav nav-pills pull-right">
				<#if currentUser??>
					<li><a href="${ctx}/user/modifyUser">${currentUser.name?if_exists}</a></li>
					<li><a href="${ctx}/cas/logout">退出</a></li>
				</#if>
	        </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
  	<br class="clear"/>
</div>