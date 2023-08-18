<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>注文登録</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">

            <div class="regbox box">
                <img class="avatar" src="product-image/collaboration.png">
                <h1>登録</h1>
                <form action="RegisterServlet" method="post">
                    <p>お名前</p>
                    <input type="text" placeholder="お名前入力" name="name" required>
                    <p>メールアドレース</p>
                    <input type="text" placeholder=メール入力 name="email" required>
                    <p>パスワード</p>
                    <input type="password" placeholder="パスワード入力" name="password" required>
                    <input type="submit" value="登録">
                    <a href="login.jsp">すでにアカウントをお持ちですか?</a>
                </form>
            </div>

        </div>

    </body>
</html>