package mx.unam.fi.poo.p78;
import java.awt.Dimension;
import java.awt.Graphics2D;

public class Circulo extends Figura{
    private double radio;
    private static final double PI = Math.PI;

    public Circulo(double radio) {
        setRadio(radio);
    }

    @Override 
    public double area()
    {
        return PI*radio*radio;
    }

    @Override
    public double perimetro()
    {
        return 2*PI*radio;
    }

    public double getRadio() {
        return radio;
    }
    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public void dibujar(Graphics2D g, Dimension size) {
        double margen = 20;
        double maxDiametroPanel = Math.min(size.width, size.height) - 2 * margen;
        double diametroFigura = 2 * Math.max(getRadio(), 1.0);
        double escala = maxDiametroPanel / diametroFigura;

        int d = (int) Math.round(2 * getRadio() * escala);
        int x = (size.width - d) / 2;
        int y = (size.height - d) / 2;
        g.drawOval(x, y, d, d);
    }
}