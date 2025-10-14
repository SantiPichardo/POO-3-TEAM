public class Libro extends Material {
	private String genero;
	private static final double INTERES_LIBRO = 0.15;

	public Libro(String titulo, String autor, int anio, String genero, double precioContado) {
		super(titulo, autor, anio, precioContado);
		setGenero(genero);
	}

	public String getGenero() { return genero; }
	public void setGenero(String genero) { this.genero = genero; }

	@Override
	public String mostrarInformacion(){
		return "titulo: "+getTitulo()+"\nAutor: "+getAutor()+"\nAnio: "+getAnio()+"\nGenero: "+getGenero();
	}

	@Override
	public String tipoMaterial() { return "Libro"; }

	@Override
	public double calcularPrecio6Meses() {
		double precio = getPrecioContado() * (1 + INTERES_LIBRO);
		return Math.round(precio * 100.0) / 100.0;
	}

	@Override
	public String mostrarPrecioContado() { return "Precio de contado: $" + getPrecioContado(); } 
}
