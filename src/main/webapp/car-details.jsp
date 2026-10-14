<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="carmart.Car"%>

<%
Car car =
    (Car) request.getAttribute("car");
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1.0">
<meta name="description"
      content="<%= car.getName() %> – View specifications, pricing, and details on CarMart.">

<title>
    <%= car.getName() %> | CarMart
</title>

<link rel="preconnect"
      href="https://fonts.googleapis.com">
<link rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin>
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap">

<link rel="stylesheet"
      href="css/style.css">

</head>

<body>


<!-- ========== NAVBAR ========== -->

<nav class="navbar">

    <a href="home" class="logo">
        Car<span>Mart</span>
    </a>

    <div class="nav-links">

        <a href="home">
            Home
        </a>

        <a href="home#cars">
            Cars
        </a>

        <a href="cart">
            🛒 Cart
        </a>

        <button id="themeButton"
                class="theme-button"
                aria-label="Toggle theme">
            🌙
        </button>

    </div>

</nav>


<!-- ========== DETAILS ========== -->

<section class="details-page">

    <div class="details-image">

        <img src="<%= car.getImage() %>"
             alt="<%= car.getName() %>"
             loading="lazy">

    </div>


    <div class="details-content">

        <p class="brand">
            <%= car.getBrand() %>
        </p>

        <h1>
            <%= car.getName() %>
        </h1>

        <span class="details-category">
            <%= car.getCategory() %>
        </span>

        <h2 class="details-price">
            ₹<%= String.format(
                "%,.0f",
                car.getPrice()) %>
        </h2>

        <p class="details-description">
            <%= car.getDescription() %>
        </p>


        <div class="specifications">

            <div>
                <strong>Year</strong>
                <span><%= car.getYear() %></span>
            </div>

            <div>
                <strong>Fuel Type</strong>
                <span><%= car.getFuelType() %></span>
            </div>

            <div>
                <strong>Transmission</strong>
                <span><%= car.getTransmission() %></span>
            </div>

            <div>
                <strong>Mileage</strong>
                <span><%= car.getMileage() %></span>
            </div>

        </div>


        <form action="addToCart"
              method="post">

            <input type="hidden"
                   name="id"
                   value="<%= car.getId() %>">

            <button type="submit"
                    class="large-cart-button">

                🛒 Add to Cart

            </button>

        </form>

        <a href="home"
           class="back-button">
            ← Back to Cars
        </a>

    </div>

</section>


<script src="js/script.js"></script>

</body>

</html>