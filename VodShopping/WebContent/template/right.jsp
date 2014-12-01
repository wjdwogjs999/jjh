<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function(){
	$('.relationSerch').hide();
	
});
</script>
<form name="rightSearch" method="post" action="/VodShopping/main/search.do">
<div style="width:250px; height:100px; position:absolute;left:740px; top:110px;background-color:white"> <!-- 전체 틀 -->
	<div style="margin-left: 20px; margin-top: 20px">
		<div style="float: left;margin-top: 10px;">
			<input style="height:25px" type="text" name="sword" id="sword"size="20" placeholder="상품검색" required="required" onkeyup="checkRelationSerch()"/>
			<ul style="display:none;relative; width:100%; height:100%; border:1pt solid rgb(230,230,230); list-style-type:none; margin:0; padding:0; background-color:white;" class="relationSerch">
			</ul>
		</div>
		<div>
			<input type="image" style="position:relative; top:10px; left:10px" src="../image/search.png">
		</div>
	</div>
</div>
</form>