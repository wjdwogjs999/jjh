<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

window.twttr=(function(d,s,id){var t,js,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return}js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);return window.twttr||(t={_e:[],ready:function(f){t._e.push(f)}})}(document,"script","twitter-wjs"));


function cartInsert(id){
	if(id==""){
		alert("로그인을 하셔야 장바구니를 이용하실 수 있습니다.");
	}else{
		document.productForm.action="/VodShopping/cart/cartInsert.do";
		document.productForm.submit();
	}
}

function orderGo(id){
	if(id==""){
		alert("로그인을 하셔야 주문하실 수 있습니다.");
	}else{
		document.productForm.action="/VodShopping/order/orderForm.do";
		document.productForm.submit();	
	}
	
}

function videoStart(vod, contentCode){
	var win = window.open("/VodShopping/content/videoStart.do?vod="+vod+"&contentCode="+contentCode, "", "width=580 height=470 left=200");
	var interval = window.setInterval(function() {
	       try {
	           if (win == null || win.closed) {
	               window.clearInterval(interval);
	               $.ajax({
	       			url:'inheritTimeInsert.do',
	       			type:'POST',
	       			data:{
	       				'contentCode':$('#contentCode').val(),
	       				'time' : $('#time').val()
	       				},
	       			dataType:'text',
	       			success:function(){
	       			}//success
	       		});//ajax 
	           }
	       }
	       catch (e) {
	       }
	   }, 1000);
}
</script>
<form name="productForm" method="post" action="">
<input type="hidden" value="" name="time" id="time">
<input type="hidden" value="${content.contentCode }" name="contentCode" id="contentCode">
<input type="hidden" value="1" name="itemCount">
<div style="width:700px; height:100%; margin:20px 20px;"> <!-- 전체 틀 div -->
	<!-- 상품설명 -->
	 <!-- 상품탭 -->
		<div style="height:650px; background:white"><!-- 왼쪽 -->
			<div style="float: left; width:300px; padding-left:25px; padding-top: 25px;">
			<img style="clear: both" src="../storage/${content.contentImage }" width="300px">
				<div style="padding-left: 120px; margin-top: 10px">
				<img src="../storage/${content.contentImage }" style="width:45px; height:45px">	
				</div>
				<div style="padding-left: 80px; margin-top: 10px">
				<img src="../image/cyworld.gif" onclick="javascript:window.open('http://cyxso.cyworld.com/Login.sk','','width=500 height=400 scrollbars=yes');">
				</div>
				<div style="padding-left: 85px; margin-top: 10px">
				<a href="https://twitter.com/share">  
  					<img class="twitter-mention-button" src="../image/twitter.png">
  				</a>
				<img src="../image/facebook.png" onclick="javascript:window.open('https://www.facebook.com/login.php','','width=500 height=400 scrollbars=yes');">
				<img src="../image/c.png" onclick="javascript:window.open('http://cyxso.cyworld.com/PopUpLogin.sk','','width=500 height=400 scrollbars=yes');">
				</div>
		</div>
		
		<!-- 오른쪽 -->
		<div style="float: left; width:330px; padding-right:25px; padding-top: 25px; margin-left: 20px;">
		<c:if test="${memDTO.id=='admin' }">
			<input type="button" value="상품상태변경" onclick="location.href=''" />
		</c:if>	 
			<p style="line-height: 180%;"><strong>${content.contentName }</strong><br/>
			<font style="color: rgb(139,139,139)">${content.contentEnglishName }</font></p>
			
			<div style="background: rgb(247,247,247); border-top: 2px solid rgb(221,221,221);border-bottom: 2px solid rgb(221,221,221); padding-left: 20px;">
			<span style="line-height: 180%;">판매금액 : <strong><fmt:formatNumber type="number" value="${content.price }" pattern="#,###"/>원</strong><br/>
			</span>
			</div>
			
			<!-- 제품코드 -->
			<div style="padding-left: 20px;">
				<p style="line-height: 80%;">연출 : ${content.director }<br/>
				<div>출연배우 : ${content.actors }</div><br/>
				</p>
				<div style="clear:both;"></div>
			</div>
			
			<div style="background: rgb(247,247,247); border-top: 2px solid rgb(221,221,221);border-bottom: 2px solid rgb(221,221,221); 
						padding-left: 20px; margin-top: 10px; padding-top: 10px; padding-bottom: 10px; width:100% ;height: 300px">
						<div>줄거리
						<p>${content.storyLine}</p>
					</div>
			</div>
			
			<!-- 버튼들 -->
			<div style="margin-top: 10px; border-bottom: 1px solid rgb(221,221,221); padding-bottom: 10px">
			<c:if test="${overlap==0 }">
			<img src="../image/buy.jpg" onclick="javascript:orderGo('${user.id}')" style="width: 87px;height: 44px">
			<img src="../image/cart.jpg" onclick="javascript:cartInsert('${user.id}')" style="width: 87px;height: 44px">
			</c:if>
			<c:if test="${overlap==1 }">
				<img src="../image/see.jpg"  onclick="javascript:videoStart('${content.vod}',${content.contentCode })" style="width: 87px;height: 44px">
			</c:if>
			<img src="../image/list.jpg" onclick="history.back()" style="width: 87px;height: 44px">
			</div>
		</div><!-- 상품탭 div끝 -->
	</div>
	<br/>
	
	<!-- 구매안내 -->
	<div style="height:150px; background:white; padding: 20px 10px 0px 10px">
	<!-- title -->
		<strong>구매안내</strong><br/>
		<hr align="left" size="1px" color="#E6E6E6" noshade/>
		<div>
			<ul type="circle" style="line-height: 150%">
				<li>구매자의 변심 및 실수(옵션선택 등)에 의한 경우에는 환불해 드리지 않습니다.</li>
				<li>구매내역은 30일 이후에 초기화 됩니다.</li>
				<li>기타 문의는 010-0000-0000으로 연락주세요</li>
			</ul>
		</div>
	</div>
	<br/>
</div> <!-- 전체 틀 div 끝 -->
</form>