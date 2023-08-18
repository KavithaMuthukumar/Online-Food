<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	<a class="navbar-brand" href="index.jsp">オンライン注文</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">ホームページ
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="cart.jsp">カート<span
					class="badge badge-danger px-1">${cart_list.size()}</span></a></li>
			<%
			if (auth != null) {
			%>
			<li class="nav-item"><a class="nav-link" href="orders.jsp">注文</a></li>
			<li class="nav-item"><a class="nav-link" href="log-out">ログアウト</a></li>
			<%
			} else {
			%>
			<li class="nav-item"><a class="nav-link" href="login.jsp">ログイン</a></li>
			<%
			}
			%>

		</ul>
	</div>
</nav>