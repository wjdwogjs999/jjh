<%--
	/*
	 * =============================================
	 * Filename	:	pay.jsp
	 * Function	:	������û ������
	 * Author		:	All contents Copyright 2013 Bankwell Co. all rights reserved
	 * =============================================
	 */
--%>
<%@ page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>�����ϱ�</title>    
  <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
  <!-- 
  	* 1. �����⺻��� Include
  	* ��ũ�� ��������� BluePayAPI.js�� include �մϴ�. 
  	*	��� ���������� ȣȯ���� ��ũ��Ʈ ȣ������� Ȯ���� �ϱ� ���ؼ� �� <head> tag ��ܿ� �߰��Ͻñ� �ٶ��ϴ�.
  -->
  <script language="javascript" type="text/javascript" src="https://pay.bluepay.co.kr/Script/BluePayAPI.js"></script>
    
  <script language="javascript" type="text/javascript">    	
	/*
	 * 3. ������ �����ϱ� ���ؼ� ȣ���ϴ� �Լ�
	 * ������� ����ȣ��!
	 */
	function startPayment(){
		
		var payType = document.PGIOForm.Pay_Type.value;
		
		// �Ҿװ����ΰ�� ����â���� ������ ��ȭ��ȣ�� �Է¹ޱ⸦ ���ϴ� ���, ��ȭ��ȣ �ʱ�ȭ�� ���ּ���.
		if(payType == "MCASH" || payType == "PBILL"){
			 document.PGIOForm.buyr_tel2.value = "";
		}
		
		doTransaction(document.PGIOForm);
	}
	
	/*
	 * 5. OpenPayAPI�� ���� â�� ���Ͽ� ������ �Ϸ� �ʰ� ���ÿ� ������ getPGIOresult() ��� �̸��� �Լ��� ȣ��(callback) �մϴ�.
	 * ������̰��������� �ڵ����� ȣ��Ǵ� �Լ�
	 * ����: ���� ���� �� ���� �ʿ� ���������� ����Ǵ� �߿� alert ȣ�� �� ������� ��û�� ��ٸ��� �ҽ��� �������� ���ʽÿ�. 
	 *			 ���� alert('��������') �̶�� �޽����� ���� �������� ���� �ÿ� ���������� ���� ������ ���޵� �� �����ϴ�.
	 */
	function getPGIOresult() {
					
		var BKW_RESULTCD = getPGIOElement('BKW_RESULTCD');
		var BKW_RESULTMSG = getPGIOElement('BKW_RESULTMSG');
		var BKW_SHA256 = getPGIOElement('BKW_SHA256');
		
		// �Լ��ȿ� ��������/���� �� �ʿ��� ���۵鿡 ���ؼ� �������ֽø� �˴ϴ�.
		// �Լ����� �ڵ忡 ���ؼ��� ���ð� �ٸ��� �ϼŵ� �����մϴ�.
		
		// 1) �ŷ������� ���		
		if (BKW_RESULTCD == '0000') {
			// �ŷ����� ���, DBó�� �� ����������� �ȳ��� �� �ִ� �������� �̵��Ͻø� �˴ϴ�.
			// Ÿ�ټ����ʼ�!
			document.PGIOForm.target = "_self";
			document.PGIOForm.action = '/VodShopping/order/orderSuccess.do';
			document.PGIOForm.submit();
		} else {
		  // 2) �ŷ����� ��� �������� ���ϴ� ���·� �����Ͻø� �˴ϴ�.
		  // 2-1) ���п� ���ؼ��� ���� ó���� �ʿ��� ���
		  //document.PGIOForm.target = "_self";
		  //document.PGIOForm.action = './result.jsp';
		  //document.PGIOForm.submit();		
		  
		  // 2-2) ���� ó������ ȭ�� refresh.
		  alert("������ �����Ͽ����ϴ�.");
		  window.location.reload();			  
		}
	}
	
	</script>
</head>
<body>
<table width="470" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>			
			<!--
				* 2. ������ �����ϱ� ���� ���� ���� PGIOForm�� ä���ݴϴ�.
				* �Ʒ��� ������ ���ؼ� �ʿ��� input �±��Դϴ�. �����͸� ������ ������ ������ ä���ּ���
				* �ڼ��� ������ [BluePay ���������Ŵ���] �� �����ϼ���.
			-->
			<!-- �������� �Է� form : PGIOForm -->
			<form name="PGIOForm" accept-charset="UTF-8" method="post"><!-- accept-charset �� ��ũ���������� ��ſ��� ���˴ϴ�. �������� ������. -->
				<!--
				  ===========================
			  	* ���뺯�� : �ʼ�����
			  	===========================
				-->
			  <input type="hidden" name="site_cd" value="P0430" />		<!-- ����Ʈ�ڵ�(�ʼ�) : ��ũ���� ���� ���� ����Ʈ�ڵ带 �Է��ϼ��� -->
			  <input type="hidden" name="pg_type" value="PGNW" />			<!-- ������� Ÿ��(�ʼ�) : �������������� -->
			  <input type="hidden" name="charset"  value="euc-kr"/>		<!-- ������charset(�ʼ�) charset�� UTF-8�� ���, �빮��(UTF-8)�� ���� ��Ź�帳�ϴ� -->
			  <input type="hidden" name="Result_URL" value="/VodShopping/pay_sample/bluepay/pop_Result.jsp" />			<!-- �������(pop_Result)�� ��ġ�� ������. URL�� �����ϰ� �Է��ϼ���. (�ʼ�)-->
			  
			  <!--
					* 2012�� 8�� 18�� ���ڻ�ŷ��� ���� ���� ���� �κ�	
					* �ڼ��� ��������� �������� �Ŵ��� ����
				-->
				<input type="hidden" name="goodperiod" value="" /><!-- [�Ҿװ����� ���ؼ� �ʼ��׸�] ��ǰ�����Ⱓ -->
				
			  
			  <table border="1" cellpadding="5" cellspacing="1" width="100%">
			  	 <!--
			      	* ��������(Pay_Type) : �ʼ�
							* ���������� �ش�Ǵ� ���� �Ѱ��ּ���
							* �ſ�ī��: CARD, ������ü: ACNT, �������: VCNT, �޴����Ҿװ���: MCASH,  ������ȭ����: PBILL
							* ��ũ��(��)�� ��û�� �����������θ� ������ �����մϴ�.
						-->
						<tr>			      		
			      		<td colspan="2" align="center">���� �ʼ�����</td>
			      </tr>
			      <tr>			      		
			      		<td>��������(Pay_Type)</td>
			        	<td>
			        		<select name="Pay_Type">
			        			<option value="CARD" selected="selected">�ſ�ī��</option>
										<option value="VCNT">�������</option>
									</select>
								</td>
			      </tr>
			      <!--�����ֹ���ȣ(ordr_idxx) : �ʼ� -->
			      <tr>
			          <td>�����ֹ���ȣ(ordr_idxx)</td>
			          <td><input type="text" name="ordr_idxx" value="castis007" readonly="readonly"/></td>
			      </tr>
			      <!-- ��ǰ��(good_name) : �ʼ� -->
			      <tr>
			          <td>��ǰ��(good_name)</td>
			          <td><input type="text" name="good_name" value="${order.orderItemsName}" readonly="readonly"/>
			          <input type="hidden" name="orderItems" value="${order.orderItems }"/>
			          </td>
			      </tr>
			      <!--��ǰ����(good_mny) : �ʼ�(���ڸ� �Ѱ��ּ���) -->
			      <tr>
			          <td>�����ݾ�(good_mny)</td>
			          <td><input type="text" name="good_mny" value="${order.totalMoney }" readonly="readonly"/></td>
			      </tr>
			      <!-- �����ڸ�(buyr_name) : �ʼ� -->
			      <tr>
			          <td>�ֹ��ڸ�(buyr_name)</td>
			          <td><input type="text" name="buyr_name" value="${user.name }" readonly="readonly"/></td>
			      </tr>
			  </table><br>
			  
			  <!--
			  	===========================
			  	* ���뺯�� : �ΰ�����
			  	===========================
				-->				 
			  <table border="1" cellpadding="5" cellspacing="1" width="100%">
			  		<tr>			      		
			      		<td colspan="2" align="center">���� �ΰ�����</td>
			      </tr>
			      <!--�ֹ��� �̸���(buyr_mail) : ���� -->
			      <tr>
			          <td>�ֹ��� �̸���(buyr_mail)</td>
			          <td><input type="text" name="buyr_mail" value="${user.email }"/></td>
			      </tr>
			      <!--�ֹ��� ��ȭ��ȣ(buyr_tel1) : ���� -->
			      <tr>
			          <td>�ֹ��� ��ȭ��ȣ(buyr_tel1)</td>
			          <td><input type="text" name="buyr_tel1" value="${user.phone1 }${user.phone2 }${user.phone3 }"/></td>
			      </tr>
			      <!--�ֹ��� ��ȭ��ȣ(buyr_tel2) : ���� -->
			      <tr>
			          <td>�ֹ��� �޴�����ȣ(buyr_tel2)</td>
			          <td><input type="text" name="buyr_tel2" value="${user.phone1 }${user.phone2 }${user.phone3 }"/></td>
			      </tr>
			      <!--����� �ּ�(rcvr_zipx, rcvr_add1, rcvr_add2) : �ɼ� -->
			      <tr>
			          <td>����� �����ȣ(rcvr_zipx)</td>
			          <td><input type="text" name="rcvr_zipx" value="${user.zipcode1 }${user.zipcode2 }"/></td>
			      </tr>
			      <tr>
			          <td>����� �ּ�(rcvr_add1)</td>
			          <td><input type="text" name="rcvr_add1" value="${user.addr1 }"/></td>
			      </tr>
			      <tr>
			          <td>����� ���ּ�(rcvr_add2)</td>
			          <td><input type="text" name="rcvr_add2" value="${user.addr2 }"/></td>
			      </tr>
			  </table>
			  
			  <input type="hidden" name="Noti_URL" value="" />		<!-- ���ƼURL-->
			  <input type="hidden" name="rcvr_name" value="" />		<!-- �����θ�-->
			  <input type="hidden" name="rcvr_tel1" value="" />		<!-- ������ ��ȭ��ȣ-->
			  <input type="hidden" name="rcvr_mail" value="" />		<!-- ������ E-MAIL-->
			  <input type="hidden" name="rcvr_date" value="" />		<!-- ��� �����-->
			  <input type="hidden" name="rqst_msgx" value="" />		<!-- ��� �ڸ�Ʈ-->
			  <input type="hidden" name="kindcss" value="" />			<!-- ����â��Ų(blue, green, pink, violet, yellow) -->
			  <input type="hidden" name="goodoption1"  value=""/> <!-- �����ʵ�(�������� ��밡���� �����ʵ�) -->
			  <input type="hidden" name="goodoption2"  value=""/> <!-- �����ʵ�(�������� ��밡���� �����ʵ�) -->
				<input type="hidden" name="goodoption3"  value=""/> <!-- �����ʵ�(�������� ��밡���� �����ʵ�) -->
				<input type="hidden" name="goodoption4"  value=""/> <!-- �����ʵ�(�������� ��밡���� �����ʵ�) --> 
				<input type="hidden" name="goodoption5"  value=""/> <!-- �����ʵ�(�������� ��밡���� �����ʵ�) -->
				
				<!--
			  	=================================
			  	* �������ܺ� ���� : �ΰ�����
			  	=================================
				-->
				<input type="hidden" name="card_quota"  value=""/> 	<!--[�ſ�ī��] ī���ҺαⰣ -->
				<input type="hidden" name="cardtype"  value=""/> 		<!--[�ſ�ī��] ����ī������ -->
			  
				<!-- 
					* 5�����̻��� ������ü/������� �ŷ��� ���ؼ��� ����ũ�� �������θ� ���� â�� �ڵ����� ǥ�õ˴ϴ�.(��, ����ũ�μ��񽺸� ��û�� ������ ����)
					* ������ ����ũ�� �������� ���Ͻô� ��� escrow_type ������ value������ "EA01" �� �Ѱ��ֽø� �˴ϴ�.
				-->
				<input type="hidden" name="escrow_yn"  value="" />	<!-- [������ü/�������] ����ũ�� �������(Y/N)-->
				<input type="hidden" name="escrow_type"  value="" /><!-- [������ü/�������] ����ũ�ΰ�������(EA01:������ ����ũ�ΰ���/EA02:������ ����ũ��)-->
			  
			  <input type="hidden" name="bankcode" value="" />		<!-- [�������] �߱������ڵ� -->
			  
			  <!--
					* ��ũ������ ������ ���� �ܿ� ���������� �ʿ��� ������ ��밡���մϴ�.
					* ��, ������ ������ ��ũ���ý��ۿ� ��������� ������, ������ �����ϼž��մϴ�.
					* ���� �ŷ������������ ���� �ŷ���� �������� ��� ������ ���� ���� ���޵��������� ���ǹٶ��ϴ�.
				-->
							  			
				
				<!--
				  ===========================
			  	* �������� ���� : ���� �ʼ�!!
			  	* ��ũ������ ������ �����ϸ鼭 ���� ä��� �׸��Դϴ�.
			  	* ���� �������� ������.
			  	===========================
				-->				
			  <!--���� �Ķ����-->
				<input type="hidden" name="BKW_RESULTCD"  value="">		<!-- ���Ұ���ڵ� 0000 ����  0000�̿� ���� -->
				<input type="hidden" name="BKW_RESULTMSG"  value="">	<!-- ���Ұ���޽���-->
				<input type="hidden" name="BKW_TRADENO"  value="">		<!-- ������̰ŷ���ȣ(�ڵ�ä���Ǵ� ��������������)-->					
				<input type="hidden" name="BKW_PAYTYPE"  value="">		<!-- �������� �ſ�ī��: PA11 / ������ü: PA03 / �������: PA10 / �޴��� �Ҿװ���: PA08 / ���� ��ȭ����: PA01-->
				<input type="hidden" name="BKW_AUTHDATE"  value="">		<!-- ��������-->
				<input type="hidden" name="BKW_AMOUNT"  value="">			<!-- ���αݾ�-->
				<input type="hidden" name="BKW_SHA256"  value="" >		<!-- �ŷ��ݾװ��� hash �� -->
				
				<!--�ſ�ī��-->
				<input type="hidden" name="BKW_AUTHNO"  value="">			<!-- ī����ι�ȣ-->
				<input type="hidden" name="BKW_CARDNAME" value="">		<!-- ī���-->
				<input type="hidden" name="BKW_QUOTA"  value="">			<!-- �Һΰ��� 00 �Ͻú� 02 2����-->
				
				<!--������ü �������-->
				<input type="hidden" name="BKW_BANKNM"  value="">			<!-- �����-->
				<input type="hidden" name="BKW_BANKACCOUNT"  value=""><!-- ������� �߱ް��¹�ȣ-->
				
				<!--�޴���/��ȭ����-->
				<input type="hidden" name="BKW_PHONENO"  value="">			<!--  ������ȭ��ȣ-->
				<input type="hidden" name="BKW_PHONECOMMTYPE"  value=""><!--  ��Ż�(SKT,KT,LGT)-->
			  
			</form>
			
		</td>
	</tr>
	<tr>
    <td align="center">&nbsp;</td>
  </tr>
	<tr>		
		<td align="center">
			<!-- 
				* 4. ������ ���� �ϱ� ���� ȭ���� ��� ������ �����մϴ�.(PGIOscreen)
				* div �±��� id�� �� PGIOscreen ���� �����ϼž� �մϴ�.
				* �������� �޼ҵ带 ȣ���ϸ� div �±׾ȿ� ����â�� ǥ�õ˴ϴ�.
				* style �������� width 320px�� ǥ�õ˴ϴ�. ���ϴ� size�� �����ø� style�� �������ֽø� �˴ϴ�.
				* ����!!
				* PGIOscreen �ȿ��� ������ �����ϱ� ���� ī�� ������ �Է� �޴� <form> �� ���ԵǾ� �ֽ��ϴ�. 
				* �׷��Ƿ� PGIOscreen�� ��� <form> tag�� �ѷ� �ο� ������ �ȵ˴ϴ�. 
			 -->
			<div id="PGIOscreen" style="width:100%;">
	    <input type="button" value="�����ϱ�" onClick="startPayment();">
	    </div>
    </td>
  </tr>
</table>
</body>
</html>