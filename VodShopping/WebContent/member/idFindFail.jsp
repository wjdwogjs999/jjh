<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="width:700px; height:700px; margin:20px 20px">
	<div style="background-color: white;height:62px">
		<h3 style="font-size:13pt; position: relative; top:19px; left:19px;color: rgb(117,117,117)">아이디찾기</h3>
	</div>
	<br>
	<div style="background-color: white; height:185px;">
		<div style="background-color: white; width:650px; height:77px; border:1pt solid rgb(240,240,240);margin-left: 20px; position:relative; top:20px;">
			<div style="width:640px; height:68px; line-height:17px;  border-style: solid; border-color: rgb(250,250,250);border-width:thick;">
				<div>
					<h5 style="text-align:center; font-size: 9pt; color:rgb(147,147,147);">
						${name } 님의 아이디는 존재하지 않습니다.<br>
						입력정보가 정확한지 확인 후 다시 한번 시도해주세요.
					</h5>
				</div>
			</div>
		</div>
		<div style="margin-left: 320px; margin-top:45px">
			<input type="button" value="다시찾기" onclick="location.href='/VodShopping/member/idFindForm.do'" style="width: 23mm;height: 9mm">
		</div>
	</div>
</div>
