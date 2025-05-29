# CollegeFeeApp

A web-based College Fee Payment Management System developed using **JSP**, **Servlets**, and **JDBC** with **MySQL** as the backend. This system allows admin users to manage student fee payments through various modules such as Add, Update, Delete, Display, and Generate Reports.

---

## ✅ Features

- Add, update, and delete student fee payment records
- Display all student fee payment data
- Generate reports by student ID
- Automatically calculate total fee amounts
- Simple and user-friendly web interface

---

## 📊 Fee Structure

> *(Adjust according to your implementation logic if needed)*

- Fees can include components such as:
  - Tuition Fee
  - Lab Fee
  - Library Fee
  - Miscellaneous Charges
- Total amount is calculated at the time of data entry or update

---

## 🧰 Prerequisites

- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 9.0 or higher
- MySQL 8.0 or higher
- Eclipse or IntelliJ IDEA (for development)
- Modern web browser (Chrome, Firefox, Edge, Safari)

---

## 🔧 Installation

###  Clone the Repository
```bash
git clone https://github.com/Karthikrajaurs/CollegeFeeApp.git
cd CollegeFeeApp



### 1. **Home Page**
- **File**: `index.jsp`
- **Screenshot**:  
  [index.jsp](https://github.com/Karthikrajaurs/CollegeFeeApp/blob/main/Screenshot%202025-05-29%20173839.png)
- **Description**: Main landing page providing navigation to all modules.

---

### 2. **Add Fee Payment**
- **File**: `feepaymentadd.jsp`
- **Screenshot**:  
  [feepaymentadd.jsp](https://github.com/Karthikrajaurs/CollegeFeeApp/blob/main/Screenshot%202025-05-29%20173932.png)
- **Description**: Form to insert new student fee payment records into the database.

---

### 3. **Update Fee Payment**
- **File**: `feepaymentupdate.jsp`
- **Screenshot**:  
  [feepaymentupdate.jsp](https://github.com/Karthikrajaurs/CollegeFeeApp/blob/main/Screenshot%202025-05-29%20174223.png)
- **Description**: Allows updating of existing fee payment details by student ID.

---

### 4. **Delete Fee Payment**
- **File**: `feepaymentdelete.jsp`
- **Screenshots**:  
  [feepaymentdelete.jsp-1](https://github.com/Karthikrajaurs/CollegeFeeApp/blob/main/Screenshot%202025-05-29%20174029.png)  
  [feepaymentdelete.jsp-2](https://github.com/Karthikrajaurs/CollegeFeeApp/blob/main/Screenshot%202025-05-29%20174116.png)
- **Description**: Provides functionality to delete records by student ID.

---

### 5. **Display Fee Payments**
- **File**: `feepaymentdisplay.jsp`
- **Screenshot**:  
  [feepaymentdisplay.jsp](https://github.com/Karthikrajaurs/CollegeFeeApp/blob/main/Screenshot%202025-05-29%20174029.png)
- **Description**: Shows all the fee payment records from the database.

---

### 6. **Generate Reports**
- **File**: `reports.jsp`
- **Screenshot**:  
  [reports.jsp](https://github.com/Karthikrajaurs/CollegeFeeApp/blob/main/Screenshot%202025-05-29%20174458.png)
- **Description**: Interface to generate reports based on input criteria (e.g., student ID).

---

### 7. **Report Result Display**
- **File**: `report_result.jsp`
- **Screenshot**:  
  [report_result.jsp](https://github.com/Karthikrajaurs/CollegeFeeApp/blob/main/Screenshot%202025-05-29%20174512.png)
- **Description**: Displays the result of the generated report (e.g., student’s total payment).
