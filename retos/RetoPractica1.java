import java.util.Scanner;
public class RetoPractica1{

    public static void main(String[] args)
    {
        int opcion;
        int dato;
        Scanner user= new Scanner(System.in);
        do
        {
            System.out.println("Elige una opción");
            System.out.println("1.- Fibonacci");
            System.out.println("2.- Factorial");
            System.out.println("3.- Collatz");
            System.out.println("4.- Salir");
            System.out.print(">");
            opcion=user.nextInt();
            switch(opcion)
            {
                case 1:
                    System.out.println("Introduce la posición que deseas en número");
                    System.out.print(">");
                    dato=user.nextInt();
                    System.out.println("El número "+ dato + " de fibonacci es "+ fibonacci(dato));
                break;

                case 2:
                    System.out.println("Introduce el número que quieres calcular su factorial");
                    System.out.print(">");
                    dato=user.nextInt(); 
                    System.out.println("El factorial de "+dato+ " es "+ factorial(dato));
                break;
                case 3:
                    System.out.println("Introduce el número para la conjetura de Collatz");
                    System.out.print(">");
                    dato=user.nextInt();
                    System.out.println("La conjetura de Collatz con "+dato+" llega a "+ collatz(dato));
                break;

                case 4:
                    System.out.println("Saliendo");
                    System.exit(1);
                break;

            }

        }while(opcion!=4);
    
    }
    public static double fibonacci(int n)
    {
        return n==0?0:(n==1?1:fibonacci(n-1)+fibonacci(n-2));
    }

    public static int factorial(int n)
    {
        return n==1?1:n*factorial(n-1);
    }

    public static int collatz(int n)
    {   
        return n==1?1:(n%2==0?collatz(n/2):collatz(3*n+1));
    }
}
