<%@page import="com.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">


<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/users.js"></script>
</head>
<body  style="background-color:#F0F8FF"> 
<div class="container"><div class="row"><div class="col-6"> 
<h1 style="color:#000080;text-align: center; font-family: 'Brush Script MT', cursive;font-size: 50px">User Management </h1>
<form id="formUser" name="formUser" method="post" action="users.jsp">
 Username: 
 <input id="username" name="username" type="text" 
 class="form-control form-control-sm">
 <br> Password: 
 <input id="password" name="password" type="text" 
 class="form-control form-control-sm">
 <br> Address: 
 <input id="address" name="address" type="text" 
 class="form-control form-control-sm">
 <br> Contact no: 
 <input id="contactno" name="contactno" type="text" pattern="[1-9]{1}[0-9]{9}"  maxlength="10" 
 class="form-control form-control-sm">
 <br>
  <input id="btnSave" name="btnSave" type="button" value="Save" 
 class="btn btn-primary">
 <input type="hidden" id="hiduseridSave" 
 name="hiduseridSave" value="">
</form>

<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divUsersGrid">
 <%
 User userObj = new User(); 
 out.print(userObj.readUsers()); 
 %>
</div>
</div> </div> </div> 
</body>
</html>