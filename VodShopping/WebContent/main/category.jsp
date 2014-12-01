<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {	
	$('#buttonForm').hide();
	$('#categoryEditForm').hide();
	$('#subcategoryAddForm').hide();
	$('#subSelectForm').hide();
});

function clickInputOne(){
	$("#buttonAddOne").fadeIn();
	$("#categoryEditForm").fadeOut();
	$('#buttonForm').fadeOut();
	$('#subcategoryAddForm').fadeOut();
	$('#subSelectForm').fadeOut();
}
function clickSelect(){
	if($("select option:selected").val()!=""){
		$('#buttonForm').fadeIn();
		$("#buttonAddOne").fadeOut();
		$('#categoryEditForm').fadeOut();
		$('#subcategoryAddForm').fadeOut();
		$.ajax({
			url:'subCategoryGet.do',
			type:'POST',
			data:{'seq' : $("select option:selected").val()},
			dataType:'json'	,
			success:function(data){
				$('#subSelectForm').html("<option value=''>2차 카테고리를 선택해주세요</option>");
				$(data).each(function(){
					$('#subSelectForm').append("<option value='"+this.category_seq+"'>"+this.category_name+"</option>");
				});
				$('#subSelectForm').show();
			}//success
		});//ajax
	}else if($("select option:selected").val()==""){
		$('#buttonForm').fadeOut();
		$("#buttonAddOne").fadeIn();
		$('#subcategoryAddForm').fadeOut();
		$('#subSelectForm').fadeOut();
	}
}
function categoryAdd(){
	$.ajax({
		url:'categoryAdd.do',
		type:'POST',
		data:{'category_name':$('#category_name').val()},
		dataType:'json'	,
		success:function(data){
			$('#category1').html("");
			$('#selectForm').html("<option value=''>카테고리를 선택해주세요</option>");
			$(data).each(function(){
				$('#category1').append("<li style='height:10px; padding:10px 15px'><a href='/VodShopping/content/contentList.do?category_seq="+this.category_seq+"pg=1'>"+this.category_name+"</a></li>");
				$('#selectForm').append("<option value='"+this.category_seq+"'>"+this.category_name+"</option>");
			});
			$('#category_name').val("");
		}//success
	});//ajax
}//function add end

function createTwo(){
	$('#subcategoryAddForm').fadeOut();
	$("#categoryEditForm").fadeIn();
}

function categoryEdit(){
	if($("#subSelectForm").val()==null || $("#subSelectForm").val()==''){
		var seq=$("#selectForm").val();	
	}else{
		var seq=$("#subSelectForm").val();
	}
	$.ajax({
		url:'categoryEdit.do',
		type:'POST',
		data:{'category_name':$('#categoryEditName').val(),
			'category_seq':seq},
		dataType:'json'	,
		success:function(data){
			$('#category1').html("");
			$('#selectForm').html("<option value=''>카테고리를 선택해주세요</option>");
			$(data).each(function(){
				$('#category1').append("<li style='height:10px; padding:10px 15px'><a href=''>"+this.category_name+"</a></li>");
				$('#selectForm').append("<option value='"+this.category_seq+"'>"+this.category_name+"</option>");
			});
			$('#categoryEditName').val("");
			$('#categoryEditForm').fadeOut();
			$('#buttonForm').fadeOut();
			$('#subSelectForm').hide();
		}//success
	});//ajax
}//edit end

function categoryDelete(){
	if($("#subSelectForm").val()==null || $("#subSelectForm").val()==''){
		var seq=$("#selectForm").val();	
	}else{
		var seq=$("#subSelectForm").val();
	}
	$.ajax({
		url:'categoryDelete.do',
		type:'POST',
		data:{'category_seq':seq},
		dataType:'json'	,
		success:function(data){
			$('#category1').html("");
			$('#selectForm').html("<option value=''>카테고리를 선택해주세요</option>");
			$(data).each(function(){
				$('#category1').append("<li style='height:10px; padding:10px 15px'><a href=''>"+this.category_name+"</a></li>");
				$('#selectForm').append("<option value='"+this.category_seq+"'>"+this.category_name+"</option>");
			});
			$('#categoryEditForm').fadeOut();
			$('#buttonForm').fadeOut();
			$('#subSelectForm').hide();
		}//success
	});//ajax
}//function add end

function subCategoryAddForm(){
	$("#categoryEditForm").fadeOut();
	$('#subcategoryAddForm').fadeIn();
}

function subCategoryAdd(){
	var seq=$("select option:selected").val();
	$.ajax({
		url:'subCategoryAdd.do',
		type:'POST',
		data:{'category_name':$('#category_name2').val(),
			'pseq':seq},
		dataType:'json'	,
		success:function(data){
			$('#subSelectForm').html("<option value=''>2차 카테고리를 선택해주세요</option>");
			$(data).each(function(){
				$('#subSelectForm').append("<option value='"+this.category_seq+"'>"+this.category_name+"</option>");
			});
			$('#category_name2').val("");
			$('#subcategoryAddForm').hide();
		}//success
	});//ajax
}
</script>

<div style="width:700px; height:100%; margin:20px 20px;">
	<!-- 위쪽 하얀상자 -->
	<div style="background-color:white; height:60px;" id="mainTitle">
		<b style="position:relative; top:15px; left:20px; font-size:14pt">카테고리 관리</b>
	</div>
	<br>
	
	<!-- 두번째 하얀상자 -->
	<form name="categoryForm" method="post" action="">
	<div style="background-color:white; height:500px;" id="subTitle">
		<div style="padding-left: 20px; padding-top: 20px">
			<input type="text" size="30" id="category_name" placeholder="1차 카테고리를 입력하세요^^" onclick="javascript:clickInputOne()">&nbsp;&nbsp;&nbsp;
			<input type="button" value="추가" onclick="javascript:categoryAdd()" id="buttonAddOne">
		</div>
		<!-- 셀렉트!! -->
		<div style="padding-left: 20px; padding-top: 20px" >
		<!-- 1차 카테고리 select -->
		<select id="selectForm" size="1" onchange="javascript:clickSelect()"> 
			<option value="" >카테고리를 선택해주세요</option>
			<c:if test="${categoryList.size()!=0}">	
				<c:forEach var="i" begin="0" end="${categoryList.size()-1 }">
					<option value="${categoryList.get(i).getCategory_seq() }" >${categoryList.get(i).getCategory_name() }</option>
				</c:forEach> 
			</c:if>
		</select>
		<!-- 하위 카테고리 selectBox -->
		<select id="subSelectForm" size="1">
		</select>
		</div>	
		
		<!--  누를시 1차 카테고리 버튼들 생성 -->
		<div style="padding-left: 20px; padding-top: 20px" id="buttonForm">
			<input type='button' value='하위카테고리추가' onclick='javascript:subCategoryAddForm()'>
			<input type='button' value='카테고리수정' onclick='javascript:createTwo()'>
			<input type='button' value='카테고리삭제' onclick='javascript:categoryDelete()'>
		</div>
		
		<!--수정하는놈  나오는곳 -->
		<div style="padding-left: 20px; padding-top: 20px" id="categoryEditForm">
			<input type='text' size='30' id='categoryEditName' placeholder='카테고리 수정''>&nbsp;&nbsp;&nbsp;
			<input type='button' value='수정' onclick='javascript:categoryEdit()'>
		</div>
		<!-- 하위 추가하는 곳 -->
		<div style="padding-left: 20px; padding-top: 20px" id="subcategoryAddForm">
			<input type='text' size='30' id='category_name2' placeholder='하위카테고리를 입력해주세요''>&nbsp;&nbsp;&nbsp;
			<input type='button' value='추가' onclick='javascript:subCategoryAdd()'>
		</div>
	</div>
	</form>
</div>