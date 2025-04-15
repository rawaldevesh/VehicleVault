<!-- Admin Footer -->
<footer class="admin-footer text-center">
    <div class="container">
        <p class="mb-1">© 2025 Vehicle Vault. All Rights Reserved.</p>
        <div class="footer-links">
            <a href="admindashboard"><i class="fas fa-home"></i> Home</a>
            <a href="profile"><i class="fas fa-user-circle"></i> Profile</a>
            <a href="settings"><i class="fas fa-cog"></i> Settings</a>
            <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
</footer>

<!-- Add to <head> if not already included -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>

<!-- Footer Styles -->
<style>
    .admin-footer {
        background: black;
        color: white;
        padding: 20px 0;
        font-family: 'Segoe UI', sans-serif;
        font-size: 14px;
        margin-top: auto;
    }

    .admin-footer .footer-links {
        margin-top: 10px;
    }

    .admin-footer .footer-links a {
        color: white;
        text-decoration: none;
        margin: 0 12px;
        font-size: 14px;
        transition: color 0.3s;
    }

    .admin-footer .footer-links a:hover {
        color: #cce5ff;
    }

    @media (max-width: 768px) {
        .admin-footer {
            font-size: 13px;
            text-align: center;
        }

        .admin-footer .footer-links {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .admin-footer .footer-links a {
            margin: 5px 0;
        }
    }
</style>
