public abstract class Material{
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
        if (precioContado < 0) throw new IllegalArgumentException("El precio no puede ser negativo");
        this.precioContado = precioContado;
    }

    public abstract String mostrarInformacion();
    public abstract String tipoMaterial();
    public abstract double calcularPrecio6Meses();
    public abstract String mostrarPrecioContado();
}                                     


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
    public String tipoMaterial(){
        return "Libro";
    }

    @Override
    public double calcularPrecio6Meses() {
        double precio = getPrecioContado() * (1 + INTERES_LIBRO);
        return Math.round(precio * 100.0) / 100.0;
    }

    @Override
    public String mostrarPrecioContado() { 



    public class DVD extends Material {
    private String duracion;
    private static final double INTERES_DVD = 0.20;

    public DVD(String titulo, String autor, int anio, String duracion, double precioContado) {
        super(titulo, autor, anio, precioContado);
        setDuracion(duracion);
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    @Override
    public String mostrarInformacion() {
        return "titulo: " + getTitulo() + "\nAutor: " + getAutor() + "\nAnio: " + getAnio() + "\nDuración: " + getDuracion();
    }

    @Override
    public String tipoMaterial() {
        return "DVD";
    }

    @Override
    public double calcularPrecio6Meses() {
        double precio = getPrecioContado() * (1 + INTERES_DVD);
        return Math.round(precio * 100.0) / 100.0;
    }

    @Override
    public String mostrarPrecioContado() {
        return "Precio de contado: $" + getPrecioContado();
    }
}




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
    public String tipoMaterial(){
        return "Revista";
    }

    @Override
    public double calcularPrecio6Meses() {
        double precio = getPrecioContado() * (1 + INTERES_REVISTA);
        return Math.round(precio * 100.0) / 100.0;
    }
    @Override
    public String mostrarPrecioContado() {
        return "Precio de contado: $" + getPrecioContado();
    }
} 





public class MainApp {
    public static void main(String[] args) {
        Material[] miMaterial = new Material[3];


        miMaterial[0] = new Libro("Ensayo sobre la ceguera", "José Saramago", 1995, "Novela", 25.99);
        miMaterial[1] = new Revista("Nexos", "Hector Aguilar", 2023, "mensual", 8.50);
        miMaterial[2] = new DVD("Amiga Mía", "Alejandro Sanz", 1997, "4:52", 15.99);

        for (Material material : miMaterial) {
            System.out.println(material.tipoMaterial());
            System.out.println(material.mostrarPrecioContado());
            System.out.printf("Precio a 6 meses: $%.2f%n", material.calcularPrecio6Meses());
            System.out.println(material.mostrarInformacion());
            System.out.println("___________________________________");
        }
    }
}
        return "Precio de contado: $" + getPrecioContado();
    }
}
