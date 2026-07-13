import 'dart:io';

void main() {
  stdout.write(
    '************************* Colecciones *****************************\n\n',
  );

  stdout.write(
    '************************* Listas *****************************\n\n',
  );

  // Se recomienda añadir una coma al final del ultimo elemento con el fin de evitar errores "de copiar y pegar".

  List<String> players = [
    'Lionel Messei',
    'Julian Alvarez',
    'Lisandro Martinez',
    'Alexis McAllister',
  ];

  stdout.write('<< Listas inmutables >>\n\n');

  // Las listas se pueden comportar como Arrays de otros lenguajes como C y Java.
  // Conteniendo un numero fijo y limitado de elementos evitando añadir nuevos items

  final pirates = List<String>.filled(
    5,
    '',
    growable: false,
  ); // lista de 5 Strings vacíos.
  print(pirates);
  print('');

  // pirates.addAll(['o\'Reilly', 'Bellingham', 'Kane', 'Pitchford']);
  // ! error "cannot add to a fixed-length list". Lo mismo con insert().

  pirates[1] = 'Pitchford';
  pirates[2] = 'Kane';

  print(pirates);

  // pirates.removeLast();
  // ! "cannot remove from a fixed-length list".

  // Mediante el getter length se puede obtener el tamaño de la lista.
  // Y con el operador de subíndice un elemento en una posición determinada

  stdout.write(
    '\n********************** Insertar, borrar, actualizar y ordenar listas **************************\n\n',
  );

  print('Hay un total de: ${players.length} jugadores en la lista');
  print('El tercer elemento de la lista es: ${players[2]}');
  print('');

  players.add('Nicolas Gonzalez');
  print('$players. Se añadió a ${players.last}');
  print('');

  players.insert(1, 'Lautaro Martinez');
  print('Se insertó a ${players[1]}');
  print(players);
  print('');

  players.replaceRange(1, 4, [
    'Enzo Fernandez',
    'Nicolas Otamendi',
    'Nicolas Tagliafico',
  ]);
  // ! Se añade cualquier cantidad dentro del rango y se elimina los existentes.
  // print('Se insertó a ${players[1]}');
  print('Se añadieron a ${players.sublist(1, 4).length} jugadores $players');
  print('');

  players.remove('Julian Alvarez');
  print(
    'Se eliminó a Julian Alvares y a el 3° elemento: ${players.removeAt(2)}. $players',
  );
  print('');

  players.sort();
  print('Los jugadores se ordenan alfabeticamente: $players');
  print('');

  print(
    'Los jugadores se ordenan alfabeticamente al reves: ${players.reversed}',
  );

  stdout.write(
    '\n********************** Records **************************\n\n',
  );

  // Los records es la versión de tupla de Dart.
  (String, int, bool) user = ('Ana', 28, true);
  print(user);
  print('El primer item del record es ${user.$1}'); // Ana

  ({String name, int age, bool active}) user2 = (
    name: 'Juan',
    age: 50,
    active: false,
  );
  print(user2); // Los campos nombrados en records se ordenan alfabeticamente.
  print(user2.name); // Juan 


  // ! user = user2; error. Los campos nombrados cumplen la función equivalente a un tipo.
  // ! No se pueden asignar variables con valores de tipo distinto.

  // Dos records con igual valor son iguales si no poseen campos nombrados.

  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);

  print(point == color); // true

  ({int x, int y, int z}) point2 = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) color2 = (r: 1, g: 2, b: 3);

  print(point2 == color2); // false

}
