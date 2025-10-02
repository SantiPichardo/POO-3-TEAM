import javax.swing.JLabel;
import javax.swing.JButton;
import java.util.ArrayList;

class EvaluacionOperaciones {
	private ArrayList<Double> operandos;
	private ArrayList<String> operaciones;

	EvaluacionOperaciones() {
		operandos = new ArrayList<Double>();
		operaciones = new ArrayList<String>();
	}

	private void parseElementos(String entrada) {
		for(String elemento : entrada.split(" ")) {
			if(esNumero(elemento))
				this.operandos.add(Double.parseDouble(elemento));
			else
				this.operaciones.add(elemento);
		}
	}
	private boolean esNumero(String s) {
		for(int i = 0; i < s.length(); i++)
			if((s.codePointAt(i) < 48 || s.codePointAt(i) > 57) && s.codePointAt(i) != 46)
				return false;
		return true;
	}

	public double procesar(String entrada) {
		parseElementos(entrada);

		Object[] operaciones = this.operaciones.toArray();
		Object[] operandos = this.operandos.toArray();

		for(int i = 0; i < operaciones.length; i++)
			switch((String)operaciones[i]) {
				case "*":
					operandos[i+1] = Double.valueOf(((Double)operandos[i]).doubleValue() * ((Double)operandos[i+1]).doubleValue());
					operandos[i] = Double.valueOf(0);
					break;
				case "/":
					operandos[i+1] = Double.valueOf(((Double)operandos[i]).doubleValue() / ((Double)operandos[i+1]).doubleValue());
					operandos[i] = Double.valueOf(0);
					break;
				case "-":
					operandos[i+1] = Double.valueOf(((Double)operandos[i+1]).doubleValue()*(-1));
				default:
					break;
			}

		double resultado = 0;

		if(operaciones.length > 0)
			for(Object operando : operandos)
				resultado += ((Double)operando).doubleValue();

		return resultado;
	}
	public void clear() { operandos.clear(); operaciones.clear(); }

}

public class ControladorInterfazCalculadora {
	private EvaluacionOperaciones evaluacion;
	private ArrayList<JButton> botones;
	private JLabel entrada, salida;

	private void ordenControlesConveniente() {
		for(int i = 3; i < botones.size(); --i, i+=4) { 
			botones.add(botones.size()-2, botones.get(i));
			botones.remove(i);
		}
	}

	public void iniciarInterfaz() {
		VistaInterfazCalculadora interfaz = new VistaInterfazCalculadora();

		evaluacion = new EvaluacionOperaciones();

		botones = interfaz.getButtons(); ordenControlesConveniente();
		entrada = interfaz.getLabelEntrada(); salida = interfaz.getLabelSalida();

		int numBotones = botones.size();

		for(int i = 1; i < numBotones-6; i++) {
			final JButton button = botones.get(i);
			button.addActionListener(e -> {
				entrada.setText(entrada.getText() + button.getText());
			});
		}
		for(int i = numBotones-6; i < numBotones-2; i++) {
			final JButton button = botones.get(i);
			button.addActionListener(e -> {
				entrada.setText(entrada.getText() + " " + button.getText() + " ");
			});
		}

		botones.getFirst().addActionListener(e -> { entrada.setText(""); salida.setText(""); });
		botones.get(numBotones-2).addActionListener(e -> {
			StringBuilder reduccion = new StringBuilder(entrada.getText());
			entrada.setText(reduccion.deleteCharAt(reduccion.length()-1).toString());
		});
		botones.getLast().addActionListener(e -> {
			evaluacion.clear();
			salida.setText("= " + Double.toString(evaluacion.procesar(entrada.getText())));
		});

	}
}
