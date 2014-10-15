<%-- 
    Document   : index
    Created on : Oct 15, 2014, 10:11:16 PM
    Author     : forsell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.jspsample.entities.Contact,com.jspsample.models.ContactModel" %>


<%@include file="header.jsp" %>
    <h1>Contacts</h1>
    <div class="pull-right">
        <p><a href="addcontact.jsp" class="btn btn-primary">Add Contact</a></p>
    </div>
    <table class="table-bordered table-striped table-responsive table" width="100%">
            <tr>
                <th><input type="checkbox" id="checkall" name="checkall"/></th>
                <th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
            <% for(Contact contact:ContactModel.getAll()){%>
                <tr>
                    <td><input type="checkbox" name="contacts"/></td>
                    <td><%=contact.getContactId()%></td>
                    <td><%=contact.getFirstName()%></td>
                    <td><%=contact.getLastName()%></td>
                    <td><%=contact.getEmail()%></td>
                    <td><%=contact.getPhone()%></td>
                    <td><a href="editcontact.jsp?id=<%=contact.getContactId()%>" class="btn btn-success">Edit</a>
                        <a href="contact/delete/<%=contact.getContactId()%>" class="btn btn-danger" onclick="return confirm('Are you sure to delete ?')">Delete</a></td>
                </tr>
            <%}%>
                
    </table>        
<%@include file="footer.jsp" %>