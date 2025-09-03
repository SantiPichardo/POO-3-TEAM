public class FormulaGeneral {
	public static void main(String[] args) {
		if(args.length == 3) {
			// arreglo para almacenar valores de los argumentos proporcionados
			double[] coeficientes = new double[3];

			// convertir tipo de argumentos de String a double
			for(byte i = 0; i < 3; i++)
				coeficientes[i] = Double.parseDouble(args[i]);

			// obtener raices
			double[] raices = { encontrarRaiz(true, coeficientes[0], coeficientes[1], coeficientes[2]),
				encontrarRaiz(false, coeficientes[0], coeficientes[1], coeficientes[2]) };

			System.out.println("Raices del trinomio con coeficientes proporcionados:\n" + raices[0] + " " + raices[1]);
		} else
			System.out.println("\nNumero incorrecto de argumentos; se requiere 3\n(ej. java FormulaGeneral.java 1 3 2)\n");
	}

	// metodo que realiza las operaciones de la formula general
	private static double encontrarRaiz(boolean signo, double a, double b, double c) {
		double discriminante = Math.sqrt((b*b) - (4*a*c));

		return ((-b + (signo? discriminante:-discriminante))/(2*a));
	}
}
