<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	document.modifyForm.gender['${user.gender}'].checked=true;
});
//달력
$(function() {  
    $( "#datepicker" ).datepicker({  
    	   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	   dayNamesMin: ['일','월','화','수','목','금','토'],
    	   weekHeader: 'Wk',
    	   dateFormat: 'yy/mm/dd', //형식(20120303)
    	   autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
    	   changeMonth: true, //월변경가능
    	   changeYear: true, //년변경가능
    	   showMonthAfterYear: true, //년 뒤에 월 표시
    	   buttonImageOnly: true, //이미지표시
    	   buttonText: '달력선택', //버튼 텍스트 표시
    	   buttonImage: '../image/btn_cale.gif', //이미지주소
    	   showOn: "both", //엘리먼트와 이미지 동시 사용(both,button)
    	   yearRange: '1900' //1990년부터 2020년까지
    });
    	
    $(function() {
    	$('#man').click(function() {
			document.modifyForm.gender['0'].checked = true;
    	});
    	
    	$('#woman').click(function() {
    		document.modifyForm.gender['1'].checked = true;
    	});
    });

  });  


function checkZipcode() {
	window.open("/VodShopping/member/checkAddressForm.do","","width=600 height=500 left=400 top=100");
}

var chkPwd=3;
//비밀번호 체크
function checkPwd(){
	$(function(){
		if(document.modifyForm.pwd.value.length<8){	//8자가 안되면
			$('.pwdResult').html("<span style='color:red;'>8자 이상 입력해야합니다</span>");
			chkPwd=0;
		}else{	//8자이면
			$('.pwdResult').html("");
			if(document.modifyForm.pwd.value==document.modifyForm.pwdRe.value){
				$('.pwdResult').html('일치합니다');
				chkPwd=1;
			}else{
				$('.pwdResult').html("<span style='color:red;'>일치하지 않습니다</span>");
				chkPwd=2;
			}
		}
	});	//function()
}


//생년월일 체크
function checkBirth(){
	$(function(){
		if(document.modifyForm.datepicker.value==null){
			checkBirthResult = false;
		}else{
			checkBirthResult = true;
		}
	});	//function
}

function modifyDo(){
	if(chkPwd==0)
		alert("비밀번호를 8자 이상 입력해주세요!!");
	else if(chkPwd==1)
		document.modifyForm.submit();
	else if(chkPwd==2)
		alert("비밀번호가 일치하지 않습니다!!");
	else if(chkPwd==3)
		alert("비밀번호를 입력해주세요!!");
}
</script>


<form name="modifyForm" method="post" action="/VodShopping/member/modify.do">
<div style="width:700px; height:100%; margin:20px 20px;">
	<!-- 위쪽 하얀상자 -->
	<div style="background-color:white; height:60px;" id="mainTitle">
		<strong style="position:relative; top:20px; left:20px; font-size:14pt">회원정보수정</strong>
	</div>
	<br>
	
	<!-- 아래쪽 하얀상자 -->
	<div style="background-color:white; height:490px; padding:20px" id="section">
		<span style="color:red" > *</span>필수입력사항
		<div style="width:665px; height:370px; border:5px solid #f3f3f3" id="sectionTitle">
			<div style=" position:relative; top:10px;">
				
				<div style="float:left; width:100px; text-align:right; height:20px">
					<strong><span style="color:red" >*</span> 아이디</strong> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<strong><input type="hidden" name="id" value="${user.id}">${user.id}</strong>
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
				
				<div style="float:left; width:100px; text-align:right; height:20px">
					<strong><span style="color:red" >*</span> 비밀번호</strong>
				</div>
				<div style="float:left; margin-left:20px; margin-bottom:10px">
					<input type="password" name="pwd" id="pwd" onkeyup="checkPwd()" required="required"/>
				</div>
				<div style="float:left; width:60px; text-align:right; height:20px">
					<strong><span style="color:red" >*</span> 재확인</strong>
				</div>
				<div style="float:left; margin-left:20px">
					<input type="password" name="pwdRe" id="pwdRe" onkeyup="checkPwd()" required="required"/>
					<strong class="pwdResult"></strong>
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
				
				<div style="float:left; width:100px; text-align:right; height:20px">
					<strong><span style="color:red" >*</span> 이름</strong> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<input type="text" name="name" id="name" value="${user.name }" required="required"/>
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
				
				<div style="float:left; width:100px; text-align:right; height:20px">
					<strong><span style="color:red" >*</span> 성별</strong> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<input type="radio" value="0" name="gender"/><label id="man">남자</label>
					<input type="radio" value="1" name="gender"/><label id="woman">여자</label>
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
			
				<div style="float:left; width:100px; text-align:right; height:20px">
					<strong><span style="color:red" >*</span> 생년월일</strong> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
				<!-- 생년월일 달력! -->
					<input type="text" name="datepicker" id="datepicker" required="required" onchange="checkBirth()" value="${user.b_year }/${user.b_month }/${user.b_day }">
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
			
				<div style="float:left; width:100px; text-align:right; height:20px">
					<strong><span style="color:red" >*</span> 이메일</strong> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<input type="text" name="email" style="width:200px;" id="email" value="${user.email }" onkeyup="checkMail(${email})"/>
					<input type="hidden" name="checkEmail" value="${user.email }">&nbsp;
					<strong class="emailResult"></strong>
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
				
				<div style="float:left; width:100px; text-align:right; margin-top:20px; height:20px">
					<strong>주소</strong> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px; line-height:27px"> 
					<input type="text" name="zipcode1" style="width:30px;" id="zipcode1" value="${user.zipcode1 }" readonly="readonly"/> -
					<input type="text" name="zipcode2" style="width:30px;" id="zipcode2" value="${user.zipcode2 }" readonly="readonly"/>
					<img src="../image/btn_zipcode.gif" onclick="javascript:checkZipcode()" style="position:relative; top:3px">
					<br/>
					<input type="text" name="addr1" style="width:200px;" id="input" value="${user.addr1 }" readonly="readonly"/>
					<input type="text" name="addr2" style="width:200px;" id="input" value="${user.addr2 }"/>		
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
			
				<div style="float:left; width:100px; text-align:right; height:20px">
					<strong>핸드폰</strong>
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<input type="text" name="phone1" style="width:35px;" id="phone1" value="${user.phone1 }" /> -
					<input type="text" name="phone2" style="width:35px;" id="phone2" value="${user.phone2 }" /> -
					<input type="text" name="phone3" style="width:35px;" id="phone3" value="${user.phone3 }" />
					<strong class="phoneResult"></strong>
				</div>
			</div>
		</div>
		</div>
		<br/><br/>
			<div>
					<input type="button" onclick="javascript:modifyDo()" value="수정하기" style="position:absolute; left:290px; top:640px; " id="modify"/>
					<input type="button" value="이전으로" style="position:absolute; left:360px; top:640px;" onclick="history.back()"/>
					<br/>
			</div>
			<br/><br/>
		</div>
</form>