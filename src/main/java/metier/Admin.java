package metier;

public class Admin {
	private int id_admin;
	private String nom;
	private String prenom;
	private String email;
	private String password;
	
	public Admin() { 
	}
	
	public Admin(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id_admin;
	}

	public void setId(int id) {
		this.id_admin = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}