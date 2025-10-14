public class Revista extends Material {
	private String periodicidad;
	private static final double INTERES_REVISTA = 0.10;

	public Revista(String titulo, String autor, int anio, String periodicidad, double precioContado) {
		super(titulo, autor, anio, precioContado);
		setPeriodicidad(periodicidad);
	}

	public String getPeriodicidad() { return periodicidad; }
	public void setPeriodicidad(String periodicidad) { this.periodicidad = periodicidad; }

	@Override
	public String mostrarInformacion(){
		return "titulo: "+getTitulo()+"\nAutor: "+getAutor()+"\nAnio: "+getAnio()+"\nPeriodicidad: "+getPeriodicidad();
	}

	@Override
	public String tipoMaterial(){ return "Revista"; }

	@Override
	public double calcularPrecio6Meses() {
		double precio = getPrecioContado() * (1 + INTERES_REVISTA);
		return Math.round(precio * 100.0) / 100.0;
	}
	@Override
	public String mostrarPrecioContado() { return "Precio de contado: $" + getPrecioContado(); }
} 
