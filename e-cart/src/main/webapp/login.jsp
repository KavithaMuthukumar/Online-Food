<%@page import="ecart.project.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
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
<title>注文ログイン</title>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
		<img src="product-image/login.jpg"></img>
			<div class="card-header text-center">ユーザログイン</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>メールアドレース</label> <input type="email"
							name="login-email" class="form-control" placeholder="メール入力">
					</div>
					<div class="form-group">
						<label>パスワード</label> <input type="password"
							name="login-password" class="form-control" placeholder="パスワード入力">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">ログイン</button>
					</div>
					<div class="text-center">
						<a href = "register.jsp">新ユーザー？ 登録</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>