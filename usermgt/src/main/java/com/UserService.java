package com;

import model.User;
//For REST Service
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
//For JSON
import com.google.gson.*;
//For XML
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;

@Path("/User")
public class UserService {

	User userObj = new User();

	@GET   //read data
	@Path("/")   //defines the path
	@Produces(MediaType.TEXT_HTML)  //data type of the output
	public String readUsers() {         //method to read users from db
		return userObj.readUsers();     //call the reading method of model class using the created user obj
	}

	@POST       // insert data
	@Path("/")   //path
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED) //get the inserted data as a form
	@Produces(MediaType.TEXT_PLAIN) //returned data type
	public String insertUser(@FormParam("username") String username, @FormParam("password") String password, //catch data from postman
			@FormParam("address") String address, @FormParam("contactno") String contactno) {

		String output = userObj.insertUser(username, password, address, contactno); //call the method in model class
		return output; //show in postman

	}

	@PUT //update
	@Path("/") //path
	@Consumes(MediaType.APPLICATION_JSON) //fetch the data as json
	@Produces(MediaType.TEXT_PLAIN) //return output data type
	public String updateUser(String userData) {
//Convert the input string to a JSON object
		JsonObject userObject = new JsonParser().parse(userData).getAsJsonObject();
//Read the values from the JSON object
		String userid = userObject.get("userid").getAsString(); //asign json to string values
		String username = userObject.get("username").getAsString();
		String password = userObject.get("password").getAsString();
		String address = userObject.get("address").getAsString();
		String contactno = userObject.get("contactno").getAsString();
		String output = userObj.updateUser(userid, username, password, address, contactno);
		return output;

	}

	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteUser(String userData) {
//Convert the input string to an XML document
		Document doc = Jsoup.parse(userData, "", Parser.xmlParser());

//Read the value from the element <userid>
		String userid = doc.select("userid").text();
		String output = userObj.deleteUser(userid);
		return output;
	}

}