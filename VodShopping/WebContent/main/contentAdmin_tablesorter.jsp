<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../jquery/jquery-latest.js"></script>
<script type="text/javascript" src="../jquery/jquery.tablesorter.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#myTable").tablesorter();
});
function contentAdmin(){
	document.contentAdminForm.action="/VodShopping/main/contentAdmin.do";
	document.contentAdminForm.submit();
}
function deleteContent(contentCode){
	var yesOrNo = confirm("컨텐츠를 정말로 삭제하시겠습니까??");
	if(yesOrNo==true){
		document.contentAdminForm.action="/VodShopping/content/deleteContent.do?contentCode="+contentCode;
		document.contentAdminForm.submit();	
	}
}
function modifyContent(contentCode){
	document.contentAdminForm.action="/VodShopping/content/modifyContentForm.do?contentCode="+contentCode;
	document.contentAdminForm.submit();
}
function searchName(){
	$.ajax({
		url:'/VodShopping/content/contentSearch.do',
		type:'POST',
		data:{'sword':$('#sword').val()},
		dataType:'json'	,
		success:function(data){
			$('#tableBody').html("");
			$(data).each(function(){
				$('#tableBody').append("<tr>"
											+"<td class='infoList' style='width:80px; text-align:center;'>"+this.contentCode+"</td>"
											+"<td class='infoList' style='width:200px; text-align:center;'>"+this.contentName+"</td>"
											+"<td class='infoList' style='width:100px; text-align:center;'>"
											+this.price+"원"
											+"</td>"
											+"<td class='infoList' style='width:100px; text-align:center;'>"+this.director+"</td>"
											+"<td class='infoList' style='width:100px; text-align:center;'>"
												+"<input type='button' onclick='javascript:modifyContent("+this.contentCode+")' value='수정'>"
												+"<input type='button' onclick='javascript:deleteContent("+this.contentCode+")' value='삭제'>"
											+"</td>"
										+"</tr>");
			});//end each
		}//success
	});//end ajax
}//end function
</script>
<style type="text/css">
.infoList_sub {
	border-top-style: solid;
	border-top-width: 1px;
	border-top-color: rgb(222, 222, 222);
	border-bottom-style: solid;
	border-bottom-width: thin;
	border-bottom-color: rgb(222, 222, 222);
	height: 15px;
	background-color: white;
	padding: 5px
}
.infoList {
	border-bottom-style: solid;
	border-bottom-width: thin;
	border-bottom-color: rgb(222, 222, 222);
	height: 15px;
	padding: 5px
}
th.headerSortDown {
	background-image: url(../img/small_desc.gif);
	background-color: #3399FF;
}
</style>
<form name="contentAdminForm" method="post" action="">
	<!-- 상단 제목 -->
	<div style="margin: 20px; width: 700px; height: 70px; background: white;">
		<div style="padding: 20px;font-size: large;">컨텐츠관리</div>
	</div>
	
	<!-- 검색란 -->
	<div style="margin: 20px; width: 700px; height: 100%;">
		<input type="text" size="20" id="sword" onkeyup="javascript:searchName()">
	</div>
	<!-- 내용들 -->
	<div style="margin: 20px; width: 700px; height: 100%; background: white;">
		<div style="padding: 15px;">
				<table id="myTable" class="tablesorter">
					<thead>
						<tr>
							<th class="infoList_sub" style="width:80px; text-align:center;">contentCode</th>
							<th class="infoList_sub" style="width:200px; text-align:center;">contentName</th>
							<th class="infoList_sub"  style="width:100px; text-align:center;">price</th>
							<th class="infoList_sub" style="width:100px; text-align:center;">director</th>
							<th class="infoList_sub" style="width:100px; text-align:center;">button</th>
						</tr>
					</thead>
					
					<!-- 공지 -->
					<tbody id="tableBody">
					<c:forEach var="data" items="${contentList }">			
							<tr>
								<td class="infoList" style="width:80px; text-align:center;">${data.contentCode }</td>
								<td class="infoList" style="width:200px; text-align:center;">${data.contentName }</td>
								<td class="infoList" style="width:100px; text-align:center;">
									<fmt:formatNumber pattern="##,###.##" value="${data.price }" ></fmt:formatNumber>원
								</td>
								<td class="infoList" style="width:100px; text-align:center;">${data.director }</td>
								<td class="infoList" style="width:100px; text-align:center;">
									<input type="button" onclick="javascript:modifyContent(${data.contentCode})" value="수정">
									<input type="button" onclick="javascript:deleteContent(${data.contentCode})" value="삭제">
								</td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
		</div>
		<br/>
		
		<!-- 페이징 -->
	   	<div style="padding:10px; text-align:left;"><br>
	        <div style="position:relative; bottom:23px; text-align:center"> ${paging} </div> 
	    </div>
	    
	</div>
</form>