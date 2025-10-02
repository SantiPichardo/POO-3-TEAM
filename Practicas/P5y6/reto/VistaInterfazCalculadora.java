import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.border.EmptyBorder;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.BorderLayout;
import java.util.ArrayList;
import java.util.List;

public class VistaInterfazCalculadora extends JFrame {
	private final ArrayList<JButton> buttons = new ArrayList<>(List.of(
				new JButton("AC"), new JButton("0"), new JButton("1"), new JButton("+"),
				new JButton("2"), new JButton("3"), new JButton("4"), new JButton("-"),
				new JButton("5"), new JButton("6"), new JButton("7"), new JButton("*"),
				new JButton("8"), new JButton("9"), new JButton("."), new JButton("/"),
				new JButton("C"), new JButton("=")));
	private JLabel entrada, salida;

	public VistaInterfazCalculadora() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		setVisible(true);
		setLayout(new BorderLayout());
		setTitle("Calculadora");
		setSize(300, 450);

		entrada = new JLabel(); salida = new JLabel();

		JPanel despliegue = new JPanel(new GridLayout(2, 1));
		JPanel botones = new JPanel(new BorderLayout());
		JPanel botonesA = new JPanel(new GridLayout(4, 4));
		JPanel botonesB = new JPanel(new GridLayout(2, 1));

		despliegue.setPreferredSize(new Dimension(300, 125));
		despliegue.setBorder(new EmptyBorder(0, 5, 5, 0));
		botones.setPreferredSize(new Dimension(300, 325));
		botonesA.setPreferredSize(new Dimension(225, 325));
		botonesB.setPreferredSize(new Dimension(75, 325));

		for(int i = 0; i < buttons.size()-2; i++)
			botonesA.add(buttons.get(i));

		botonesB.add(buttons.get(buttons.size()-2));
		botonesB.add(buttons.get(buttons.size()-1));

		despliegue.add(entrada); despliegue.add(salida);
		botones.add(botonesA, BorderLayout.CENTER); botones.add(botonesB, BorderLayout.EAST);
		add(despliegue, BorderLayout.NORTH); add(botones, BorderLayout.CENTER);

		pack();
	}

	protected ArrayList<JButton> getButtons() { return buttons; }
	protected JLabel getLabelEntrada() { return entrada; }
	protected JLabel getLabelSalida() { return salida; }
}
