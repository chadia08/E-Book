package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import metier.Achat;
import metier.Book;

public class AchatDao{
	
	public AchatDao() {
		
	}
	public void insertachat(Achat achat) throws SQLException, IOException {
		try{
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = (Statement) connection.con.createStatement();
			System.out.println(st);
			String query="insert into achat values('"+achat.getId_achat()+"',"+achat.getId_user()+",'"+achat.getId_livre()+"','"+achat.getDate()+"');";
			int row = st.executeUpdate(query);
			
		} catch (SQLException a) {
			a.printStackTrace();
			System.out.println("l'chat non insere");
		}
	}
	
	
	
	
}