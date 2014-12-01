<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.section {
    width: 660px;
    padding: 20px;
    background: #fff;
    margin-bottom: 20px;
}
.section input[type="text"]{
	border: 1px solid #ccc;
	padding: 4px;
}
</style>

<form name="pwdFindForm" method="post" action="/VodShopping/member/pwdFind.do">
	<div id="body"style=" margin:20px 20px;">
		<div style="height: 100%">
			<div class="section">
				<h2>비밀번호찾기</h2>
			</div>

			<div class="section">
				<div>
					<font style="color: red">비밀번호 찾기</font>
				</div>
				<div style="border: 1px solid #DEDEDE;">
					<table width=100% cellpadding=0 cellspacing=0 border=0>
						<tr>
							<td style="border: 5px solid #F3F3F3; padding: 10px;">

								<div style="float: right; width: 480px">
									<table cellpadding=2 cellspacing=0 border=0>
										<tr>
											<td
												style="text-align: right; padding-right: 10px; width: 80px;"
												class="input_txt">아이디</td>
											<td><input name="id" type="text" size="29" required
												tabindex=1></td>
											<td rowspan=4><input type="submit" value="찾기"
												style="width: 23mm; height: 23mm">
											</div></td>
										</tr>
										<tr>
											<td
												style="text-align: right; padding-right: 10px; width: 80px;"
												class="input_txt">이름</td>
											<td><input name="name" type="text" size="29" required
												tabindex=2></td>
										</tr>
										<tr>
											<td
												style="text-align: right; padding-right: 5px; width: 80px;"
												class="input_txt">가입 메일주소</td>
											<td><input name="email" type="text" size="29" required
												tabindex=5></td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>

				<div align="center" style="padding-top: 15px">
					<input type="button" value="로그인하기"
						onclick="location.href='/VodShopping/main/loginForm.do'"
						style="width: 23mm; height: 9mm"> <input type="button"
						value="아이디찾기"
						onclick="location.href='/VodShopping/member/idFindForm.do'"
						style="width: 23mm; height: 9mm">
				</div>
			</div>
		</div>
	</div>

</form>