<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>관리자 공지글 수정</title>
<meta charset="UTF-8">
<script type="text/javascript" src="../smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" src="../smarteditor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="UTF-8"></script>
</head>
<body>
<form name="" method="post" action="/VodShopping/info/infoModify.do">
	<input type="hidden" name="infoCode" value="${info.infoCode }">
	<table width=100% cellpadding=0 cellspacing=0 border=0>
		<tr>
			<td height=500 style="border:10px solid #fff" valign=top>
				<div style="width:100%; background:#fff; border-bottom:2px solid #DDDDDD">
					공지 글 수정(관리자)
				</div>
				<br/>
				<div style="width:800px; border:1px solid #DEDEDE;">
					<table width=100% cellpadding=0 cellspacing=0 border=0>
						<tr>
							<td style="border:3px solid #F3F3F3; padding:5 5 5 5" align=center>
								<table width=780px id=form cellpadding=5 cellspacing=0 border=0>
								<col width=14% align=right>
							<tr>
								<td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td>
							</tr>
							<tr>
								<td class="input_txt">제목</td>
								<td><input type=text name="infoSubject" style="width:100%" required label="제목" value="${info.infoSubject }"></td>
							</tr>
							<tr>
								<td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td>
							</tr>
							<tr>
								<td class="input_txt">내용</td>
								<td>
									<textarea name="infoContent" id="infoContent" style="width:655px;height:350px">${info.infoContent }</textarea>
									<script type="text/javascript">
										var oEditors = [];
										nhn.husky.EZCreator.createInIFrame({
											oAppRef : oEditors,
											elPlaceHolder : "infoContent", //textarea에서 지정한 id와 일치해야 합니다.
											sSkinURI : "../smarteditor/SmartEditor2Skin.html",
											fCreator : "createSEditor2"
										});
									
										function submitContents(elClickedObj) {
											//에디터의 내용이 textarea에 적용된다.
											oEditors.getById["infoContent"].exec("UPDATE_CONTENTS_FIELD", []);
											//에디터의 내용에 대한 값 검증은 이곳에서
											//document.getElementById("content").value을 이용해서 처리한다
											try {
												elClickedObj.form.submit();
											} catch (e) {
									
											}
										}
										function pasteHTML(filepath) {
											var sHTML = "<img src='http://localhost:8080/VodShopping/info_image/"+filepath+"'>";
											oEditors.getById["infoContent"].exec("PASTE_HTML", [ sHTML ]);
										}
									</script>
								</td>
							</tr>
							</table>
							</td>
						</tr>
					</table>
				</div>
				<TABLE width=100%>
					<tr>
						<td align=center style="padding-top:5"><input type="image" src="../image/btn_upload.gif" onclick="submitContents('document')"></td>
					</tr>
				</TABLE>
				<TABLE width=100% cellpadding=0 cellspacing=0 border=0>
					<TR>
						<TD align=right><A HREF="javascript:this.close()" onFocus="blur()"><img src="../image/popup_close.gif"></A></TD>
					</TR>
				</TABLE>
			</td>
		</tr>
	</table>
</form>
</body>
</html>