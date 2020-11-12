package com.kon;
import java.io.*;
import java.sql.*;


public class DB {

    public Connection initiateConnection() throws SQLException, InstantiationException, IllegalAccessException {
        String dbURL = "jdbc:mysql://localhost:3306/kone";
        String username = "sean";
        String password = "nalwanga";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch( ClassNotFoundException e ) {
            e.printStackTrace();
        }

        
        Connection con = DriverManager.getConnection( dbURL, username, password );

       if ( con != null ) {
           return con;
       }
       else return null;
    }

}