<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="width:700px; height:100%; margin:20px 20px;">

	<!-- 위쪽 하얀상자 -->
	<div style="background-color:white; height:60px;" id="mainTitle">
		<b style="position:relative; top:20px; left:20px; font-size:14pt">회원가입 / Sign up</b>
	</div>
	<br>
	
	<c:if test="${Exception==null }">
	<!-- 아래쪽 하얀상자 -->
	<div style="background-color:white; height:200px; padding:20px" id="section">
		<img src="../image/join_ok.gif" style="position:relative; left:200px; top:20px">
	</div>
	</c:if>
	<c:if test="${Exception!=null }">
	<!-- 아래쪽 하얀상자 -->
	<div style="background-color:white; height:200px; padding:20px" id="section">
		<font style="font-size: x-large;color: red;">회원가입 실패</font><br/>
		<font style="font-size: x-large;color: red;">${Exception.toString() }</font>
	</div>
	</c:if>
</div>