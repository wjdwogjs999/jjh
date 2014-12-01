<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script type="text/javascript" src="../jquery/jquery-2.1.1.min.js"></script>
<meta charset="UTF-8">
<title>VOD 쇼핑몰</title>

<!-- css -->
<!-- 전체 스타일쉤트 -->
<style type="text/css">
*{font-size:9pt; font-family: 'Lato', 'Apple SD Gothic Neo', NanumGothic, 'Malgun Gothic', sans-serif;}
img{cursor:pointer}
.top{width:100%; height:90px; background-color:white;}
.body{width:740px; height:100%; float:left;}
.bottom{width:100%; height:100px; clear:both; background-color:white}
a:link{color:black; text-decoration:none;}
a:visited{color:black; text-decoration:none}
a:hover{color:black; text-decoration:none}
a:active{color:black; text-decoration:none;}
</style>
<script type="text/javascript">
function checkRelationSerch(){
	//trim의 효과
	var sword = $('#sword').val().replace(/(^\s*)|(\s*$)/gi, "");	
	if(sword==""){
		$('.relationSerch').html("");
	}else {
		$.ajax({
			url:'/VodShopping/main/checkRelationSerch.do',
			type:'POST',
			data:{'sword':sword},
			dataType:'json',
			success:function(data){
				$('.relationSerch').html("");
				$(data).each(function(){
					$('.relationSerch').append("<li style='height:20px; margin:10px'><a href='/VodShopping/main/search.do?sword="+this.contentName+"'>"+this.contentName+"</a></li>");
				});//each end			
			}//success end
		});//ajax end
		$('.relationSerch').show();
	}
}
</script>
</head>

<body style="background-color:rgb(237,237,237); margin:0; padding:0">

<div style="width:100%"> <!-- 세부 div들을 감싸는 div -->

<!-- top부분 (div1)-->
<div class="top">
	<jsp:include page="../template/top.jsp"></jsp:include>
</div>

<!-- body, right 부분 (div2,3)-->
<div class="body">
<jsp:include page="${display }"></jsp:include> <!-- 여기 page 부분에 만들고자하는 jsp파일 경로를 넣고 작성할 것  -->
</div>
<div style="width:300px; height:100%; float:left;">
<jsp:include page="../template/right.jsp"></jsp:include>
</div>

<!-- bottom부분 (div4)-->
<div class="bottom">
<jsp:include page="../template/bottom.jsp"></jsp:include>
</div>

</div> <!-- 감싸는 div의 끝 -->

</body>

</html>