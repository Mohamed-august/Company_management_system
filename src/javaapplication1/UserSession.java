package javaapplication1;

/**
 * Stores the session data for the currently logged-in user.
 */
public class UserSession {
    private static int employeeId;
    private static String fname;
    private static String lname;
    private static String position;
    private static String department;
    private static double salary;

    public static void setUser(int id, String first, String last, String pos, String dept, double sal) {
        employeeId = id;
        fname = first;
        lname = last;
        position = pos;
        department = dept;
        salary = sal;
    }

    public static int getEmployeeId() { return employeeId; }
    public static String getFname() { return fname; }
    public static String getFullName() { return fname + " " + lname; }
    public static String getPosition() { return position; }
    public static String getDepartment() { return department; }
    public static double getSalary() { return salary; }
}
