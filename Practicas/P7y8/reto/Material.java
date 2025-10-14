public abstract class Material {
	private String titulo;
	private String autor;
	private int anio;
	private double precioContado;

	public Material(String titulo, String autor, int anio, double precioContado){
		setTitulo(titulo);
		setAutor(autor);
		setAnio(anio);
		setPrecioContado(precioContado);
	}

	public String getTitulo() { return titulo; }
	public void setTitulo(String titulo) { this.titulo = titulo; }

	public String getAutor() { return autor; }
	public void setAutor(String autor) { this.autor = autor; }

	public int getAnio() { return anio; }
	public void setAnio(int anio) { this.anio = anio; }

	public double getPrecioContado() { return precioContado; }
	public void setPrecioContado(double precioContado) {
		if (precioContado < 0)
			System.out.println("El precio no puede ser negativo");
		else
			this.precioContado = precioContado;
	}

	public abstract String mostrarInformacion();
	public abstract String tipoMaterial();
	public abstract double calcularPrecio6Meses();
	public abstract String mostrarPrecioContado();
}                                     
