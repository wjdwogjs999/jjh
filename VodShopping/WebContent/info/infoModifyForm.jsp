<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>관리자 공지글 수정</title>
<meta charset="UTF-8">
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
									<textarea name="infoContent" id="content" style="width:655px;height:350px">${info.infoContent }</textarea>
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