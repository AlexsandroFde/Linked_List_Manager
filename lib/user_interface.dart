import 'dart:io';

import 'algorithms/max_search.dart';
import 'data_structures/node.dart';
import 'operations/input_output.dart';

void userInterface() {
  var lista = Node(null);
  var pointer = Max();
  clearConsole();

  while (true) {
    print(">=~~=< Menu >=~~=<");
    print("1. Adicionar valor");
    print("2. Remover valor");
    print("3. Sair");
    listInterface(lista, pointer);

    var choice = promptInt("Escolha uma opção: ");

    switch (choice) {
      case 1:
        clearConsole();
        print(">=~~=< Adicionar valor >=~~=<");
        listInterface(lista, pointer);
        do {
          var input =
              prompt("Digite o valor a ser adicionado ('q' para parar): ");
          if (input.toLowerCase() == 'q') {
            clearConsole();
            break;
          }
          var value = int.tryParse(input);
          if (value == null) {
            stdout.write('\x1B[1F\x1B[2K\x1B[1F\x1B[2K');
            print("Por favor, insira um número válido ou 'q' para parar");
            continue;
          }
          //add
          var newNode = Node(value);
          newNode.next = lista.next;
          lista.next = newNode;
          pointer.searchMax(newNode);
          //
          clearConsole();
          print(">=~~=< Adicionar valor >=~~=<");
          listInterface(lista, pointer);
        } while (true);
        break;
      case 2:
        clearConsole();
        print(">=~~=< Remover valor >=~~=<");
        listInterface(lista, pointer);
        do {
          var input =
              prompt("Digite o valor a ser removido ('q' para parar): ");
          if (input.toLowerCase() == 'q') {
            clearConsole();
            break;
          }
          var value = int.tryParse(input);
          if (value == null) {
            stdout.write('\x1B[1F\x1B[2K\x1B[1F\x1B[2K');
            print("Por favor, insira um número válido ou 'q' para parar");
            continue;
          }
          clearConsole();
          print(">=~~=< Remover valor >=~~=<");
          if (lista.next == null) {
            print("Lista vazia. Nada para remover");
            break;
          }
          var prev = lista;
          Node? current = lista.next!;
          while (current != null && current.data != value) {
            prev = current;
            current = current.next;
          }
          if (current != null && current.data == value) {
            prev.next = current.next;
            if (pointer.max == current) {
              pointer.searchMax(lista.next);
            }
            print("Valor $value removido com sucesso");
          } else {
            print("Valor $value não encontrado na lista");
          }
          listInterface(lista, pointer);
        } while (true);
        break;
      case 3:
        clearConsole();
        print("Saindo...");
        return;
      default:
        clearConsole();
        print("Opção inválida. Por favor, escolha uma opção válida");
    }
  }
}
