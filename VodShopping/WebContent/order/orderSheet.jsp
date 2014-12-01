<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function orderDo(totalMoney,size){
	var orderItems="";
	for(var i=0;i<size;i++){
		orderItems=orderItems+$('#content'+i).val()+"-";
	}
	window.open("/VodShopping/order/order.do?orderItems="+orderItems+"&totalMoney="+totalMoney+"&itemCount=2", "", "width=600 height=500 left=400 top=100");
}
</script>
<div style="width: 700px; height: 100%; margin: 20px 20px">
	<div style="background-color: white; height: 30px; padding: 20px 20px">
		<font style="font-size: 14pt">주문하기 / Ordersheet</font>
	</div>
	<br />
	<form name="orderForm" method=post action="">
		<div style="background-color: white; height: 100%; padding: 20px 20px">
			<div>
				구매상세내역
			</div>
			<div style="display: table">
				<div
					style="border-top: 2pt solid rgb(200, 200, 200); border-bottom: 1pt solid rgb(230, 230, 230); background-color: rgb(240, 240, 240); height: 15px; display: table-raw; text-align: center; padding: 5px">
					<div style="display: table-cell; width: 120px"></div>
					<div style="display: table-cell; width: 400px">상품정보</div>
					<div style="display: table-cell; width: 120px">판매가</div>
				</div>

				<!-- 장바구니에서 여러상품이 넘어오므로 for문 -->


				<c:if test="${cartList!=null && cartList.size()!=0}">
					<c:forEach var="i" begin="0" end="${ cartList.size()-1}" step="1">
						<div
							style="border-bottom: 1pt solid rgb(230, 230, 230); height: 50px; display: table-raw; text-align: center; padding: 5px">
							<div style="display: table-cell; width: 120px">
								<a href="/VodShopping/content/contentView.do?contentCode=${cartList.get(i).contentCode}">
								<img src="../storage/${ cartList.get(i).contentImage}" width="50px" height="50px">
								</a>
							</div>
							<div
								style="display: table-cell; width: 400px; vertical-align: middle">
								<a href="/VodShopping/content/contentView.do?contentCode=${cartList.get(i).contentCode}">
								${ cartList.get(i).contentName}
								</a></div>
								<input type="hidden" id="content${i}" value="${cartList.get(i).contentCode}">
							<div
								style="display: table-cell; width: 120px; vertical-align: middle">${ cartList.get(i).price}원</div>
						</div>
					</c:forEach>
				</c:if>
				<!-- 목록 들어갈 for 문 end  -->
				<!-- for문 끝 -->		
						
				<div
					style="background-color: rgb(247, 247, 247); border-bottom: 1pt solid rgb(230, 230, 230); height: 50px">
					<div
						style="float: right; line-height: 20px; margin-top: 5px; font-weight: bold; text-align: right; margin-right: 8px">
						${totalMoney }원<br />
					</div>
					<div
						style="float: right; line-height: 20px; margin-top: 5px; margin-right: 40px;">
						상품합계금액<br /> 
					</div>
				</div>
			</div>
			<br/>

			<!-- 구매자 정보 -->
			<div
				style="background-color: rgb(243, 243, 243); border: 1pt solid rgb(220, 220, 220); height: 130px">
				<div
					style="width: 650px; height: 120px; background-color: white; margin-top: 5px; float: left">
					<div
						style="position: relative; left: 20px; bottom: 5px; float: left">
						<p style="line-height: 25px;">
							구매하시는분<br />
							주소<br /> 
							핸드폰번호<br /> 
							이메일
						</p>
					</div>
					<div
						style="position: relative; left: 50px; bottom: 5px; float: left">
						<div style="line-height: 25px; margin-top: 12px">
							<input type="text" name="name" size="50" readonly="readonly"value="${user.name }"><br />
							${user.addr1 } ${user.addr2} <br />
							<input type="text" name="ordererphone1" size="7"  value="${user.phone1}" required="required">-<input type="text" name="ordererphone2" size="7"  value="${user.phone2}" required>-<input type="text" name="ordererphone3" size="7"  value="${user.phone3}" required><br />
							<input type="text" name="email" size="50"  value="${user.email}" required>
						</div>
					</div>
				</div>
			</div>
			<br />
			<div style="text-align: center">
				<input type="button" value="결재하기" onclick="javascript:orderDo('${totalMoney}','${cartList.size() }')">
				 <input type="button" value="이전으로" onclick="javascript:history.back()">
			</div>
		</div>
		</form>
</div>