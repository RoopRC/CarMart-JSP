<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CarMart - Cart</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f6f8;
            color: #111827;
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
            align-items: center;
            gap: 30px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
        }

        .nav-links a:hover {
            color: #f59e0b;
        }

        /* HEADER */

        .header {
            background: #111827;
            color: white;
            text-align: center;
            padding: 65px 20px;
        }

        .header p {
            color: #f59e0b;
            font-weight: bold;
            letter-spacing: 3px;
            margin-bottom: 15px;
        }

        .header h1 {
            font-size: 48px;
        }

        /* CART */

        .cart-section {
            max-width: 1000px;
            margin: auto;
            padding: 60px 25px;
        }

        .cart-box {
            background: white;
            border-radius: 15px;
            padding: 35px;

            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 20px 0;

            border-bottom: 1px solid #e5e7eb;
        }

        .car-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .car-icon {
            width: 70px;
            height: 70px;

            background: #fff7ed;

            border-radius: 10px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 35px;
        }

        .car-name {
            font-size: 20px;
            font-weight: bold;
        }

        .car-price {
            color: #f59e0b;
            margin-top: 6px;
        }

        .remove-btn {
            border: none;

            background: #fee2e2;

            color: #dc2626;

            padding: 10px 15px;

            border-radius: 6px;

            cursor: pointer;
        }

        .remove-btn:hover {
            background: #fecaca;
        }

        .total {
            display: flex;
            justify-content: space-between;

            padding-top: 25px;

            font-size: 23px;

            font-weight: bold;
        }

        .checkout-btn {
            margin-top: 25px;

            width: 100%;

            padding: 15px;

            border: none;

            background: #f59e0b;

            color: #111827;

            border-radius: 7px;

            font-size: 17px;

            font-weight: bold;

            cursor: pointer;
        }

        .checkout-btn:hover {
            background: #d97706;
        }

        .empty {
            text-align: center;

            padding: 60px 20px;

            color: #6b7280;
        }

        .empty-icon {
            font-size: 60px;
            margin-bottom: 20px;
        }

        .continue {
            display: inline-block;

            margin-top: 25px;

            padding: 12px 25px;

            background: #111827;

            color: white;

            text-decoration: none;

            border-radius: 6px;
        }

        footer {
            background: #0b1120;
            color: white;
            text-align: center;
            padding: 35px;
            margin-top: 30px;
        }

        footer p {
            color: #9ca3af;
            margin-top: 8px;
        }

        @media(max-width:700px) {

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

            .cart-item {
                gap: 15px;
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

            <a href="login.jsp">Login</a>

        </div>

    </nav>


    <!-- HEADER -->

    <section class="header">

        <p>YOUR SELECTION</p>

        <h1>Shopping Cart</h1>

    </section>


    <!-- CART -->

    <section class="cart-section">

        <div class="cart-box">

            <div id="cartItems">

                <!-- JavaScript will display items -->

            </div>

            <div id="cartTotal"></div>

        </div>

    </section>


    <!-- FOOTER -->

    <footer>

        <h3>CarMart</h3>

        <p>
            Your destination for premium automobiles.
        </p>

        <p>
            © 2026 CarMart. All Rights Reserved.
        </p>

    </footer>


    <script>

        /*
         * Get cart from browser storage.
         */

        let cart =
            JSON.parse(
                localStorage.getItem("cart")
            ) || [];


        function displayCart() {

            const container =
                document.getElementById("cartItems");

            const totalContainer =
                document.getElementById("cartTotal");


            if (cart.length === 0) {

                container.innerHTML = `

                    <div class="empty">

                        <div class="empty-icon">
                            🛒
                        </div>

                        <h2>Your cart is empty</h2>

                        <p>
                            Add some cars to your cart
                            to see them here.
                        </p>

                        <a
                            href="cars.jsp"
                            class="continue">

                            Explore Cars

                        </a>

                    </div>

                `;

                totalContainer.innerHTML = "";

                return;
            }


            container.innerHTML = "";


            let total = 0;


            cart.forEach(function(item, index) {

                total += item.price;


                container.innerHTML += `

                    <div class="cart-item">

                        <div class="car-info">

                            <div class="car-icon">
                                🚘
                            </div>

                            <div>

                                <div class="car-name">
                                    ${item.name}
                                </div>

                                <div class="car-price">
                                    ₹${item.price} Lakh
                                </div>

                            </div>

                        </div>

                        <button
                            class="remove-btn"
                            onclick="removeItem(${index})">

                            Remove

                        </button>

                    </div>

                `;

            });


            totalContainer.innerHTML = `

                <div class="total">

                    <span>
                        Total
                    </span>

                    <span>
                        ₹${total} Lakh
                    </span>

                </div>

                <button
                    class="checkout-btn"
                    onclick="checkout()">

                    Proceed to Checkout

                </button>

            `;

        }


        function removeItem(index) {

            cart.splice(index, 1);

            localStorage.setItem(
                "cart",
                JSON.stringify(cart)
            );

            displayCart();

        }


        function checkout() {

            if (cart.length === 0) {

                alert("Your cart is empty.");

                return;

            }

            alert(
                "Checkout feature will be connected to the backend next."
            );

        }


        displayCart();

    </script>

</body>

</html>