package dao;

import java.sql.SQLException;

import com.mysql.jdbc.Statement;

import metier.User;

public class UserDao {
	
	public UserDao() {
		
	}
	
	public void insertUser(User user) throws SQLException {
		
		try{
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = (Statement) connection.con.createStatement();
			System.out.println(st);
			String query="insert into users values("+user.getId_user()+",'"+user.getNom()+"','"+user.getPrenom()+"','"+user.getEmail()+"','"+user.getPassword()+"');";
			int row = st.executeUpdate(query);
			
		} catch (SQLException a) {
			a.printStackTrace();
		}
	}

}
