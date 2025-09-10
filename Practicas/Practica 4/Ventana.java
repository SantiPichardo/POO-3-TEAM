import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
    JButton boton;
    Mensajes controlador;
    Punto puntoA, puntoB;
    public Ventana(Mensajes controlador, Punto a, Punto b) {
        this.controlador = controlador;
        this.puntoA=a;
        this.puntoB=b;
        setTitle("Distancia entre 2 puntos");
        setSize(300, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        boton = new JButton("Haz clic aqui");
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String mensaje = controlador.mensaje(puntoA, puntoB);
                JOptionPane.showMessageDialog(null, mensaje);
            }
        });

        add(boton);
    }
}
