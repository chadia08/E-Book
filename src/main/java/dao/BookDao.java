package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import metier.Book;

public class BookDao {
	
	public Book selectBook(String id) {
		Book book = null;
		try {
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = (Statement) connection.con.createStatement();
			System.out.println(st);
			ResultSet res = st.executeQuery("select * from livre where id_livre='"+id+"';");

			while (res.next()) {
				String id_livre = res.getString("id_livre");
				String titre = res.getString("Titre");
				String auteur = res.getString("Auteur");
				String categorie = res.getString("Categorie");
				int nbpages = res.getInt("nbpages");
				String description = res.getString("description");
				String image = res.getString("image");
				int prix = res.getInt("prix");
				book = new Book(id_livre, titre, auteur, categorie,nbpages, description,image,prix);
			}
		} catch (SQLException b) {
			b.printStackTrace();
		}
		return book;
	}
	
	
	public List<Book> selectAllBooks()throws Exception {
		List<Book> books = new ArrayList<>();
		try {
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = (Statement) connection.con.createStatement();
			System.out.println(st);
			ResultSet res = st.executeQuery("select * from livre");

			while (res.next()) {
				String id_livre = res.getString("id_livre");
				String titre = res.getString("Titre");
				String auteur = res.getString("Auteur");
				String categorie = res.getString("Categorie");
				int nb = res.getInt("nbpages");
				String description = res.getString("description");
				String image = res.getString("image");
				int prix = res.getInt("prix");
				books.add(new Book(id_livre, titre, auteur, categorie,nb, description,image,prix));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return books;
	}
	
	public void insertBook(Book book) throws SQLException {
		try{
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = (Statement) connection.con.createStatement();
			System.out.println(st);
			String query="insert into livre values("+book.getId_livre()+",'"+book.getTitre()+"','"+book.getAuteur()+"','"+book.getCategorie()+"',"+book.getNbpages()+",'"+book.getDescription()+"','"+book.getImage()+"',"+book.getPrix()+");";
			int row = st.executeUpdate(query);
			
		} catch (SQLException a) {
			a.printStackTrace();
		}
	}
	
	
	public void deleteBook(String id) throws SQLException {
		try {
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = (Statement) connection.con.createStatement();
			System.out.println(st);
			st.executeUpdate("delete from livre where id_livre='"+id+"';");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int updateBook(Book book) throws SQLException {
		int rowUpdated = 0;
		try{
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = (Statement) connection.con.createStatement();
			System.out.println(st);
			String query = "update livre set titre ='"+book.getTitre()+"',auteur='"+book.getAuteur()+"',categorie='"+book.getCategorie()+"',nbpages="+book.getNbpages()+",description ='"+book.getDescription()+"',image='"+book.getImage()+"',prix="+book.getPrix()+" where id_livre='"+book.getId_livre()+"';";
			rowUpdated = st.executeUpdate(query);
		}catch (SQLException c) {
			c.printStackTrace();
		}
		return rowUpdated;
	}
}
