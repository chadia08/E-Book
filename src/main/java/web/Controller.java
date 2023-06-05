package web;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AchatDao;
import dao.BookDao;
import dao.SingletonConnection;
import dao.UserDao;
import metier.Achat;
import metier.Admin;
import metier.Book;
import metier.User;


@WebServlet("/")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDao bookDAO;
	private AchatDao achatDAO;
	private UserDao userDAO;
	
	public void init() {
		bookDAO = new BookDao();
		achatDAO = new AchatDao();
		userDAO = new UserDao();
	}
       
    public Controller() {
        super();
    }

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{

		response.setContentType("application/javascript");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/logine":
				log(request, response);
				break;
			case "/home":
				home(request, response);
				break;
			case "/list":
				listbook(request, response);
				break;
			case "/newuser":
				showNewForm(request, response);
				break;
			case "/ADMIN/insertbook":
				insertbook(request, response);
				break;
			case "/ADMIN/deletebook":
				deletebook(request, response);
				break;
			case "/selectbook":
				showeditbook(request, response);
				break;
			case "/ADMIN/updatebook":
				updateBook(request, response);
				break;
			case "/ADMIN/editbook":
				showeditbook(request, response);
				break;
			case "/insertachat":
				insertachat(request, response);
				break;
			case "/insertuser":
				insertUser(request, response);
				break;
			case "/login":
				login(request, response);
				break;
			case "/logout":
				logout(request, response);
				break;
			case "/adminlogin":
				loginadmin(request,response);
			case "/logoutadmin":
				logoutadmin(request,response);
				
			}
			}catch (Exception ex) {
				ex.printStackTrace();
			}
					
	}
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
			doGet(request, response);
		}
	 
	 private void home(HttpServletRequest request, HttpServletResponse response)throws Exception {
		 RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		 dispatcher.forward(request, response);
	 }
	 
	 private void log(HttpServletRequest request, HttpServletResponse response)throws Exception {
		 RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		 dispatcher.forward(request, response);
	 }
	
	private void listbook(HttpServletRequest request, HttpServletResponse response)throws Exception {
		List<Book> listbook = bookDAO.selectAllBooks();
		request.setAttribute("listbook", listbook);
		RequestDispatcher dispatcher = request.getRequestDispatcher("books.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertbook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String id_livre = request.getParameter("id_livre") ;		
		String titre = request.getParameter("titre");
		String auteur = request.getParameter("auteur");
		String categorie = request.getParameter("categorie");
		int nbpages = Integer.parseInt(request.getParameter("nbpages"));
		String desc = request.getParameter("description");
		String image = request.getParameter("image");
		int prix = Integer.parseInt(request.getParameter("prix"));
		Book book = new Book(id_livre, titre, auteur, categorie,nbpages,desc,image,prix);
		bookDAO.insertBook(book);
		
		Book existingbook = bookDAO.selectBook(id_livre);
		if(existingbook!=null) {
			 request.setAttribute("bookexiste", existingbook);
		 }
		RequestDispatcher dispatcher = request.getRequestDispatcher("/livres.jsp?msg=true");
		dispatcher.forward(request, response);
	}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);
	}
	private void deletebook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String id_livre = request.getParameter("id_livre");
		bookDAO.deleteBook(id_livre);
		response.sendRedirect("http://localhost:8080/library/ADMIN/livres.jsp");
	}
	
	private void showeditbook(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		String id = request.getParameter("id_livre");
		Book existingBook = bookDAO.selectBook(id);
		request.setAttribute("book", existingBook);
		String referrer = request.getHeader("referer");
		if(referrer.equals("http://localhost:8080/library/ADMIN/livres.jsp")) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/livreupdate.jsp");
		dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("infobook.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	private void updateBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String id = request.getParameter("id_livre");
		String titre = request.getParameter("titre");
		String auteur = request.getParameter("auteur");
		String Categorie = request.getParameter("categorie");
		int  Nbpages = Integer.parseInt(request.getParameter("nbpages"));
		String Description = request.getParameter("description");
		String image = request.getParameter("image");
		int prix = Integer.parseInt(request.getParameter("prix"));
		Book book = new Book(id,titre,auteur,Categorie,Nbpages,Description,image,prix);
		bookDAO.updateBook(book);
		response.sendRedirect("http://localhost:8080/library/ADMIN/livres.jsp");
	}
	
	private void insertachat(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		LocalDate currentDate = java.time.LocalDate.now();	
		Date date = Date.valueOf(currentDate);
		SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yy");
		String outputDate = outputFormat.format(date);
		int id_user =(int) request.getSession().getAttribute("id_user");
		String id_livre=request.getParameter("id_livre");
		String id_achat = ""+id_user+""+id_livre;
        Achat achat = new Achat(id_achat,outputDate,id_user,id_livre);
		achatDAO.insertachat(achat);
		response.sendRedirect("books.jsp");
	}
	
	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id_user =Integer.parseInt(request.getParameter("id")) ;		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User newUser = new User(id_user, nom, prenom, email,password);
		userDAO.insertUser(newUser);
		response.sendRedirect("http://localhost:8080/library/login.jsp?msg=congrats");
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String password=request.getParameter("password");
		try {
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = connection.con.createStatement();
			ResultSet res = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
			if(res.next()) {
				 session.setAttribute("email",email);
				 session.setAttribute("password",password);
				 session.setAttribute("id_user",res.getInt("id"));
			     session.setAttribute("nom", res.getString("nom"));
				 session.setAttribute("prenom", res.getString("prenom"));
				 response.sendRedirect("books.jsp");
			}else response.sendRedirect("http://localhost:8080/library/login.jsp?message=error");
			res.close();
			st.close();
			connection.con.close();
	
	}catch(Exception v) {
		v.printStackTrace();
	}
}
	private void loginadmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		String email = request.getParameter("emailadmin");
		String password=request.getParameter("passwordadmin");
		try {
			SingletonConnection connection = new SingletonConnection();
			connection.getconnection();
			Statement st = (Statement) connection.con.createStatement();
			System.out.println(st);
			ResultSet res = st.executeQuery("select * from admin where email='"+email+"' and password='"+password+"';");
			 if(res.next()) {
				 System.out.println("admin existe");
				 session.setAttribute("emailadmin", email);
				 session.setAttribute("passwordadmin", password);
				 System.out.println("session ouverte email = "+session.getAttribute("emailadmin")+"  password = "+session.getAttribute("passwordadmin"));
				response.sendRedirect("http://localhost:8080/library/ADMIN/dashboard.jsp");
				
			}else response.sendRedirect("http://localhost:8080/library/ADMIN/login.jsp?message=error");
			res.close();
			st.close();
			connection.con.close();
		}catch(Exception k) {	k.printStackTrace();	}
}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
	HttpSession session = request.getSession();
	session.removeAttribute("id_user");
	session.removeAttribute("password");
	session.removeAttribute("email");
	session.removeAttribute("nom");
	session.removeAttribute("prenom");
	response.sendRedirect("login.jsp");
	
	}
	
	private void logoutadmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		session.removeAttribute("emailadmin");
		session.removeAttribute("passwordadmin");
		response.sendRedirect("http://localhost:8080/library/ADMIN/login.jsp");
	}
}