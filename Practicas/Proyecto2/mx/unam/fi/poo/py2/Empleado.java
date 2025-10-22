package mx.unam.fi.poo.py2;

public abstract class Empleado {
	private final String nombre, apellidoP;
	private final int nss;

	public Empleado(String n, String ap, int s) {
		this.nombre = n; this.apellidoP = ap;
		this.nss = s;
	}

	public abstract double ingresos();
	public abstract String toString();
}
