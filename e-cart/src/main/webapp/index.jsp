<%@page import="java.util.*"%>
<%@page import="ecart.project.dao.*"%>
<%@page import="ecart.project.model.*"%>
<%@page import="ecart.project.connection.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文ホームページ</title>
<%@include file="/includes/head.jsp"%>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>
<body class="bg-image bgimage"> 
	<div class="container">
		<div class="card-header my-3">全て食べ物</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-4 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="product-image/<%=p.getImage()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">
							価格:
							¥<%=p.getPrice()%>
						</h6>
						<h6 class="category">
							カテゴリー:
							<%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">カート追加</a>
							<a class="btn btn-primary"
								href="order-now?quantity=1&id=<%=p.getId()%>">今すぐ注文</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>