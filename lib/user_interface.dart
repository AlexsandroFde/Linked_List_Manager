import 'algorithms/max_search.dart';
import 'data_structures/node.dart';
import 'operations/input_output.dart';
import 'operations/list_operations.dart';

void userInterface() {
  var lista = Node(null);
  var pointer = Max();
  clearConsole();

  while (true) {
    print("\n=== Menu ===");
    print("1. Adicionar valor");
    print("2. Remover valor");
    print("3. Encontrar valor máximo");
    print("4. Imprimir lista");
    print("5. Sair");

    var choice = promptInt("Escolha uma opção: ");

    switch (choice) {
      case 1:
        var value = promptInt("Digite o valor a ser adicionado: ");
        var newNode = Node(value);
        newNode.next = lista.next;
        lista.next = newNode;
        pointer.searchMax(newNode);
        clearConsole();
        print("Valor adicionado com sucesso");
        break;
      case 2:
        var value = promptInt("Digite o valor a ser removido: ");
        clearConsole();
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
          print("Valor removido com sucesso");
        } else {
          print("Valor não encontrado na lista");
        }
        break;
      case 3:
        clearConsole();
        if (pointer.max != null) {
          print("Máximo: ${pointer.max!.data}");
        } else {
          print("Lista vazia");
        }
        break;
      case 4:
        clearConsole();
        print("Lista:");
        printList(lista.next);
        break;
      case 5:
        clearConsole();
        print("Saindo...");
        return;
      default:
        clearConsole();
        print("Opção inválida. Por favor, escolha uma opção válida");
    }
  }
}
