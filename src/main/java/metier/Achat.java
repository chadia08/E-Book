package metier;

import java.sql.Date;

public class Achat {
	
	private String id_achat;
	private String date;
	private int id_user;
	private String id_livre;
	
	public Achat(String id_achat, String date, int id_user, String id_livre) {
		super();
		this.id_achat = id_achat;
		this.date = date;
		this.id_user = id_user;
		this.id_livre = id_livre;
	}

	public String getId_achat() {
		return id_achat;
	}
	public void setId_achat(String id_achat) {
		this.id_achat = id_achat;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String dat) {
		this.date = dat;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getId_livre() {
		return id_livre;
	}
	public void setId_livre(String id_livre) {
		this.id_livre = id_livre;
	}
}
	
