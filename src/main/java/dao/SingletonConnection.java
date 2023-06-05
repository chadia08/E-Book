package dao;


import java.sql.*;
import java.io.IOException;

@SuppressWarnings("unused")
public class SingletonConnection {
        
        public Connection con = null;
        String url= "jdbc:mysql://localhost:3306/ebook";
        String user  = "root";
        String mdp = "";
        
        public SingletonConnection() {
            super();
        }
        public void getconnection() {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("ok pour class for name");
            con =DriverManager.getConnection(url,user,mdp);
            System.out.println("la connexion est etablie");
            
        }catch(Exception e) {
                System.out.println(e.getMessage());
            }
        }
}
