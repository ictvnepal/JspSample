<%-- 
    Document   : index
    Created on : Oct 15, 2014, 10:11:16 PM
    Author     : forsell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@page import="com.jspsample.entities.Contact,com.jspsample.models.ContactModel" %>
<%
    Contact contact=ContactModel.getByPK(Integer.parseInt(request.getParameter("id")));
%>
<div class="panel panel-primary">
    <div class="panel-heading"><h3 class="panel-title">Edit Contact</h3></div>
  <div class="panel-body">
      <form role="form" method="post" action="">
      <div class="form-group">
        <label for="first_name">First Name</label>
        <input type="text" class="form-control" id="first_name" name="first_name" value="<%=contact.getFirstName()%>" placeholder="Enter First Name" required="required"/>
      </div>
      <div class="form-group">
        <label for="last_name">Last Name</label>
        <input type="text" class="form-control" id="last_name" name="last_name" value="<%=contact.getLastName()%>" placeholder="Enter Last Name" required="required"/>
      </div>
       <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" name="email"  value="<%=contact.getEmail()%>" placeholder="Enter Email" required="required"/>
      </div>
      <div class="form-group">
        <label for="phone">Phone No.</label>
        <input type="text" class="form-control" id="phone" name="phone"  value="<%=contact.getPhone()%>" placeholder="Enter Phone No" required="required"/>
      </div>  
          <input type="hidden" id="contact_id" name="contact_id" value=""/>
      <button type="submit" class="btn btn-success">Submit</button>
      <a href="contacts.jsp" class="btn btn-danger">Cancel</a>
    </form>
  </div>
</div>

    
<%@include file="footer.jsp" %>    