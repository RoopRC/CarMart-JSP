<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CarMart - Premium Automobiles</title>


    <!-- ================= CSS ================= -->

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
            transition: 0.3s;
        }


        /* ================= NAVBAR ================= */

        .navbar {
            width: 100%;
            height: 75px;
            background: #111827;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 60px;

            box-shadow: 0 3px 15px rgba(0,0,0,0.2);

            position: sticky;
            top: 0;
            z-index: 1000;
        }


        .logo {
            color: white;
            font-size: 30px;
            font-weight: bold;
            text-decoration: none;
        }


        .nav-links {
            display: flex;
            align-items: center;
            gap: 30px;
        }


        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: 0.3s;
        }


        .nav-links a:hover {
            color: #f59e0b;
        }


        #themeBtn {
            border: none;
            background: #374151;
            color: white;

            width: 42px;
            height: 42px;

            border-radius: 50%;

            font-size: 20px;

            cursor: pointer;

            transition: 0.3s;
        }


        #themeBtn:hover {
            background: #f59e0b;
        }


        /* ================= HERO ================= */

        .hero {
            min-height: 560px;

            padding: 120px 80px;

            background:
                linear-gradient(
                    rgba(17,24,39,0.88),
                    rgba(17,24,39,0.88)
                ),
                url("https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1600&q=80");

            background-size: cover;
            background-position: center;

            color: white;

            display: flex;
            flex-direction: column;
            justify-content: center;
        }


        .hero-small-title {
            color: #f59e0b;
            font-size: 17px;
            font-weight: bold;

            letter-spacing: 3px;

            margin-bottom: 20px;
        }


        .hero h1 {
            font-size: 64px;
            line-height: 1.1;

            max-width: 700px;

            margin-bottom: 25px;
        }


        .hero-description {
            font-size: 20px;

            line-height: 1.7;

            max-width: 700px;

            color: #e5e7eb;

            margin-bottom: 35px;
        }


        .hero-btn {
            display: inline-block;

            width: fit-content;

            padding: 15px 30px;

            background: #f59e0b;

            color: #111827;

            text-decoration: none;

            font-size: 17px;

            font-weight: bold;

            border-radius: 7px;

            transition: 0.3s;
        }


        .hero-btn:hover {
            background: #ffffff;

            transform: translateY(-3px);
        }


        /* ================= CATEGORIES ================= */

        .categories {
            padding: 80px 60px;

            text-align: center;

            background: #f5f6f8;
        }


        .section-small-title {
            color: #f59e0b;

            font-size: 15px;

            font-weight: bold;

            letter-spacing: 2px;

            margin-bottom: 15px;
        }


        .categories h2 {
            font-size: 42px;

            margin-bottom: 15px;
        }


        .section-description {
            color: #6b7280;

            font-size: 18px;

            margin-bottom: 50px;
        }


        /* ================= CARDS ================= */

        .category-container {

            max-width: 1200px;

            margin: auto;

            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 25px;
        }


        .category-card {

            background: white;

            padding: 35px 25px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.08);

            transition: 0.3s;

            border: 1px solid #eeeeee;
        }


        .category-card:hover {

            transform: translateY(-8px);

            box-shadow:
                0 15px 35px rgba(0,0,0,0.15);
        }


        .category-icon {

            width: 75px;

            height: 75px;

            margin: 0 auto 20px;

            border-radius: 50%;

            background: #fff7ed;

            overflow: hidden;
        }

        .category-icon img {

            width: 100%;

            height: 100%;

            object-fit: cover;
        }


        .category-card h3 {

            font-size: 23px;

            margin-bottom: 12px;
        }


        .category-card p {

            color: #6b7280;

            line-height: 1.6;

            margin-bottom: 20px;
        }


        .category-link {

            color: #f59e0b;

            text-decoration: none;

            font-weight: bold;
        }


        .category-link:hover {

            text-decoration: underline;
        }


        /* ================= FEATURE SECTION ================= */

        .features {

            background: #111827;

            color: white;

            padding: 70px 60px;

            text-align: center;
        }


        .features h2 {

            font-size: 38px;

            margin-bottom: 45px;
        }


        .feature-container {

            max-width: 1000px;

            margin: auto;

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 30px;
        }


        .feature {

            padding: 25px;
        }


        .feature-icon {

            font-size: 38px;

            margin-bottom: 15px;
        }


        .feature h3 {

            margin-bottom: 10px;

            font-size: 20px;
        }


        .feature p {

            color: #d1d5db;

            line-height: 1.5;
        }


        /* ================= FOOTER ================= */

        footer {

            background: #0b1120;

            color: white;

            text-align: center;

            padding: 35px 20px;
        }


        footer h3 {

            font-size: 25px;

            margin-bottom: 10px;
        }


        footer p {

            color: #9ca3af;

            margin: 7px;
        }


        /* ================= DARK MODE ================= */

        body.dark-mode {

            background: #0f172a;

            color: white;
        }


        body.dark-mode .categories {

            background: #0f172a;
        }


        body.dark-mode .category-card {

            background: #1e293b;

            border-color: #334155;

            color: white;
        }


        body.dark-mode .category-card p {

            color: #cbd5e1;
        }


        body.dark-mode .section-description {

            color: #cbd5e1;
        }


        body.dark-mode .category-icon {

            background: #334155;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .navbar {

                padding: 0 25px;
            }


            .nav-links {

                gap: 15px;
            }


            .hero {

                padding: 80px 40px;
            }


            .hero h1 {

                font-size: 48px;
            }


            .category-container {

                grid-template-columns:
                    repeat(2, 1fr);
            }

        }


        @media (max-width: 600px) {

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


            .hero {

                padding: 70px 25px;

                min-height: 500px;
            }


            .hero h1 {

                font-size: 40px;
            }


            .hero-description {

                font-size: 17px;
            }


            .categories {

                padding: 60px 20px;
            }


            .categories h2 {

                font-size: 34px;
            }


            .category-container {

                grid-template-columns: 1fr;
            }


            .feature-container {

                grid-template-columns: 1fr;
            }

        }

    </style>

</head>


<body>


    <!-- ================= NAVBAR ================= -->

    <nav class="navbar">

        <a href="home.jsp" class="logo">
            CarMart
        </a>


        <div class="nav-links">

            <a href="home.jsp">
                Home
            </a>

            <a href="cars.jsp">
                Cars
            </a>

            <a href="categories.jsp">
                Categories
            </a>

            <a href="cart.jsp">
                🛒 Cart
            </a>

            <a href="login.jsp">
                Login
            </a>


            <button id="themeBtn"
                    onclick="toggleDarkMode()">

                🌙

            </button>

        </div>

    </nav>



    <!-- ================= HERO ================= -->

    <section class="hero">


        <div class="hero-small-title">

            PREMIUM AUTOMOBILES

        </div>


        <h1>

            Find Your Dream Car

        </h1>


        <p class="hero-description">

            Explore premium luxury cars, sports cars,
            SUVs and electric vehicles from
            world-class brands.

        </p>


        <a href="cars.jsp"
           class="hero-btn">

            Explore Cars →

        </a>


    </section>



    <!-- ================= CATEGORIES ================= -->

    <section class="categories">


        <div class="section-small-title">

            CHOOSE YOUR STYLE

        </div>


        <h2>

            Explore Categories

        </h2>


        <p class="section-description">

            Find the perfect car for your lifestyle

        </p>



        <div class="category-container">


            <!-- ALL CARS -->

            <div class="category-card">


                <div class="category-icon">

                    <img src="https://images.unsplash.com/photo-1555215695-3004980ad54e?auto=format&fit=crop&w=800&q=80" alt="All Cars">

                </div>


                <h3>

                    All Cars

                </h3>


                <p>

                    Explore our complete collection
                    of premium automobiles.

                </p>


                <a href="cars.jsp"
                   class="category-link">

                    Explore All Cars →

                </a>


            </div>



            <!-- LUXURY -->

            <div class="category-card">


                <div class="category-icon">

                    <img src="https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?auto=format&fit=crop&w=800&q=80" alt="Luxury">

                </div>


                <h3>

                    Luxury

                </h3>


                <p>

                    Discover premium automobiles
                    with comfort and elegance.

                </p>


                <a href="cars.jsp?category=luxury"
                   class="category-link">

                    Premium Automobiles →

                </a>


            </div>



            <!-- SPORTS -->

            <div class="category-card">


                <div class="category-icon">

                    <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=800&q=80" alt="Sports">

                </div>


                <h3>

                    Sports

                </h3>


                <p>

                    Experience high-performance
                    cars built for speed.

                </p>


                <a href="cars.jsp?category=sports"
                   class="category-link">

                    High Performance →

                </a>


            </div>



            <!-- SUV -->

            <div class="category-card">


                <div class="category-icon">

                    <img src="https://images.unsplash.com/photo-1606016159991-dfe4f2746ad5?auto=format&fit=crop&w=800&q=80" alt="SUVs">

                </div>


                <h3>

                    SUVs

                </h3>


                <p>

                    Powerful and spacious vehicles
                    for every journey.

                </p>


                <a href="cars.jsp?category=suv"
                   class="category-link">

                    Explore SUVs →

                </a>


            </div>


        </div>


    </section>



    <!-- ================= FEATURES ================= -->

    <section class="features">


        <h2>

            Why Choose CarMart?

        </h2>


        <div class="feature-container">


            <div class="feature">

                <div class="feature-icon">

                    🚗

                </div>

                <h3>

                    Premium Cars

                </h3>

                <p>

                    Carefully selected automobiles
                    from trusted brands.

                </p>

            </div>



            <div class="feature">

                <div class="feature-icon">

                    🔒

                </div>

                <h3>

                    Secure Shopping

                </h3>

                <p>

                    Your information and
                    transactions are protected.

                </p>

            </div>



            <div class="feature">

                <div class="feature-icon">

                    ⭐

                </div>

                <h3>

                    Trusted Service

                </h3>

                <p>

                    A simple and reliable way
                    to find your dream car.

                </p>

            </div>


        </div>


    </section>



    <!-- ================= FOOTER ================= -->

    <footer>


        <h3>

            CarMart

        </h3>


        <p>

            Your destination for premium automobiles.

        </p>


        <p>

            © 2026 CarMart. All Rights Reserved.

        </p>


    </footer>



    <!-- ================= JAVASCRIPT ================= -->

    <script>

        function toggleDarkMode() {

            document.body.classList.toggle("dark-mode");


            const button =
                document.getElementById("themeBtn");


            if (
                document.body.classList.contains("dark-mode")
            ) {

                button.innerHTML = "☀️";

            } else {

                button.innerHTML = "🌙";

            }

        }

    </script>


</body>

</html>