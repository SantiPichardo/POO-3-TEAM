import java.util.HashMap;

public class Libreria {
	HashMap<String, Libro> libros;

	public Libreria() { this.libros = new HashMap<String, Libro>(); }

	public void agregarLibro(String t, String a) {
		Libro nuevo = new Libro(t, a);
		this.libros.put((nuevo.titulo + nuevo.autor), nuevo);
	}

	public void quitarLibro(String t, String a) {
		String llave = t+a;
		if(this.libros.keySet().contains(llave))
			this.libros.remove(llave);
		else
			System.out.println("Libro titulado \"" + t + "\" por " + a + " no se encuentra en la libreria");
	}

	public void printInventario() {
		for(String llave : libros.keySet())
			System.out.println(this.libros.get(llave));
	}
}
