<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.input_txt{
	font-size:12px;
 	font-weight: 700;
 	color: #515151;
}
table {
	font-size: 12px;
}
.cart-top{
	padding:20px;
	background:#fff;
	margin-bottom:20px;
	color: #515151;
	font-size: 18px;
}
.cart-bottom{
	background:#fff;
	padding: 20px;
	color: #515151;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var total=0;
	for(var i=0;i<$('#size').val();i++){
		total = total+parseInt($('#price'+i).val());
	}
	$('#totalPrice').text(total);
	$('#totalMoney').val(total);
});

function orderDo(){
	if($('#size').val()==0)
		alert("장바구니에 상품이 남아있지 않습니다!!");
	else
		document.basketForm.submit();
}
</script>
<div style="width: 700px; height: 100%; margin: 20px 20px;">
	<!-- 전체 틀 div -->
	<div class="cart-top">
		<b style="font-size: 14pt">장바구니 <em style="font-size: 14pt">/
				Shopping cart</em></b>
	</div>
	<div class="cart-bottom">
		<!-- Start indiv -->
		<form name="basketForm" method="post"
			action="/VodShopping/order/orderSheet.do">
			<input type=hidden id="size" value="${cartList.size() }"><br>
			<input type="hidden" id="totalMoney" name="totalMoney">
			<table width=100% cellpadding=0 cellspacing=0 border=0>
				<tr>
					<td height=2 bgcolor="#CCCCCC" colspan=10></td>
				</tr>
				<tr bgcolor=#F0F0F0 height=23>
					<th colspan=2 class="input_txt">상품정보</th>
					<th class="input_txt">판매가</th>
					<th class="input_txt">삭제</th>
				</tr>
				<tr>
					<td height=1 bgcolor="#D6D6D6" colspan=10></td>
				</tr>
				<col width=60>
				<col>
				<col width=60>
				<col width=80>
				<col width=50>
				<col width=80>
				<col width=50>
				<!-- 선택목록 들어가 for문 start -->
				<c:if test="${cartList!=null && cartList.size()!=0}">
					<c:forEach var="i" begin="0" end="${ cartList.size()-1}" step="1">
						<tr>
							<td height=60 align=center><a
								href="/VodShopping/content/contentView.do?contentCode=${cartList.get(i).contentCode}"><img
									src="../storage/${ cartList.get(i).contentImage}" width="40" /></a>
							</td>
							<td><a
								href="/VodShopping/content/contentView.do?contentCode=${cartList.get(i).contentCode}">${cartList.get(i).contentName}</a>
							</td>
							<td align=center style="padding-right: 10"><fmt:formatNumber
									type="number" value="${ cartList.get(i).price}"
									pattern="#,###.##" />원 <input type="hidden"
								value="${ cartList.get(i).price}" id="price${i}"></td>
							<td align=center><a
								href="/VodShopping/cart/deleteCartItem.do?seq=${i }"><img
									src="../image/sbtn_del.gif"></a></td>
						</tr>
						<tr>
							<td colspan=10 height=1 bgcolor=#DEDEDE></td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td colspan=10 height=60 bgcolor=#f7f7f7 align=right>
						<table>
							<tr>
								<td align=right width=80 nowrap style="font-size: 12px">상품합계금액</td>
								<td align=right style="font-weight: bold; padding-left: 20px"><span
									id="totalPrice"></span>원</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan=10 height=1 bgcolor=#efefef></td>
				</tr>
			</table>
			<br>
			<TABLE width=100% cellpadding=0 cellspacing=0 border=0>
				<tr>
					<td align=center><input type="button" value="주문하기"
						onclick="javascript:orderDo()">&nbsp; <input type="button"
						onclick="history.back()" value="이전으로">&nbsp; <input
						type="button"
						onclick="location.href='/VodShopping/cart/cartAllDelete.do'"
						value="비우기">&nbsp;</td>
				</tr>
			</TABLE>
			<div align="center"></div>
			<div align="center"></div>
		</form>
		<!-- form end -->
	</div>
	<!-- End indiv -->
</div>
