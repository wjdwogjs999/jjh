<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="width:700px; height:700px; margin:20px 20px">
	<div style="background-color: white;height:58px">
		<h3 style="font-size:13pt; position: relative; top:19px; left:19px;color: rgb(117,117,117)">아이디찾기</h3>
	</div>
	<br>
	<div style="background-color: white; height:167px">
		<div style="background-color: white; width:650px; height:58px; border:1pt solid rgb(240,240,240);margin-left: 20px; position:relative; top:20px;">
			<div style="width:640px; height:48px; border-style: solid; border-color: rgb(250,250,250);;border-width:thick;">
				<h5 style="margin-top:15px; text-align:center; font-size: 10pt; color:rgb(147,147,147);">
					"${member.name }회원님의 아이디는 <FONT style="color:rgb(252,150,24)">${member.id }</FONT> 입니다."
				</h5>
			</div>
		</div>
		<div style="margin-left: 272px; margin-top:40px">
			<input type="button" value="비밀번호찾기" onclick="location.href='/VodShopping/member/pwdFindForm.do'" style="width: 23mm;height: 9mm">
			<input type="button" value="로그인하기" onclick="location.href='/VodShopping/main/loginForm.do'" style="width: 23mm;height: 9mm">
		</div>
	</div>
</div>