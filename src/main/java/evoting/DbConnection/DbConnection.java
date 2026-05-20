package evoting.DbConnection;

import java.sql.Connection;  //  for connection interface
import java.sql.DriverManager;  // for driver load 

public class DbConnection {

    private static final String url =  "jdbc:mysql://localhost:3306/e_voting";
           
    private static final String user = "root";

    private static final String password = "Cimage@123";

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(url, user, password);

            System.out.println("Connected Successfully");  // it will be print on console not web project 

        } catch (Exception e) {

            System.out.println(e.getMessage());
        }

        return con;
    }
}