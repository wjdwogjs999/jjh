<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="jquery-1.11.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	$('#subCategory').hide();
});

function clickSelect(){
	if($("#mainCategory").val()!=""){
		$.ajax({
			url:'subCategoryGet.do',
			type:'POST',
			data:{'seq' : $("#mainCategory").val()},
			dataType:'json'	,
			success:function(data){
				$('#subCategory').html("<option value=''>2차 카테고리를 선택해주세요</option>");
				if(data!=''){
					$(data).each(function(){
						$('#subCategory').append("<option value='"+this.category_seq+"'>"+this.category_name+"</option>");
					});
					$('#subCategory').show();
				}else{
					$('#subCategory').hide();
				}
			}//success
		});//ajax
	}else if($("#mainCategory").val()==""){
		$('#subCategory').hide();
	}
}
</script>

<form name="contentInsertForm" method="post" enctype="multipart/form-data" action="/VodShopping/content/contentInsert.do">
<div style="width:700px; margin:20px 15px;"> <!-- 전체 틀 div -->
	<div style="height: 40px; padding: 20px 15px 0px; background: white">
	<span style="font-size: 14pt;">컨텐츠 등록 / Register content</span>
	</div>
	
	<!-- 등록 form -->
	<div style="height: 600px; background: white; margin-top: 20px">
		<div style="width:640px; height:300;border: 1px solid rgb(243,243,243);margin-left: 30px;">
		<table id="table" style="margin-top: 50px;">
			<tr>
				<td>content</td>
				<td><input type="text" name="contentName" required>
				</td>
			<tr>
			<tr>
				<td>content(English)</td>
				<td><input type="text" name="contentEnglishName" required></td>
			<tr>
			<tr>
				<td>price(원) </td>
				<td><input type="text" name="price" required></td>
			<tr>
			<tr>
				<td>director</td>
				<td><input type="text" name="director" required></td>
			<tr>
			<tr>
				<td>actors</td>
				<td><input type="text" name="actors" required></td>
			<tr>
			<tr>
				<td>storyLine</td>
				<td><textarea rows="12" cols="70" name="storyLine" required></textarea></td>
			<tr>
			<tr>
				<td>category</td>
				<td>
					<select name="mainCategory" onchange="javascript:clickSelect()" required id="mainCategory">
						<option value="" >카테고리를 선택해주세요</option>
						<c:if test="${categoryList.size()!=0}">	
							<c:forEach var="i" begin="0" end="${categoryList.size()-1 }">
								<option value="${categoryList.get(i).getCategory_seq() }" >${categoryList.get(i).getCategory_name() }</option>
							</c:forEach> 
						</c:if>
					</select>&nbsp;&nbsp;
					<select name="subCategory" required id="subCategory">
					</select>
				</td>
			<tr>
			<tr>
				<td>contentImage</td>
				<td class="input"><input type="file" name="img" required></td>
			<tr>
			<tr>
				<td>vod</td>
				<td><input type="file" name="img" required></td>
			</tr>
		</table>
			<div style="text-align: center;">
				<input type="submit" value="작성완료" id="submit"/>
				<input type="reset" value="다시작성" />
			</div>
		</div>
	</div>
</div>
</form>