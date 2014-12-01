<%@ page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>
<%
    /*
		 * =============================================
		 * Filename	:	pop_Result.jsp
		 * Function	:	Bluepay �˾� ���� ��, �˾����� �̵��ϴ� ������(PGNW ����ü ������)
		 * Author		:	All contents Copyright 2013 Bankwell Co. all rights reserved
		 * =============================================
		 */


		/*
     * ���� ��� �Ķ����
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
		<!--���� �Ķ����-->
		<input type="hidden" name='BKW_RESULTCD'  value="<%=BKW_RESULTCD%>">   	<!--// ���ΰ���ڵ� 0000 ����  0000�̿� ���� -->
		<input type="hidden" name='BKW_RESULTMSG'  value="<%=BKW_RESULTMSG%>"> 	<!--// ��� �޼���-->
		<input type="hidden" name='BKW_TRADENO'  value="<%=BKW_TRADENO%>">   		<!--// ��ũ�� ���� ������ȣ-->
		<input type="hidden" name='BKW_PAYTYPE'  value="<%=BKW_PAYTYPE%>">   		<!--// ��������-->
		
		<input type="hidden" name='BKW_AUTHDATE'  value="<%=BKW_AUTHDATE%>">   	<!--// ��������-->
		<input type="hidden" name='BKW_AMOUNT'  value="<%=BKW_AMOUNT%>">   			<!--// ���αݾ�-->
		<input type="hidden" name='BKW_SHA256'  value="<%=BKW_SHA256%>">   			<!--// �ŷ��ݾװ��� hash ��-->
		
		<!--������ü �������-->
		<input type="hidden" name='BKW_BANKNM'  value="<%=BKW_BANKNM%>">         	<!--// �����̸�-->
		<input type="hidden" name='BKW_BANKACCOUNT'  value="<%=BKW_BANKACCOUNT%>"><!--// �������-->
		
		<!--������Ҿ� ARS-->
		<input type="hidden" name='BKW_PHONENO'  value="<%=BKW_PHONENO%>">              <!--// ������Ҿ� ��ȭ��ȣ-->
		<input type="hidden" name='BKW_PHONECOMMTYPE'  value="<%=BKW_PHONECOMMTYPE%>">  <!--// ������Ҿ� ��Ż�-->
		
		<!--CARD-->
		<input type="hidden" name='BKW_AUTHNO'  value="<%=BKW_AUTHNO%>">     	<!--// ���ι�ȣ-->
		<input type="hidden" name='BKW_CARDNAME'  value="<%=BKW_CARDNAME%>">  <!--// ī���ȣ-->
		<input type="hidden" name='BKW_QUOTA'  value="<%=BKW_QUOTA%>">        <!--// �Һΰ��� 00 �Ͻú� 02 2����-->
		</form>
		<input type="button" onclick="Pay_Result_PGNW();" value="Ȯ��">
	</body>
</html>