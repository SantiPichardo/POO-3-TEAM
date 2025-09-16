import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
	public Ventana(Mensajes controlador, Punto a, Punto b,Punto c) {
		JButton boton = new JButton("Haz clic aquí para ver el resultado");

		setTitle("Comprobar si un trianguo es equilatero por la distancia de sus vertices");
		setSize(400, 200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);

		boton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String mensaje = controlador.mensaje(a, b, c);
				JOptionPane.showMessageDialog(null, mensaje);
			}
		});

		add(boton);
	}
}
