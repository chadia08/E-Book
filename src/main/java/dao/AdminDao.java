package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import metier.Admin;


public class AdminDao {
	
	public AdminDao() {
		
	}
	
	public void selectAdmin(String Email, String Password) {
		Admin admin = null;
		
		try{
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = (Statement) connection.con.createStatement();
			System.out.println(st);
			ResultSet res = st.executeQuery("select * from admin where email='"+Email+"' and password='"+Password+"';");
			while (res.next()) {
				String email = res.getString("email");
				String password = res.getString("password");
				admin = new Admin(email,password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
