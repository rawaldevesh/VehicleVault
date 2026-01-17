# 🚗 Vehicle Vault  
### Vehicle Buying & Selling Platform – Spring Boot Full Stack Application

---

## 📌 Overview
**Vehicle Vault** is a full-stack web application built using **Spring Boot (MVC architecture)** that enables users to buy and sell vehicles through a role-based system.  
The platform focuses on **secure authentication, vehicle management, inquiry generation, and administrative control**, without online payment integration.

This project was developed as a **final-year college project** and is fully functional.

---

## 🏗️ Architecture
- **Architecture Pattern:** MVC (Model–View–Controller)
- **Backend:** Spring Boot
- **Frontend:** JSP + Bootstrap
- **Database:** MySQL
- **Security:** Spring Security with BCrypt encryption

---

## 🧰 Technology Stack

| Layer        | Technologies Used |
|-------------|------------------|
| Backend     | Java, Spring Boot, Spring MVC |
| Security    | Spring Security, BCrypt |
| Frontend    | JSP, Bootstrap |
| Database    | MySQL |
| ORM         | Spring Data JPA, Hibernate |
| File Upload | Multipart File Handling |
| Cloud       | Cloudinary (Image Storage) |
| Build Tool  | Maven |
| Deployment  | WAR File |

---

## 👥 User Roles & Permissions

### 🔹 Admin
- Manage users and vehicles  
- View all inquiries  
- Export inquiry data as CSV  

### 🔹 Seller
- Add and manage vehicle listings  
- Upload vehicle images  

### 🔹 Buyer
- Browse available vehicles  
- Generate inquiries  

---

## ✨ Key Features
- Spring Boot MVC based application
- Role-based authentication (Admin / Seller / Buyer)
- Secure login using **BCrypt password encryption**
- OTP-based password reset  
  > OTP is stored in the database as implemented
- Vehicle listing with image upload (Cloudinary integration)
- Inquiry generation system
- CSV export of inquiry data
- Multipart file upload support
- Responsive UI using Bootstrap
- MySQL database integration
- No manual server setup required

---

## 🔐 Security Implementation
- Password encryption using **BCrypt**
- Role-based authorization with Spring Security
- OTP-based password reset mechanism
- Session-based authentication

---

## ⚙️ Installation & Setup

### 🔹 Prerequisites
- Java 8 or higher
- Maven
- MySQL
- Spring Tool Suite (STS) or IntelliJ IDEA

---

### 🔹 Database Setup
```sql
CREATE DATABASE vehicle_vault;

### 🔹 Configuration

Update `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/vehicle_vault
spring.datasource.username=YOUR_DB_USERNAME
spring.datasource.password=YOUR_DB_PASSWORD
```

---

### 🔹 Run the Application

1. Clone the repository:

   ```bash
   git clone https://github.com/rawaldevesh/VehicleVault.git
   ```

2. Open the project in **Spring Tool Suite**

3. Right-click the project
   **Run As → Spring Boot App**

4. Access the application:

   ```
   http://localhost:8080/
   ```

---

## 📦 Deployment

* The project generates a **WAR file** for deployment:

  ```
  vehicle-vault.war
  ```
* Can be deployed on **Apache Tomcat** or any compatible servlet container.

---

## 📈 Future Enhancements

* Online payment gateway integration
* OTP expiration and retry limits
* REST API version of the application
* Modern frontend using React or Angular
* Docker-based deployment

---

## 🧑‍💻 Author

**Devesh Rawal**
Java Developer

**Skills:**
Java • Spring Boot • MySQL • Spring Security • MVC Architecture

---

## 📜 License

This project is developed for educational purposes and personal learning.


