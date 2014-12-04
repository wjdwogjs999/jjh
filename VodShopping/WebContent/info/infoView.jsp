<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.infoview_table_sub_raw{display:table-raw; border-top-style:solid; border-top-width:1px; border-top-color:rgb(222,222,222); border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:rgb(222,222,222); height:25px; background-color:white; padding:5px}
.infoview_content{display:table-content; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:rgb(222,222,222); height:100% ;padding:5px}
.infoview_cell{display:table-cell;}
</style>

<script type="text/javascript">
	function infoModify(seq){
		window.open("/VodShopping/info/infoModifyForm.do?infoCode=${info.infoCode}", "", "width=850 height=620 left=200 top=100");
	}
</script>

<div style="width:700px; height:100%; margin:20px 20px; font-size:14pt"> <!-- 전체 틀 div -->
		<!-- div1 -->
		<div style="background-color:white; height:60px">
			<h3 style="position:relative; top: 20px; left: 10px; font-size:14pt">공지사항</h3>
		</div><!-- div1 끝부분 -->
		<br/>
		
	<!-- div2 -->
	<div style="background-color:white; height:100%">
		<!-- div2 내부 전체 틀 -->
		<div style="padding:20px; margin:10px 0px;">
			<div style="display:table; width:655px">
			
				<div class="infoview_table_sub_raw">
					<div class="infoview_cell" style="font-weight:bold; float:left; font-size:16px; width:70%;">
						${info.infoSubject }
					</div>
					<div class="infoview_cell" style="width:30%; margin-top:3px; float:right">
						${info.logtime }
					</div>
				</div>
				<br/>
				
				<!-- 공지 -->
				<div class="infoview_content">
					<pre>${info.infoContent}</pre>
				</div>
			</div>
			<!-- bottom메뉴 -->
			<!-- 목록버튼 -->
		    <div style="padding:10px; float:left; text-align:left;">
		        <img onclick="history.back()" src="../image/list_btn.jpg" width="40px" height="28px">
		    </div>
		    <c:if test="${user.id=='admin' }">
			    <div style="float: right; margin-top:10px;">
			    	<input type="button" value="수정" onclick="javascript:infoModify(${info.infoCode})"/>
			    	<input type="button" value="삭제" onclick="location.href='/VodShopping/info/infoDelete.do?infoCode=${info.infoCode}'"/>
			    </div>
		    </c:if>
		</div> <!-- div2 내부 전체 틀 끝 -->
		<br/><br/><br/>
	</div> <!-- div2 끝 -->
</div> <!-- 전체 틀 div 끝 -->