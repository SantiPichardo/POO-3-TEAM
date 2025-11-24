abstract class Pokemon {
  String _nombre;
  int _ataque;
  int _defensa;
  int _velocidad;
  int _hp;
  String _tipo;
  String _debilidad;
  String _nombreAtaque;
  String _tipoAtaque;

  Pokemon({
    String nombre = "",
    int hp = 1,
    int ataque = 1,
    int defensa = 1,
    int velocidad = 1,
    String tipo = "",
    String debilidad = "",
    String nombreAtaque = "",
    String tipoAtaque = "",
  })  : _nombre = nombre,
        _hp = hp,
        _ataque = ataque,
        _defensa = defensa,
        _velocidad = velocidad,
        _tipo = tipo,
        _debilidad = debilidad,
        _nombreAtaque = nombreAtaque,
        _tipoAtaque = tipoAtaque;

  // getters
  String get nombre => _nombre;
  int get hp => _hp;
  int get ataque => _ataque;
  int get defensa => _defensa;
  int get velocidad => _velocidad;
  String get tipo => _tipo;
  String get debilidad => _debilidad;
  String get nombreAtaque => _nombreAtaque;
  String get tipoAtaque => _tipoAtaque;

  // setters
  set nombre(String nuevoNombre) {
    if (nuevoNombre.isEmpty) throw Exception("El nombre no puede estar vacío");
    _nombre = nuevoNombre;
  }
  set hp(int nuevoHp) {
    if ( nuevoHp < 1 ||  nuevoHp > 999) throw Exception("HP debe estar entre 1 y 999");
    _hp = nuevoHp;
  }
  set ataque(int nuevoAtaque) {
    if (nuevoAtaque < 1 || nuevoAtaque > 255) throw Exception("Ataque debe estar entre 1 y 255");
    _ataque = nuevoAtaque;
  }
  set defensa(int nuevaDefensa) {
    if (nuevaDefensa < 1 || nuevaDefensa > 255) throw Exception("Defensa debe estar entre 1 y 255");
    _defensa = nuevaDefensa;
  }
  set velocidad(int nuevaVelocidad) {
    if (nuevaVelocidad < 1 || nuevaVelocidad > 255) throw Exception("Velocidad debe estar entre 1 y 255");
    _velocidad = nuevaVelocidad;
  }
  set tipo(String nuevoTipo) {
    if (nuevoTipo.isEmpty) throw Exception("El tipo no puede estar vacío");
    _tipo = nuevoTipo;
  }
  set debilidad(String nuevaDebilidad) {
    if (nuevaDebilidad.isEmpty) throw Exception("La debilidad no puede estar vacía");
    _debilidad = nuevaDebilidad;
  }
  set nombreAtaque(String nuevoNAtaque) {
    if (nuevoNAtaque.isEmpty) throw Exception("El nombre del ataque no puede estar vacío");
    _nombreAtaque = nuevoNAtaque;
  }
  set tipoAtaque(String nuevoTAtaque) {
    if (nuevoTAtaque.isEmpty) throw Exception("El tipo del ataque no puede estar vacío");
    _tipoAtaque = nuevoTAtaque;
  }

  void mostrarInformacion() {
    print("$nombre ($tipo) | HP: $hp | Atk: $ataque | Def: $defensa | Vel: $velocidad | Ataque: $nombreAtaque");
  }
}

//18 tipos de pokemon

class TipoNormal extends Pokemon {
  TipoNormal(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Normal", debilidad: "Lucha", nombreAtaque: atk, tipoAtaque: "Normal");
  static final snorlax = TipoNormal("Snorlax", 160, 110, 65, 30, "Golpe Cuerpo");
  static final eevee = TipoNormal("Eevee",   55,  55, 50, 55, "Derribo");
}

class TipoFuego extends Pokemon {
  TipoFuego(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Fuego", debilidad: "Agua", nombreAtaque: atk, tipoAtaque: "Fuego");
  static final charmander = TipoFuego("Charmander", 39, 52, 43, 65, "Ascuas");
  static final charizard = TipoFuego("Charizard",  78, 104, 78, 100, "Lanzallamas");
}

class TipoAgua extends Pokemon {
  TipoAgua(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Agua", debilidad: "Eléctrico", nombreAtaque: atk, tipoAtaque: "Agua");
  static final squirtle = TipoAgua("Squirtle",  44, 48, 65, 43, "Pistola Agua");
  static final blastoise = TipoAgua("Blastoise", 79, 83, 100, 78, "Hidrobomba");
}

class TipoPlanta extends Pokemon {
  TipoPlanta(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Planta", debilidad: "Fuego", nombreAtaque: atk, tipoAtaque: "Planta");
  static final bulbasaur = TipoPlanta("Bulbasaur", 45, 49, 49, 45, "Látigo Cepa");
  static final venusaur = TipoPlanta("Venusaur",  80, 82, 83, 80, "Rayo Solar");
}

class TipoElectrico extends Pokemon {
  TipoElectrico(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Eléctrico", debilidad: "Tierra", nombreAtaque: atk, tipoAtaque: "Eléctrico");
  static final pikachu = TipoElectrico("Pikachu", 35, 55, 40, 90, "Impactrueno");
  static final raichu = TipoElectrico("Raichu",  60, 90, 55, 110, "Trueno");
}

class TipoLucha extends Pokemon {
  TipoLucha(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Lucha", debilidad: "Volador", nombreAtaque: atk, tipoAtaque: "Lucha");
  static final machop = TipoLucha("Machop",  70, 80, 50, 35, "Golpe Karate");
  static final machamp = TipoLucha("Machamp", 90, 130, 80, 55, "Puño Dinámico");
}

class TipoVolador extends Pokemon {
  TipoVolador(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Volador", debilidad: "Eléctrico", nombreAtaque: atk, tipoAtaque: "Volador");
  static final pidgey = TipoVolador("Pidgey",  40, 45, 40, 56, "Tornado");
  static final pidgeot = TipoVolador("Pidgeot", 83, 80, 75, 101, "Huracán");
}

class TipoVeneno extends Pokemon {
  TipoVeneno(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Veneno", debilidad: "Psíquico", nombreAtaque: atk, tipoAtaque: "Veneno");
  static final ekans = TipoVeneno("Ekans", 35, 60, 44, 55, "Colmillo Veneno");
  static final arbok = TipoVeneno("Arbok", 60, 95, 69, 80, "Ácido");
}

class TipoTierra extends Pokemon {
  TipoTierra(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Tierra", debilidad: "Agua", nombreAtaque: atk, tipoAtaque: "Tierra");
  static final diglett = TipoTierra("Diglett", 10, 55, 25, 95, "Terremoto");
  static final dugtrio = TipoTierra("Dugtrio", 35, 100, 50, 120, "Excavar");
}

class TipoRoca extends Pokemon {
  TipoRoca(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Roca", debilidad: "Agua", nombreAtaque: atk, tipoAtaque: "Roca");
  static final geodude = TipoRoca("Geodude", 40, 80, 100, 20, "Lanzarrocas");
  static final golem = TipoRoca("Golem",   80, 120, 130, 45, "Avalancha");
}

class TipoPsiquico extends Pokemon {
  TipoPsiquico(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Psíquico", debilidad: "Bicho", nombreAtaque: atk, tipoAtaque: "Psíquico");
  static final abra = TipoPsiquico("Abra",     25, 20, 15, 90, "Teletransporte");
  static final alakazam = TipoPsiquico("Alakazam", 55, 50, 45, 120, "Psíquico");
}

class TipoHielo extends Pokemon {
  TipoHielo(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Hielo", debilidad: "Fuego", nombreAtaque: atk, tipoAtaque: "Hielo");
  static final swinub= TipoHielo("Swinub",    50, 50, 40, 50, "Rayo Hielo");
  static final mamoswine = TipoHielo("Mamoswine", 110, 130, 80, 80, "Ventisca");
}

class TipoBicho extends Pokemon {
  TipoBicho(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Bicho", debilidad: "Fuego", nombreAtaque: atk, tipoAtaque: "Bicho");
  static final caterpie = TipoBicho("Caterpie", 45, 30, 35, 45, "Disp. Demora");
  static final scizor = TipoBicho("Scizor",   70, 130, 100, 65, "Punto Bala");
}

class TipoFantasma extends Pokemon {
  TipoFantasma(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Fantasma", debilidad: "Fantasma", nombreAtaque: atk, tipoAtaque: "Fantasma");
  static final gastly = TipoFantasma("Gastly", 30, 35, 30, 80, "Lengüetazo");
  static final gengar = TipoFantasma("Gengar", 60, 65, 60, 110, "Bola Sombra");
}

class TipoAcero extends Pokemon {
  TipoAcero(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Acero", debilidad: "Fuego", nombreAtaque: atk, tipoAtaque: "Acero");
  static final magnemite = TipoAcero("Magnemite", 25, 35, 70, 45, "Impactrueno");
  static final metagross = TipoAcero("Metagross", 80, 135, 130, 70, "Cometa");
}

class TipoDragon extends Pokemon {
  TipoDragon(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Dragón", debilidad: "Hada", nombreAtaque: atk, tipoAtaque: "Dragón");
  static final dratini = TipoDragon("Dratini",   41, 64, 45, 50, "Garra Dragón");
  static final dragonite = TipoDragon("Dragonite", 91, 134, 95, 80, "Enfado");
}

class TipoSiniestro extends Pokemon {
  TipoSiniestro(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Siniestro", debilidad: "Hada", nombreAtaque: atk, tipoAtaque: "Siniestro");
  static final houndour = TipoSiniestro("Houndour", 45, 60, 30, 65, "Mordisco");
  static final umbreon = TipoSiniestro("Umbreon",  95, 65, 110, 65, "Pulso Umbrío");
}

class TipoHada extends Pokemon {
  TipoHada(String n, int h, int a, int d, int v, String atk)
      : super(nombre: n, hp: h, ataque: a, defensa: d, velocidad: v, tipo: "Hada", debilidad: "Veneno", nombreAtaque: atk, tipoAtaque: "Hada");
	  static final togepi = TipoHada("Togepi",    35, 20, 65, 20, "Encanto");
  static final gardevoir = TipoHada("Gardevoir", 68, 125, 65, 80, "Brillo Mágico");
}

//prueba
void main() {

  Pokemon p1 = TipoFuego.charmander;
  Pokemon p2 = TipoFuego.charizard;
  Pokemon p3 = TipoAgua.blastoise;
  Pokemon p4 = TipoElectrico.pikachu;
  Pokemon p5 = TipoDragon.dragonite;
  Pokemon p6 = TipoHada.gardevoir;

  List<Pokemon> equipo = [p1, p2, p3, p4, p5, p6];
  for (var p in equipo) {
    p.mostrarInformacion();
  }
  
}
