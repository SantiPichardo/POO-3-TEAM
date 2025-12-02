import 'package:flutter/material.dart';
import '../models/all_pokemon.dart';
import '../models/music_controller.dart';
import 'battle_screen.dart';
import '../models/pokemon.dart'; // Import directo de la clase


class PokemonSelectionScreen extends StatefulWidget {
  const PokemonSelectionScreen({super.key});

  @override
  State<PokemonSelectionScreen> createState() => _PokemonSelectionScreenState();
}

class _PokemonSelectionScreenState extends State<PokemonSelectionScreen> {
  Pokemon? pokemonSeleccionado;

  @override
  void initState() {
    super.initState();
    MusicController.changeMusic();
  }

  @override
  void dispose() {
    MusicController.disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final all = getAllPokemon();
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("¡Elige tu Pokémon!", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          // Información completa del Pokémon seleccionado
          if (pokemonSeleccionado != null)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _getColorPorTipo(pokemonSeleccionado!.tipo), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pokemonSeleccionado!.nombre,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getColorPorTipo(pokemonSeleccionado!.tipo),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              pokemonSeleccionado!.tipo,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white, size: 20),
                            onPressed: () {
                              setState(() {
                                pokemonSeleccionado = null;
                              });
                            },
                            tooltip: 'Cerrar',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // método mostrarInformacion() de clase pokemon
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      pokemonSeleccionado!.mostrarInformacion(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        final enemy = pickRandomEnemy(all, pokemonSeleccionado!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BattleScreen(playerPoke: pokemonSeleccionado!, enemyPoke: enemy),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getColorPorTipo(pokemonSeleccionado!.tipo),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('¡Elegir este Pokémon!'),
                    ),
                  ),
                ],
              ),
            ),
          
          
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: all.length,
              itemBuilder: (context, index) {
                final poke = all[index];
                return Card(
                  color: Colors.grey[800],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      setState(() {
                        pokemonSeleccionado = poke;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          poke.nombre,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: poke.nombre.length > 10 ? 10 : 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Image.asset(
                          'assets/pokemon/' + getImagenPorNombre(poke.nombre),
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.contain),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getColorPorTipo(poke.tipo),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            poke.tipo,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text("${poke.hp} HP", style: const TextStyle(color: Colors.green, fontSize: 10)),
                        Text("Atk: ${poke.ataque}", style: const TextStyle(color: Colors.orange, fontSize: 10)),
                        Text("Vel: ${poke.velocidad}", style: const TextStyle(color: Colors.purple, fontSize: 10)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorPorTipo(String tipo) {
    switch (tipo) {
      case "Fuego": return Colors.orange;
      case "Agua": return Colors.blue;
      case "Planta": return Colors.green;
      case "Eléctrico": return Colors.yellow;
      case "Normal": return Colors.grey;
      case "Lucha": return Colors.brown;
      case "Volador": return Colors.lightBlue;
      case "Veneno": return Colors.purple;
      case "Tierra": return Colors.brown[700]!;
      case "Roca": return Colors.grey[600]!;
      case "Psíquico": return Colors.pink;
      case "Hielo": return Colors.cyan;
      case "Bicho": return Colors.lightGreen;
      case "Fantasma": return Colors.deepPurple;
      case "Acero": return Colors.blueGrey;
      case "Dragón": return Colors.indigo;
      case "Siniestro": return Colors.black;
      default: return Colors.grey;
    }
  }
}
