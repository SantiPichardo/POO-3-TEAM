public class Mensajes {
    public String mensaje(Punto a, Punto b) {
        double Distancia= Math.hypot(b.x-a.x, b.y-a.y);
        return "Punto a=("+a.x+","+a.y+")\nPunto b=("+b.x+","+b.y+")\nLa Distancia entre el punto a y el punto b es:"+Distancia;
    }   
}