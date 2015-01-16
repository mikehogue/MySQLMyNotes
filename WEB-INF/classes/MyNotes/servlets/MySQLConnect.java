package MyNotes.servlets;

import java.util.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class MySQLConnect {
    public static final String user_name = "nope";
    public static final String password = "nope";
    public Connection connection;
    
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Registers drivers

            String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
            String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
            String url = String.format("jdbc:mysql://%s:%s/mysqlmynotes", host, port);
            this.connection = DriverManager.getConnection(url, user_name, password); // get a connection
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




