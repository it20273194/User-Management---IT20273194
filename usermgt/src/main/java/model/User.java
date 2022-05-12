package model;
import java.sql.*;
public class User {
	
	//Connect data method
	public Connection connect()
	{
	 Connection con = null;

	 try
	 {
	 Class.forName("com.mysql.jdbc.Driver"); // connect mysql
	//Provide the correct details: DBServer/DBName, username, password
	 con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/electrogrid", "root", "");
	 //For testing
	 System.out.print("Successfully connected");
	 }
	 catch(Exception e)
	 {
	
		 e.printStackTrace();
	 }

	 return con; //return connection variable
	  
	}

public String insertUser(String username, String password, String address, String contactno){ //parameters
		
		String output = ""; 
		
		try
		{ 
			Connection con = connect(); 
			
			if (con == null) 
			{
				return "Error while connecting to the database for inserting."; 
				
			} 
			// create a prepared statement
			
			String query = "insert into user(userid,username,password,address,contactno)"+" values (?, ?, ?, ?, ?)"; 
			PreparedStatement preparedStmt = con.prepareStatement(query);  //prepare the statement through con
			//Binding values in order
			preparedStmt.setInt(1, 0); 
			preparedStmt.setString(2, username); 
			preparedStmt.setString(3, password); 
			preparedStmt.setString(4, address); 
			preparedStmt.setString(5, contactno); 
			preparedStmt.execute(); //execute query
			con.close(); 
			output = "Inserted successfully"; 
		} 
		
		catch (Exception e) 
		{ 
			output = "Error while inserting the user details."; 
			System.err.println(e.getMessage()); 
		} 
		return output; //return to api
} 

	// Read User details

public String readUsers(){
	
	String output = "";
	try{
		Connection con = connect();
		if (con == null){
			return "Error while connecting to the database for reading."; 
		}
		// Prepare the html table to be displayed
//Added Bootstrap
		output ="<html> " 
				+"<head>"
				  +"<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">"	
				  +"</head>"
				  
				  +"<body>"+ 
				
				"<table border='1' class='table'><tr><th>userid</th><th>username</th>" +
				"<th>password</th>" +
				"<th>address</th>" +
				"<th>contactno</th>" +
				"<th>Update</th><th>Remove</th></tr>";

		String query = "select * from user";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query); //assign the query o the result set
		// iterate through the rows in the result set in an order
		while (rs.next()){
			String userid = Integer.toString(rs.getInt("userid"));
			String username = rs.getString("username");
			String password = rs.getString("password");
			String address = rs.getString("address");
			String contactno = rs.getString("contactno");
			
			// Add into the html table
			output += "<tr><td>" + userid + "</td>";
			output += "<td>" + username + "</td>";
			output += "<td>" + password + "</td>";
			output += "<td>" + address + "</td>";
			output += "<td>" + contactno + "</td>";
			
			// buttons
			output += "<td><input name='btnUpdate' type='button' value='Update'"
					+ " class='btn btn-secondary'></td>" + 
					"<td><form method='post' action='user.jsp'>" + 
					"<input name='btnRemove' type='submit' value='Remove' class='btn btn-danger'>" + 
					"<input name='userid' type='hidden' value='" + userid + "'>" + "</form></td></tr>";
		}
		con.close();
		// Complete the html table
		output += "</table>";
	}catch (Exception e){
		output = "Error while reading the users.";
		System.err.println(e.getMessage()); //show error
	}
	return output;
 }
	

// Updating User details
public String updateUser(String userid, String username, String password, String address, String contactno)

{
	String output = "";
	
	
	try {
		Connection con = connect();
		if (con == null) {
			return "Error while connecting to the database for updating.";
		}
		// create a prepared statement
		String query = "UPDATE user SET username=?,password=?,address=?,contactno=? WHERE userid=?";
		
		PreparedStatement preparedStmt = con.prepareStatement(query);
		// binding values
		preparedStmt.setString(1, username);
		preparedStmt.setString(2, password);
		preparedStmt.setString(3, address);
		preparedStmt.setString(4, contactno);
		preparedStmt.setInt(5, Integer.parseInt(userid));
		// execute the statement
		 preparedStmt.execute();
		con.close();
		
		output = "Updated successfully";
		
		
	} catch (Exception e) {
		
		output = "Error while updating the user details.";
		System.err.println(e.getMessage());
		
	}
	return output;
}

//Deleting existing users
public String deleteUser(String userid){
	 
	String output = "";
	try{
 
		Connection con = connect();
		if (con == null){
			return "Error while connecting to the database for deleting."; 
		}
		// create a prepared statement
		String query = "delete from user where userid=?";
		PreparedStatement preparedStmt = con.prepareStatement(query);
		// binding values
		preparedStmt.setInt(1, Integer.parseInt(userid));
		// execute the statement
		preparedStmt.execute();
		con.close();
		output = "Deleted successfully";
	}catch (Exception e){
		output = "Error while deleting the user.";
		System.err.println(e.getMessage());
	}
	return output;
 }
}

