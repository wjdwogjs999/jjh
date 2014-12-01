<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="member.css">

<script type="text/javascript">
function inputCheck(){
	if(document.loginForm.id.value=="") alert("아이디를 입력하세요");
	else if(document.loginForm.pwd.value=="") alert("비밀번호를 입력하세요");
	else document.loginForm.submit();
}
</script>

<div style="width:700px; height:100%; margin:20px 20px;">
	<!-- 위쪽 하얀상자 -->
	<div style="background-color:white; height:60px;" id="mainTitle">
		<b style="position:relative; top:15px; left:20px; font-size:14pt">로그인 / <em style="font-size:14pt">Login</em></b>
	</div>
	<br>
	<br>
	
	<!-- 두번째 하얀상자 -->
	<form name="loginForm" method="post" action="/VodShopping/member/login.do">
	<div style="background-color:white; height:200px;" id="mainTitle2">
		<b style="position:relative; top:15px; left:20px;">회원로그인</b>
		<div style="width:650px; height:120px; border:1px solid #dedede; position:relative; top:40px; left:25px;">
			<div style="width:610px; height:80px; border:5px solid #f3f3f3; padding:15px;">
			<!-- 테두리 안쪽 시작 -->
				<div style="float:left; position:relative; left:5px; top:8px;" id="section">
					아이디&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" id="input" /><br><br>
					비밀번호&nbsp;<input type="password" name="pwd" id="input" style="position:relative; left:2px" onkeypress="if(event.keyCode==13) {javascript:inputCheck();}"/>
				</div>
				<div style="float:left;">
				<!-- 로그인버튼 -->
					<img src="../image/login.jpg" onclick="javascript:inputCheck();" style="position:relative; left:10px; top:15px;width: 80px;height:50px">
				</div>
				<div style="float:left">
					<img src="../image/login_div02.gif" style="position:relative; left:40px; top:10px;">
				</div>
				<div style="float:left">
					<!-- 회원가입/아이디찾기/비밀번호찾기 버튼 -->
					<img src="../image/join.jpg" onclick="location.href='/VodShopping/member/joinForm.do'" style="position:relative; left:60px; top:22px;width: 80px;height:40px;float: left;">
					<img src="../image/idFind.jpg"onclick="location.href='/VodShopping/member/idFindForm.do'" style="position:relative; left:60px; top:22px; width: 80px;height:40px;float: left;">
					<img src="../image/pwdFind.jpg" onclick="location.href='/VodShopping/member/pwdFindForm.do'" style="position:relative; left:60px; top:22px; width: 80px;height:40px;float: left;">
				</div>
			</div>
		</div>
	</div>
	</form>
	<br>
</div>