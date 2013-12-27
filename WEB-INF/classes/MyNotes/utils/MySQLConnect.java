package MyNotes.utils;

import java.util.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class MySQLConnect {
    public static final String connect_string = "jdbc:mysql://127.13.50.2:3306/mikehogue";
    public static final String user_name = "adminSLMrZdy";
    public static final String password = "M9wH6K-IlmtY";
    public Connection connection;
    
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Registers drivers

            this.connection = DriverManager.getConnection(connect_string, user_name, password); // get a connection
            if(connection == null) {
                throw new Exception("getConnection failed!");
            }
            
            connection.setAutoCommit(true); //We want to auto commit
        } catch (Exception e) {            
          e.printStackTrace();
          System.exit(1);
        }
        
        return this.connection;
    }
    
    public Statement getStatement() {
        Statement s = null;
        try {
            s = connection.createStatement();  // create a statement
            if (s == null) {
              throw new Exception("createStatement failed");
            }
        } catch (Exception e) {            
          e.printStackTrace();
          System.exit(1);
        }
        return s;
    }
    
    
}




