<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script type="text/javascript">
function memberAdmin(pg){
	document.memberAdminForm.action="/VodShopping/main/memberAdmin.do?pg="+pg;
	document.memberAdminForm.submit();
}
function deleteMember(id){
	var yesOrNo = confirm("정말로 회원님을 탈퇴시키겠습니까??");
	if(yesOrNo==true){
		document.memberAdminForm.action="/VodShopping/member/deleteMember.do?id="+id;
		document.memberAdminForm.submit();
	}
}
</script>
<style type="text/css">
.infoList_sub_raw{display:table-raw; border-top-style:solid; border-top-width:1px; border-top-color:rgb(222,222,222); border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:rgb(222,222,222); height:15px; background-color:white; padding:5px}
.infoList_raw{display:table-raw; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:rgb(222,222,222); height:15px;padding:5px}
.infoList_cell{display:table-cell;}
</style>
<form name="memberAdminForm" method="post" action="">
	<!-- 상단 제목 -->
	<div style="margin: 20px; width: 700px; height: 70px; background: white;">
		<div style="padding: 20px;font-size: large;">회원관리</div>
	</div>
	
	<!-- 내용들 -->
	<div style="margin: 20px; width: 700px; height: 100%; background: white;">
		<div style="display: table; width: 600px;">
			<!-- div2 내부 전체 틀 -->
			<div style="padding:20px; margin:10px 0px; text-align:center; font-size:9pt;">
					<div style="display:table; width:655px">
						<div class="infoList_sub_raw">
							<div class="infoList_cell" style="width:150px; text-align:center;">ID</div>
							<div class="infoList_cell" style="width:80px; text-align:center;">이름</div>
							<div class="infoList_cell" style="width:40px; text-align:center;">성별</div>
							<div class="infoList_cell" style="width:60px; text-align:center;">생년월일</div>
							<div class="infoList_cell" style="width:200px; text-align:center;">이메일</div>
							<div class="infoList_cell" style="width:50px; text-align:center;"></div>
						</div>
						
						<!-- 공지 -->
						<c:forEach var="data" items="${memberList }">
							<div class="infoList_raw">
								<div class="infoList_cell" style="width:150px; text-align:center;">${data.id }</div>
								<div class="infoList_cell" style="width:80px; text-align:center;">${data.name }</div>
								<div class="infoList_cell" style="width:40px; text-align:center;">${data.gender }</div>
								<div class="infoList_cell" style="width:60px; text-align:center;">${data.b_year }/${data.b_month }/${data.b_day }</div>
								<div class="infoList_cell" style="width:200px; text-align:center;">${data.email }</div>
								<div class="infoList_cell" style="width:50px; text-align:center;">
								<c:if test="${data.id!='admin'}">
									<input type="button" onclick="javascript:deleteMember('${data.id}')" value="탈퇴">
								</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				<br/>

			<!-- 페이징 -->
		   	<div style="padding:10px; text-align:left;"><br>
		        <div style="position:relative; bottom:23px; text-align:center"> ${paging} </div> 
		    </div>
		</div>
		</div>
	</div>
</form>