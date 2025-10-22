package mx.unam.fi.poo.py2;

public abstract class Empleado {
	private  String nombre, apellidoPaterno;
	private int nss;

	public Empleado(String n, String ap, int s) {
		this.nombre = n; this.apellidoPaterno = ap;
		this.nss = s;
	}
public String getNombre() {
        return nombre;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public String getNumeroSeguroSocial() {
        return nss;
    }
	public abstract double ingresos();

    public String toString() {
        return getNombre() + " " + getApellidoPaterno() +
               "\nNúmero de seguro social: " + getNumeroSeguroSocial();
    }
}
