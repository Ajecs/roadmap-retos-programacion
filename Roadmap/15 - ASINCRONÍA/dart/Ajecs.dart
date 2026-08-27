import 'dart:async';
import 'dart:io';

/* 
  Dart se caracteriza por no hacer uso de callbacks. En su lugar se utilizan futures y streams.
  Un future es una promesa de un resultado, mientras que un stream es una secuencia de eventos asincronos
  Ambos Objetos pertenecen a la librería dart:async.
*/

void main() async {
  stdout.writeln('*********************** Asincronía ***********************');

  Future<void> funcAsyncrony({int duration = 0, String name = ''}) async {
    print('\nTarea: $name.\nInicio: ${DateTime.now()}');
    await Future.delayed(Duration(seconds: duration));
    // El objeto Timer cumple la misma función pero lo realiza de forma sincrona.

    print('\nTarea: $name.\nFin: ${DateTime.now()}');
  }

  await funcAsyncrony(duration: 2, name: 'funcAsyncrony');

  await stdout.flush();
  // Permite la impresión de stdout a continuación de forma asincrona.

  stdout.writeln(
    '\n***************************** Extra ***************************\n',
  );

  // El patrón then().catchError() es la versión asincrona de try-catch.

  await Future.wait([
    // Ya que el main() es asincrono, podemos utilizar await para esperar a que finalice la tarea.
    funcAsyncrony(name: "C", duration: 3),
    funcAsyncrony(name: "B", duration: 2),
    funcAsyncrony(name: "A", duration: 1),
    // Las 3 funciones se ejecutan en paralelo. 
  ]);

   await funcAsyncrony(name: "D", duration: 1);
   // Luego se ejecuta la tarea D cuando la C termina.
}
