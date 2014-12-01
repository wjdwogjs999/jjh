<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
function productView(contentCode) {
	location.href = "/VodShopping/content/contentView.do?contentCode="+ contentCode;
}
$(function() {
    $('#main_bn').ulslide({          
        statusbar: true,
        affect: 'fade',      // fade로 변경시 서서히 사라지고 나타나는 형태로 바뀜
        axis: 'x',              // y로 변경시 세로슬라이드로 바뀜
        //navigator: '#main_bn_bt a',
        duration: 400,        // 배너 바뀌는 속도
        autoslide: 1000       // 배너 바뀌는 딜레이 조절
    });
});
</script>
</head>
<body>
<div style="width:700px; height:100%; margin:20px 20px;"> <!-- 전체 틀 div -->
	<!-- div1 / 메인이미지 -->
	<!-- Indicators -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width:700px; height:100%; ">
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active" >
				<img src="../image/movie_interstellar.jpg" style="width: 700px;height: 600px;">
			</div>
			<div class="item"> 
				<img src="../image/sunsin.jpg" style="width: 700px;height: 600px;">
			</div>
			<div class="item"> 
				<img src="../image/haejuk.jpg" style="width: 700px;height: 600px;">
			</div>
		</div>

		 <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div>
	<br/>
	 
	<!-- div2 / 공지글 목록 -->
	<div style="background-color:white; height:240px"> <!-- div2의 전체 틀 -->
		<!--공지사항  -->
		<div style="margin:10px 10px; float:left; width:340px;">
			<ul>
			<font style="font-size: 6mm; font-family: cursive;">캐스트이즈에서 알립니다.</font>
			<hr width="100%"><br/>
			<c:if test="${info.size()!=0 }">
				<c:forEach var="data" items="${info}">
				<li style="height:100%;"><a href="/VodShopping/info/infoView.do?infoCode=${data.infoCode }&pg=1">${data.infoSubject }</a></li>
				</c:forEach>
			</c:if>
			</ul>
		</div>
	</div>
	<br/>
	
	<!-- div4 / 베스트셀러 목록 -->
	<div style="background-color:white; height:240px">
		<!-- 제목 이미지 -->
		<img style="margin-top:20px" src="../image/main_bar_best.gif">
		<!-- div4 내부 전체 틀 -->
		<div style="margin:10px 0px; text-align:center;">
		<!-- forEach (for문으로 처리 예정)-->
		<c:forEach var="data" items="${bestList }">
			<div style="width:150px; float:left; margin-left:20px; line-height:18px">
				<img src="../storage/${data.contentImage}" width="100px" height="100px" onclick="javascript:productView('${data.contentCode}')"><br/>
				<a href="javascript:productView('${data.contentCode}')">${data.contentName}</a><br/>
				<strong>${data.price }원</strong><br/>
			</div>
		</c:forEach>
		<!-- forEach -->
		</div> <!-- div4 내부 전체 틀 끝 -->
	</div> <!-- div4 끝 -->
	<br/>

</div> <!-- 전체 틀 div 끝 -->
</body>
</html>