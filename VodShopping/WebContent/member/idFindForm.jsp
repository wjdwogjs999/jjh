<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="idFindForm" method="post" action="/VodShopping/member/idFind.do">
<div style="width:700px; height:100%; margin:20px 20px">
	<div style="background-color: white;height:58px">
	<h3 style="font-size:13pt;  position: relative; top:19px; left:19px;color: rgb(117,117,117)">아이디찾기</h3>
	</div>
	<br/>
	<div style="background-color:white; height:240px">
	<p style="font-size:13pt;  position: relative; top:19px; left:19px; color: red;">ID찾기</p>
		<div style="background-color: white; width:650px; height:110px; border-style: solid; border-width:1pt; border-color: rgb(240,240,240);margin-left: 20px;">
			<div style="width:640px; height:100px;border-style: solid; border-color: rgb(250,250,250);border-width:thick;">
				
				<div style="float: left; margin-left: 45px;margin-top: 20px">
					<div style="text-align: right;color: rgb(93,93,93)">이름&nbsp;&nbsp;
					<input type="text" name="name"style="margin-bottom:5px ;width:210px; height:22px; border-style:solid; border-color:rgb(215,215,215);border-width:thin;" required>
					</div>
					<div style="text-align: right; color: rgb(93,93,93); margin	-top:10px">가입 메일주소&nbsp;&nbsp;
					<input type="text" name="email" style=" width:210px; height:22px;border-style:solid;border-color:rgb(215,215,215);border-width:thin;" required>
					</div>
				</div>
				<div style="float:left;margin-left:5px;margin-top:16px">
				<input type="submit" value="찾기" style="width: 17mm;height: 17mm"></div>
			</div>
		</div>
		<div style="margin-left: 200px; margin-top:17px">
			<input type="button" value="비밀번호찾기" onclick="location.href='/VodShopping/member/pwdFindForm.do'" style="width: 23mm;height: 9mm">
			<input type="button" value="로그인하기" onclick="location.href='/VodShopping/main/loginForm.do'" style="width: 23mm;height: 9mm">
		</div>
	</div>
</div>
</form>