<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
var idChk=false;
var pwdChk=false;
function chkJoin(){
	if(document.joinForm.id.value=="")
		alert("아이디를 입력해주세요");
	else if(!idChk)
		alert("아이디를 제대로 입력해주세요");
	else if(document.joinForm.pwd.value=="")
		alert("비밀번호를 입력해주세요");
	else if(!pwdChk)
		alert("비밀번호를 제대로 입력해주세요");
	else if(document.joinForm.name.value=="")	
		alert("이름을 입력해주세요");
	else if(document.joinForm.email.value=="")
		alert("이메일을 입력해주세요");  
	else if(!mailChk)
		alert("이메일을 제대로 입력해주세요");
	else document.joinForm.submit();
}
/////////////////////////달력
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
 }); 

function checkBirth(){
	$(function(){
		if(document.joinForm.datepicker.value==null){
			checkBirthResult = false;
		}else{
			checkBirthResult = true;
		}
	});	//function
}

function checkZipcode() {
	window.open("/VodShopping/member/checkAddressForm.do","","width=600 height=500 left=400 top=100");
}

function checkId(id){
	if(document.joinForm.id.value.trim().length<6){
		$('.idResult').html("<span style='color:red;'>6자 이상 입력해야합니다</span>");
		idChk=false;
	}else{
		$.ajax({
			url:'checkId.do',
			type:'POST',
			data:{'id':$('#id').val()},
			dataType:'text',
			success:function(result){
				if(result=='OK'){
					$('.idResult').html('이 아이디는 사용가능합니다');
					idChk=true;
				}else{
					$('.idResult').html("<span style='color:red;'>이 아이디는 사용 불가능합니다</span>");
					idChk=false;
				}
			}//success
		});//ajax 
		
	}
}//function

//비밀번호 체크
function checkPwd(){
		if(document.joinForm.pwd.value.trim().length<8){	//8자가 안되면
			$('.pwdResult').html("<span style='color:red;'>8자 이상 입력해야합니다</span>");
			pwdChk=false;
		}else{	//8자이면
			$('.pwdResult').html("");
			if(document.joinForm.pwd.value.trim()==document.joinForm.pwdRe.value.trim()){
				$('.pwdResult').html('일치합니다');
				pwdChk=true;
			}else{
				$('.pwdResult').html("<span style='color:red;'>일치하지 않습니다</span>");
				pwdChk=false;
			}
		}
}

//이메일체크
function checkMail(){
	var re_mail = /([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)\.([0-9a-zA-Z_-]+)/; // 이메일 검사식
	if(re_mail.test(document.joinForm.email.value)){
		$('#emailResult').html("<span style='color:red;'>사용가능한 이메일입니다</span>");
		mailChk=true;
	}else{
		$('#emailResult').html("<span style='color:red;'>이메일 형식이 잘못되었습니다</span>");
		mailChk=false;
	}

}
</script>

<form name="joinForm" method="post" action="/VodShopping/member/join.do">
<div style="width:700px; height:100%; margin:20px 20px;">
	<!-- 위쪽 하얀상자 -->
	<div style="background-color:white; height:60px;" id="mainTitle">
		<b style="position:relative; top:20px; left:20px; font-size:14pt">회원가입 / Sign up</b>
	</div>
	<br>
	
	<!-- 아래쪽 하얀상자 -->
	<div style="background-color:white; height:490px; padding:20px" id="section">
		<font color="red" > *</font>필수입력사항
		<div style="width:665px; height:375px; border:5px solid #f3f3f3;" id="sectionTitle">
			<div style=" position:relative; top:10px;">
				
				<div style="float:left; width:100px; text-align:right; height:20px">
					<b><font color="red" >*</font> 아이디</b> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:8px"> 
					<input type="text" name="id" id="id" onkeyup="checkId(${id})">
					<input type="hidden" id="check1" value="0">
					<strong class="idResult"></strong>
				</div>
			
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
				
				<div style="float:left; width:100px; text-align:right; height:20px">
					<b><font color="red" >*</font> 비밀번호</b>
				</div>
				<div style="float:left; margin-left:20px; margin-bottom:10px">
					<input type="password" name="pwd" id="pwd" onkeyup="checkPwd()" />
				</div>
				<div style="float:left; width:60px; text-align:right; height:20px">
					<b><font color="red" >*</font> 재확인</b>
					<input type="hidden" id="check2" value="0">
				</div>
				<div style="float:left; margin-left:20px">
					<input type="password" name="pwdRe" id="pwdRe" onkeyup="checkPwd()"  />
					<strong class="pwdResult"></strong>
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
				
				<div style="float:left; width:100px; text-align:right; height:20px">
					<b><font color="red" >*</font> 이름</b> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<input type="text" name="name" id="name" />
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
				
				<div style="float:left; width:100px; text-align:right; height:20px">
					<b><font color="red" >*</font> 성별</b> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<input type="radio" value="0" name="gender" checked="checked"/><label id="man">남자</label>
					<input type="radio" value="1" name="gender"/><label id="woman">여자</label>
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
			
				<div style="float:left; width:100px; text-align:right; height:20px">
					<b><font color="red" >*</font> 생년월일</b> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<!-- 생년월일 달력! -->
					<input type="text" name="datepicker" id="datepicker" onchange="checkBirth()" readonly="readonly">
				
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
			
				<div style="float:left; width:100px; text-align:right; height:20px">
					<b><font color="red" >*</font> 이메일</b> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<input type="text" name="email" style="width:200px;" id="email" onkeyup="checkMail()" />
					<strong id="emailResult"></strong>
					<input type="hidden" name="checkEmail" value="">
					&nbsp;&nbsp;
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
				
				<div style="float:left; width:100px; text-align:right; margin-top:20px; height:20px">
					<b>주소</b> 
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px; line-height:27px"> 
					<input type="text" name="zipcode1" style="width:30px;" id="zipcode1" readonly/> -
					<input type="text" name="zipcode2" style="width:30px;" id="zipcode2" readonly/>
					<img src="../image/btn_zipcode.gif" onclick="javascript:checkZipcode()" style="position:relative; top:3px">
					<br/>
					<input type="text" name="addr1" style="width:200px;" id="addr1" readonly="readonly"/>
					<input type="text" name="addr2" style="width:200px;" id="addr2"/>
				</div>
				
			<div style="clear:both; height:10px"><div style="border-width:1px; border-top-style:solid; color:#CDCDCD; width:95%; margin-left:15px"></div></div>
			
				<div style="float:left; width:100px; text-align:right; height:20px">
					<b>핸드폰</b>
				</div> 
				<div style="float:left; margin-left:20px; margin-bottom:10px"> 
					<input type="text" name="phone1" style="width:35px;" onkeyup="checkPhone1()"  /> -
					<input type="text" name="phone2" style="width:35px;" onkeyup="checkPhone2()" /> -
					<input type="text" name="phone3" style="width:35px;" onkeyup="checkPhone3()" />
				</div>
			</div>
		</div>
		<br/><br/>
		<div>
			<input type="button" value="회원가입" style="position:absolute; left:290px; top:640px; " onclick="javascript:chkJoin()"/>
			<input type="button" value="이전으로" style="position:absolute; left:360px; top:640px;" onclick="history.back()"/>
			<br/>
		</div>
	</div>
	
</div>
</form>