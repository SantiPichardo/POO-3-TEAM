public class TrianguloEq {
	public static void main(String[] args) {
		Mensajes controlador = new Mensajes();

		if(args.length==6) {
			float[] Datos= new float[6];

			for (byte i=0; i<args.length ;i++)
				Datos[i]= Float.parseFloat(args[i]);

			Punto a= new Punto(Datos[0], Datos[1]);

			Punto b= new Punto(Datos[2], Datos[3]);

			Punto c= new Punto(Datos[4], Datos[5]);

			Ventana ventana = new Ventana(controlador,a,b,c);
			ventana.setVisible(true);
		}
		else
			System.out.println("Porfavor ingresa el número correcto de argumentos a la hora de correr de la siguiente forma:\njava Practica4 ax ay bx by cx cy");

	}
}
