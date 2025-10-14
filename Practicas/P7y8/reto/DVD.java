public class DVD extends Material {
	private String duracion;
	private static final double INTERES_DVD = 0.20;

	public DVD(String titulo, String autor, int anio, String duracion, double precioContado) {
		super(titulo, autor, anio, precioContado);
		setDuracion(duracion);
	}

	public String getDuracion() { return duracion; }
	public void setDuracion(String duracion) { this.duracion = duracion; }

	@Override
	public String mostrarInformacion() {
		return "titulo: " + getTitulo() + "\nAutor: " + getAutor() + "\nAnio: " + getAnio() + "\nDuración: " + getDuracion();
	}

	@Override
	public String tipoMaterial() { return "DVD"; }

	@Override
	public double calcularPrecio6Meses() {
		double precio = getPrecioContado() * (1 + INTERES_DVD);
		return Math.round(precio * 100.0) / 100.0;
	}

	@Override
	public String mostrarPrecioContado() { return "Precio de contado: $" + getPrecioContado(); }
}
