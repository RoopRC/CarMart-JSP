<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CarMart - Login</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {

            font-family: Arial, Helvetica, sans-serif;

            min-height: 100vh;

            background:
                linear-gradient(
                    rgba(17,24,39,0.94),
                    rgba(17,24,39,0.94)
                );

            display: flex;

            flex-direction: column;

        }

        /* NAVBAR */

        .navbar {

            height: 75px;

            background: #111827;

            padding: 0 60px;

            display: flex;

            align-items: center;

            justify-content: space-between;

        }

        .logo {

            color: white;

            text-decoration: none;

            font-size: 30px;

            font-weight: bold;

        }

        .nav-links {

            display: flex;

            gap: 30px;

        }

        .nav-links a {

            color: white;

            text-decoration: none;

        }

        .nav-links a:hover {

            color: #f59e0b;

        }

        /* LOGIN */

        .login-container {

            flex: 1;

            display: flex;

            justify-content: center;

            align-items: center;

            padding: 50px 20px;

        }

        .login-box {

            width: 420px;

            background: white;

            padding: 45px;

            border-radius: 15px;

            box-shadow:
                0 15px 40px rgba(0,0,0,0.3);

        }

        .login-box h1 {

            text-align: center;

            font-size: 32px;

            margin-bottom: 10px;

        }

        .login-subtitle {

            text-align: center;

            color: #6b7280;

            margin-bottom: 30px;

        }

        .form-group {

            margin-bottom: 20px;

        }

        .form-group label {

            display: block;

            margin-bottom: 8px;

            font-weight: bold;

        }

        .form-group input {

            width: 100%;

            padding: 14px;

            border: 1px solid #d1d5db;

            border-radius: 7px;

            font-size: 15px;

            outline: none;

        }

        .form-group input:focus {

            border-color: #f59e0b;

        }

        .login-btn {

            width: 100%;

            padding: 14px;

            border: none;

            border-radius: 7px;

            background: #f59e0b;

            color: #111827;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

        }

        .login-btn:hover {

            background: #d97706;

        }

        .register {

            text-align: center;

            margin-top: 25px;

            color: #6b7280;

        }

        .register a {

            color: #f59e0b;

            text-decoration: none;

            font-weight: bold;

        }

        /* FOOTER */

        footer {

            background: #0b1120;

            color: white;

            text-align: center;

            padding: 25px;

        }

        footer p {

            color: #9ca3af;

            margin-top: 7px;

        }

        @media(max-width:600px) {

            .navbar {

                height: auto;

                padding: 20px;

                flex-direction: column;

                gap: 20px;

            }

            .nav-links {

                flex-wrap: wrap;

                justify-content: center;

            }

            .login-box {

                width: 100%;

                padding: 30px;

            }

        }

    </style>

</head>


<body>


    <!-- NAVBAR -->

    <nav class="navbar">

        <a href="home.jsp" class="logo">
            CarMart
        </a>

        <div class="nav-links">

            <a href="home.jsp">Home</a>

            <a href="cars.jsp">Cars</a>

            <a href="categories.jsp">Categories</a>

            <a href="cart.jsp">🛒 Cart</a>

        </div>

    </nav>


    <!-- LOGIN -->

    <div class="login-container">

        <div class="login-box">

            <h1>
                Welcome Back
            </h1>

            <p class="login-subtitle">
                Login to your CarMart account
            </p>


            <form onsubmit="loginUser(event)">


                <div class="form-group">

                    <label>
                        Email
                    </label>

                    <input
                        type="email"
                        id="email"
                        placeholder="Enter your email"
                        required>

                </div>


                <div class="form-group">

                    <label>
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        placeholder="Enter your password"
                        required>

                </div>


                <button
                    type="submit"
                    class="login-btn">

                    Login

                </button>


            </form>


            <div class="register">

                Don't have an account?

                <a href="#"
                   onclick="registerUser()">

                    Register

                </a>

            </div>

        </div>

    </div>


    <!-- FOOTER -->

    <footer>

        <h3>
            CarMart
        </h3>

        <p>
            Your destination for premium automobiles.
        </p>

    </footer>


    <!-- JAVASCRIPT -->

    <script>

        function loginUser(event) {

            event.preventDefault();

            const email =
                document.getElementById("email").value;

            const password =
                document.getElementById("password").value;


            if (email === "" || password === "") {

                alert("Please enter email and password.");

                return;

            }


            alert(
                "Login successful!\nWelcome to CarMart."
            );

        }


        function registerUser() {

            alert(
                "Registration page will be connected next."
            );

        }

    </script>


</body>

</html>