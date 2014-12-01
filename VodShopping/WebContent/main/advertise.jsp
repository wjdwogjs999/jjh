<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
function selectCount(){
	$('#contentSelectForm').html("");
	for(var i=1;i<=$('#advertisingCount').val();i++){
		$('#contentSelectForm').append("<select name='contentSelect"+i+"' size='1' id='contentSelect"+i+"'><option value=''>상품을 선택해주세요</option></select><br/><br/>");
	}
	
	
}
</script>

<div style="width:700px; height:100%; margin:20px 20px;">
	<!-- 위쪽 하얀상자 -->
	<div style="background-color:white; height:60px;" id="mainTitle">
		<b style="position:relative; top:15px; left:20px; font-size:14pt"> 광고배너관리</b>
	</div>
	<br>
	
	<!-- 두번째 하얀상자 -->
	<form name="advertiseForm" method="post" action="/VodShopping/main/advertiseModify.do">
	<div style="background-color:white; height:500px;" id="subTitle">
		<div style="padding-left: 20px; padding-top: 20px">
				<select size="1" name="advertisingCount" id="advertisingCount" onchange="selectCount();">
					<option value="0">광고 배너의 개수를 선택해주세요</option>
					<c:forEach var="i" begin="1" end="5">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
		</div>
		
		<!-- advertisingCount만큼 들어갈 content 셀렉트 박스 들어가는곳 -->
		<div style="padding-left: 20px; padding-top: 20px" id="contentSelectForm">
		
		</div>
	</div>
	
	</form>
</div>