/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {

	config.filebrowserImageUploadUrl = 'http://www.ffpaimai.com/bo/uploadFile/img';
	config.height = 120;
	config.removePlugins = 'elementspath';
	config.enterMode = CKEDITOR.ENTER_BR;
	config.shiftEnterMode = CKEDITOR.ENTER_P;
    config.language = 'zh-cn'

	//config.toolbar = 'MyToolbar';// 把默认工具栏改为‘MyToolbar’
	//config.toolbar_MyToolbar = [ [ 'Image' ], ];
};
