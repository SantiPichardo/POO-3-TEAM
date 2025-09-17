public class Libro {
	public String titulo, autor;

	public Libro(String t, String a) {
		this.titulo = t;
		this.autor = a;
	}
	//public Libro() { Libro("N/A", "N/A"); }

	public String toString() { return this.titulo + " (" + this.autor + ")"; }
}
