package javaapplication1;

import java.sql.*;

public class Connection_to_sql {

   public static String cleanInput(String input) {
    if (input == null) return "";
    
    input = input.trim();

    if (input.length() >= 2 && input.startsWith("'") && input.endsWith("'")) {
        input = input.substring(1, input.length() - 1).trim();
    }

    input = input.replaceAll("\\s+", " ");

    return input;
}



    public static boolean validateLogin(Login_page loginPage) {
        String Fname = loginPage.getUsername().trim();
        String password = loginPage.getPassword().trim(); 
        System.out.println("Username entered: " + Fname);
        System.out.println("Password entered: " + password);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
            return false;
        }

        try (Connection c = DriverManager.getConnection(
                "jdbc:mysql://localhost/Company_management_system_schema?serverTimezone=UTC",
                "root", "")) {
            
            String query = "SELECT * FROM employees WHERE Fname = ? AND password = ?";
            PreparedStatement pst = c.prepareStatement(query);
            pst.setString(1, Fname);  
            pst.setString(2, password); 

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                System.out.println("User found!");
                
                // Store user details in session
                UserSession.setUser(
                    rs.getInt("employee_id"),
                    rs.getString("Fname"),
                    rs.getString("Lname"),
                    rs.getString("position"),
                    rs.getString("department"),
                    rs.getDouble("salary")
                );
                
                return true; 
            } else {
                System.out.println("No user found with the provided credentials.");
                return false; 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  
        }
    }

    public static boolean addProductToSupplier(int supplier_id, String supplierName, String productName, String contactInfo) {
        try (Connection c = DriverManager.getConnection(
                "jdbc:mysql://localhost/Company_management_system_schema?serverTimezone=UTC", "root", "")) {

            String selectQuery = "SELECT products_supplied FROM suppliers WHERE supplier_id = ?";
            try (PreparedStatement selectStmt = c.prepareStatement(selectQuery)) {
                selectStmt.setInt(1, supplier_id);
                ResultSet rs = selectStmt.executeQuery();

                if (rs.next()) {
                    String currentProducts = rs.getString("products_supplied");
                    if (currentProducts == null || currentProducts.trim().isEmpty()) {
                        currentProducts = productName;
                    } else {
                        currentProducts += ", " + productName;
                    }

                    String updateQuery = "UPDATE suppliers SET products_supplied = ?, contact_information = ? WHERE supplier_id = ?";
                    try (PreparedStatement updateStmt = c.prepareStatement(updateQuery)) {
                        updateStmt.setString(1, currentProducts);
                        updateStmt.setString(2, contactInfo);
                        updateStmt.setInt(3, supplier_id);

                        return updateStmt.executeUpdate() > 0;
                    }
                } else {
                    String insertQuery = "INSERT INTO suppliers (supplier_id, supplier_name, contact_information, products_supplied) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement insertStmt = c.prepareStatement(insertQuery)) {
                        insertStmt.setInt(1, supplier_id);
                        insertStmt.setString(2, supplierName);
                        insertStmt.setString(3, contactInfo);
                        insertStmt.setString(4, productName);

                        return insertStmt.executeUpdate() > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

 public static boolean addAttendanceRecordFromStrings(
        String attendence_time_str,
        String employee_id_str,
        String attendence_date_str,
        String check_in_time_str,
        String check_out_time_str,
        String employee_name) {

    try {
        
        String cleanedAttendenceTime = cleanInput(attendence_time_str);
        String cleanedEmployeeId = cleanInput(employee_id_str);
        String cleanedDate = cleanInput(attendence_date_str);
        String cleanedCheckIn = cleanInput(check_in_time_str);
        String cleanedCheckOut = cleanInput(check_out_time_str);
        String cleanedEmployeeName = cleanInput(employee_name);

      
        int attendence_time = Integer.parseInt(cleanedAttendenceTime);
        int employee_id = Integer.parseInt(cleanedEmployeeId);
        Date attendence_date = Date.valueOf(cleanedDate); 
        Time check_in_time = Time.valueOf(cleanedCheckIn); 
        Time check_out_time = Time.valueOf(cleanedCheckOut);

        
        try (Connection c = DriverManager.getConnection(
                "jdbc:mysql://localhost/Company_management_system_schema?serverTimezone=UTC", "root", "")) {

            String insertQuery = "INSERT INTO attendence (attendence_time, employee_id, attendence_date, check_in_time, check_out_time, employee_name) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";

            try (PreparedStatement pst = c.prepareStatement(insertQuery)) {
                pst.setInt(1, attendence_time);
                pst.setInt(2, employee_id);
                pst.setDate(3, attendence_date);
                pst.setTime(4, check_in_time);
                pst.setTime(5, check_out_time);
                pst.setString(6, cleanedEmployeeName);

                int rowsInserted = pst.executeUpdate();
                return rowsInserted > 0;
            }

        }
    } catch (Exception e) {
        System.err.println("Error parsing or inserting attendance record:");
        e.printStackTrace();
        return false;
    }
}

    public static boolean recordAttendance(int empId, String empName) {
        try (Connection c = DriverManager.getConnection(
                "jdbc:mysql://localhost/Company_management_system_schema?serverTimezone=UTC", "root", "")) {
            
            // Generate current date and time
            long now = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(now);
            java.sql.Time time = new java.sql.Time(now);
            int attendanceId = (int)(now / 1000); // Simple unique ID based on seconds
            
            String query = "INSERT INTO attendence (attendence_time, employee_id, attendence_date, check_in_time, check_out_time, employee_name) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pst = c.prepareStatement(query)) {
                pst.setInt(1, attendanceId);
                pst.setInt(2, empId);
                pst.setDate(3, date);
                pst.setTime(4, time);
                pst.setTime(5, time); // Default checkout is same as checkin for now
                pst.setString(6, empName);
                
                return pst.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
   
}



