package mx.unam.fi.Proyecto;

public class Articulo 
{
   private String nombre;
   private double precio;

    public Articulo(String nombre, double precio) 
    {
        setNombre(nombre);
        setPrecio(precio);
    }

    public void setNombre(String nombre)
    {
        this.nombre=nombre;
    }
    
    public String getNombre()
    {
        return nombre;
    }

    public void setPrecio(double precio)
    {
        this.precio=precio;
    }
    public double getPrecio()
    {
        return precio;
    }

    public String toItemString() 
    {
        long cents = Math.round(precio * 100);
        String entero = String.valueOf(cents/100);
        int dec = (int)(cents % 100);
        String decStr = dec < 10 ? ("0" + dec) : String.valueOf(dec);
        return nombre + " - $" + entero + "." + decStr;
    }
}
