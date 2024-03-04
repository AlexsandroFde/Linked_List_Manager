import 'dart:io';

import '../algorithms/max_search.dart';
import '../data_structures/node.dart';
import 'list_operations.dart';

String prompt(String promptText) {
  stdout.write(promptText);
  return stdin.readLineSync()!;
}

int promptInt(String promptText) {
  while (true) {
    try {
      return int.parse(prompt(promptText));
    } catch (_) {
      return 0;
    }
  }
}

void clearConsole() {
  if (Platform.isWindows) {
    stdout.write('\x1B[2J\x1B[0f');
  } else {
    stdout.write('\x1B[2J\x1B[3J\x1B[H');
  }
}

void listInterface(Node lista, Max pointer) {
  if (lista.next != null){
    printList(lista.next);
    print("\nMáximo: ${pointer.max!.data}");
  }
  print("==================\n");
}