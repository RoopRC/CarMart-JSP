<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CarMart - Categories</title>

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

        #themeBtn {
            width: 42px;
            height: 42px;
            border: none;
            border-radius: 50%;
            background: #374151;
            color: white;
            font-size: 18px;
            cursor: pointer;
        }

        /* HEADER */

        .header {
            background: #111827;
            color: white;
            text-align: center;
            padding: 70px 20px;
        }

        .header p {
            color: #f59e0b;
            font-weight: bold;
            letter-spacing: 3px;
            margin-bottom: 15px;
        }

        .header h1 {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .header span {
            color: #d1d5db;
            font-size: 18px;
        }

        /* CATEGORIES */

        .categories {
            max-width: 1200px;
            margin: auto;
            padding: 70px 30px;

            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }

        .card {
            background: white;
            padding: 40px;
            border-radius: 15px;

            box-shadow: 0 8px 25px rgba(0,0,0,0.08);

            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .icon {
            width: 80px;
            height: 80px;

            background: #fff7ed;

            border-radius: 50%;

            overflow: hidden;

            margin-bottom: 20px;
        }

        .icon img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .card h2 {
            font-size: 28px;
            margin-bottom: 12px;
        }

        .card p {
            color: #6b7280;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;

            padding: 12px 22px;

            background: #f59e0b;

            color: #111827;

            text-decoration: none;

            border-radius: 6px;

            font-weight: bold;
        }

        .btn:hover {
            background: #d97706;
        }

        /* FOOTER */

        footer {
            background: #0b1120;
            color: white;
            text-align: center;
            padding: 35px;
        }

        footer p {
            color: #9ca3af;
            margin-top: 8px;
        }

        /* DARK MODE */

        body.dark {
            background: #0f172a;
            color: white;
        }

        body.dark .card {
            background: #1e293b;
        }

        body.dark .card p {
            color: #cbd5e1;
        }

        body.dark .icon {
            background: #334155;
        }

        /* RESPONSIVE */

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

            .categories {
                grid-template-columns: 1fr;
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

            <button id="themeBtn"
                    onclick="toggleTheme()">

                🌙

            </button>

        </div>

    </nav>


    <!-- HEADER -->

    <section class="header">

        <p>CHOOSE YOUR STYLE</p>

        <h1>Car Categories</h1>

        <span>
            Explore cars based on your lifestyle and preferences.
        </span>

    </section>


    <!-- CATEGORY CARDS -->

    <section class="categories">


        <!-- ALL -->

        <div class="card">

            <div class="icon">
                <img src="https://images.unsplash.com/photo-1555215695-3004980ad54e?auto=format&fit=crop&w=800&q=80" alt="All Cars">
            </div>

            <h2>All Cars</h2>

            <p>
                Explore our complete collection of
                premium automobiles from different categories.
            </p>

            <a href="cars.jsp" class="btn">
                View All Cars →
            </a>

        </div>


        <!-- LUXURY -->

        <div class="card">

            <div class="icon">
                <img src="https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?auto=format&fit=crop&w=800&q=80" alt="Luxury Cars">
            </div>

            <h2>Luxury Cars</h2>

            <p>
                Discover elegant and premium vehicles
                designed for comfort and sophistication.
            </p>

            <a href="cars.jsp?category=luxury" class="btn">
                Explore Luxury →
            </a>

        </div>


        <!-- SPORTS -->

        <div class="card">

            <div class="icon">
                <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=800&q=80" alt="Sports Cars">
            </div>

            <h2>Sports Cars</h2>

            <p>
                Experience powerful performance,
                speed and exciting driving.
            </p>

            <a href="cars.jsp?category=sports" class="btn">
                Explore Sports →
            </a>

        </div>


        <!-- SUV -->

        <div class="card">

            <div class="icon">
                <img src="https://images.unsplash.com/photo-1606016159991-dfe4f2746ad5?auto=format&fit=crop&w=800&q=80" alt="SUVs">
            </div>

            <h2>SUVs</h2>

            <p>
                Spacious and powerful vehicles
                designed for family and adventure.
            </p>

            <a href="cars.jsp?category=suv" class="btn">
                Explore SUVs →
            </a>

        </div>


        <!-- ELECTRIC -->

        <div class="card">

            <div class="icon">
                <img src="https://images.unsplash.com/photo-1560958089-b8a1929cea89?auto=format&fit=crop&w=800&q=80" alt="Electric Cars">
            </div>

            <h2>Electric Cars</h2>

            <p>
                Explore modern electric vehicles
                with smart technology and efficiency.
            </p>

            <a href="cars.jsp?category=electric" class="btn">
                Explore Electric →
            </a>

        </div>


        <!-- PREMIUM -->

        <div class="card">

            <div class="icon">
                <img src="https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?auto=format&fit=crop&w=800&q=80" alt="Premium Cars">
            </div>

            <h2>Premium Cars</h2>

            <p>
                High-end automobiles offering
                advanced features and refined interiors.
            </p>

            <a href="cars.jsp?category=premium" class="btn">
                Explore Premium →
            </a>

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


    <!-- JAVASCRIPT -->

    <script>

        function toggleTheme() {

            document.body.classList.toggle("dark");

            const button =
                document.getElementById("themeBtn");

            if (document.body.classList.contains("dark")) {

                button.innerHTML = "☀️";

            } else {

                button.innerHTML = "🌙";

            }

        }

    </script>

</body>

</html>