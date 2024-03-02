import '../data_structures/node.dart';

class Max {
  Node? max;

  Max searchMax(Node? node) {
    max = node;
    while (node != null) {
      if (node.data != null && (max!.data == null || node.data! > max!.data!)) {
        max = node;
      }
      node = node.next;
    }
    return this;
  }
}