import 'pokemon.dart';
import 'dart:math';

class BatallaPokemon {
  final Pokemon pokemon;
  int hpActual;
  String estado = "normal"; // normal, quemado, envenenado, paralizado, congelado

  // Sistema de mochila 
  Map<String, int> mochila = {
    'pocion': 2,
    'antidoto': 2,
  };

  BatallaPokemon(this.pokemon) : hpActual = pokemon.hp;

  String get nombre => pokemon.nombre;
  String get tipo => pokemon.tipo;
  String get tipoAtaque => pokemon.tipoAtaque;
  String get nombreAtaque => pokemon.nombreAtaque;
  int get hpMax => pokemon.hp;
  int get ataque => pokemon.ataque;
  int get defensa => pokemon.defensa;
  int get velocidad => pokemon.velocidad;

  
  String get estadoNombre => switch (estado) {
        "quemado" => "Quemado",
        "envenenado" => "Envenenado",
        "paralizado" => "Paralizado",
        "congelado" => "Congelado",
        _ => "Normal",
      };

  bool get estaDebilitado => hpActual <= 0;

  int get velocidadEfectiva =>
      estado == "paralizado" ? (velocidad ~/ 2) : velocidad;

  bool puedeAtacar() {
    if (estado == "congelado") return false;
    if (estado == "paralizado") return Random().nextDouble() < 0.75;
    return true;
  }

  void recibirDanio(int dano) {
    hpActual = (hpActual - dano).clamp(0, hpMax);
  }

  void curar(int cantidad) {
    hpActual = (hpActual + cantidad).clamp(0, hpMax);
  }

  void curarEstado() {
    estado = "normal";
  }

  void aplicarEfectoEstado() {
    if (estado == "quemado" || estado == "envenenado") {
      recibirDanio((hpMax * 0.0625).floor());
    }
  }

  // MÉTODOS NUEVOS PARA LA MOCHILA
  bool puedeUsarPocion() => mochila['pocion']! > 0 && hpActual < hpMax;
  bool puedeUsarAntidoto() => mochila['antidoto']! > 0 && estado != "normal";
  
  void usarPocion() {
    if (mochila['pocion']! > 0) {
      mochila['pocion'] = mochila['pocion']! - 1;
      curar(40); // Curar menos para batallas más largas
    }
  }
  
  void usarAntidoto() {
    if (mochila['antidoto']! > 0 && estado != "normal") {
      mochila['antidoto'] = mochila['antidoto']! - 1;
      curarEstado();
    }
  }
}