import java.util.Scanner;

public class Proyecto {
    public static void main(String[] args) {
        
        Libreria Libreria1= new Libreria();
        
        String autor="Franz_Herbert",titulo="Dune";
        Libreria1.agregarLibro(titulo,autor);
        int opcion;
        Scanner user= new Scanner (System.in);
        do
        {
            System.out.println("Elige una opción");
            System.out.println("1.- Imprimir Libreria");
            System.out.println("2.- Agregar Libro");
            System.out.println("3.- Eliminar un libro específico");
            System.out.println("4.- Salir");
            System.out.print(">");
            opcion=user.nextInt();
            switch(opcion)
            {
                case 1:
                    Libreria1.printInventario();
                break;

                case 2:
                    System.out.println("Introduce el titulo (Si es más de 1 palabra separalas con guión bajo _ )");
                    System.out.print(">");
                    titulo=user.next();
                    System.out.println("Introduce el autor (Si es más de 1 palabra separalas con guión bajo _ )");
                    System.out.print(">");
                    autor=user.next();
                    Libreria1.agregarLibro(titulo,autor);
                    
                break;
                case 3:
                    System.out.println("Introduce el titulo (Si es más de 1 palabra separalas con guión bajo _ )");
                    System.out.print(">");
                    titulo=user.next();
                    System.out.println("Introduce el autor (Si es más de 1 palabra separalas con guión bajo _ )");
                    System.out.print(">");
                    autor=user.next();
                    System.out.println("Se eliminará de la librería el libro: \n"+titulo+" ("+autor+").");
                    Libreria1.quitarLibro(titulo,autor);
                break;

                case 4:
                    System.out.println("Se cierra la librería");
                    System.exit(1);
                break;

            }

        }while(opcion!=4);

    }
}

