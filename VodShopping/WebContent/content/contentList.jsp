<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="product.js"></script>
<script type="text/javascript">
function contentList(pg,category_seq) {
	document.contentListForm.action='/VodShopping/content/contentList.do?pg='+pg+'&category_seq='+category_seq;
	document.contentListForm.submit();
}
function subContentList(pg, category_seq, subCategory_seq){
	document.contentListForm.action='/VodShopping/content/subContentList.do?pg='+pg+'&category_seq='+category_seq+'&subCategory_seq='+subCategory_seq;
	document.contentListForm.submit();
}
</script>
<form name="contentListForm" method="post" action="">
	<div style="width:700px; height:100%; margin:20px 20px;"> <!-- 전체 틀 div -->
		<!-- 리스트 타이틀 -->
		<div style="height: 50px; background: white; font-weight:bold; padding-top: 20px; padding-left: 15px;">
			<div style="margin-top:3px">
			<c:forEach var="data" items="${subCategoryList }">
				<a href="/VodShopping/content/subContentList.do?category_seq=${data.category_group }&subCategory_seq=${data.category_seq}&pg=1">${data.category_name }</a> | 
			</c:forEach>
			</div>
		</div>
		
		<!-- 리스트 내용 -->
		<div style="height: 100%; background: rgb(242,222,222); margin-top: 20px; border:4px solid rgb(238,211,215); color:rgb(185,74,72)">
		<p style="line-height:18px; margin:10px 15px;">
		환영합니다^^
		</div>
		
		<!-- 상품리스트 뿌려주기!! -->
		<div style="background: white; margin-top: 20px; padding: 30px 15px 30px 15px">
		총 ${list.size() }개의 상품이 있습니다.<!--여기서 갯수는 list.length로 받는다 --><br/>
		<c:if test="${list.size()!=0 }">
			<c:forEach var="i" begin="0" end="${list.size()-1 }">
				<div style="width:330px; heigt:460px;float:left; margin-top: 15px;margin-bottom: 15px; "> 
					<div style="float: left;">
						<img src="../storage/${list.get(i).contentImage }" onclick="location.href='/VodShopping/content/contentView.do?contentCode=${list.get(i).contentCode}'" width="100" height="100">
					</div>
					<div style="float:left; padding: 15px; line-height: 20px;">
						<a href="/VodShopping/content/contentView.do?contentCode=${list.get(i).contentCode}" >${list.get(i).contentName } </a><br/>
						<strong style="color:rgb(201,76,0)"><fmt:formatNumber type="number" value="${list.get(i).price }" pattern="#,###"/>원</strong><br/>
					</div>
				</div>	
				
				<!-- if문써서 3번째 뿌린놈은 밑에 뿌리게 clear:both써준다 -->
				<c:if test="i%2==0">
				<div style="clear: both; border-top:1px solid rgb(221,221,221);"></div>
				</c:if> 
			</c:forEach>
		</c:if>
		<!-- for문 끝!! -->
		<div style="clear: both; border-top:1px solid rgb(221,221,221);"></div>
			<!-- 원래는 페이징 기법이 들어갈자리 -->
			<div style="clear:both; text-align: center; padding-top: 30px">${paging }</div>
		</div><!-- 상품 리스트 끝 --> 
	</div><!-- 전체 body -->
</form>