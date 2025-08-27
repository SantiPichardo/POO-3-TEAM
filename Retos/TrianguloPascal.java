import java.util.Scanner;

public class TrianguloPascal {
	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		String formato, formatoS;
		byte nivel = 0;

		System.out.print("Ingrese numero para nivel de triangulo de Pascal\n> ");
		nivel = input.nextByte();

		/* elegir el formato de despliegue de los números y espacios
		 * para que el triángulo tenga la forma correcta
		 */
		if(nivel < 21) {
			if(nivel < 17) {
				if(nivel < 14) {
					if(nivel < 10) {
						if(nivel < 6) {
							formato = "%1d%1s";
							formatoS = "%1s";
						} else {
							formato = "%2d%2s";
							formatoS = "%2s";
						}
					} else {
						formato = "%3d%3s";
						formatoS = "%3s";
					}
				} else {
					formato = "%4d%4s";
					formatoS = "%4s";
				}
			} else {
				formato = "%5d%5s";
				formatoS = "%5s";
			}
		} else {
			formato = "%6d%6s";
			formatoS = "%6s";
		}

		for(long i = 0; i < nivel; i++) {
			// se imprimen espacios para centrar los renglones con menos números
			for(long e = nivel; e > i; e--)
				System.out.format(formatoS, " ");

			for(long j = 0; j <= i; j++)
				//calcular los números del triángulo
				System.out.format(formato, coeficienteBinomial(i, j), " ");
			System.out.println();
		}
	}

	private static long coeficienteBinomial(long n, long k) { return factorial(n)/(factorial(k)*factorial(n-k)); }
	private static long factorial(long n) { return n == 0 ? 1 : n*factorial(n-1); }
}
