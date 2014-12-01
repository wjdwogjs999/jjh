<%@ page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>
<%
    /*
		 * =============================================
		 * Filename	:	pop_Result.jsp
		 * Function	:	Bluepay 팝업 결제 후, 팝업에서 이동하는 페이지(PGNW 사용업체 배포용)
		 * Author		:	All contents Copyright 2013 Bankwell Co. all rights reserved
		 * =============================================
		 */


		/*
     * 결제 결과 파라미터
     */     
    String BKW_RESULTCD       = request.getParameter("BKW_RESULTCD");
    String BKW_RESULTMSG      = request.getParameter("BKW_RESULTMSG");
    String BKW_TRADENO        = request.getParameter("BKW_TRADENO");
    String BKW_PAYTYPE        = request.getParameter("BKW_PAYTYPE");
    String BKW_AUTHDATE       = request.getParameter("BKW_AUTHDATE");
    String BKW_AMOUNT        	= request.getParameter("BKW_AMOUNT");
    String BKW_BANKNM         = request.getParameter("BKW_BANKNM");
    String BKW_BANKACCOUNT    = request.getParameter("BKW_BANKACCOUNT");
    String BKW_PHONENO        = request.getParameter("BKW_PHONENO");
    String BKW_PHONECOMMTYPE  = request.getParameter("BKW_PHONECOMMTYPE");
    String BKW_AUTHNO         = request.getParameter("BKW_AUTHNO");
    String BKW_CARDNAME       = request.getParameter("BKW_CARDNAME");
    String BKW_QUOTA         	= request.getParameter("BKW_QUOTA");
    String BKW_SHA256         = request.getParameter("BKW_SHA256");
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<title>BLUEPAY RESULT</title>
		<!--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
		<script language="javascript" type="text/javascript" src="https://pay.bluepay.co.kr/Script/BluePayAPI.js"></script>
		<!--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
	</head>
	<body onload="javascript:Pay_Result_PGNW();">
		<form name="BLUEPAY_FORM">
		<!--공통 파라미터-->
		<input type="hidden" name='BKW_RESULTCD'  value="<%=BKW_RESULTCD%>">   	<!--// 승인결과코드 0000 성공  0000이외 오류 -->
		<input type="hidden" name='BKW_RESULTMSG'  value="<%=BKW_RESULTMSG%>"> 	<!--// 결과 메세지-->
		<input type="hidden" name='BKW_TRADENO'  value="<%=BKW_TRADENO%>">   		<!--// 뱅크웰 결제 고유번호-->
		<input type="hidden" name='BKW_PAYTYPE'  value="<%=BKW_PAYTYPE%>">   		<!--// 결제수단-->
		
		<input type="hidden" name='BKW_AUTHDATE'  value="<%=BKW_AUTHDATE%>">   	<!--// 승인일자-->
		<input type="hidden" name='BKW_AMOUNT'  value="<%=BKW_AMOUNT%>">   			<!--// 승인금액-->
		<input type="hidden" name='BKW_SHA256'  value="<%=BKW_SHA256%>">   			<!--// 거래금액검증 hash 값-->
		
		<!--계좌이체 가상계좌-->
		<input type="hidden" name='BKW_BANKNM'  value="<%=BKW_BANKNM%>">         	<!--// 은행이름-->
		<input type="hidden" name='BKW_BANKACCOUNT'  value="<%=BKW_BANKACCOUNT%>"><!--// 은행계좌-->
		
		<!--헨드폰소액 ARS-->
		<input type="hidden" name='BKW_PHONENO'  value="<%=BKW_PHONENO%>">              <!--// 헨드폰소액 전화번호-->
		<input type="hidden" name='BKW_PHONECOMMTYPE'  value="<%=BKW_PHONECOMMTYPE%>">  <!--// 헨드폰소액 통신사-->
		
		<!--CARD-->
		<input type="hidden" name='BKW_AUTHNO'  value="<%=BKW_AUTHNO%>">     	<!--// 승인번호-->
		<input type="hidden" name='BKW_CARDNAME'  value="<%=BKW_CARDNAME%>">  <!--// 카드번호-->
		<input type="hidden" name='BKW_QUOTA'  value="<%=BKW_QUOTA%>">        <!--// 할부개월 00 일시불 02 2개월-->
		</form>
		<input type="button" onclick="Pay_Result_PGNW();" value="확인">
	</body>
</html>