<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, carmart.Car, carmart.CarDAOImpl, carmart.User" %>

<%
    // Load cars from database
    List<Car> cars = null;
    try {
        cars = new carmart.CarDAOImpl().getAllCars();
    } catch (Exception e) {
        cars = new java.util.ArrayList<>();
    }

    // Get logged-in user
    User loggedUser = (User) session.getAttribute("loggedUser");

    // Get wishlist
    List<Car> wishlist = (List<Car>) session.getAttribute("wishlist");
    if (wishlist == null) {
        wishlist = new java.util.ArrayList<>();
    }

    // Get cart count
    List<?> cart = (List<?>) session.getAttribute("cart");
    int cartCount = (cart != null) ? cart.size() : 0;

    // Get search/category filter
    String searchQuery = request.getParameter("search");
    String categoryFilter = request.getParameter("category");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CarMart - Cars</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', Arial, Helvetica, sans-serif;
            background: #f5f6f8;
            color: #111827;
            transition: background 0.3s, color 0.3s;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            height: 75px;
            background: #111827;
            padding: 0 60px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            box-shadow: 0 3px 15px rgba(0,0,0,0.2);

            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            color: white;
            text-decoration: none;
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .logo span {
            color: #f59e0b;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            color: #d1d5db;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: color 0.2s;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: #f59e0b;
        }

        .nav-cart {
            position: relative;
        }

        .cart-badge {
            position: absolute;
            top: -8px;
            right: -12px;
            background: #ef4444;
            color: white;
            font-size: 11px;
            font-weight: 700;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .nav-user {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #d1d5db;
            font-size: 14px;
        }

        .nav-user-avatar {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: #f59e0b;
            color: #111827;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 14px;
        }

        .nav-logout {
            color: #9ca3af;
            text-decoration: none;
            font-size: 13px;
            margin-left: 5px;
        }

        .nav-logout:hover {
            color: #ef4444;
        }

        #themeBtn {
            width: 38px;
            height: 38px;

            border: none;
            border-radius: 50%;

            background: #374151;
            color: white;

            font-size: 16px;

            cursor: pointer;
            transition: background 0.2s;
        }

        #themeBtn:hover {
            background: #f59e0b;
        }

        /* ================= HEADER ================= */

        .page-header {
            background:
                linear-gradient(
                    135deg,
                    rgba(17,24,39,0.95),
                    rgba(30,41,59,0.95)
                );

            color: white;

            text-align: center;

            padding: 70px 20px;
        }

        .page-header p {
            color: #f59e0b;

            font-size: 14px;

            font-weight: 700;

            letter-spacing: 3px;

            margin-bottom: 15px;
        }

        .page-header h1 {
            font-size: 48px;
            font-weight: 800;
            margin-bottom: 15px;
        }

        .page-header span {
            color: #d1d5db;
            font-size: 18px;
        }

        /* ================= SEARCH ================= */

        .search-section {
            padding: 30px 60px;

            background: white;

            display: flex;

            justify-content: center;

            gap: 12px;

            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .search-box {
            width: 500px;

            padding: 14px 20px;

            border: 2px solid #e5e7eb;

            border-radius: 10px;

            font-size: 15px;
            font-family: 'Inter', sans-serif;

            outline: none;

            transition: border-color 0.2s;
        }

        .search-box:focus {
            border-color: #f59e0b;
        }

        .search-btn {
            padding: 14px 24px;

            border: none;

            border-radius: 10px;

            background: #f59e0b;

            color: #111827;

            font-weight: 700;
            font-family: 'Inter', sans-serif;

            cursor: pointer;

            transition: background 0.2s;
        }

        .search-btn:hover {
            background: #d97706;
        }

        /* ================= CARS ================= */

        .cars-section {
            padding: 60px;
        }

        .section-title {
            text-align: center;

            margin-bottom: 40px;
        }

        .section-title h2 {
            font-size: 36px;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .section-title p {
            color: #6b7280;
            font-size: 17px;
        }

        .cars-container {

            max-width: 1200px;

            margin: auto;

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 30px;
        }

        /* ================= CAR CARD ================= */

        .car-card {

            background: white;

            border-radius: 16px;

            overflow: hidden;

            box-shadow:
                0 4px 20px rgba(0,0,0,0.06);

            transition: transform 0.3s, box-shadow 0.3s;

            position: relative;
        }

        .car-card:hover {

            transform: translateY(-6px);

            box-shadow:
                0 12px 35px rgba(0,0,0,0.12);
        }

        .car-image {

            height: 210px;

            background: #f1f5f9;

            overflow: hidden;

            position: relative;
        }

        .car-image img {

            width: 100%;

            height: 100%;

            object-fit: cover;

            transition: transform 0.4s;
        }

        .car-card:hover .car-image img {
            transform: scale(1.05);
        }

        /* Wishlist Heart Button */

        .wishlist-btn {
            position: absolute;
            top: 12px;
            right: 12px;

            width: 40px;
            height: 40px;

            border: none;
            border-radius: 50%;

            background: rgba(255,255,255,0.9);
            backdrop-filter: blur(4px);

            cursor: pointer;

            display: flex;
            align-items: center;
            justify-content: center;

            transition: transform 0.2s, background 0.2s;
            z-index: 5;

            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .wishlist-btn:hover {
            transform: scale(1.15);
            background: white;
        }

        .wishlist-btn svg {
            width: 22px;
            height: 22px;
            transition: fill 0.3s, stroke 0.3s;
        }

        .wishlist-btn.active svg {
            fill: #ef4444;
            stroke: #ef4444;
        }

        .wishlist-btn:not(.active) svg {
            fill: none;
            stroke: #6b7280;
            stroke-width: 2;
        }

        .car-details {

            padding: 22px;
        }

        .car-category {

            color: #f59e0b;

            font-size: 12px;

            font-weight: 700;

            text-transform: uppercase;

            letter-spacing: 1.5px;
        }

        .car-details h3 {

            font-size: 22px;
            font-weight: 700;

            margin: 6px 0;
        }

        .car-description {

            color: #6b7280;

            line-height: 1.5;

            margin-bottom: 14px;

            font-size: 14px;
        }

        .car-specs {

            display: flex;

            justify-content: space-between;

            margin: 12px 0;

            color: #6b7280;

            font-size: 13px;
        }

        .car-specs span {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .price {

            font-size: 22px;

            font-weight: 800;

            color: #111827;

            margin-bottom: 16px;
        }

        .car-buttons {

            display: flex;

            gap: 10px;
        }

        .view-btn {

            flex: 1;

            padding: 11px;

            border: 2px solid #e5e7eb;

            border-radius: 10px;

            background: white;

            color: #111827;

            cursor: pointer;

            font-weight: 600;
            font-family: 'Inter', sans-serif;
            font-size: 14px;

            transition: all 0.2s;

            text-decoration: none;
            text-align: center;

            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .cart-btn {

            flex: 1;

            padding: 11px;

            border: none;

            border-radius: 10px;

            background: #f59e0b;

            color: #111827;

            cursor: pointer;

            font-weight: 600;
            font-family: 'Inter', sans-serif;
            font-size: 14px;

            transition: all 0.2s;
        }

        .view-btn:hover {
            border-color: #111827;
            background: #111827;
            color: white;
        }

        .cart-btn:hover {
            background: #d97706;
        }

        .cart-btn.added {
            background: #22c55e;
            color: white;
        }

        /* ================= TOAST ================= */

        .toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #111827;
            color: white;
            padding: 16px 28px;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 500;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
            z-index: 9999;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.3s, transform 0.3s;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .toast.show {
            opacity: 1;
            transform: translateY(0);
        }

        .toast-icon {
            font-size: 20px;
        }

        /* ================= FOOTER ================= */

        footer {

            background: #0b1120;

            color: white;

            text-align: center;

            padding: 35px 20px;

            margin-top: 40px;
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

        body.dark-mode .search-section {

            background: #1e293b;
        }

        body.dark-mode .search-box {
            background: #334155;
            border-color: #475569;
            color: white;
        }

        body.dark-mode .cars-section {

            background: #0f172a;
        }

        body.dark-mode .section-title p {

            color: #cbd5e1;
        }

        body.dark-mode .car-card {

            background: #1e293b;
        }

        body.dark-mode .car-image {
            background: #334155;
        }

        body.dark-mode .car-description {

            color: #cbd5e1;
        }

        body.dark-mode .car-specs {

            color: #cbd5e1;
        }

        body.dark-mode .price {

            color: white;
        }

        body.dark-mode .view-btn {

            background: #1e293b;

            color: white;

            border-color: #475569;
        }

        body.dark-mode .view-btn:hover {
            background: white;
            color: #111827;
        }

        body.dark-mode .car-details h3 {
            color: white;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .navbar {
                padding: 0 25px;
            }

            .nav-links {
                gap: 15px;
            }

            .cars-section {
                padding: 40px 25px;
            }

            .cars-container {
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

            .page-header h1 {

                font-size: 36px;
            }

            .search-section {

                padding: 25px;

                flex-direction: column;
            }

            .search-box {

                width: 100%;
            }

            .cars-container {

                grid-template-columns: 1fr;
            }

        }

    </style>

</head>


<body>


    <!-- ================= NAVBAR ================= -->

    <nav class="navbar">

        <a href="home" class="logo">
            Car<span>Mart</span>
        </a>

        <div class="nav-links">

            <a href="home">
                Home
            </a>

            <a href="cars.jsp" class="active">
                Cars
            </a>

            <a href="categories.jsp">
                Categories
            </a>

            <a href="cart" class="nav-cart">
                Cart
                <% if (cartCount > 0) { %>
                    <span class="cart-badge"><%= cartCount %></span>
                <% } %>
            </a>

            <% if (loggedUser != null) { %>

                <div class="nav-user">
                    <div class="nav-user-avatar">
                        <%= loggedUser.getName().substring(0, 1).toUpperCase() %>
                    </div>
                    <%= loggedUser.getName() %>
                    <a href="logout" class="nav-logout">Logout</a>
                </div>

            <% } else { %>

                <a href="login">
                    Login
                </a>

            <% } %>

            <button id="themeBtn"
                    onclick="toggleDarkMode()">
                &#9790;
            </button>

        </div>

    </nav>


    <!-- ================= PAGE HEADER ================= -->

    <section class="page-header">

        <p>
            OUR COLLECTION
        </p>

        <h1>
            Explore Our Cars
        </h1>

        <span>
            Discover premium cars for every lifestyle and journey.
        </span>

    </section>


    <!-- ================= SEARCH ================= -->

    <section class="search-section">

        <form action="cars.jsp" method="get"
              style="display:flex; gap:12px; justify-content:center; width:100%; max-width:600px;">

            <input
                type="text"
                name="search"
                class="search-box"
                placeholder="Search for a car..."
                value="<%= (searchQuery != null) ? searchQuery : "" %>">

            <button
                type="submit"
                class="search-btn">

                Search

            </button>

        </form>

    </section>


    <!-- ================= CARS ================= -->

    <section class="cars-section">

        <div class="section-title">

            <h2>
                Featured Cars
            </h2>

            <p>
                Choose from our collection of premium automobiles
            </p>

        </div>


        <div class="cars-container"
             id="carsContainer">

            <%
                for (Car car : cars) {
                    // Apply search filter
                    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                        if (!car.getName().toLowerCase().contains(searchQuery.toLowerCase())
                            && !car.getBrand().toLowerCase().contains(searchQuery.toLowerCase())
                            && !car.getCategory().toLowerCase().contains(searchQuery.toLowerCase())) {
                            continue;
                        }
                    }

                    // Apply category filter
                    if (categoryFilter != null && !categoryFilter.trim().isEmpty()) {
                        if (!car.getCategory().toLowerCase().contains(categoryFilter.toLowerCase())) {
                            continue;
                        }
                    }

                    // Check if car is in wishlist
                    boolean isWishlisted = false;
                    for (Car w : wishlist) {
                        if (w.getId() == car.getId()) {
                            isWishlisted = true;
                            break;
                        }
                    }

                    // Format price
                    String priceDisplay;
                    if (car.getPrice() >= 10000000) {
                        priceDisplay = String.format("%.1f Crore", car.getPrice() / 10000000.0);
                    } else {
                        priceDisplay = String.format("%.0f Lakh", car.getPrice() / 100000.0);
                    }
            %>

            <div class="car-card" data-name="<%= car.getName() %>">

                <div class="car-image">

                    <img src="<%= car.getImage() %>"
                         alt="<%= car.getName() %>"
                         loading="lazy"
                         onerror="this.src='https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=800&q=80'">

                    <!-- Wishlist Heart Button -->
                    <form action="wishlist" method="post" style="position:absolute;top:0;right:0;margin:0;">
                        <input type="hidden" name="id" value="<%= car.getId() %>">
                        <button type="submit"
                                class="wishlist-btn <%= isWishlisted ? "active" : "" %>"
                                title="<%= isWishlisted ? "Remove from Wishlist" : "Add to Wishlist" %>">
                            <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5
                                    2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09
                                    C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5
                                    c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
                            </svg>
                        </button>
                    </form>

                </div>

                <div class="car-details">

                    <div class="car-category">
                        <%= car.getCategory() %>
                    </div>

                    <h3>
                        <%= car.getName() %>
                    </h3>

                    <p class="car-description">
                        <%= car.getDescription() %>
                    </p>

                    <div class="car-specs">

                        <span>
                            &#9889; <%= car.getTransmission() %>
                        </span>

                        <span>
                            <%= car.getFuelType() %>
                        </span>

                        <span>
                            <%= car.getYear() %>
                        </span>

                    </div>

                    <div class="price">
                        &#8377;<%= priceDisplay %>
                    </div>

                    <div class="car-buttons">

                        <a href="carDetails?id=<%= car.getId() %>"
                           class="view-btn">

                            View Details

                        </a>

                        <form action="addToCart" method="post" style="flex:1;margin:0;">
                            <input type="hidden" name="id" value="<%= car.getId() %>">
                            <button type="submit"
                                    class="cart-btn"
                                    style="width:100%;"
                                    onclick="showToast('<%= car.getName() %> added to cart!')">

                                Add to Cart

                            </button>
                        </form>

                    </div>

                </div>

            </div>

            <% } %>

        </div>

    </section>


    <!-- ================= TOAST NOTIFICATION ================= -->

    <div class="toast" id="toast">
        <span class="toast-icon">&#10003;</span>
        <span id="toastMessage"></span>
    </div>


    <!-- ================= FOOTER ================= -->

    <footer>

        <h3>
            CarMart
        </h3>

        <p>
            Your destination for premium automobiles.
        </p>

        <p>
            &copy; 2026 CarMart. All Rights Reserved.
        </p>

    </footer>


    <!-- ================= JAVASCRIPT ================= -->

    <script>

        /* DARK MODE */

        function toggleDarkMode() {

            document.body.classList.toggle("dark-mode");

            var button =
                document.getElementById("themeBtn");

            if (
                document.body.classList.contains("dark-mode")
            ) {

                button.innerHTML = "&#9788;";
                localStorage.setItem("theme", "dark");

            } else {

                button.innerHTML = "&#9790;";
                localStorage.setItem("theme", "light");

            }

        }

        // Restore theme
        if (localStorage.getItem("theme") === "dark") {
            document.body.classList.add("dark-mode");
            document.getElementById("themeBtn").innerHTML = "&#9788;";
        }


        /* TOAST */

        function showToast(message) {

            var toast =
                document.getElementById("toast");

            var toastMsg =
                document.getElementById("toastMessage");

            toastMsg.textContent = message;

            toast.classList.add("show");

            setTimeout(function() {
                toast.classList.remove("show");
            }, 2500);

        }

    </script>


</body>

</html>