<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js">   </script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
function exit() {
	window.close();
}

function select(zipcode,addr,i) {
	opener.document.all.zipcode1.value = zipcode.substring(0,3);
	opener.document.all.zipcode2.value = zipcode.substring(i,i+3);
	opener.document.all.addr1.value = addr;
	window.close();
	opener.document.all.addr2.focus();
}

function addrSearch(addr) {	
	if(AddressForm.dong.value == null || AddressForm.dong.value == '') {
		alert("동(읍/면) 입력오류");
		AddressForm.dong.focus();
	} else if (AddressForm.dong.value == '동') {
		alert("동을 다시 입력하세요");
		AddressForm.dong.value="";
		AddressForm.dong.focus();
	} else {
		AddressForm.submit();
	}
}
</script>

<style type="text/css">
*{font-size:10pt; font-family: 'Lato', 'Apple SD Gothic Neo', NanumGothic, 'Malgun Gothic', sans-serif;}
a:link{color:1793ea; }
a:visited{color:1793ea; }
a:hover{color:1793ea; }
a:active{color:1793ea; }
.selected{
	background-color:rgb(68,68,68);
	color:white;
	font-weight:bold;
}
.unselected {
	background-color:white;
	color:black;
	font-weight:normal;
}
</style>

<form name="AddressForm" method="post" action="/VodShopping/member/checkAddress.do">
<div style="background-color:white; height:100%">
	<!-- 타이틀 -->
	<div>
		<div style="float:left; position:relative; left:10px; top:10px;"><b style="font-size:16pt">주소 찾기</b></div>
		<img src="../image/btn_close.gif" style="cursor:pointer; position:relative; top:-5px; left:470px;" onclick="javascript:exit()">
	</div>
	<!-- 회색선 -->
	<div style="background-color:#d8d8d8; height:1px;"></div>
	<!-- 버튼 -->
	<div style="padding:10px;">
		<div style="cursor:pointer; float:left; padding:10px; border:1px solid #444444;" id="zipcode">&nbsp;&nbsp;우편번호 찾기(지번찾기)&nbsp;&nbsp;</div>
		<div style="background-color:#444444; position:relative; top:38px; height:1px;"></div>
	</div>
	<br><br>

	<div class="zip" style="padding:10px">
		<div style="background-color:#f5f5f5; height:100px; position:relative; top:-16px;">
			<div style="position:relative; top:15px; left:40px; width:400px;">
				<b>찾고자 하는 주소의 동(읍/면)명을 입력하신 후 검색을 누르세요.</b><br>
			</div>
			<div style="position:relative; top:15px; left:10px; width:430px;">
				예) 서울시 강남구 삼성동 이라면, '삼성', 혹은 '삼성동'으로 입력해주세요.
			</div>
			<br>
			<div style="position:relative; top:0px; left:20px; width:430px;">
				<b>지역명 </b>
				<input type="text" id="dong" name="dong" style="width:300px;" placeholder="동(읍/면)" />
				<img src="../image/btn_search_addr.gif" onclick="javascript:addrSearch('dong')" style="position:relative; top:8px;">
			</div>
		</div>
		
		<!-- 검색한 값이 있을때 for -->
		<div class="addrList">
			<div style="width:550px">
			<c:forEach var="data" items="${list }" >
				<c:set var="addr">
					${data.sido} ${data.gugun} ${data.dong} ${data.ri}
				</c:set>
				<div style="padding:5px 5px;">
					<div style="float:left;  width:70px" id="selectAddr">[${data.zipcode }]</div>
					<div style="float:left">
						<div>${addr } ${data.bunji }</div>
					</div>
					<div style="cursor:pointer; width:30px; height:15px; float:right; background-color:#aaaaaa; color:white; padding:5px;" onclick="javascript:select('${data.zipcode }','${addr }',4)">선택</div>					
				</div>
				<div style="clear:both; background-color:#d8d8d8; height:1px;"></div>
			</c:forEach>
			</div>
		</div>
	</div>	
</div>
</form>


