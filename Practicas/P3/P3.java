import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

public class P3 {

    public static void main(String[] args) {
        // Opcional: mal uso de argumentos en la entrada indicar uso correcto
        if (args.length == 0) //usamos length para conocer el número de argumentos que mandamos en el main.
        {
            System.out.println("Uso correcto: java Borrador argumento_1 argumento_2 argumento_n");
            return;
        }

        // Definir objeto ArrayList
        //Definimos el ArrayList pra que almacene los argumentos que introducimos desde el main
        ArrayList<String> argumentosList = new ArrayList<>();
        // Definir objeto HashMap
        //Definimos el hashmap para que tenga dos objetos string, uno la clave generada por la función digestiva y la original
        HashMap<String, String> hashMap = new HashMap<>();

        // Recorrido sobre ArrayList para agregar las entradas
        for (String arg : args) //Usamos ciclo For each de java, donde recorrerá el objeto args con el objeto arg
        {
            argumentosList.add(arg);
        }

        // Recorrer el ArrayList para procesar cada argumento, con un ciclo For each.
        for (String argumentoOriginal : argumentosList) 
        {
            // Mandamos las entradas a la función digestiva y nos devuelve un hash.
            String hashGenerado = generaHash(argumentoOriginal);
            
            // Mandamos al HashMap las entradas donde las llaves van asociadas a cada entrada
            // La clave es el hash generado y el valor es el texto original
            hashMap.put(hashGenerado, argumentoOriginal);
        }

        // Presentamos resultados con base en el HashMap
        System.out.println("       Resultados del HashMap:       ");
        System.out.println("=======================================");
        for (String clave : hashMap.keySet()) //Usamos un ciclo for each donde recorremos el Hashmap, la clave es generada por la función digestiva
        {
            System.out.println("Hash: " + clave + " -> Texto original: " + hashMap.get(clave));//Usamos la función get para que nos dé el valor del hashmap
        }
    }
        //Esta parte es código del profe.
    public static String generaHash(String texto) {
        // Variable para crear semilla a partir de la suma de los caracteres
        int semilla = 0;
        for (char c : texto.toCharArray()) {
            semilla += c;
        }

        Random random = new Random(semilla);

        //Para generar 32 caracteres hexadecimales (investigar a quien se parece)
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 32; i++) {
            int valor = random.nextInt(16); //0 - 15
            sb.append(Integer.toHexString(valor));
        }

        return sb.toString();
    }
}
