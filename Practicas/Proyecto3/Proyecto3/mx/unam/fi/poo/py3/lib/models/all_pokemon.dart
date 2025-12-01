import 'pokemon.dart';
import 'dart:math';
import 'type_effectiveness.dart';

List<Pokemon> getAllPokemon() {
  return [
    TipoNormal.snorlax, TipoNormal.eevee,
    TipoFuego.charmander, TipoFuego.charizard,
    TipoAgua.squirtle, TipoAgua.blastoise,
    TipoPlanta.bulbasaur, TipoPlanta.venusaur,
    TipoElectrico.pikachu, TipoElectrico.raichu,
    TipoLucha.machop, TipoLucha.machamp,
    TipoVolador.pidgey, TipoVolador.pidgeot,
    TipoVeneno.ekans, TipoVeneno.arbok,
    TipoTierra.diglett, TipoTierra.dugtrio,
    TipoRoca.geodude, TipoRoca.golem,
    TipoPsiquico.abra, TipoPsiquico.alakazam,
    TipoHielo.swinub, TipoHielo.mamoswine,
    TipoBicho.caterpie, TipoBicho.scizor,
    TipoFantasma.gastly, TipoFantasma.gengar,
    TipoAcero.magnemite, TipoAcero.metagross,
    TipoDragon.dratini, TipoDragon.dragonite,
    TipoSiniestro.houndour, TipoSiniestro.umbreon,
  ];
}

Pokemon pickRandomEnemy(List<Pokemon> all, Pokemon player) {
  final rand = Random();
  Pokemon enemy;
  int intentos = 0;

  while (intentos < 50) {
    enemy = all[rand.nextInt(all.length)];

    // Evitar mismo Pokémon
    if (enemy.nombre == player.nombre) {
      intentos++;
      continue;
    }

    // Verificar que pueden hacerse daño mutuamente
    final multJugadorARival = TypeEffectiveness.get(player.tipoAtaque, enemy.tipo);
    final multRivalAJugador = TypeEffectiveness.get(enemy.tipoAtaque, player.tipo);

    // Ambos deben poder hacer al menos algo de daño
    if (multJugadorARival > 0 && multRivalAJugador > 0) {
      return enemy;
    }

    intentos++;
  }

  // devolver cualquier Pokémon diferente
  while (true) {
    enemy = all[rand.nextInt(all.length)];
    if (enemy.nombre != player.nombre) return enemy;
  }
}