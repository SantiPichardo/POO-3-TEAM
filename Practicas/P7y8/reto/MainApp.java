public class MainApp {
    public static void main(String[] args) {
        Material[] miMaterial = new Material[3];


        miMaterial[0] = new Libro("Ensayo sobre la ceguera", "José Saramago", 1995, "Novela", 25.99);
        miMaterial[1] = new Revista("Nexos", "Hector Aguilar", 2023, "mensual", 8.50);
        miMaterial[2] = new DVD("Amiga Mía", "Alejandro Sanz", 1997, "4:52", 15.99);

        for (Material material : miMaterial) {
            System.out.println(material.tipoMaterial());
            System.out.println(material.mostrarPrecioContado());
            System.out.printf("Precio a 6 meses: $%.2f%n", material.calcularPrecio6Meses());
            System.out.println(material.mostrarInformacion());
            System.out.println("___________________________________");
        }
    }
}
