import 'dart:io';
import '../data_structures/node.dart';

void printList(Node? node) {
  Node? temp = node;
  while (temp != null) {
    stdout.write(" -> [${temp.data}]");
    temp = temp.next;
  }
}