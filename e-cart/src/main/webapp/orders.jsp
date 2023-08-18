<%@page import="ecart.project.connection.DbCon"%>
<%@page import="ecart.project.dao.ProductDao"%>
<%@page import="ecart.project.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="ecart.project.dao.OrderDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>注文</title>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">注文</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">日付</th>
					<th scope="col">アイテム名</th>
					<th scope="col">カテゴリー</th>
					<th scope="col">量</th>
					<th scope="col">価格</th>
					<th scope="col">キャンセル</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">注文キャンセル</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>