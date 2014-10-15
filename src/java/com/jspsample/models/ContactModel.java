/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.jspsample.models;

import com.jspsample.db.DBConnection;
import com.jspsample.entities.Contact;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author forsell
 */
public class ContactModel {

    private static Contact mapData(ResultSet rs) throws SQLException{
        Contact contact=new Contact();  
        contact.setContactId(rs.getInt("contact_id"));
        contact.setFirstName(rs.getString("first_name"));
        contact.setLastName(rs.getString("last_name"));
        contact.setEmail(rs.getString("email"));
        contact.setPhone(rs.getString("phone"));
        return contact;
    }
    
    public static ArrayList<Contact> getAll() throws SQLException, ClassNotFoundException{
        ArrayList<Contact> contacts=new ArrayList<Contact>();
        DBConnection connection=new DBConnection();
        String sql="SELECT * from contacts";
        PreparedStatement stmt=connection.initStatement(sql);
        
        ResultSet rs=connection.executeReader();
        while(rs.next()){
            Contact contact=mapData(rs);
            contacts.add(contact);
        }
        connection.close();
        return contacts;       
    }
    
    public static Contact getByPK(int id) throws ClassNotFoundException, SQLException{
        Contact contact=null;
        DBConnection connection=new DBConnection();
        String sql="SELECT * from contacts WHERE contact_id=?";
        PreparedStatement stmt=connection.initStatement(sql);
        stmt.setInt(1,id);
        ResultSet rs=connection.executeReader();
        while(rs.next()){
           contact=mapData(rs);
            
        }
        connection.close();
        return contact;    
    }    
    

}
