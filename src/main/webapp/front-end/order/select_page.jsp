<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<title>IBM Order: Home</title>
<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>IBM Order: Home</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the Home page for FitanyWhere Order: Home</p>

	<h3>資料查詢:</h3>

	<%-- 錯誤表列 --%>

	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='list_all_order.jsp'>List</a> all Orders. <br>
		<br></li>


		<li>
			<FORM METHOD="post" ACTION="order.do">
				<b>輸入課程訂單編號 (如1):</b> <input type="text" name="od_id"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="odSvc" scope="page"
			class="com.fitanywhere.order.model.OrderService" />


		<li>
			<FORM METHOD="post" ACTION="order.do">
				<b>選擇課程訂單編號:</b> <select size="1" name="od_id">
					<c:forEach var="orderVO" items="${odSvc.all}">
						<option value="${orderVO.odId}">${orderVO.odId}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		


	</ul>


	<h3>課程訂單管理</h3>
	<ul>
		<li><a href='add_order.jsp'>Add</a> a new Order.</li>
	</ul>

</body>
</html>