<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="product.js"></script>
<div style="width: 700px; height: 100%; margin: 20px 20px;">
	<!-- 리스트 타이틀 -->
	<div style="height: 50px; background: white; font-weight: bold; padding-top: 20px; padding-left: 15px;">
		<div style="margin-top: 3px;">검색하신 컨텐츠들입니다.</div>
	</div>


	<!-- 상품리스트 뿌려주기!! -->
	<div style="background: white; margin-top: 20px; padding: 30px 15px 30px 15px;">
	총 ${contentList.size() }개의 상품이 있습니다.<!--여기서 갯수는 list.length로 받는다 --><br/>
	<c:if test="${contentList.size()!=0 }">
		<c:forEach var="i" begin="0" end="${contentList.size()-1 }">
			<div style="width:330px; heigt:460px;float:left; margin-top: 15px;margin-bottom: 15px; "> 
				<div style="float: left;">
					<img src="../storage/${contentList.get(i).contentImage }" onclick="location.href='/VodShopping/content/contentView.do?contentCode=${contentList.get(i).contentCode}'" width="100" height="100">
				</div>
				<div style="float:left; padding: 15px; line-height: 20px;">
					<a href="/VodShopping/content/contentView.do?contentCode=${contentList.get(i).contentCode}" >${contentList.get(i).contentName } </a><br/>
					<strong style="color:rgb(201,76,0)"><fmt:formatNumber type="number" value="${contentList.get(i).price }" pattern="#,###"/>원</strong><br/>
				</div>
			</div>	
			
			<!-- if문써서 3번째 뿌린놈은 밑에 뿌리게 clear:both써준다 -->
			<c:if test="i%2==0">
			<div style="clear: both; border-top:1px solid rgb(221,221,221);"></div>
			</c:if> 
		</c:forEach>
	</c:if>
	<div style="clear: both; border-top:1px solid rgb(221,221,221);"></div>
	<!-- for문 끝!! -->
	</div>
</div>