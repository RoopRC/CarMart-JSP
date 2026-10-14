// =========================
// DARK / LIGHT MODE
// =========================

const themeButton = document.getElementById("themeButton");

if (themeButton) {

    const savedTheme = localStorage.getItem("theme");

    if (savedTheme === "dark") {

        document.body.classList.add("dark");

        themeButton.textContent = "☀️";

    } else {

        themeButton.textContent = "🌙";
    }


    themeButton.addEventListener("click", function () {

        document.body.classList.toggle("dark");

        if (document.body.classList.contains("dark")) {

            localStorage.setItem("theme", "dark");

            themeButton.textContent = "☀️";

        } else {

            localStorage.setItem("theme", "light");

            themeButton.textContent = "🌙";
        }

    });

}


// =========================
// CAR SEARCH - FRONTEND
// =========================

const searchInput = document.getElementById("carSearch");

if (searchInput) {

    searchInput.addEventListener("keyup", function () {

        const searchText =
            searchInput.value.toLowerCase();

        const carCards =
            document.querySelectorAll(".car-card");

        carCards.forEach(function (card) {

            const text =
                card.innerText.toLowerCase();

            if (text.includes(searchText)) {

                card.style.display = "";

            } else {

                card.style.display = "none";
            }

        });

    });

}