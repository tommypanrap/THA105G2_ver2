<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fitanywhere.order.model.*"%>

<%
//見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
OrderVO orderVO = (OrderVO) request.getAttribute("orderVO");
%>
--<%=orderVO == null%>--${empVO.deptno}--
<!-- line 100 -->

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>課程訂單資料新增 - addOrder.jsp</title>
<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
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

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>
	<table id="table-1">
		<tr>
			<td>
				<h3>課程訂單資料新增 - addOrder.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>
	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>>
		</c:forEach>
		</ul>
	</c:if>


	<FORM METHOD="post" ACTION="order.do" name="form1">
		<table>
			<tr>
				<td>購買人ID：</td>
				<td><input type="TEXT" name="u_id"
					value="<%=(orderVO == null) ? "101" : orderVO.getUser().getuId()%>" size="45" /></td>

				
			</tr>

			<tr>
				<td>交易狀態：</td>
				<td><input type="TEXT" name="od_status"
					value="<%=(orderVO == null) ? "3" : orderVO.getOdStatus()%>"
					size="45" /></td>

			</tr>

			<tr>
				<td>課程訂單總金額：</td>
				<td><input type="TEXT" name="od_price"
					value="<%=(orderVO == null) ? "999" : orderVO.getOdPrice()%>"
					size="45" /></td>

			</tr>

			<tr>
				<td>優惠活動ID：</td>
				<td><input type="TEXT" name="dc_id"
					value="<%=(orderVO == null) ? "1" : orderVO.getDc().getDcId()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert" /> <input
			type="submit" value="送出新增" />
	</FORM>


</body>
</html>