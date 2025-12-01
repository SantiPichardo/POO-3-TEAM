import 'package:flutter/material.dart';
import '../models/batalla_pokemon.dart';
import '../models/music_controller.dart';
import '../models/type_effectiveness.dart';
import '../models/pokemon.dart';
import 'dart:math';

class BattleScreen extends StatefulWidget {
  final Pokemon playerPoke;
  final Pokemon enemyPoke;
  const BattleScreen({super.key, required this.playerPoke, required this.enemyPoke});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  late BatallaPokemon tuPokemon;
  late BatallaPokemon pokemonRival;

  String log = "";
  bool batallaTerminada = false;
  bool turnoJugador = true;
  bool jugadorPuedeUsarMochila = false;

  final Random _rand = Random();
  final int _basePowerDefault = 25;
  final int _level = 50;

  @override
  void initState() {
    super.initState();
    MusicController.changeMusic();
    tuPokemon = BatallaPokemon(widget.playerPoke);
    pokemonRival = BatallaPokemon(widget.enemyPoke);

    turnoJugador = tuPokemon.velocidadEfectiva >= pokemonRival.velocidadEfectiva;

    log = "TÚ ELEGISTE: ${tuPokemon.nombre.toUpperCase()}\n";
    log += "EL RIVAL ESCOGIÓ: ${pokemonRival.nombre.toUpperCase()}\n\n";
    log += turnoJugador ? "Atacas primero por mayor velocidad.\n" : "El rival ataca primero por mayor velocidad.\n";
    log += "¡COMIENZA LA BATALLA!\n";

    if (!turnoJugador) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (!batallaTerminada && mounted) turnoRival();
      });
    }
  }

  int _calculateDamage({
    required int attackerAtk,
    required int defenderDef,
    required int basePower,
    required double typeMultiplier,
  }) {
    if (typeMultiplier == 0.0) return 0;

    final double factor = ((2 * _level) / 5.0) + 2.0;
    double damage = (factor * basePower * attackerAtk / defenderDef) / 50.0 + 2.0;

    final double randFactor = (85 + _rand.nextInt(16)) / 100.0;
    damage = damage * typeMultiplier * randFactor;

    if (damage < 1.0) return 1;
    return damage.floor();
  }

  void elegirAtaque() {
    if (!turnoJugador || batallaTerminada) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.grey[850],
        title: Text("Ataque de ${tuPokemon.nombre}", style: const TextStyle(color: Colors.cyan)),
        content: ListTile(
          leading: const Icon(Icons.whatshot, color: Colors.orange),
          title: Text(tuPokemon.nombreAtaque, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text("Tipo: ${tuPokemon.tipoAtaque} • Poder: $_basePowerDefault"),
          onTap: () {
            Navigator.pop(context);
            atacarJugador();
          },
        ),
      ),
    );
  }

  void atacarJugador() {
    if (batallaTerminada) return;

    final basePower = _basePowerDefault;
    final mult = TypeEffectiveness.get(tuPokemon.tipoAtaque, pokemonRival.tipo);

    int dano = _calculateDamage(
      attackerAtk: tuPokemon.ataque,
      defenderDef: pokemonRival.defensa,
      basePower: basePower,
      typeMultiplier: mult,
    );

    pokemonRival.recibirDanio(dano);

    log += "\nTÚ → ${tuPokemon.nombre} usó ${tuPokemon.nombreAtaque}!";
    if (mult > 1.0) {
      log += " ¡Es muy efectivo!";
    } else if (mult < 1.0 && mult > 0) {
      log += " No es muy efectivo...";
    } else if (mult == 0) {
      log += " ¡No afecta!";
    }
    log += " ($dano daño)";

    jugadorPuedeUsarMochila = true;

    if (_rand.nextDouble() < 0.15 && mult > 0) {
      switch (tuPokemon.tipoAtaque) {
        case "Fuego":
          if (pokemonRival.estado == "normal") {
            pokemonRival.estado = "quemado";
            log += "\n¡${pokemonRival.nombre} se quemó!";
          }
          break;
        case "Hielo":
          if (pokemonRival.estado == "normal") {
            pokemonRival.estado = "congelado";
            log += "\n¡${pokemonRival.nombre} se congeló!";
          }
          break;
        case "Eléctrico":
          if (pokemonRival.estado == "normal") {
            pokemonRival.estado = "paralizado";
            log += "\n¡${pokemonRival.nombre} está paralizado!";
          }
          break;
        case "Veneno":
          if (pokemonRival.estado == "normal") {
            pokemonRival.estado = "envenenado";
            log += "\n¡${pokemonRival.nombre} está envenenado!";
          }
          break;
      }
    }

    verificarFinBatalla();
    if (!batallaTerminada) {
      turnoJugador = false;
      setState(() {});
      Future.delayed(const Duration(seconds: 1), turnoRival);
    }
  }

  void turnoRival() {
    if (batallaTerminada || !mounted) return;

    final decision = _decidirAccionRival();
    
    switch (decision) {
      case 'atacar':
        ataqueRival();
        break;
      case 'pocion':
        usarPocionRival();
        break;
      case 'antidoto':
        usarAntidotoRival();
        break;
      default:
        ataqueRival();
    }
  }

  String _decidirAccionRival() {
    if (pokemonRival.estado != "normal" && pokemonRival.mochila['antidoto']! > 0) {
      return 'antidoto';
    }
    
    final ratioHP = pokemonRival.hpActual / pokemonRival.hpMax;
    if (ratioHP < 0.4 && pokemonRival.mochila['pocion']! > 0) {
      return 'pocion';
    }
    
    if (pokemonRival.puedeAtacar()) {
      return 'atacar';
    }
    
    return 'atacar';
  }

  void usarPocionRival() {
    if (pokemonRival.mochila['pocion']! > 0) {
      pokemonRival.usarPocion();
      log += "\nRIVAL → ${pokemonRival.nombre} usó Poción! +40 HP";
    }
    
    verificarFinBatalla();
    turnoJugador = true;
    setState(() {});
  }

  void usarAntidotoRival() {
    if (pokemonRival.mochila['antidoto']! > 0 && pokemonRival.estado != "normal") {
      pokemonRival.usarAntidoto();
      log += "\nRIVAL → ${pokemonRival.nombre} usó Antídoto! Estado curado.";
    }
    
    verificarFinBatalla();
    turnoJugador = true;
    setState(() {});
  }

  void ataqueRival() {
    if (batallaTerminada || !mounted) return;

    if (!pokemonRival.puedeAtacar()) {
      log += "\nRIVAL → ${pokemonRival.nombre} no pudo atacar por estado.";
      turnoJugador = true;
      setState(() {});
      return;
    }

    final mult = TypeEffectiveness.get(pokemonRival.tipoAtaque, tuPokemon.tipo);
    final basePower = _basePowerDefault;

    int dano = _calculateDamage(
      attackerAtk: pokemonRival.ataque,
      defenderDef: tuPokemon.defensa,
      basePower: basePower,
      typeMultiplier: mult,
    );

    tuPokemon.recibirDanio(dano);

    log += "\nRIVAL → ${pokemonRival.nombre} usó ${pokemonRival.nombreAtaque}!";
    if (mult > 1.0) {
      log += " ¡Es muy efectivo!";
    } else if (mult < 1.0 && mult > 0) {
      log += " No es muy efectivo...";
    } else if (mult == 0) {
      log += " ¡No afecta!";
    }
    log += " ($dano daño)";

    jugadorPuedeUsarMochila = true;

    if (_rand.nextDouble() < 0.15 && mult > 0) {
      switch (pokemonRival.tipoAtaque) {
        case "Fuego":
          if (tuPokemon.estado == "normal") {
            tuPokemon.estado = "quemado";
            log += "\n¡${tuPokemon.nombre} se quemó!";
          }
          break;
        case "Hielo":
          if (tuPokemon.estado == "normal") {
            tuPokemon.estado = "congelado";
            log += "\n¡${tuPokemon.nombre} se congeló!";
          }
          break;
        case "Eléctrico":
          if (tuPokemon.estado == "normal") {
            tuPokemon.estado = "paralizado";
            log += "\n¡${tuPokemon.nombre} está paralizado!";
          }
          break;
        case "Veneno":
          if (tuPokemon.estado == "normal") {
            tuPokemon.estado = "envenenado";
            log += "\n¡${tuPokemon.nombre} está envenenado!";
          }
          break;
      }
    }

    verificarFinBatalla();
    turnoJugador = true;
    setState(() {});
  }

  void usarPocion() {
    if (!turnoJugador || batallaTerminada || !jugadorPuedeUsarMochila) return;
    if (tuPokemon.puedeUsarPocion()) {
      tuPokemon.usarPocion();
      log += "\n¡Usaste Poción! +40 HP";
      Navigator.pop(context);
      jugadorPuedeUsarMochila = false;
      turnoJugador = false;
      setState(() {});
      Future.delayed(const Duration(seconds: 1), turnoRival);
    }
  }

  void curarEstado() {
    if (!turnoJugador || batallaTerminada || !jugadorPuedeUsarMochila) return;
    if (tuPokemon.puedeUsarAntidoto()) {
      tuPokemon.usarAntidoto();
      log += "\n¡Usaste Antídoto! Estado curado.";
      Navigator.pop(context);
      jugadorPuedeUsarMochila = false;
      turnoJugador = false;
      setState(() {});
      Future.delayed(const Duration(seconds: 1), turnoRival);
    }
  }

  void verificarFinBatalla() {
    tuPokemon.aplicarEfectoEstado();
    pokemonRival.aplicarEfectoEstado();

    if (tuPokemon.estaDebilitado) {
      log += "\n\n¡${tuPokemon.nombre} se debilitó!\n¡PERDISTE!";
      batallaTerminada = true;
    } else if (pokemonRival.estaDebilitado) {
      log += "\n\n¡${pokemonRival.nombre} se debilitó!\n¡GANASTE!";
      batallaTerminada = true;
    }
    setState(() {});
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Column(  
      children: [
        
        Expanded(
          child: SingleChildScrollView(  
            child: Column(
              children: [
                
                Container(
                  height: 200,  
                  color: Colors.red[900]!.withAlpha(77),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text("RIVAL", style: TextStyle(fontSize: 28, color: Colors.redAccent, fontWeight: FontWeight.bold)),
                              Text(pokemonRival.nombre, style: const TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold)),
                              Text("${pokemonRival.tipo} • ${pokemonRival.estadoNombre}", style: const TextStyle(color: Colors.yellow, fontSize: 18)),
                              Text("HP: ${pokemonRival.hpActual}/${pokemonRival.hpMax}", style: const TextStyle(color: Colors.white70, fontSize: 16))]),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                'assets/pokemon/' + getImagenPorNombre(pokemonRival.nombre),
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.contain)))]),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: pokemonRival.hpActual / pokemonRival.hpMax.clamp(1, double.infinity),
                        backgroundColor: Colors.grey[800],
                        valueColor: AlwaysStoppedAnimation(_colorHP(pokemonRival)),
                        minHeight: 14,
                      ),
                    ],
                  ),
                ),
                
                
                Container(
                  height: 160,  
                  color: Colors.grey[900],
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: Text(
                      log, 
                      style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                    ),
                  ),
                ),
                
                // altura fija
                Container(
                  height: 200, 
                  color: Colors.blue[900]!.withAlpha(77),
                  padding: const EdgeInsets.all(16),
                  child: Column(
		    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image.asset(
                                'assets/pokemon/' + getImagenPorNombre(tuPokemon.nombre),
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.contain))),
                          Column(
                            children: [
                              const Text("TÚ", style: TextStyle(fontSize: 28, color: Colors.cyan, fontWeight: FontWeight.bold)),
                              Text(tuPokemon.nombre, style: const TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold)),
                              Text("${tuPokemon.tipo} • ${tuPokemon.estadoNombre}", style: const TextStyle(color: Colors.yellow, fontSize: 18)),
                              Text("HP: ${tuPokemon.hpActual}/${tuPokemon.hpMax}", style: const TextStyle(color: Colors.white70, fontSize: 16))])]),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: tuPokemon.hpActual / tuPokemon.hpMax.clamp(1, double.infinity),
                        backgroundColor: Colors.grey[800],
                        valueColor: AlwaysStoppedAnimation(_colorHP(tuPokemon)),
                        minHeight: 14,
                      )
                    ]
                  )
                )
              ]
            )
          )
        ),
        
        Container(
          height: 80,  
          color: Colors.grey[850],
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: (!turnoJugador || batallaTerminada) ? null : elegirAtaque,
                  child: const Text("LUCHA", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: (!turnoJugador || batallaTerminada || !jugadorPuedeUsarMochila)
                      ? null
                      : () => showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: Colors.grey[850],
                            title: const Text("MOCHILA", style: TextStyle(color: Colors.white)),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.local_hospital, color: Colors.green),
                                  title: Text("Poción (+40 HP) ${tuPokemon.mochila['pocion']} restantes"),
                                  onTap: tuPokemon.puedeUsarPocion() ? usarPocion : null,
                                ),
                                ListTile(
                                  leading: const Icon(Icons.healing, color: Colors.purple),
                                  title: Text("Antídoto ${tuPokemon.mochila['antidoto']} restantes"),
                                  onTap: tuPokemon.puedeUsarAntidoto() ? curarEstado : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                  child: const Text("MOCHILA", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    // ganar o perder 
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: batallaTerminada
        ? Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: tuPokemon.estaDebilitado ? Colors.red : Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              onPressed: () {
                MusicController.changeMusic();
                Navigator.pop(context);
              },
              child: Text(
                tuPokemon.estaDebilitado ? "¡PERDISTE! Volver" : "¡GANASTE! Volver",
                style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          : null,
    );
  }

  Color _colorHP(BatallaPokemon p) {
    final ratio = p.hpActual / p.hpMax;
    if (ratio > 0.5) return Colors.green;
    if (ratio > 0.2) return Colors.yellow;
    return Colors.red;
  }
}


String getImagenPorNombre(String nombre) {
  switch(nombre) {
    case "Snorlax": return 'Snorlax.png';
    case "Eevee": return 'Eevee.png';
    case "Charmander": return 'Charmander.png';
    case "Charizard": return 'Charizard.png';
    case "Squirtle": return 'Squirtle.png';
    case "Blastoise": return 'Blastoise.png';
    case "Bulbasaur": return 'Bulbasaur.png';
    case "Venusaur": return 'Venusaur.png';
    case "Pikachu": return 'Pikachu.png';
    case "Raichu": return 'Raichu.png';
    case "Machop": return 'Machop.png';
    case "Machamp": return 'Machamp.png';
    case "Pidgey": return 'Pidgey.png';
    case "Pidgeot": return 'Pidgeot.png';
    case "Ekans": return 'Ekans.png';
    case "Arbok": return 'Arbok.png';
    case "Diglett": return 'Diglett.png';
    case "Dugtrio": return 'Dugtrio.png';
    case "Geodude": return 'Geodude.png';
    case "Golem": return 'Golem.png';
    case "Abra": return 'Abra.png';
    case "Alakazam": return 'Alakazam.png';
    case "Swinub": return 'Swinub.png';
    case "Mamoswine": return 'Mamoswine.png';
    case "Caterpie": return 'Caterpie.png';
    case "Scizor": return 'Scizor.png';
    case "Gastly": return 'Gastly.png';
    case "Gengar": return 'Gengar.png';
    case "Magnemite": return 'Magnemite.png';
    case "Metagross": return 'Metagross.png';
    case "Dratini": return 'Dratini.png';
    case "Dragonite": return 'Dragonite.png';
    case "Houndour": return 'Houndour.png';
    case "Umbreon": return 'Umbreon.png';
    default: return 'assets/pokemon/mystery.png';
  }
}

