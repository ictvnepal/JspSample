/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.jspsample.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author forsell
 */
public class DBConnection {
    Connection connection=null;
    PreparedStatement stmt=null;
    
    
    public DBConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost/contact", "root","");
    }
    
    public PreparedStatement initStatement(String sql) throws SQLException{
        stmt=connection.prepareStatement(sql);
        return stmt;
    }
    
    public int executeNonQuery() throws SQLException{
        return stmt.executeUpdate();
    }
    
    public ResultSet executeReader() throws SQLException{
        return stmt.executeQuery();
    }
    
    
    
    public void close() throws SQLException{
        if(!connection.isClosed()){
            connection.close();
            connection=null;
        }
    }
    
    

}
