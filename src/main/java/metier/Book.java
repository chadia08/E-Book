package metier;

public class Book {
	private String id_livre;
	private String titre;
	private String auteur;
	private String categorie;
	private int nbpages;
	private String description;
	private String image;
	private int prix;
	
	
	public Book(String id_livre, String titre, String auteur, String categorie, int nbpages, String description,String image, int prix) {
		super();
		this.id_livre = id_livre;
		this.titre = titre;
		this.auteur = auteur;
		this.categorie = categorie;
		this.nbpages = nbpages;
		this.description = description;
		this.image = image;
		this.prix = prix;
	}
	public String getId_livre() {
		return id_livre;
	}
	public void setId_livre(String id_livre) {
		this.id_livre = id_livre;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getAuteur() {
		return auteur;
	}
	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public int getNbpages() {
		return nbpages;
	}
	public void setNbpages(int nbpages) {
		this.nbpages = nbpages;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPrix() {
		return prix;
	}
	public void setPrix(int prix) {
		this.prix = prix;
	}
}