public class Punto {
    float x = 0, y = 0;
    
    public Punto() {}

    public Punto(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public String toString() {
        return "Punto (x = " + x + ", y = " + y + ")";
    }
}