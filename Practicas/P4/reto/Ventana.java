import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
    JButton boton;
    Mensajes controlador;
    Punto punto1, punto2, punto3;
    public Ventana(Mensajes controlador, Punto a, Punto b,Punto c) {
        this.controlador = controlador;
        this.punto1=a;
        this.punto2=b;
        this.punto3=c;
        
        setTitle("Comprobar si un trianguo es equilatero por la distancia de sus vertices");
        setSize(400, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        boton = new JButton("Haz clic aquí para ver el resultado");
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String mensaje = controlador.mensaje(punto1, punto2, punto3);
                JOptionPane.showMessageDialog(null, mensaje);
            }
        });

        add(boton);
    }
}
