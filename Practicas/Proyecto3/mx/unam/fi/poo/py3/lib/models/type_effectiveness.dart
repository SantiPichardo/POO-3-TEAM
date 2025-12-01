class TypeEffectiveness {
  /// Devuelve el multiplicador de efectividad del ataque [atk] sobre el defensor [def].
  
  static double get(String atk, String def) {
    final multipliers = <String, Map<String, double>>{
      "Normal": {
        "Lucha": 2.0, "Fantasma": 0.0
      },
      "Fuego": {
      "Fuego":0.5, "Agua": 2.0, "Planta": 0.5, "Hielo": 0.5, "Tierra": 2.0, 
      "Bicho": 0.5, "Roca": 2.0, "Acero": 0.5
      },
      "Agua": {
        "Fuego": 0.5, "Agua": 0.5, "Eléctrico": 2.0, "Planta": 2.0, "Hielo": 0.5, "Acero": 0.5  
      },
      "Planta": {
        "Fuego": 2.0, "Agua": 0.5, "Eléctrico": 0.5, "Planta": 0.5, "Hielo": 2.0, 
        "Veneno": 2.0, "Tierra": 0.5, "Volador": 2.0, "Bicho": 2.0 
      },
      "Eléctrico": {
        "Eléctrico": 0.5, "Tierra": 2.0, "Volador": 0.5, "Acero": 0.5
      },
      "Hielo": {
        "Fuego": 2.0,
        "Hielo": 0.5,
        "Lucha": 2.0,
        "Roca": 2.0,
        "Acero": 2.0
      },
      "Lucha": {
        "Volador": 2.0,
        "Psíquico": 2.0,
       "Bicho": 0.5,
       "Roca": 0.5,
       "Siniestro": 0.5
},
      "Veneno": {
        "Planta": 0.5,
        "Lucha": 0.5,
        "Veneno": 0.5,
        "Tierra": 2.0,
        "Psíquico": 2.0,
        "Bicho": 0.5
},
     "Tierra": {
       "Agua": 2.0,
       "Eléctrico": 0.0,      
       "Planta": 2.0,
       "Hielo": 2.0,
       "Veneno": 0.5,
       "Roca": 0.5
},
      "Volador": {
         "Eléctrico": 2.0,
         "Planta": 0.0,
         "Hielo": 2.0,
         "Lucha": 0.5,
         "Bicho": 0.5,
         "Roca": 2.0
},
      "Psíquico": {
         "Lucha": 0.5,
         "Psíquico": 0.5,
         "Bicho": 2.0,
         "Fantasma": 2.0,
         "Siniestro": 2.0
},
      "Bicho": {
        "Fuego": 2.0,
        "Planta": 0.5,
        "Lucha": 0.5,
        "Tierra": 0.5,
        "Volador": 2.0,
        "Roca": 2.0
},
      "Roca": {
         "Normal": 0.5,
         "Fuego": 0.5,
         "Agua": 2.0,
         "Planta": 2.0,
         "Lucha": 2.0,
         "Veneno": 0.5,
         "Tierra": 2.0,
         "Volador": 0.5,
         "Acero": 2.0
},
      "Fantasma": {
        "Normal": 0.0,
        "Lucha": 0.0,
        "Veneno": 0.5,
        "Bicho": 0.5,
        "Fantasma": 2.0,
        "Siniestro": 2.0
},
      "Dragón": {
       "Fuego": 0.5,
       "Agua": 0.5,
       "Eléctrico": 0.5,
       "Planta": 0.5,
       "Hielo": 2.0,
       "Dragón": 2.0
},
      "Siniestro": {
        "Lucha": 2.0,
        "Psíquico": 0.0,
        "Bicho": 2.0,
        "Fantasma": 0.5,
        "Siniestro": 0.5
},
     "Acero": {
       "Normal": 0.5,
       "Fuego": 2.0,
       "Planta": 0.5,
       "Hielo": 0.5,
       "Lucha": 2.0,
       "Veneno": 0.0,
       "Tierra": 2.0,
       "Volador": 0.5,
       "Psíquico": 0.5,
       "Bicho": 0.5,
       "Roca": 0.5,
       "Fantasma": 0.5,
       "Dragón": 0.5,
       "Siniestro": 0.5,
       "Acero": 0.5
},
    };

   
    final tipoAtaque = multipliers[atk];
    if (tipoAtaque == null) return 1.0;
    
    final multiplicador = tipoAtaque[def];
    return multiplicador ?? 1.0;  // 1.0 por defecto
  }
}