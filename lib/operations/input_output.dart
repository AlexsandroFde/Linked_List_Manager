import 'dart:io';

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
