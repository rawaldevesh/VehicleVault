<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>VehicleVault - Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    
  .search-section {
    padding-top: 60px;
    padding-bottom: 40px;
    background-color: #f8f9fa;
}

.search-bg-image {
    background-image: url('background.png'); /* Replace with your image path */
    background-size: cover;
    background-position: center;
    height: 100%;
    min-height: 400px;
    border-radius: 10px;
}
.carousel-inner img {
    height: 400px;
    object-fit: cover;
    border-radius: 10px;
}

.search-section .search-container {
        padding-right: 8px; /* reduce space on the right */
    }
    .search-section .carousel-inner {
        padding-left: 8px; /* reduce space on the left */
    }

.search-container {
    max-width: 400px; /* Adjust the width as needed */
    margin-left: 0;
    margin-right: auto;
}

.vehicle-results {
    margin-left: 20px; /* Space between search and results */
}

.vehicle-card {
    width: 100%;
    height: 70%; /* Responsive full width within the column */
    padding: 0; /* Remove extra inner space */
    margin: 0;  /* Remove gap between cards */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    font-size: 14px;
    display: block;
    object-fit: cover; /* Stack in rows properly */
}

.vehicle-card img {
    width: 100%; /* Ensure image fills the card */
    height: 50%;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
    object-fit: cover;
}



.vehicle-image {
    border-radius: 8px;
}

.featured-vehicles .vehicle-card {
    border: none;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<section class="search-section">
    <div class="container">
        <div class="row align-items-center ">
            <!-- Left: Search Form -->
            <div class="col-12 col-md-6 search-container">
                <h2 class="mb-3">Find Your Perfect Ride</h2>
                <div class="mb-2">
                    <label class="form-label">Vehicle Type</label>
                    <select id="filterType" class="form-select">
                        <option value="">All Types</option>
                        <option value="Car">Car</option>
                        <option value="Bike">Bike</option>
                        <option value="SUV">SUV</option>
                    </select>
                </div>
                <div class="mb-2">
                    <label class="form-label">City / Location</label>
                    <input type="text" id="filterCity" class="form-control" placeholder="e.g. Mumbai">
                </div>
                <div class="mb-2">
                    <label class="form-label">Model Name</label>
                    <input type="text" id="filterModel" class="form-control" placeholder="e.g. Swift, Alto">
                </div>
                <div class="mb-3">
                    <label class="form-label">Max Price: ₹<span id="priceLabel">1000000</span></label>
                    <input type="range" class="form-range" min="100000" max="2000000" step="10000" value="1000000" id="priceRange" oninput="document.getElementById('priceLabel').innerText = this.value;">
                </div>
                <button class="btn btn-primary w-100" onclick="filterHeroVehicles()">
                    <i class="fas fa-search me-2"></i> Search Vehicles
                </button>
            </div>

            <!-- Right: Background Image -->
           <div class="col-12 col-md-6 d-none d-md-block">
		    <div id="carouselImages" class="carousel slide" data-bs-ride="carousel">
		        <div class="carousel-inner rounded-3">
		            <div class="carousel-item active">
		                <img src="https://images.unsplash.com/photo-1562911791-c7a97b729ec5?w=600" class="d-block w-100" alt="Car 1">
		            </div>
		            
		            <div class="carousel-item">
		                <img src="https://images.unsplash.com/photo-1558981403-c5f9899a28bc?q=80" class="d-block w-100" alt="Car 2">
		            </div>
		            <div class="carousel-item">
		                <img src="https://images.unsplash.com/photo-1494905998402-395d579af36f?w=600" class="d-block w-100" alt="Car 3">
		            </div>
		            <div class="carousel-item">
		                <img src="https://images.unsplash.com/photo-1507136566006-cfc505b114fc?w=600" class="d-block w-100" alt="Car 3">
		            </div>
		            <div class="carousel-item">
		                <img src="https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?auto=format&fit=crop&w=800&q=80" class="d-block w-100" alt="Car 3">
		            </div>
		            
		            
		        </div>
		    </div>
		</div>

        </div>
    </div>
</section>



<section class="featured-vehicles py-4">
    <div class="container">
        <h2>Result Listings</h2>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3" id="featuredVehicleContainer">
            <c:forEach var="item" items="${vehiclesWithCity}">
                <c:set var="vehicle" value="${item.vehicle}" />
                <c:set var="cityName" value="${item.cityName}" />
                <div class="col">
                    <div class="card vehicle-card" data-type="${vehicle.vehicleType}" data-city="${cityName}" data-model="${vehicle.make} ${vehicle.model}" data-price="${vehicle.price}">
                        <img src="${vehicle.carPicPath}" class="card-img-top vehicle-image" alt="${vehicle.make} ${vehicle.model}">
                        <div class="card-body vehicle-info">
                            <h5 class="vehicle-title">${vehicle.make} ${vehicle.model} (${vehicle.year})</h5>
                            <p class="card-text price">₹${vehicle.price}</p>
                            <p class="card-text"><i class="fas fa-map-marker-alt"></i> ${cityName}</p>
                            <a href="buyerviewvehicle?id=${vehicle.vehicleId}" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="text-center mt-3">
            <a href="login" class="btn btn-outline-primary btn-sm">Explore All Listings <i class="fas fa-arrow-right ms-2"></i></a>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
function filterHeroVehicles() {
    const type = document.getElementById("filterType").value.toLowerCase();
    const city = document.getElementById("filterCity").value.toLowerCase();
    const model = document.getElementById("filterModel").value.toLowerCase();
    const maxPrice = parseInt(document.getElementById("priceRange").value);

    const cards = document.getElementsByClassName("vehicle-card");

    for (let card of cards) {
        const vehicleType = card.getAttribute("data-type")?.toLowerCase() || "";
        const cityName = card.getAttribute("data-city")?.toLowerCase() || "";
        const vehicleModel = card.getAttribute("data-model")?.toLowerCase() || "";
        const price = parseInt(card.getAttribute("data-price")) || 0;

        const matchesType = type === "" || vehicleType.includes(type);
        const matchesCity = city === "" || cityName.includes(city);
        const matchesModel = model === "" || vehicleModel.includes(model);
        const matchesPrice = price <= maxPrice;

        card.style.display = (matchesType && matchesCity && matchesModel && matchesPrice) ? "block" : "none";
    }
}
</script>

</body>
</html>
