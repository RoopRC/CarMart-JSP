# 🚗 CarMart – Car Selling E-Commerce Website

CarMart is a web-based car-selling e-commerce project designed to provide users with a simple and attractive platform to explore premium automobiles. Users can browse cars, explore categories, search for vehicles, and add cars to a shopping cart.

## ✨ Features

- **Home Page:** Attractive landing page featuring premium automobiles.
- **Cars Page:** Browse different cars with descriptions, prices, and details.
- **Car Categories:** Explore Luxury Cars, Sports Cars, SUVs, Electric Cars, and more.
- **Search Functionality:** Search for cars by name.
- **Shopping Cart:** Add and remove cars and view the cart total.
- **Login Page:** User-friendly login interface.
- **Dark Mode:** Switch between light and dark themes on supported pages.
- **Responsive Design:** Layout adapts to desktop and mobile screens.
- **Navigation Bar:** Easily navigate between different pages.

## 🛠️ Technologies Used

This project is built using the actual technologies used in the source code and configuration:

- **Core Language:** Java
- **Web Layer:** Jakarta Servlet API (HttpServlet, HttpServletRequest, HttpServletResponse)
- **Presentation Layer:** JavaServer Pages (JSP)
- **Database Access:** JDBC (Java Database Connectivity)
- **Database:** MySQL
- **Frontend:** HTML5, CSS3, JavaScript
- **Application Server:** Apache Tomcat
- **IDE:** Eclipse IDE for Java EE / Dynamic Web Project development
- **Architecture Pattern:** MVC (Model-View-Controller)
- **Design Pattern:** DAO (Data Access Object)
- **Project Type:** Java Dynamic Web Project

The application is not using Spring Boot, React, or a modern framework. It is a classic Java EE web application built directly on Servlets, JSP, and JDBC.

## 🏗️ How This Project Is Built

This project is a classic Java Dynamic Web Project built using the Java EE / Jakarta EE technology stack. It does not use Maven, Gradle, Spring Boot, or a modern framework. Instead, it is built manually using Java Servlets, JSP pages, and JDBC connections to MySQL.

### 1) Project type

The project is organized as a standard Java web application:

- Java source files are placed under `src/main/java/carmart`
- JSP pages are placed under `src/main/webapp`
- Web configuration is in `src/main/webapp/WEB-INF/web.xml`
- Static resources like CSS and JavaScript are under `src/main/webapp/css` and `src/main/webapp/js`
- Compiled classes are generated under `build/classes`

This is typical for an Eclipse Dynamic Web Project.

### 2) Layered architecture used in this project

#### a) Model layer
The model classes represent business entities.

- `Car` stores a car's details such as `id`, `name`, `brand`, `category`, `price`, `year`, `fuelType`, `transmission`, `mileage`, `description`, and `image`.
- `User` stores `id`, `name`, `email`, and `password`.
- `CartItem` stores a selected car and its quantity, with helper methods like `increaseQuantity()`, `decreaseQuantity()`, and `getTotal()`.

These classes are plain Java objects (POJOs) and hold application data.

#### b) DAO layer
The DAO layer is responsible for all database interactions.

- `CarDAO` defines the contract for all car-related database operations.
- `UserDAO` defines the contract for registration/login operations.
- `CarDAOImpl` implements `CarDAO` and executes SQL queries such as:
  - `SELECT * FROM car`
  - `SELECT * FROM car WHERE id = ?`
- `UserDAOImpl` implements `UserDAO` and executes SQL queries such as:
  - `SELECT * FROM users WHERE email = ? AND password = ?`
  - `INSERT INTO users (name, email, password) VALUES (?, ?, ?)`

This separation keeps business logic and data access logic independent.

#### c) Controller / servlet layer
Servlets are the request handlers and act as controllers.

Examples from the project:

- `HomeServlet` handles the home page and loads all cars.
- `CarDetailsServlet` loads a specific car by ID.
- `LoginServlet` checks user credentials and creates a session.
- `RegisterServlet` creates a new user and logs them in.
- `AddToCartServlet` adds a selected car into the cart.
- `CartServlet` loads the cart page.
- `RemoveFromCartServlet` removes an item from the cart.
- `WishlistServlet` is also present in the project structure and would handle wishlist-related actions.

These classes extend `HttpServlet` and use annotations such as `@WebServlet("/home")`, `@WebServlet("/login")`, and so on.

#### d) View layer
The JSP files are the presentation part of the application.

Examples:

- `home.jsp` displays the landing page and car listings
- `cars.jsp` displays the cars section
- `car-details.jsp` displays the selected car detail page
- `cart.jsp` shows items in the shopping cart
- `login.jsp` shows login and registration UI

The servlet sets values in request scope or session scope and then forwards the request to JSP pages using:

```java
req.setAttribute("cars", cars);
req.getRequestDispatcher("home.jsp").forward(req, resp);
```

This is the standard MVC pattern used in Java web applications.

#### e) Persistence layer
The database connectivity is handled by `DBConnection.java`.

```java
Class.forName("com.mysql.cj.jdbc.Driver");
return DriverManager.getConnection(URL, USER, PASSWORD);
```

This means the application connects to a MySQL database using JDBC. The connection details are:

- database URL: `jdbc:mysql://localhost:3306/carmart`
- username: `root`
- password: `root`

The application expects a MySQL database named `carmart` with tables such as:

- `car`
- `users`

### 3) How the application actually works

The flow is:

```text
Browser
  ↓
Servlet receives request
  ↓
Servlet calls DAO method
  ↓
DAO uses JDBC to query MySQL
  ↓
Data is converted into Java objects
  ↓
Servlet stores data in request/session
  ↓
Servlet forwards to JSP
  ↓
JSP renders HTML response to browser
```

### 4) Home page flow in detail

When a user visits the home page:

1. The browser requests `/home` or `/`.
2. `HomeServlet` is invoked.
3. `HomeServlet` creates a `CarDAOImpl` instance.
4. `CarDAOImpl.getAllCars()` runs SQL: `SELECT * FROM car`.
5. The result set is read row by row.
6. Each record is mapped into a `Car` object.
7. All `Car` objects are stored in a `List<Car>`.
8. The servlet sets the list in request scope with `req.setAttribute("cars", cars)`.
9. The request is forwarded to `home.jsp`.
10. The JSP loops through the list and displays the car cards.

This is the main data flow for the application.

### 5) Login flow in detail

When a user logs in:

1. The browser sends the login form data to `/login`.
2. `LoginServlet.doPost()` receives the `email` and `password` values.
3. `UserDAOImpl.login(email, password)` runs a `SELECT` query against the `users` table.
4. If the credentials match, a `User` object is returned.
5. The servlet creates or reuses the current `HttpSession`.
6. It stores the logged-in user in the session: `session.setAttribute("loggedUser", user)`. 
7. The user is redirected to the home page using `resp.sendRedirect("home")`.
8. If credentials are wrong, the servlet forwards back to `login.jsp` with an error message.

This is a classic session-based authentication pattern.

### 6) Registration flow in detail

During registration:

1. `RegisterServlet.doPost()` receives `name`, `email`, and `password`.
2. It validates that fields are not empty.
3. It calls `UserDAOImpl.login(email, password)` to check whether the user already exists.
4. If the user does not exist, a new `User` object is created.
5. `dao.register(user)` inserts the user into the `users` table.
6. The new user is placed in session.
7. The user is redirected to the home page.

### 7) Cart flow in detail

The shopping cart is stored in the session, not in the database.

When a user clicks Add to Cart:

1. `AddToCartServlet` receives the car ID from the request.
2. It calls `CarDAOImpl.getCarById(carId)` to fetch the selected car from the database.
3. It reads the current cart from the session.
4. If no cart exists, it creates a new `ArrayList<CartItem>`.
5. If the same car already exists in the cart, it increments the quantity.
6. If it is a new item, it adds a new `CartItem`.
7. The updated cart is stored back in the session.
8. The user is redirected to the cart page.

When the user removes an item:

1. `RemoveFromCartServlet` receives the `id` parameter.
2. It reads the cart from the session.
3. It removes the matching `CartItem` using `removeIf(...)`.
4. The user is redirected to the cart page.

This is a session-based shopping cart design.

### 8) Why this is MVC architecture

The project follows MVC clearly:

- **Model**: `Car`, `User`, `CartItem`
- **View**: JSP pages like `home.jsp`, `login.jsp`, `cart.jsp`
- **Controller**: Servlets like `HomeServlet`, `LoginServlet`, `CartServlet`
- **DAO**: `CarDAOImpl`, `UserDAOImpl`

This separation makes the design organized, maintainable, and easier to extend.

### 9) Advanced Java concepts used in this project

The project uses several important Java and enterprise Java features:

- **Object-Oriented Programming (OOP):** classes and objects are used throughout the app.
- **Encapsulation:** fields are private and accessed via getters/setters.
- **Abstraction:** interfaces define contracts through `CarDAO` and `UserDAO`.
- **Polymorphism:** different implementations can satisfy the DAO interface contract.
- **Collections API:** `List`, `ArrayList`, and session attributes are used to manage data in memory.
- **JDBC API:** database interaction is handled using `Connection`, `PreparedStatement`, `ResultSet`, and `DriverManager`.
- **PreparedStatement:** used for SQL parameter binding to avoid SQL injection and handle values safely.
- **Session tracking:** `HttpSession` is used for login state and cart state.
- **Request and response handling:** `HttpServletRequest`, `HttpServletResponse`, and `HttpSession` are used to manage HTTP communication.
- **Forwarding and redirecting:** `req.getRequestDispatcher(...).forward(...)` and `resp.sendRedirect(...)` are used to move between pages.
- **Exception handling:** application processes `SQLException`, `ClassNotFoundException`, and servlet exceptions in a structured way.
- **Dependency separation:** database logic is not embedded in servlet code; it is abstracted in DAO classes.
- **Annotations:** `@WebServlet` is used to map URLs to Java classes without a heavy framework.

### 10) Practical build and deployment flow

This project is built and run in the following way:

1. Open Eclipse and import the project as a Dynamic Web Project.
2. Ensure the project structure matches the Java web app layout.
3. Add the MySQL JDBC driver JAR to the project classpath or `WEB-INF/lib`.
4. Create a MySQL database named `carmart`.
5. Create the required tables such as `car` and `users`.
6. Configure Apache Tomcat in Eclipse.
7. Add the project to Tomcat.
8. Start the Tomcat server.
9. Open the application in the browser using the project context path, such as:

```text
http://localhost:8080/CarMart/home
```

or

```text
http://localhost:8080/CarMart/
```

Depending on the server configuration, the exact context path may vary.

### 11) What is missing in a typical Java project build?

This project does not contain:

- a `pom.xml` (no Maven build)
- a `build.gradle` (no Gradle build)
- a Spring Boot application class
- a REST API framework
- a frontend framework like React or Angular

It is a legacy Java EE-style project built around native servlet-based web development.

## 🔄 Complete Project Workflow

The end-to-end project workflow can be summarized as:

```text
User opens browser
      ↓
Request hits servlet URL
      ↓
Servlet gets data/request parameters
      ↓
Servlet calls DAO implementation
      ↓
DAO reaches MySQL using JDBC
      ↓
Java objects are created from database data
      ↓
Servlet stores data in request/session
      ↓
JSP page renders final HTML
      ↓
User sees the output in browser
```

### Example workflow summary

- Start page: `HomeServlet` loads cars from database and shows them in `home.jsp`
- Login page: `LoginServlet` validates credentials and creates session
- Registration: `RegisterServlet` inserts a new user
- Car details: `CarDetailsServlet` fetches a car by id and shows details
- Cart: `AddToCartServlet` and `RemoveFromCartServlet` manage session cart state

This is the full functional flow of the application.

## 📂 Project Structure

```text
CarMart/
├── README.md
├── .gitignore
├── build/
│   └── classes/
│       └── carmart/
│           ├── AddToCartServlet.class
│           ├── Car.class
│           ├── CarDAO.class
│           ├── CarDAOImpl.class
│           ├── CarDetailsServlet.class
│           ├── CartItem.class
│           ├── CartServlet.class
│           ├── DBConnection.class
│           ├── HomeServlet.class
│           ├── LoginServlet.class
│           ├── LogoutServlet.class
│           ├── RegisterServlet.class
│           ├── RemoveFromCartServlet.class
│           ├── User.class
│           ├── UserDAO.class
│           ├── UserDAOImpl.class
│           └── WishlistServlet.class
├── src/
│   └── main/
│       ├── java/
│       │   └── carmart/
│       │       ├── AddToCartServlet.java
│       │       ├── Car.java
│       │       ├── CarDAO.java
│       │       ├── CarDAOImpl.java
│       │       ├── CarDetailsServlet.java
│       │       ├── CartItem.java
│       │       ├── CartServlet.java
│       │       ├── DBConnection.java
│       │       ├── HomeServlet.java
│       │       ├── LoginServlet.java
│       │       ├── LogoutServlet.java
│       │       ├── RegisterServlet.java
│       │       ├── RemoveFromCartServlet.java
│       │       ├── User.java
│       │       ├── UserDAO.java
│       │       ├── UserDAOImpl.java
│       │       └── WishlistServlet.java
│       └── webapp/
│           ├── META-INF/
│           │   └── MANIFEST.MF
│           ├── WEB-INF/
│           │   ├── web.xml
│           │   └── lib/
│           ├── css/
│           │   └── style.css
│           ├── js/
│           │   └── script.js
│           ├── car-details.jsp
│           ├── cars.jsp
│           ├── cart.jsp
│           ├── categories.jsp
│           ├── home.jsp
│           ├── index.jsp
│           ├── login.jsp
│           └── register.jsp
└── target/ (if generated during build)
    └── classes/
```

This project follows a typical Java Dynamic Web Project structure with servlet classes in `src/main/java/carmart`, JSP views in `src/main/webapp`, and configuration files under `WEB-INF`.

## ⚙️ Prerequisites

Before running the project, install:

- Java Development Kit (JDK)
- Apache Tomcat 10.1.36
- Eclipse IDE with web development support, or another compatible Java web IDE
- A modern web browser

## ▶️ How to Run the Project

1. Clone or download this repository.
2. Import the project into Eclipse as a Dynamic Web Project or Maven web application, depending on its actual structure.
3. Configure Apache Tomcat 10.1.36 in Eclipse.
4. Add the project to the Tomcat server.
5. Start the server.
6. Open the following URL in your browser:

```text
http://localhost:8080/CarMart/home.jsp
```

Replace `CarMart` with the actual deployed context path if it differs.

## 🛒 How to Use

1. Open the home page.
2. Click **Cars** to browse the available vehicles.
3. Use the search box to find a car by name.
4. Click **Add** to add a car to the shopping cart.
5. Open **Cart** to review or remove selected cars.
6. Visit **Categories** to explore vehicle categories.
7. Open **Login** to view the login interface.

## 🚀 Future Enhancements

- User registration and authentication
- MySQL database integration
- Java Servlet backend
- Dynamic car inventory management
- Persistent shopping cart
- Secure checkout and order management
- Individual car details pages
- Admin dashboard for managing cars

## 👩‍💻 Author

**Roopa Chinchewadi**

- GitHub: [RoopRC](https://github.com/RoopRC)
- LinkedIn: [Connect on LinkedIn](https://www.linkedin.com/in/roopa-chinchewadi-850181305/)

## 📄 License

This project is intended for educational and portfolio purposes. A formal open-source license can be added if the project is distributed under specific terms.
