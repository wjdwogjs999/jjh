<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.submenu a:hover{color:red;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('.menu').mouseenter(function(){
		$(this).find('.submenu').slideToggle('fast');
		$(this).siblings().find('.submenu').slideUp(0);
	});
	$('.menu').mouseleave(function(){
		$('.submenu').slideUp(0);
	});
});

function infoWrite(){
	window.open("/VodShopping/info/infoWriteForm.do","","width=700 height=500 left=100 top=50");
}

function loginCheck(id,action){
	if(id=="" || id==null){
		alert("로그인을 하셔야 이용가능합니다!!");
	}else if(action=="modifyForm"){
		location.href="/VodShopping/member/modifyForm.do";
	}else if(action=="myOrderList"){
		location.href="/VodShopping/order/myOrderList.do";
	}else if(action=="cart"){
		location.href="/VodShopping/cart/shoppingBasket.do";
	}
		
}
</script>

<div style="width:100%; height:80px;">
<img src="../image/castisMain.png" style="margin-top:25px; float:left" onclick="location.href='/VodShopping/main/index.do'" width="100px">

<div style="margin-top:35px; font-size:10pt;  position:absolute; left:100px; z-index:3">
<div style="float:left; margin-left:40px;">
<div style="float:left;" class="menu">
	<b style="cursor:pointer; height:30px"> V O D &nbsp;▼</b>
	<ul style="display:none; position:relative; top:10px; width:150px; height:100%; border:1pt solid rgb(230,230,230); list-style-type:none; margin:0; padding:0; background-color:white;" class="submenu" id="category1">
		<c:if test="${categoryList!=''}">
			<c:forEach var="data" items="${categoryList}">
				<li style="height:10px; margin:10px 15px"><a href="/VodShopping/content/contentList.do?category_seq=${data.category_seq }&pg=1">${data.category_name}</a></li>
			</c:forEach>
		</c:if>
	</ul>
</div>

<div style="float:left; margin-left:110px; position:absolute; width:80px"  class="menu">
	<b style="cursor:pointer; height:20px">공지사항&nbsp;▼</b>
	<ul style="display:none; position:relative; top:10px; width:150px; height:100%; border:1pt solid rgb(230,230,230); list-style-type:none; margin:0; padding:0; background-color:white;" class="submenu">
		<li style="height:10px; margin:10px 15px"><a href="/VodShopping/info/infoList.do">공지사항</a></li>
	</ul>
</div>

<div style="float:left; margin-left:220px; position:absolute; width:90px" class="menu">
	<b style="cursor:pointer; height:20px" >마이페이지&nbsp;▼</b>
	<ul style="display:none; position:relative; top:10px; width:150px; height:100%; border:1pt solid rgb(230,230,230); list-style-type:none; margin:0; padding:0; background-color:white;" class="submenu">
		<li style="height:10px; margin:10px 15px"><a href="javascript:loginCheck('${user.id }', 'modifyForm')">정보변경</a></li>
		<li style="height:10px; margin:10px 15px"><a href="javascript:loginCheck('${user.id }', 'myOrderList')">구매내역</a></li>
	</ul>
</div>

</div>

<div style="float:left; margin-left:380px; position:absolute; width:500px">
<a href="javascript:loginCheck('${user.id }', 'cart')"><b>장바구니</b></a>

<c:if test="${user.id==null }">
<a href="/VodShopping/member/joinForm.do"><b style="margin-left:30px">회원가입</b></a>
<a href="/VodShopping/main/loginForm.do"><b style="margin-left:30px">로그인</b></a>
</c:if>
<c:if test="${user.id!=null }">
<a href="/VodShopping/member/logout.do"><b style="margin-left:30px">로그아웃</b></a>
</c:if>
</div>

<c:if test="${user.id=='admin' }">
<div style="float:left; margin-left:650px; position:absolute; width:100px" class="menu">
	<b style="cursor:pointer; height:30px">관리자메뉴&nbsp;▼</b>
	<ul style="display:none; position:relative; top:10px; width:150px; height:100%; border:1pt solid rgb(230,230,230); list-style-type:none; margin:0; padding:0; background-color:white;" class="submenu">
		<li style="height:10px; margin:10px 15px"><a href="/VodShopping/main/contentWriteForm.do">상품등록</a></li>
		<li style="height:10px; margin:10px 15px"><a href="#" onclick="javascript:infoWrite()">공지등록</a></li>
		<li style="height:10px; margin:10px 15px"><a href="/VodShopping/main/category.do">카테고리관리</a></li>
		<li style="height:10px; margin:10px 15px"><a href="/VodShopping/main/memberAdmin.do?pg=1">회원관리</a></li>
		<li style="height:10px; margin:10px 15px"><a href="/VodShopping/main/contentAdmin.do">컨텐츠관리</a></li>
		<li style="height:10px; margin:10px 15px"><a href="/VodShopping/main/salesGraph.do">매출그래프보기</a></li>
		<!-- <li style="height:10px; margin:10px 15px"><a href="/VodShopping/main/advertiseForm.do">광고배너관리</a></li> -->
	</ul>
</div>
</c:if>

</div>

</div>