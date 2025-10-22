package mx.unam.poo.py2;

public class EmpleadoAsalariado extends Empleado {

    private double salarioSemanal;


    public EmpleadoAsalariado(String nombre, String apellidoPaterno, String numeroSeguroSocial, double salarioSemanal) {
        super(nombre, apellidoPaterno, numeroSeguroSocial);
        setSalarioSemanal(salarioSemanal);
    }

    public void setSalarioSemanal(double salario) {
        if (salario < 0.0) {
            System.out.println("El salario semanal no puede ser negativo. Se asignará 0.0");
            this.salarioSemanal = 0.0;
        } else {
            this.salarioSemanal = salario;
        }
    }

    public double getSalarioSemanal() {
        return salarioSemanal;
    }

    @Override
    public double ingresos() {
        return getSalarioSemanal();
    }


    @Override
    public String toString() {
        return "--- Empleado Asalariado ---" +
               "\n" + super.toString() +
               "\nSalario semanal: $" + getSalarioSemanal();
    }

}
