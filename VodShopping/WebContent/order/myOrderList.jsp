<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div style="width: 700px; height: 100%; margin: 20px 20px">

	<div style="background-color: white; height: 60px;">
		<h3 style="position: relative; top: 18px; left: 20px">
			<b style="font-size: 14pt">주문내역</b>
		</h3>
	</div>

	<br />

	<div style="background-color: white; height: 100%; padding-left: 20px">
		<div style="display: table; width: 655px; margin: 20px">
			<div style="display: table-raw; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: rgb(222, 222, 222); height: 30px; margin-top: 20px;">
				<div style="width: 30px; display: table-cell; text-align: center;">번호</div>
				<div style="width: 150px; display: table-cell; text-align: center;">주문일시</div>
				<div style="width: 100px; display: table-cell; text-align: center;">주문번호</div>
				<div style="width: 150px; display: table-cell; text-align: center;">구매상품</div>
				<div style="width: 70px; display: table-cell; text-align: center;">결제방법</div>
				<div style="width: 70px; display: table-cell; text-align: center;">주문금액</div>
			</div>

			<!-- for문 -->

			<c:if test="${orderList!=null && orderList.size()!=0}">
				<c:forEach var="i" begin="0" end="${ orderList.size()-1}" step="1">
					<div
						style="display: table-raw; border-bottom: solid thin rgb(222, 222, 222); height: 30px;margin-top: 10px;">
						<div style="width: 30px; display: table-cell; text-align: center;">${i+1}</div>
						<div style="width: 150px; display: table-cell; text-align: center;"><fmt:formatDate value="${orderList.get(i).orderDate}" pattern="yy-MM-dd" type="date"/><br></div>
						<div style="width: 100px; display: table-cell; text-align: center;">${orderList.get(i).orderCode}</div>
						<div style="width: 150px; display: table-cell; text-align: center;">${orderList.get(i).orderItemsName}</div>
						<c:if test="${orderList.get(i).payment=='VCNT'}">
							<div style="width: 70px; display:table-cell; text-align: center;">가상계좌</div>
						</c:if>
						<div style="width: 70px; display: table-cell; text-align: center;"><fmt:formatNumber type="number" value="${orderList.get(i).totalMoney}" pattern="#,###.##"/>원</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>