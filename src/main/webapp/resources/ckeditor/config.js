/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language='ko';						//언어설정
	// config.uiColor = '#AADC6E';
	config.enterMode =CKEDITOR.ENTER_BR;		//엔터키 입력시 br 태그 변경
	config.shiftEnterMode = CKEDITOR.ENTER_P;	//엔터키 입력시 p 태그로 변경
	config.startupFocus = true;					//시작시 포커스 설정
	config.docType = "<!DOCTYPE html>";			//문서타입 설정S
	config.htmlEncodeOutput = true;
	config.filebrowserUploadUrl='/Day12/board/upload.jsp';
	config.toolbarCanCollapse = true;
	config.filebrowserUploadMethod = 'form';

};
