package mx.unam.poo.py2;

public abstract class Empleado{
    private final String nombre;
    private final String apellidoPaterno;
    private final String numeroSeguro;

    public Empleado(String nombre, String apellidoPaterno, String numeroSeguro) {
        this.nombre = nombre;
        this.apellidoPaterno = apellidoPaterno;
        this.numeroSeguro = numeroSeguro;
    }

    public abstract double ingresos(); 

    @Override
    public String toString(){
        return String.format("%s %s\nnumero de seguro social: %s", nombre, apellidoPaterno, numeroSeguro);
    }
}

