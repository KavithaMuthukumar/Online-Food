<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>注文支払い</title>
<link href="css/payment.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="payment-container">
		<h1>注文支払い</h1>
		<form id="paymentForm" onsubmit="finalPage()">
			<div class="form-group">
				<label for="cardNumber">カード番号</label> <input type="text"
					id="cardNumber" required>
			</div>
			<div class="form-group">
				<label for="expirationDate">有効期限</label> <input
					type="text" id="expirationDate" required>
			</div>
			<div class="form-group">
				<label for="cvv">CVV</label> <input type="text" id="cvv" required>
			</div>
			<div class="form-group">
				<label for="name">氏名</label> <input type="text"
					id="name" required>
			</div>
			<button type="submit">今払う</button>
		</form>
		<script>
        function finalPage() {
            // Prevent the default form submission behavior
            event.preventDefault();

            // Redirect to the next page
            window.location.href = "success.jsp"; // 
        }
    </script>
	</div>
</body>
</html>