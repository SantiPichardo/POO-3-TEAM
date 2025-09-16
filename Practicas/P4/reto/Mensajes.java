
public class Mensajes {
    public String mensaje(Punto a, Punto b, Punto c) {
        double Distancia_ab= Math.sqrt((b.x-a.x)*(b.x-a.x)+ (b.y-a.y)*(b.y-a.y));
        double Distancia_ac= Math.hypot(c.x-a.x, c.y-a.y);
        double Distancia_bc= Math.hypot(c.x-b.x, c.y-b.y);

        double valor1=Math.round((Distancia_ab*Distancia_bc)*(Distancia_ab*Distancia_bc));
        double valor2=Math.round((Distancia_ab*Distancia_ac)*(Distancia_ab*Distancia_ac));

        if(valor1==valor2)
        return "Vertice a=" + a + "\nVertice b=" + b + "\nVertice c=" + c + "\nLa Distancia entre el Vertice a y el Vertice b es:"+Distancia_ab+"\nLa Distancia entre el Vertice a y el Vertice c es:"+Distancia_ac+"\nLa Distancia entre el Vertice b y el Vertice c es:"+Distancia_bc+"\n\nComo las distancias son iguales es un triangulo equilatero";
        else
                return "Vertice a=" + a + "\nVertice b=" + b + "\nVertice c=" + c + "\nLa Distancia entre el Vertice a y el Vertice b es:"+Distancia_ab+"\nLa Distancia entre el Vertice a y el Vertice c es:"+Distancia_ac+"\nLa Distancia entre el Vertice b y el Vertice c es:"+Distancia_bc+"\n\nComo las distancias son diferentes NO es un triangulo equilatero";
    }   
}
