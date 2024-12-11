# Hibernate-Employee-Management-System
# Hibernate Employee Management System

## Project Overview
The Hibernate Employee Management System is a web-based application designed to manage employee and admin data. It leverages Hibernate ORM for database interactions and is built on a Java Servlet-based architecture. The system provides functionalities for admin registration and login, employee CRUD operations, and seamless database integration.

## Features
- **Admin Registration and Login**: Allows admin users to register, log in, and manage employee data.
- **Employee Management**:
  - Add new employees.
  - Update existing employee details.
  - View all employees.
  - Delete employees.
- **Hibernate Integration**: Uses Hibernate ORM for database interactions.
- **MySQL Database**: Stores admin and employee data.

## Technologies Used
- **Java**: Core programming language.
- **Servlets**: For handling HTTP requests and responses.
- **Hibernate ORM**: For database interaction.
- **MySQL**: Database management.
- **JSP**: For front-end interfaces.
- **Apache Tomcat**: Web server.

## Prerequisites
- Java JDK 8 or later
- Apache Tomcat 9 or later
- MySQL 8 or later
- IDE (Eclipse/IntelliJ IDEA recommended)
- Maven (optional for dependency management)

## Project Structure
```
HibernateEmployeeManagementSystem/
|-- src/main/java/
|   |-- com/HibernateWebProject/Bean/
|   |   |-- Admin.java
|   |   |-- Emp.java
|   |-- com/HibernateWebProject/Servlet/
|       |-- HibernateProject.java
|-- src/main/resources/
|   |-- hibernate.cfg.xml
|-- WebContent/
|   |-- WEB-INF/
|       |-- web.xml
|   |-- JSP files (e.g., reg.jsp, adminhome.jsp, adminlogin.jsp, emp.jsp)
```

## Setup and Installation
### 1. Clone the Repository
```bash
git clone <repository-url>
cd HibernateEmployeeManagementSystem
```

### 2. Configure the Database
1. Create a MySQL database named `hibernate`.
2. Update the database credentials in `hibernate.cfg.xml`:
   ```xml
   <property name="hibernate.connection.username">your-username</property>
   <property name="hibernate.connection.password">your-password</property>
   ```
3. Use the following SQL to create the necessary tables (if `hibernate.hbm2ddl.auto` is not set to `update`):
   ```sql
   CREATE TABLE Admin (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255),
       email VARCHAR(255),
       password VARCHAR(255)
   );

   CREATE TABLE Emp (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255),
       salary INT
   );
   ```

### 3. Build and Deploy
1. Compile the project in your IDE or using Maven.
2. Deploy the WAR file to Apache Tomcat.
3. Start the server and access the application via `http://localhost:8080/HibernateEmployeeManagementSystem/`.

## Usage
1. Register as an admin on the `reg.jsp` page.
2. Log in with your admin credentials on the `adminlogin.jsp` page.
3. Manage employees via the admin dashboard (`adminhome.jsp`).

## Code Highlights
### HibernateProject Servlet
Handles HTTP requests and performs operations like admin registration, login, employee CRUD, and logout.

### Admin and Emp Beans
Defines Hibernate-mapped entities for `Admin` and `Emp` tables.

### Hibernate Configuration (`hibernate.cfg.xml`)
Specifies database connection properties, dialect, and entity mappings.

### Jsp Files
adminreg.jsp 

## Future Enhancements
- Add user roles for employees to log in and view their own profiles.
- Implement better error handling and validation.
- Enhance UI with modern front-end frameworks.
- Secure sensitive data with encryption.

# Hibernate Employee Management System

A full-stack web application built with **Java**, **Hibernate**, **MySQL**, and **Servlets**. This system manages employee records with features like registration, login, data retrieval, update, and deletion. It provides admin functionalities for employee management.

---

## 🚀 Features

- **Admin Registration & Login**: Secure admin authentication.
- **Employee CRUD Operations**: Create, Read, Update, and Delete employee records.
- **Dynamic Routing**: Servlets handle requests dynamically with Hibernate integration.
- **MySQL Database Integration**: Persistent data storage with Hibernate ORM.

---

## 🛠️ Tech Stack

- **Backend**: Java, Hibernate
- **Database**: MySQL
- **Frontend**: JSP (Java Server Pages)
- **Server**: Apache Tomcat

---

## 📂 Project Structure

### **Servlet**: [HibernateProject.java]
```java
@WebServlet("/")
public class HibernateProject extends HttpServlet {
    // Routing for various functionalities
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        switch (request.getServletPath()) {
            case "/reg": adminReg(request, response); break;
            case "/login": loginAdmin(request, response); break;
            case "/empreg": regEmployee(request, response); break;
            case "/empdata": getEmpData(request, response); break;
            case "/delemp": deleteEmp(request, response); break;
            case "/getempdata": getDataFromEmp(request, response); break;
            case "/updateemp": updateEmpData(request, response); break;
            case "/logout": getLogout(request, response); break;
        }
    }
}
```

### **Hibernate Configuration**: [hibernate.cfg.xml]
```xml
<hibernate-configuration>
  <session-factory>
    <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
    <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/hibernate</property>
    <property name="hibernate.dialect">org.hibernate.dialect.MySQL8Dialect</property>
    <property name="hibernate.connection.username">root</property>
    <property name="hibernate.connection.password">password</property>
    <property name="hibernate.hbm2ddl.auto">update</property>
    <mapping class="com.HibernateWebProject.Bean.Admin" />
    <mapping class="com.HibernateWebProject.Bean.Emp" />
  </session-factory>
</hibernate-configuration>
```

### **Entity Classes**:
#### [Admin.java]
```java
@Entity
@Table
public class Admin {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String name;
    private String email;
    private String password;
    // Getters, setters, and constructors
}
```

#### [Emp.java]
```java
@Entity
@Table
public class Emp {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String name;
    private int salary;
    // Getters, setters, and constructors
}
```

---

## 🔧 Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   ```
2. **Setup MySQL Database**:
   - Create a database named `hibernate`.
   - Update `hibernate.cfg.xml` with your database credentials.
3. **Deploy to Tomcat Server**:
   - Place the compiled `.war` file into the `webapps` directory of your Apache Tomcat server.
4. **Run the Application**:
   - Access the app at `http://localhost:<port>/HibernateWebProject`.

---

## 🌟 Key JSP Files

- **reg.jsp**: Admin Registration
- **adminlogin.jsp**: Admin Login
- **adminhome.jsp**: Admin Dashboard
- **emp.jsp**: Employee Update Form

---

## 📝 License
This project is open-source and available under the [MIT License](LICENSE).

---

## 📧 Contact
For questions or support, reach out via [email@example.com](mailto:email@example.com).



## Author
Developed by Pulivarthi Paripurna Chari.

