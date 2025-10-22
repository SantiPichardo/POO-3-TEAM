package mx.unam.poo.py2;

public class EmpleadoPorHoras extends Empleado {
    private double salario;
    private int horas;

    public EmpleadoPorHoras(String nombre, String apellidoPaterno, String numeroSeguroSocial, int horas, double salario) {
        super(nombre, apellidoPaterno, numeroSeguroSocial);
        
        setHoras(horas);
        setSalario(salario);
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        if (salario < 0) {
            System.out.println("No se puede asignar un salario negativo");
        } else {
            this.salario = salario;
        }
    }

    public int getHoras() {
        return horas;
    }

    public void setHoras(int horas) {
        if (horas < 0) {
            System.out.println("No se puede asignar menos de 0 horas");
        } else if (horas > 180) {
            System.out.println("No se puede asignar más de 180 horas");
        } else {
            this.horas = horas;
        }
    }

    @Override
    public double ingresos() {
        double salarioBase = 0;
        double horasExtras = 0;
        
        if (horas <= 40) {
            salarioBase = horas * salario;
        } else {
            salarioBase = 40 * salario;
            horasExtras = (horas - 40) * salario * 1.5;
        }
        
        return salarioBase + horasExtras;
    }

    @Override
    public String toString() {
        return "--- Empleado Por Horas ---" +
               "\n" + super.toString() +
               "\nSalario por hora: $" + salario +
               "\nHoras trabajadas: " + horas +
               "\nIngresos totales: $" + ingresos();
    }

}
