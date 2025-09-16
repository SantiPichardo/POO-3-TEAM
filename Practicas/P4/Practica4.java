public class Practica4 {
    public static void main(String[] args) {
        Mensajes controlador = new Mensajes();

        float[] Datos= new float[4];
        for (byte i=0; i<4; i++)
            Datos[i]= Float.parseFloat(args[i]);

        Punto a= new Punto(Datos[0], Datos[1]);
        Punto b= new Punto();
		b.x=Datos[2];
		b.y=Datos[3];

        Ventana ventana = new Ventana(controlador,a,b);
        ventana.setVisible(true);
    }
}

