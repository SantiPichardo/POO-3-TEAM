public class RetoP4 {
    public static void main(String[] args) {
        Mensajes controlador = new Mensajes();

        float[] Datos= new float[6];
        for (byte i=0; i<6; i++)
            Datos[i]= Float.parseFloat(args[i]);

        Punto a= new Punto(Datos[0], Datos[1]);
        Punto b= new Punto(Datos[2], Datos[3]);
        Punto c= new Punto(Datos[4], Datos[5]);

        Ventana ventana = new Ventana(controlador,a,b,c);
        ventana.setVisible(true);
    }
}