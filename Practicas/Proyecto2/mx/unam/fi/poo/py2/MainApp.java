package mx.unam.fi.poo.py2;
public class MainApp{
    public static void main (String[] args){


        EmpleadoPorHoras empleado1 = new EmpleadoPorHoras("Juan", "Perez", 1256789, 45, 50.0);
        System.out.println(empleado1.toString());
        System.out.println("Ingresos: $" + empleado1.ingresos());

        EmpleadoPorHoras empleado2 = new EmpleadoPorHoras("Ana", "Lopez", 9765321, 38, 60.0);
        System.out.println(empleado2.toString());


    }
}



